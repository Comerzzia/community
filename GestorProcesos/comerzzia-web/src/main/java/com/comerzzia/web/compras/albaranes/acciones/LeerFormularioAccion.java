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

package com.comerzzia.web.compras.albaranes.acciones;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.compras.albaranes.articulos.ArticuloAlbaranCompraBean;
import com.comerzzia.persistencia.compras.albaranes.pagos.PagoAlbaranCompraBean;
import com.comerzzia.persistencia.general.articulos.ArticuloBean;
import com.comerzzia.servicios.compras.albaranes.AlbaranCompra;
import com.comerzzia.servicios.compras.albaranes.ServicioAlbaranesCompras;
import com.comerzzia.servicios.compras.albaranes.pagos.PagoAlbaranCompraConstraintViolationException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.articulos.ServicioArticulos;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.compras.albaranes.ui.FormularioAlbaranCompraBean;


public class LeerFormularioAccion extends Accion {
	
	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(LeerFormularioAccion.class);
	

	@Override
	public String getNombre() {
		return "leerFormulario";
	}
	
	@Override
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();
			
			// Obtenemos la operación solicitada
			String operacion = request.getParameter("operacion");
			String indice = request.getParameter("indice");
			log.debug("ejecutar() - operacion=" + operacion + " indice=" + indice);
			
			// Actualizamos el formulario
			FormularioAlbaranCompraBean formulario = (FormularioAlbaranCompraBean) sesion.getAttribute(WebKeys.FORMULARIO_ALBARAN_COMPRA);
			if (operacion == null || !operacion.equals("cancelar")) {
				leerFormulario(formulario, request);
			}
			
