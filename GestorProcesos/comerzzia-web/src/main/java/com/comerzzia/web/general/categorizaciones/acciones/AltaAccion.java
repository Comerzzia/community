/**
 * 
 */
package com.comerzzia.web.general.categorizaciones.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.categorizaciones.CategorizacionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

/**
 *
 */
public class AltaAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("general/categorizaciones/mantenimiento/jsp/categorizacion.jsp", Vista.INTERNA);

	public String getNombre() {
		return "alta";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		try {
    		HttpSession sesion = request.getSession();
    		
    		CategorizacionBean categorizacion = new CategorizacionBean();
    		categorizacion.setEstadoBean(Estado.NUEVO);
    		categorizacion.setEnEdicion(true);
    		
    		sesion.setAttribute(WebKeys.CATEGORIZACION_BEAN, categorizacion);
    		
    		return NEXT_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
	}

}
