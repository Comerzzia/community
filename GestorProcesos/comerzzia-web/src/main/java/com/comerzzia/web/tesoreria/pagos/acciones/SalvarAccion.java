/**
 * 
 */
package com.comerzzia.web.tesoreria.pagos.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.tesoreria.pagos.tratamiento.TratamientoPagosBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.tesoreria.pagos.PagoConstraintViolationException;
import com.comerzzia.servicios.tesoreria.pagos.PagoException;
import com.comerzzia.servicios.tesoreria.pagos.ServicioPagos;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.tesoreria.pagos.ui.FormularioDocumentoPagoBean;

/**
 *
 */
public class SalvarAccion extends Accion {

	public String getNombre() {
		return "salvar";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		try {
    		HttpSession sesion = request.getSession();
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeAñadir() && !permisos.isPuedeEditar()) {
    			return SIN_PERMISO;
    		}
    		
    		// Obtenemos el documento del formulario y lo salvamos
    		FormularioDocumentoPagoBean formulario = (FormularioDocumentoPagoBean) sesion.getAttribute(WebKeys.FORMULARIO_DOCUMENTO_PAGO);
    		TratamientoPagosBean tratamientoPagos = (TratamientoPagosBean) formulario.getRegistroActivo();
    		ServicioPagos.salvar(tratamientoPagos.getDocumento(), datosSesion);
    		formulario.aceptar();
    		
    		setMensaje(request, "El documento se ha grabado correctamente");
    		
    		// Consultamos el documento e inicializamos el formulario
    		try {
    			tratamientoPagos.setDocumento(ServicioPagos.consultar(tratamientoPagos.getDocumento().getIdPago(), datosSesion));
				formulario.inicializar(tratamientoPagos);
			}
    		catch (Exception e) {
    			setMensajeError(request, "Se ha producido un error al acceder al registro");
    			return getControlador().getAccion("buscar").ejecutar(request);
			}
    		
    		return getControlador().getAccion("verFormulario").ejecutar(request);
    	}
		catch (PagoConstraintViolationException e) {
    		setMensajeError(request, e.getMessage());
    		
    		return getControlador().getAccion("verFormulario").ejecutar(request);
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
