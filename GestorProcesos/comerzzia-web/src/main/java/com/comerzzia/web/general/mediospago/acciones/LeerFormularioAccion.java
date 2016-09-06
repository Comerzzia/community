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

package com.comerzzia.web.general.mediospago.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.mediospago.MedioPagoBean;
import com.comerzzia.persistencia.general.mediospago.vencimientos.VencimientoBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.mediospago.ServicioMediosPago;
import com.comerzzia.util.log.Logger;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.general.mediospago.ui.FormularioMedioPagoBean;

public class LeerFormularioAccion extends Accion {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(LeerFormularioAccion.class);
	
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
	public String getNombre() {
		return "leerFormulario";
	}
	
	/**
     * Ejecuta la acción
     * @param request Datos de la petición
     * @return Vista con la siguiente pagina a mostrar
     */
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();
			
			// Obtenemos la operación solicitada
			String operacion = request.getParameter("operacion");
			String indice = request.getParameter("indice");
			log.debug("ejecutar() - operacion=" + operacion + " indice=" + indice);
			
			// Actualizamos el formulario
			FormularioMedioPagoBean formulario = (FormularioMedioPagoBean) sesion.getAttribute(WebKeys.FORMULARIO_MEDIO_PAGO);
			if (operacion == null || !operacion.equals("cancelar")) {
				leerFormulario(formulario, request);
			}
			
            if (operacion != null) {
            	// Cambiar pestaña activa
                if (operacion.equals("pestaña")) {
                	//if(!((MedioPagoBean)formulario.getRegistroActivo()).isContado())
                		formulario.setPestañaActiva(Integer.parseInt(indice));
                }
                // Cambiar modo visualización de la pestaña activa 
                else if (operacion.equals("vistaTablaPestaña")) {
                	formulario.getFormularioPestañaActiva().setModoVisualizacionTabla();
                }
                // Ver un registro de la pestaña activa
                else if (operacion.equals("verRegistroPestaña")) {
                	formulario.getFormularioPestañaActiva().seleccionaRegistroActivo(Integer.parseInt(indice));
                	formulario.getFormularioPestañaActiva().setModoVisualizacionFicha();
                }
                // Añadir un nuevo registro a la pestaña activa
                else if (operacion.equals("nuevoRegistroPestaña")) {
                	switch (formulario.getPestañaActiva()) {
	    				case 1:  // Vencimientos
	    					VencimientoBean vencimiento = new VencimientoBean();
	    					formulario.getFormularioPestañaActiva().setModoInsercion(vencimiento);
	    					break;
                	}
                }
                // Editar un registro de la pestaña activa
                else if (operacion.equals("editarRegistroPestaña")) {
                	formulario.getFormularioPestañaActiva().setModoEdicion(Integer.parseInt(indice));
                }
                // Eliminar un registro de la pesaña activa
                else if (operacion.equals("eliminarRegistroPestaña")) {
                	formulario.getFormularioPestañaActiva().eliminar(Integer.parseInt(indice));
                }
                // Aceptar cambios del formulario de la pestaña activa
                if (operacion.equals("aceptarRegistroPestaña")) {
                	leerFormularioRegistro(formulario, request);
                	formulario.getFormularioPestañaActiva().aceptar();
                }
                // Cancelar cambios del formulario de la pestaña activa
                else if (operacion.equals("cancelarRegistroPestaña")) {
                	formulario.getFormularioPestañaActiva().cancelar();
                }
                // Aceptar cambios del formulario
                else if (operacion.equals("aceptar")) {
                	// Si tenemos algún formulario en edición forzamos a que se acepten o cancelen los cambios
                	int pestaña = formulario.getIndicePrimeraPestañaEditable();
                	if (pestaña != -1) {
                		formulario.setPestañaActiva(pestaña);
                		setMensajeError(request, "Debe aceptar o cancelar los cambios de la línea antes de salvar el medio de pago");
                	}
                	else {
                		return getControlador().getAccion("salvar").ejecutar(request);
                	}
                }
                // Cancelar cambios en el formulario
                else if (operacion.equals("cancelar")) {
                	formulario.cancelar();
                	
                	// Si no tenemos registro activo volvemos al buscador
                	if (formulario.isRegistroActivoVacio()) {
                		return getControlador().getAccion("buscar").ejecutar(request);
                	}
                	else {
                		// Obtenemos el medio de pago y lo actualizamos en el formulario
                		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
                		MedioPagoBean medioPago = (MedioPagoBean) formulario.getRegistroActivo();
                		medioPago = ServicioMediosPago.consultar(medioPago.getCodMedioPago(), datosSesion);
                		formulario.inicializar(medioPago);
                	}
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
	 * Lee los campos del formulario principal y del formulario de la pestaña activa
	 * actualizando los atributos del registro activo
	 * @param formulario
	 * @param request
	 */
	private void leerFormulario(FormularioMedioPagoBean formulario, HttpServletRequest request) {
		MedioPagoBean medioPago = (MedioPagoBean) formulario.getRegistroActivo();
		
		if (formulario.isEnInsercion()) {
			medioPago.setCodMedioPago(request.getParameter("codMedioPago"));
		}
		
		if (formulario.isEditable()) {
			medioPago.setDesMedioPago(request.getParameter("desMedioPago"));
            medioPago.setActivo(request.getParameter("activo")!= null);
			
			switch (formulario.getPestañaActiva()) {
				case 0:  // Datos Generales
					medioPago.setContado(request.getParameter("contado") != null);
		            medioPago.setEfectivo(request.getParameter("efectivo") != null);
		            medioPago.setTarjetaCredito(request.getParameter("tarjetaCredito") != null);            
		            medioPago.setVisibleVenta(request.getParameter("visibleVenta") != null);
		            medioPago.setVisibleTiendaVirtual(request.getParameter("visibleTiendaVirtual") != null);
		            medioPago.setVisibleCompra(request.getParameter("visibleCompra") != null);
		            medioPago.setCodTipoEfecto(request.getParameter("codTipoEfecto"));
	            	medioPago.setDesTipoEfecto(request.getParameter("desTipoEfecto"));
		            
					break;
			}
		}
	}
	
	
	private void leerFormularioRegistro(FormularioMedioPagoBean formulario, HttpServletRequest request) {
		switch (formulario.getPestañaActiva()) {
			case 1:  // Vencimientos
				if (formulario.getFormularioPestañaActiva().isEditable()) {
					VencimientoBean vencimiento = (VencimientoBean) formulario.getFormularioPestañaActiva().getRegistroActivo();
					vencimiento.setDesVencimiento(request.getParameter("desVencimiento"));
					if(request.getParameter("numeroVencimientos") != null && !request.getParameter("numeroVencimientos").equals(""))
						vencimiento.setNumeroVencimientos(Long.parseLong(request.getParameter("numeroVencimientos")));
					else
						vencimiento.setNumeroVencimientos(new Long(0));
					if(request.getParameter("diasCadencia") != null && !request.getParameter("diasCadencia").equals(""))
						vencimiento.setDiasCadencia(Long.parseLong(request.getParameter("diasCadencia")));
					else
						vencimiento.setDiasCadencia(new Long(0));
					if(request.getParameter("diasEntreVencimientos") != null && !request.getParameter("diasEntreVencimientos").equals(""))
						vencimiento.setDiasEntreVencimientos(Long.parseLong(request.getParameter("diasEntreVencimientos")));
					else
						vencimiento.setDiasEntreVencimientos(new Long(0));
					
					vencimiento.setDiasNaturales(request.getParameter("diasNaturales") != null);
					
				}
				break;
		}
	}
	
}
