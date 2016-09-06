/**
 * 
 */
package com.comerzzia.web.tesoreria.pagos.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.tesoreria.pagos.tratamiento.TratamientoPagosBean;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.tesoreria.pagos.ui.FormularioDocumentoPagoBean;

/**
 *
 */
public class LeerFormularioAccion extends Accion {

protected static Logger log = Logger.getMLogger(LeerFormularioAccion.class);
	
	public String getNombre() {
		return "leerFormulario";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();
			
			// Obtenemos la operación solicitada
			String operacion = request.getParameter("operacion");
			String indice = request.getParameter("indice");
			log.debug("ejecutar() - operacion=" + operacion + " indice=" + indice);
			
			// Actualizamos el formulario
			FormularioDocumentoPagoBean formulario = (FormularioDocumentoPagoBean) sesion.getAttribute(WebKeys.FORMULARIO_DOCUMENTO_PAGO);
			if (operacion == null || !operacion.equals("cancelar")) {
				leerFormulario(formulario, request);
			}			

            if (operacion != null) {
            	if (operacion.equals("aceptar")) {
            		return getControlador().getAccion("salvar").ejecutar(request);
                }
                // Cancelar cambios en el formulario
                else if (operacion.equals("cancelar")) {
                	formulario.cancelar();
                	return getControlador().getAccion("buscar").ejecutar(request);
                }
            }
            
            // Mostramos el formulario
            return getControlador().getAccion("verFormulario").ejecutar(request);
		}
		catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
		}
	}

	/**
	 * @param formulario
	 * @param request
	 * @throws FechaException 
	 */
	private void leerFormulario(FormularioDocumentoPagoBean formulario,
			HttpServletRequest request) throws FechaException {

			TratamientoPagosBean tratamientoPagos = (TratamientoPagosBean)formulario.getRegistroActivo();
			
			if (formulario.isEditable()){
				//vencimiento
				tratamientoPagos.setCodProveedor(request.getParameter("codProveedor"));
				tratamientoPagos.getDocumento().setCodProveedor(request.getParameter("codProveedor"));
				tratamientoPagos.getDocumento().setFechaVencimiento(Fechas.getFecha(request.getParameter("fechaVencimiento")));
				tratamientoPagos.getDocumento().setCodSerie(request.getParameter("codSerie"));
				tratamientoPagos.getDocumento().setDocumento(request.getParameter("documento"));
				if (!request.getParameter("fechaFactura").isEmpty()){
					tratamientoPagos.getDocumento().setFechaFactura(Fechas.getFecha(request.getParameter("fechaFactura")));
				}else{
					tratamientoPagos.getDocumento().setFechaFactura(null);
				}
				tratamientoPagos.getDocumento().setImporte(Numero.desformatea(request.getParameter("importe"), 0D));
				tratamientoPagos.getDocumento().setCodTipoEfecto(request.getParameter("codTipoEfecto"));
				
				//remesa
				tratamientoPagos.getDocumento().setRemesable(request.getParameter("remesable"));
				if (!request.getParameter("fechaEmision").isEmpty()){
					tratamientoPagos.getDocumento().setFechaEmision(Fechas.getFecha(request.getParameter("fechaEmision")));
				}else{
					tratamientoPagos.getDocumento().setFechaEmision(null);
				}
				tratamientoPagos.getDocumento().setCodBancoPago(request.getParameter("codBancoPago"));
				
				//observaciones
				tratamientoPagos.getDocumento().setObservaciones(request.getParameter("observaciones"));
			}
	}

}
