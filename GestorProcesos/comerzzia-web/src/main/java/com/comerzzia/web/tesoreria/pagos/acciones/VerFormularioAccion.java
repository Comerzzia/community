/**
 * 
 */
package com.comerzzia.web.tesoreria.pagos.acciones;

import javax.servlet.http.HttpServletRequest;

import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;

/**
 *
 */
public class VerFormularioAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("tesoreria/pagos/mantenimiento/jsp/documentoPago.jsp", Vista.INTERNA);
	
	public String getNombre() {
		return "verFormulario";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		try {
			
			return NEXT_PAGE;
		}
		catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
		}
	}
}
