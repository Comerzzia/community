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

package com.comerzzia.web.tesoreria.cobros.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.tesoreria.cobros.tratamiento.TratamientoCobrosBean;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.tesoreria.cobros.ui.FormularioDocumentoCobroBean;

public class LeerFormularioAccion extends Accion {

	/**
	 * Logger
	 */
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
			FormularioDocumentoCobroBean formulario = (FormularioDocumentoCobroBean) sesion.getAttribute(WebKeys.FORMULARIO_DOCUMENTO_COBRO);
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
	private void leerFormulario(FormularioDocumentoCobroBean formulario,
			HttpServletRequest request) throws FechaException {

			TratamientoCobrosBean tratamientoCobros = (TratamientoCobrosBean)formulario.getRegistroActivo();
			
			if (formulario.isEditable()){
				//vencimiento
				tratamientoCobros.setCodCliente(request.getParameter("codCliente"));
				tratamientoCobros.getDocumento().setCodCliente(request.getParameter("codCliente"));
				tratamientoCobros.getDocumento().setFechaVencimiento(Fechas.getFecha(request.getParameter("fechaVencimiento")));
				tratamientoCobros.getDocumento().setCodSerie(request.getParameter("codSerie"));
				tratamientoCobros.getDocumento().setDocumento(request.getParameter("documento"));
				if (!request.getParameter("fechaFactura").isEmpty()){
					tratamientoCobros.getDocumento().setFechaFactura(Fechas.getFecha(request.getParameter("fechaFactura")));
				}else{
					tratamientoCobros.getDocumento().setFechaFactura(null);
				}
				tratamientoCobros.getDocumento().setImporte(Numero.desformatea(request.getParameter("importe"), 0D));
				tratamientoCobros.getDocumento().setCodTipoEfecto(request.getParameter("codTipoEfecto"));
				
				//remesa
				tratamientoCobros.getDocumento().setRemesable(request.getParameter("remesable") != null);
				if (!request.getParameter("fechaEntradaDocumento").isEmpty()){
					tratamientoCobros.getDocumento().setFechaEntradaDocumento(Fechas.getFecha(request.getParameter("fechaEntradaDocumento")));
				}else{
					tratamientoCobros.getDocumento().setFechaEntradaDocumento(null);
				}
				tratamientoCobros.getDocumento().setCodBancoCobro(request.getParameter("codBancoCobro"));
				
				//observaciones
				tratamientoCobros.getDocumento().setObservaciones(request.getParameter("observaciones"));
			}
	}

}