            if (operacion != null) {
            	// Cambiar pestaña activa
                if (operacion.equals("pestaña")) {
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
	    				case 1:  // Artículos
	    					ArticuloAlbaranCompraBean articulo = new ArticuloAlbaranCompraBean();
	    					formulario.getFormularioPestañaActiva().setModoInsercion(articulo);
	    					
	    					break;
	    				case 2:
	    					AlbaranCompra albaran = formulario.getRegistroActivo();
	    					PagoAlbaranCompraBean pago = new PagoAlbaranCompraBean();
	    					formulario.getFormularioPestañaActiva().setModoInsercion(pago);
	    					
	    					albaran.calcularTotalesPagos();
	    					
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
                	AlbaranCompra albaran = formulario.getRegistroActivo();
                	
                	switch (formulario.getPestañaActiva()) {
                		case 1:
                        	// Recalcular los totales del albarán
                        	albaran.calcularTotales();
                			
                			break;
                	}
                }
                // Aceptar cambios del formulario de la pestaña activa
                if (operacion.equals("aceptarRegistroPestaña")) {
                	AlbaranCompra albaran = formulario.getRegistroActivo();
                	boolean enInsercion = formulario.getFormularioPestañaActiva().isEnInsercion();
                	
                	switch (formulario.getPestañaActiva()) {
                		case 1:
                			leerFormularioRegistro(formulario, request);
                			formulario.getFormularioPestañaActiva().aceptar();
                			
                        	// Recalculamos los totales del albarán
                        	albaran.calcularTotales();
                        	
                        	// Si  estábamos en modo inserción continuamos añadiendo artículos
                        	if (enInsercion) {
                        		ArticuloAlbaranCompraBean articulo = new ArticuloAlbaranCompraBean();
            					formulario.getFormularioPestañaActiva().setModoInsercion(articulo);
                        	}
                			
                			break;
                		case 2:
            				// Controlar los errores de integridad de las cantidades que puedan producirse
            				try {
            					leerFormularioRegistro(formulario, request);
            				}
            				catch (PagoAlbaranCompraConstraintViolationException e) {
                        		setMensajeError(request, e.getMessage());
                        		
                        		return getControlador().getAccion("verFormulario").ejecutar(request);
            				}
            				
                        	formulario.getFormularioPestañaActiva().aceptar();
                        	
                        	// Recalculamos los totales de pagos
                        	albaran.calcularTotalesPagos();
                        	
                        	// Si estábamos en modo inserción y el total del albarán no es igual al total de pagos continuamos añadiendo pagos
                        	if (enInsercion && !albaran.getTotal().equals(albaran.getTotalPagos())) {
                        		PagoAlbaranCompraBean pago = new PagoAlbaranCompraBean();
            					formulario.getFormularioPestañaActiva().setModoInsercion(pago);
                        	}
                        	
                        	break;
                	}
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
                		setMensajeError(request, "Debe aceptar o cancelar los cambios de la línea antes de salvar el albarán de compra");
                	}
                	else {
                		AlbaranCompra albaran = formulario.getRegistroActivo();
                		
                		// Validar los totales de los pagos
                		try {
                			albaran.checkTotalesPagos();
                		}
                		catch (PagoAlbaranCompraConstraintViolationException e) {
                			formulario.setPestañaActiva(2); // Ir a la pestaña de pagos
                    		setMensajeError(request, e.getMessage());
                    		
                    		return getControlador().getAccion("verFormulario").ejecutar(request);
                		}
                		
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
                		// Obtenemos el albarán y lo actualizamos en el formulario
                		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
                		AlbaranCompra albaran = formulario.getRegistroActivo();
                		albaran = ServicioAlbaranesCompras.consultar(albaran.getIdAlbaran(), datosSesion);
                		formulario.inicializar(albaran);
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
	private void leerFormulario(FormularioAlbaranCompraBean formulario, HttpServletRequest request) throws Exception {
		DatosSesionBean datosSesion = (DatosSesionBean) request.getSession().getAttribute(WebKeys.DATOS_SESION);
		AlbaranCompra albaran = formulario.getRegistroActivo();
		
		if (formulario.isEditable()) {
			switch (formulario.getPestañaActiva()) {
				case 0:  // Cabecera
					if (formulario.isEnInsercion()) {
						albaran.setCodSerie(request.getParameter("codSerie"));
						albaran.setDesSerie(request.getParameter("desSerie"));
					}
					//Si no tiene artículos guardamos los datos del almacén
					if(!albaran.isTieneArticulos()){
						albaran.setConceptoAlmacen(request.getParameter("codConceptoAlmacen"), request.getParameter("codAlmacen"), datosSesion);
					}
					albaran.setFechaAlbaran(Fechas.getFecha(request.getParameter("fecha")));
		        	albaran.setFechaSuministro(Fechas.getFecha(request.getParameter("fechaSuministro")));
		        	albaran.setProveedor(request.getParameter("codProveedor"), datosSesion);
		        	albaran.setReferenciaProveedor(request.getParameter("referenciaProveedor"));
		        	albaran.setPersonaContacto(request.getParameter("personaContacto"));
		        	albaran.setObservaciones(request.getParameter("observaciones"));
		        	albaran.setCodMedioPago(request.getParameter("codMedioPago"));
		        	albaran.setDesMedioPago(request.getParameter("desMedioPago"));
		        	albaran.setCodMedioPagoVen(request.getParameter("codMedioPagoVen"));
		        	albaran.setDesMedioPagoVen(request.getParameter("desMedioPagoVen"));
		        	
		        	break;
			}
		}
	}
	
	
	private void leerFormularioRegistro(FormularioAlbaranCompraBean formulario, HttpServletRequest request) throws Exception {
		if (formulario.getFormularioPestañaActiva().isEditable()) {		
			switch (formulario.getPestañaActiva()) {
				case 1:  // Artículos
					ArticuloAlbaranCompraBean articulo = (ArticuloAlbaranCompraBean) formulario.getFormularioPestañaActiva().getRegistroActivo();
					articulo.setCodArticulo(request.getParameter("codArticulo"));
					articulo.setDesArticulo(request.getParameter("desArticulo"));
					articulo.setDesglose1(request.getParameter("desglose1"));
					articulo.setDesglose2(request.getParameter("desglose2"));
					articulo.setCantidadMedida(Numero.desformatea(request.getParameter("cantidadMedida"), 0.0));
					articulo.setUnidadMedida(request.getParameter("unidadMedida"));
					articulo.setCantidad(Numero.desformatea(request.getParameter("cantidad"), 0.0));
					articulo.setPrecio(Numero.desformatea(request.getParameter("precio"), 0.0));
					articulo.setDescuento(Numero.desformatea(request.getParameter("descuento"), 0.0));
					articulo.calcularImporte();
					articulo.setDescripcionAmpliada(request.getParameter("descripcionAmpliada"));
					articulo.setFecha(new Date());
					
					// Obtenemos el código de impuesto del artículo
					DatosSesionBean datosSesion = (DatosSesionBean) request.getSession().getAttribute(WebKeys.DATOS_SESION);
					ArticuloBean articuloBean = ServicioArticulos.consultar(articulo.getCodArticulo(), datosSesion);
					articulo.setCodImpuesto(articuloBean.getCodImpuesto());
					
					break;
				case 2: // Pagos
					AlbaranCompra albaran = formulario.getRegistroActivo();
					
					PagoAlbaranCompraBean pago = (PagoAlbaranCompraBean) formulario.getFormularioPestañaActiva().getRegistroActivo();
					pago.setIdMedioPagoVencimiento(Numero.desformateaLong(request.getParameter("idMedioPagoVencimiento"), null));
					pago.setDesMedioPagoVencimiento(request.getParameter("desMedioPagoVencimiento"));
					pago.setImporte(Numero.desformatea(request.getParameter("importe"), null));
					
					// No permitir que el importe introducido sea de distinto signo al del total
					if (albaran.getTotal() > 0 && pago.getImporte() < 0) {
						throw new PagoAlbaranCompraConstraintViolationException("Debe introducir un importe positivo");
					}
					else if (albaran.getTotal() < 0 && pago.getImporte() > 0) {
						throw new PagoAlbaranCompraConstraintViolationException("Debe introducir un importe negativo");
					}
					
					break;
			}
		}
	}
}
