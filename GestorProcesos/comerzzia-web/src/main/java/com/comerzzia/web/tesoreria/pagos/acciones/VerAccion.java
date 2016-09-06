/**
 * 
 */
package com.comerzzia.web.tesoreria.pagos.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.tesoreria.pagos.DocumentoPagoBean;
import com.comerzzia.persistencia.tesoreria.pagos.tratamiento.TratamientoPagosBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.tesoreria.pagos.PagoException;
import com.comerzzia.servicios.tesoreria.pagos.PagoNotFoundException;
import com.comerzzia.servicios.tesoreria.pagos.ServicioPagos;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.tesoreria.pagos.ui.FormularioDocumentoPagoBean;

/**
 *
 */
public class VerAccion extends Accion {

	public String getNombre() {
		return "ver";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		try {
    		HttpSession sesion = request.getSession();
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeEjecutar()) {
    			return SIN_PERMISO;
    		}
    		
    		// Obtenemos documento
    		String idPago = request.getParameter(WebKeys.ID_OBJETO);
    		DocumentoPagoBean documentoPago = ServicioPagos.consultar(Long.parseLong(idPago), datosSesion);
    		
    		// Inicalizamos el formulario
    		FormularioDocumentoPagoBean formulario = (FormularioDocumentoPagoBean) sesion.getAttribute(WebKeys.FORMULARIO_DOCUMENTO_PAGO);
    		TratamientoPagosBean tratamientoPagos = new TratamientoPagosBean();
    		tratamientoPagos.setDocumento(documentoPago);
    		formulario.inicializar(tratamientoPagos);

    		// Mostramos el formulario
    		return getControlador().getAccion("verFormulario").ejecutar(request);
    	}
		catch (PagoNotFoundException e) {
            setError(request, e);
            
            return ERROR_PAGE;
    	}
    	catch (PagoException e) {
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
