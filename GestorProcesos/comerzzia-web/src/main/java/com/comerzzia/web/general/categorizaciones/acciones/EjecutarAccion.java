/**
 * 
 */
package com.comerzzia.web.general.categorizaciones.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.categorizaciones.ParametrosBuscarCategorizacionesBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

/**
 *
 */
public class EjecutarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("general/categorizaciones/buscar/jsp/buscar.jsp", Vista.INTERNA);

	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "ejecutar";
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
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisos(this.getAccionMenu());
    		if (!permisos.isPuedeEjecutar()) {
    			return SIN_PERMISO;
    		}
    		
    		ParametrosBuscarCategorizacionesBean param = (ParametrosBuscarCategorizacionesBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_CATEGORIZACIONES);
    		if (param == null) {
    			param = new ParametrosBuscarCategorizacionesBean();
    			
    			sesion.setAttribute(WebKeys.PARAM_BUSCAR_CATEGORIZACIONES, param);
    		}
    		
    		param.setNumPagina(0);
            
    		return NEXT_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
    }

}
