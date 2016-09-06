/**
 * 
 */
package com.comerzzia.web.tesoreria.pagos.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.tesoreria.pagos.ParametrosBuscarDocumentosPagosBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.tesoreria.pagos.ui.FormularioDocumentoPagoBean;

/**
 *
 */
public class EjecutarAccion extends Accion {

	public String getNombre() {
		return "ejecutar";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		try{
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
			
			// Comprobamos los permisos de la acción
			PermisosEfectivosAccionBean permisos = datosSesion.getPermisos(this.getAccionMenu());
			if (!permisos.isPuedeEjecutar()) {
				return SIN_PERMISO;
			}
			
			//inicializamos los parámetros de búsqueda
			ParametrosBuscarDocumentosPagosBean param = (ParametrosBuscarDocumentosPagosBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_DOCUMENTOS_PAGOS);
			if (param == null) {
				param = new ParametrosBuscarDocumentosPagosBean();
				
				sesion.setAttribute(WebKeys.PARAM_BUSCAR_DOCUMENTOS_PAGOS, param);
			}
			else {
				param.setNumPagina(0);
			}
			
			// Inicializamos el formulario
			FormularioDocumentoPagoBean formulario = (FormularioDocumentoPagoBean) sesion.getAttribute(WebKeys.FORMULARIO_DOCUMENTO_PAGO);
			if (formulario == null) {
				formulario = new FormularioDocumentoPagoBean();
				
				sesion.setAttribute(WebKeys.FORMULARIO_DOCUMENTO_PAGO, formulario);
			}
        
			return getControlador().getAccion("buscar").ejecutar(request);
		}
		catch (Exception e) {
	        e.printStackTrace();
	        setError(request, e);
	        
	        return ERROR_PAGE;
		}
	}

}
