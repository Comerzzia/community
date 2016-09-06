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

package com.comerzzia.web.general.unidadesmedida.etiquetas.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.unidadesmedida.etiquetas.UnidadesMedidaEtiquetasBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.unidadesmedida.etiquetas.ServicioUnidadesMedidaEtiquetas;
import com.comerzzia.servicios.general.unidadesmedida.etiquetas.UnidadesMedidaEtiquetaConstraintViolationException;
import com.comerzzia.servicios.general.unidadesmedida.etiquetas.UnidadesMedidaEtiquetaException;
import com.comerzzia.util.base.Estado;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class SalvarAccion extends Accion {
	
	private static final Vista NEXT_PAGE = new Vista("general/unidades_medida/etiquetas/mantenimiento/jsp/unidadesMedidaEtiqueta.jsp", Vista.INTERNA);

	
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
    		
    		UnidadesMedidaEtiquetasBean umEtiqueta = (UnidadesMedidaEtiquetasBean) sesion.getAttribute(WebKeys.UNIDADES_MEDIDA_ETIQUETA_BEAN);
    		if (umEtiqueta.getEstadoBean() == Estado.NUEVO) {
    			umEtiqueta.setCod_UM_Etiqueta(request.getParameter("cod_UM_Etiqueta"));
    		}
    		
    		setParameters(request, umEtiqueta);
    		ServicioUnidadesMedidaEtiquetas.salvar(umEtiqueta, datosSesion);
    		
    		// Liberamos recursos
    		sesion.removeAttribute(WebKeys.UNIDADES_MEDIDA_ETIQUETA_BEAN);
    		
    		// Volvemos a consultar el registro
    		try {
    			umEtiqueta = ServicioUnidadesMedidaEtiquetas.consultar(umEtiqueta.getCod_UM_Etiqueta(), datosSesion);
    			
    			sesion.setAttribute(WebKeys.UNIDADES_MEDIDA_ETIQUETA_BEAN, umEtiqueta);
    			setMensaje(request, "La unidad de medida se ha salvado correctamente");
    			return NEXT_PAGE;
    		}
    		catch (Exception e) {
    			setMensajeError(request, "La unidad de medida se ha salvado correctamente pero no se ha podido acceder al registro", e);
    			return getControlador().getAccion("buscar").ejecutar(request);
    		}
    	}
    	catch (UnidadesMedidaEtiquetaConstraintViolationException e) {
    		setMensajeError(request, e.getMessage());
    		return NEXT_PAGE;
    	}
    	catch (UnidadesMedidaEtiquetaException e) {
    		setError(request, e);
            
            return ERROR_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
    }
    
private void setParameters(HttpServletRequest request, UnidadesMedidaEtiquetasBean umEtiqueta){
    	
	umEtiqueta.setDes_UM_Etiqueta(request.getParameter("des_UM_Etiqueta"));
	umEtiqueta.setDesEtiqueta(request.getParameter("desEtiqueta")); 
	umEtiqueta.setFactor(Long.parseLong(request.getParameter("factor")));
  		
	umEtiqueta.setActivo(request.getParameter("activo") != null); 
    	
    }
}
