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
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.conceptoalmacenes.ConceptoAlmacenException;
import com.comerzzia.servicios.general.conceptoalmacenes.ConceptoAlmacenNotFoundException;
import com.comerzzia.servicios.general.conceptoalmacenes.ServicioConceptoAlmacenes;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;


public class VerAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("general/conceptoalmacenes/mantenimiento/jsp/conceptoAlmacen.jsp", Vista.INTERNA);
	private String codAplicacion;
	
	public VerAccion (String codAplicacion){
		this.codAplicacion = codAplicacion;
	}
	
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "ver";
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
    		
    		// Obtenemos el concepto de almacen
    		String codConAlm = request.getParameter(WebKeys.ID_OBJETO);
    		//Insertamos el código de la aplicación en la consulta
    		ConceptoAlmacenBean cAlmacen = ServicioConceptoAlmacenes.consultar(codAplicacion, codConAlm, datosSesion);
    		
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
    		    		
    		return NEXT_PAGE;
    	}
    	catch (ConceptoAlmacenNotFoundException e) {
    		// Si no se encuentra el registro volvemos al buscador y enviamos en mensaje de error
            setMensajeError(request, "No se ha encontrado el registro", e);
            return new BuscarAccion(codAplicacion).ejecutar(request);
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
}
