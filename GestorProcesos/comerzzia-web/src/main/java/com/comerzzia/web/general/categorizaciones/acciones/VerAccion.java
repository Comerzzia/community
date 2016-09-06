/**
 * 
 */
package com.comerzzia.web.general.categorizaciones.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.categorizaciones.CategorizacionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.categorizaciones.CategorizacionException;
import com.comerzzia.servicios.general.categorizaciones.CategorizacionNotFoundException;
import com.comerzzia.servicios.general.categorizaciones.ServicioCategorizaciones;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

/**
 *
 */
public class VerAccion extends Accion {

private static final Vista NEXT_PAGE = new Vista("general/categorizaciones/mantenimiento/jsp/categorizacion.jsp", Vista.INTERNA);
	
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

    		// Obtenemos el país
    		String codCat = request.getParameter(WebKeys.ID_OBJETO);
    		CategorizacionBean categorizacion = ServicioCategorizaciones.consultar(codCat, datosSesion);
    		
    		sesion.setAttribute(WebKeys.CATEGORIZACION_BEAN, categorizacion);
    		    		
    		return NEXT_PAGE;
    	}
    	catch (CategorizacionNotFoundException e) {
    		// Si no se encuentra el registro volvemos al buscador y enviamos en mensaje de error
            setMensajeError(request, "No se ha encontrado el registro", e);
            return getControlador().getAccion("buscar").ejecutar(request);
    	}
    	catch (CategorizacionException e) {
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
