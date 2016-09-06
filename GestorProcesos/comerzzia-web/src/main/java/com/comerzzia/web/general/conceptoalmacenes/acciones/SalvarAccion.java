/**
 * Copyright 2009-2014 RED.ES - Desarrollado por TIER1
 * 
 * Licencia con arreglo a la EUPL, versión 1.1 o -en cuanto 
 * sean aprobadas por la comisión Europea- versiones 
 * posteriores de la EUPL (la "Licencia").
 * Solo podrá usarse esta obra si se respeta la Licencia.
 * 
 * http://ec.europa.eu/idabc/eupl.html
 * 
 * Salvo cuando lo exija la legislación aplicable o se acuerde
 * por escrito, el programa distribuido con arreglo a la
 * Licencia se distribuye "TAL CUAL",
 * SIN GARANTÍAS NI CONDICIONES DE NINGÚN TIPO, 
 * ni expresas ni implícitas.
 * Véase la Licencia en el idioma concreto que rige
 * los permisos y limitaciones que establece la Licencia.
 */

package com.comerzzia.web.general.conceptoalmacenes.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.conceptoalmacenes.ConceptoAlmacenBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.conceptoalmacenes.ConceptoAlmacenConstraintViolationException;
import com.comerzzia.servicios.general.conceptoalmacenes.ConceptoAlmacenException;
import com.comerzzia.servicios.general.conceptoalmacenes.ServicioConceptoAlmacenes;
import com.comerzzia.util.base.Estado;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class SalvarAccion extends Accion {
	
	private static final Vista NEXT_PAGE = new Vista("general/conceptoalmacenes/mantenimiento/jsp/conceptoAlmacen.jsp", Vista.INTERNA);
	private String codAplicacion;
	
	public SalvarAccion (String codaplicacion){
		this.codAplicacion = codaplicacion;
	}
	
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "salvar";
    }
    
    
    /**
     * Ejecuta la acción
     * @param request Datos de la petición
     * @return Vista con la siguiente pagina a mostrar
     */
    public Vista ejecutar(HttpServletRequest request) {
    	try {
    		HttpSession sesion = request.getSession();
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);

    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeAñadir()) {
    			return SIN_PERMISO;
    		}
    		
    		ConceptoAlmacenBean cAlmacen = (ConceptoAlmacenBean) sesion.getAttribute(WebKeys.CONCEPTO_ALMACEN_BEAN);
    		if (cAlmacen.getEstadoBean() == Estado.NUEVO) {
    			cAlmacen.setCodConAlm(request.getParameter("codConAlm"));
    		}
    		//Insertamos el código de la aplicación
    		cAlmacen.setCodAplicacion(codAplicacion);
    		
    		setParameters(request, cAlmacen);    		
    		ServicioConceptoAlmacenes.salvar(cAlmacen, datosSesion);
    		
    		// Liberamos recursos
    		sesion.removeAttribute(WebKeys.CONCEPTO_ALMACEN_BEAN);
    		
    		// Volvemos a consultar el registro
    		try {
    			cAlmacen = ServicioConceptoAlmacenes.consultar(cAlmacen.getCodAplicacion(), cAlmacen.getCodConAlm(), datosSesion);
    			
    	   		if (codAplicacion.equals("COMP")){
        			cAlmacen.setVisibleTiendas(false);
        			cAlmacen.setVisibleVisibleTiendas(false);
        			cAlmacen.setVisibleCodAlmacenOrigen(false);
        		}
        		else if (codAplicacion.equals("REGU")){
        			cAlmacen.setVisibleSolicitudAceptacionAutomatico(false);
        			cAlmacen.setVisibleSolicitudRecepcionAutomatico(false);
        			cAlmacen.setVisibleSolicitudGenerarFaltas(false);
        			cAlmacen.setVisibleCodAlmacenOrigen(false);
        		}
    			
    			sesion.setAttribute(WebKeys.CONCEPTO_ALMACEN_BEAN, cAlmacen);
    			setMensaje(request, "El Concepto de almacén se ha salvado correctamente");
    			return NEXT_PAGE;
    		}
    		catch (Exception e) {
    			setMensajeError(request, "El Concepto de almacén se ha salvado correctamente pero no se ha podido acceder al registro", e);
    			return new BuscarAccion(codAplicacion).ejecutar(request);
    		}
    	}
    	catch (ConceptoAlmacenConstraintViolationException e) {
    		setMensajeError(request, e.getMessage());
    		return NEXT_PAGE;
    	}
    	catch (ConceptoAlmacenException e) {
    		setError(request, e);
            
            return ERROR_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
    }
    
    private void setParameters(HttpServletRequest request, ConceptoAlmacenBean cAlmacen) {
    	cAlmacen.setDesConAlm(request.getParameter("desConAlm"));
		cAlmacen.setSigno(request.getParameter("signo"));
		cAlmacen.setCodAlm_origen(request.getParameter("codAlm_origen"));
		cAlmacen.setDesAlm_origen(request.getParameter("desAlm_origen"));
		cAlmacen.setCodAlm_destino(request.getParameter("codAlm_destino"));
		cAlmacen.setDesAlm_destino(request.getParameter("desAlm_destino"));
		cAlmacen.setSolicitudAceptacionAutomatico(request.getParameter("solicitudAceptacionAutomatico") != null);
		cAlmacen.setSolicitudRecepcionAutomatico(request.getParameter("solicitudRecepcionAutomatico") != null);
		cAlmacen.setSolicitudGenerarFaltas(request.getParameter("solicitudGenerarFaltas") != null);
		cAlmacen.setVisibleTiendas(request.getParameter("visibleTiendas") != null);
		cAlmacen.setActivo(request.getParameter("activo") != null);
    }
}
