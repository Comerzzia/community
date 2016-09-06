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

package com.comerzzia.web.ventas.pedidos.acciones;

import java.util.Enumeration;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.articulos.ArticuloBean;
import com.comerzzia.persistencia.general.articulos.codigosbarras.CodigoBarrasArticuloBean;
import com.comerzzia.persistencia.ventas.pedidos.articulos.ArticuloPedidoVentaBean;
import com.comerzzia.persistencia.ventas.pedidos.pagos.PagoPedidoVentaBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.articulos.ArticuloDesgloses;
import com.comerzzia.servicios.general.articulos.ServicioArticulos;
import com.comerzzia.servicios.general.articulos.codigosbarras.ServicioCodigosBarrasArticulos;
import com.comerzzia.servicios.ventas.pedidos.PedidoVenta;
import com.comerzzia.servicios.ventas.pedidos.PedidoVentaConstraintViolationException;
import com.comerzzia.servicios.ventas.pedidos.ServicioPedidosVentas;
import com.comerzzia.servicios.ventas.pedidos.articulos.ArticuloPedidoVentaConstraintViolationException;
import com.comerzzia.servicios.ventas.pedidos.pagos.PagoPedidoVentaConstraintViolationException;
import com.comerzzia.servicios.ventas.tarifas.articulos.PreciosArticuloTarifaBean;
import com.comerzzia.servicios.ventas.tarifas.articulos.ServicioArticulosTarifas;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.pedidos.ui.FormularioPedidoVentaBean;


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
			FormularioPedidoVentaBean formulario = (FormularioPedidoVentaBean) sesion.getAttribute(WebKeys.FORMULARIO_PEDIDO_VENTA);
			if (operacion == null || !operacion.equals("cancelar")) {
				// Si incumple alguna restricción al leer el formulario mostrar mensaje y no permitir continuar
				try {
					leerFormulario(formulario, request);
				}
				catch (PedidoVentaConstraintViolationException e) {
					setMensajeError(request, e.getMessage());
					
					return getControlador().getAccion("verFormulario").ejecutar(request);
				}
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
                	PedidoVenta pedido = formulario.getRegistroActivo();
                	
                	switch (formulario.getPestañaActiva()) {
	    				case 1:  // Artículos
	    					nuevoArticulo(formulario, request);
	    					
	    					break;
	    				case 2: // Pagos
	    					PagoPedidoVentaBean pago = new PagoPedidoVentaBean();
	    					formulario.getFormularioPestañaActiva().setModoInsercion(pago);
	    					
	    					pedido.calcularTotalesPagos();
	    					
	    					break;
	    			}
                }
                // Editar un registro de la pestaña activa
                else if (operacion.equals("editarRegistroPestaña")) {
                	PedidoVenta pedido = formulario.getRegistroActivo();
                	ArticuloPedidoVentaBean articulo = pedido.getArticulos().get(Integer.parseInt(indice));
                	
                	// Sólo permitir editar un registro si la línea no está rechazada
                	if (!pedido.isEstaLineaRechazada(articulo)) {
                		formulario.getFormularioPestañaActiva().setModoEdicion(Integer.parseInt(indice));
                	}
                	else {
                		setMensajeAviso(request, "No se puede editar el registro: La línea está rechazada");
                	}
                }
                // Eliminar un registro de la pesaña activa
                else if (operacion.equals("eliminarRegistroPestaña")) {
                	PedidoVenta pedido = formulario.getRegistroActivo();
                	
                	switch (formulario.getPestañaActiva()) {
                		case 1:  // Artículos
                        	pedido.eliminarLineaPedido(Integer.parseInt(indice));
                        	
                        	// Recalculamos los totales del pedido
                        	if(pedido.isEstaSolicitud()) {
                        		pedido.calcularTotales();
                        	}
                        	
                        	// TODO: este cálculo se debe hacer internamente en la clase PedidoVenta
                        	
                        	break;
                		case 2: // Pagos
                			formulario.getFormularioPestañaActiva().eliminar(Integer.parseInt(indice));
                			
                			break;
                	}
                }
                // Aceptar cambios del formulario de la pestaña activa
                if (operacion.equals("aceptarRegistroPestaña")) {
                	PedidoVenta pedido = formulario.getRegistroActivo();
                	boolean enInsercion = false;
                	
                	switch (formulario.getPestañaActiva()) {
            			case 1:  // Artículos
                        	// Controlar los errores de integridad de las cantidades que puedan producirse
                        	try {
                        		leerFormularioRegistro(formulario, request);
                        	}
                        	catch (ArticuloPedidoVentaConstraintViolationException e) {
                        		setMensajeError(request, e.getMessage());
                        		
                        		return getControlador().getAccion("verFormulario").ejecutar(request);
                        	}
                        	
                        	enInsercion = formulario.getFormularioPestañaActiva().isEnInsercion();
                        	formulario.getFormularioPestañaActiva().aceptar();
                        	
                        	// Recalculamos los totales del pedido
                        	if(pedido.isEstaSolicitud()) {
                        		pedido.calcularTotales();
                        	}
                        	
                        	// Si estábamos en modo inserción continuamos añadiendo artículos
                        	if (enInsercion) {
                        		nuevoArticulo(formulario, request);
                        	}
                        	
                        	break;
            			case 2: // Pagos
            				// Controlar los errores de integridad de las cantidades que puedan producirse
            				try {
            					leerFormularioRegistro(formulario, request);
            				}
            				catch (PagoPedidoVentaConstraintViolationException e) {
                        		setMensajeError(request, e.getMessage());
                        		
                        		return getControlador().getAccion("verFormulario").ejecutar(request);
            				}
            				
                        	enInsercion = formulario.getFormularioPestañaActiva().isEnInsercion();
                        	formulario.getFormularioPestañaActiva().aceptar();
                        	
                        	// Recalculamos los totales de pagos
                        	pedido.calcularTotalesPagos();
                        	
                        	// Si estábamos en modo inserción y el total del pedido no es igual al total de pagos continuamos añadiendo pagos
                        	if (enInsercion && !pedido.getTotal().equals(pedido.getTotalPagos())) {
                        		PagoPedidoVentaBean pago = new PagoPedidoVentaBean();
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
                		setMensajeError(request, "Debe aceptar o cancelar los cambios de la línea antes de salvar el pedido de venta");
                	}
                	else {
                		PedidoVenta pedido = formulario.getRegistroActivo();
                		
                		// Validar los totales de los pagos
                		try {
                			pedido.checkTotalesPagos();
                		}
                		catch (PagoPedidoVentaConstraintViolationException e) {
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
                		// Obtenemos el pedido y lo actualizamos en el formulario
                		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
                		PedidoVenta pedido = formulario.getRegistroActivo();
                		pedido = ServicioPedidosVentas.consultar(pedido.getIdPedido(), datosSesion);
                		formulario.inicializar(pedido);
                	}
                }
                // Añadir articulos mediante desglose
                else if (operacion.equals("añadirArticulosDesgloses")) {
                	int pestaña =formulario.getPestañaActiva();
                	if(pestaña == 1){
                		formulario.getFormularioPestañaArticulos().borrarDesgloses();
                		formulario.getFormularioPestañaArticulos().setModoVisualizacionDesgloses();
                	}
                }
                else if (operacion.equals("cancelarArticulosDesgloses")) {
                	formulario.getFormularioPestañaActiva().cancelar();
                	formulario.getFormularioPestañaActiva().setModoVisualizacionTabla();
                	formulario.getFormularioPestañaArticulos().borrarDesgloses();
                }
                else if (operacion.equals("aceptarArticulosDesgloses")) {
                	leerFormularioDesgloses(formulario, request);
                }
                else if (operacion.equals("cargarDesgloses")) {
                	//datos necesarios
                	String codArticulo = (String) request.getParameter("codArticulo");
                	String desArticulo = (String) request.getParameter("desArticulo");
                	if (desArticulo.isEmpty()){
                		formulario.getFormularioPestañaArticulos().borrarDesgloses();
                	}
                	else{
                    	DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
                    	List<CodigoBarrasArticuloBean> codigosBarras = ServicioCodigosBarrasArticulos.consultarCodigosBarras(codArticulo,datosSesion);
                    	//instancio nuevo objeto ArticuloDesgloses
                    	ArticuloDesgloses desgloses=new ArticuloDesgloses();
                    	//Relleno del nuevo objeto
                    	desgloses.setCodArticulo(codArticulo);
                    	desgloses.setDesArticulo(desArticulo);
                    	desgloses.setDesgloses(codigosBarras);
                    	//se introduce en el formulario de la pestaña de articulos
                    	formulario.getFormularioPestañaArticulos().setDesgloses(desgloses);
                	}
                }
                // Aceptar todas las líneas del pedido
                else if (operacion.equals("aceptarLineasCompleto")) {
                	PedidoVenta pedido = formulario.getRegistroActivo();
                	pedido.aceptarLineasCompleto();
                }
                // Aceptar todas las líneas del pedido
                else if (operacion.equals("prepararLineasCompleto")) {
                	PedidoVenta pedido = formulario.getRegistroActivo();
                	pedido.prepararLineasCompleto();
                }
                // Aceptar todas las líneas del pedido
                else if (operacion.equals("rechazarLineasCompleto")) {
                	PedidoVenta pedido = formulario.getRegistroActivo();
                	pedido.rechazarLineasCompleto();
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
	
	private ArticuloPedidoVentaBean nuevoArticulo(FormularioPedidoVentaBean formulario, HttpServletRequest request) throws Exception {
		PedidoVenta pedido = formulario.getRegistroActivo();
		ArticuloPedidoVentaBean articulo = new ArticuloPedidoVentaBean();
		
		// Establecer estado de la línea en función de la cabecera
		if(pedido.isEstaSolicitud()) {
			pedido.setEstadoLineaSolicitada(articulo);
		}
		else if(pedido.isEstaPendienteAceptacion()) {
			pedido.setEstadoLineaPendienteAceptacion(articulo);
		}
		else if(pedido.isEstaPendientePreparacion()) {
			pedido.setEstadoLineaPendientePreparacion(articulo);
		}
		formulario.getFormularioPestañaActiva().setModoInsercion(articulo);
		
		return articulo;
	}
	
	/**
	 * Lee los campos del formulario principal y del formulario de la pestaña activa
	 * actualizando los atributos del registro activo
	 * @param formulario
	 * @param request
	 */
	private void leerFormulario(FormularioPedidoVentaBean formulario, HttpServletRequest request) throws Exception {
		DatosSesionBean datosSesion = (DatosSesionBean) request.getSession().getAttribute(WebKeys.DATOS_SESION);
		PedidoVenta pedido = formulario.getRegistroActivo();
		
		if (formulario.isEditable()) {
			switch (formulario.getPestañaActiva()) {
				case 0:  // Cabecera
					if (formulario.isEnInsercion()) {
						pedido.setCodSerie(request.getParameter("codSerie"));
						pedido.setDesSerie(request.getParameter("desSerie"));
					}
					pedido.setCliente(request.getParameter("codCliente"), datosSesion);
					// Si no tiene artículos guardamos los datos del almacén
					if(!pedido.isTieneArticulos()){
						pedido.setConceptoAlmacen(request.getParameter("codConceptoAlmacen"), request.getParameter("codAlmacen"), datosSesion);
					}
					pedido.setFecha(Fechas.getFecha(request.getParameter("fecha")));
					try {
						pedido.setFechaSuministroPrevista(Fechas.getFecha(request.getParameter("fechaSuministroPrevista")));
					} catch (FechaException ignore) {}
		        	pedido.setCodTarifa(request.getParameter("codTarifa"));
		        	pedido.setDesTarifa(request.getParameter("desTarifa"));
		        	pedido.setPersonaContacto(request.getParameter("personaContacto"));
		        	pedido.setReferenciaCliente(request.getParameter("referenciaCliente"));
		        	pedido.setObservaciones(request.getParameter("observaciones"));
		        	
		        	break;
			}
		}
	}
	
	private void leerFormularioRegistro(FormularioPedidoVentaBean formulario, HttpServletRequest request) throws Exception {
		if (formulario.getFormularioPestañaActiva().isEditable()) {
			PedidoVenta pedido = formulario.getRegistroActivo();
			
			switch (formulario.getPestañaActiva()) {
				case 1:  // Artículos
					ArticuloPedidoVentaBean articulo = (ArticuloPedidoVentaBean) formulario.getFormularioPestañaActiva().getRegistroActivo();
					
					// Si el artículo es nuevo o el pedido es una solicitud
					// recoger todos los parámetros a excepción de las cantidades
					if(articulo.isEstadoNuevo() || pedido.isEstaSolicitud()) {
						articulo.setCodArticulo(request.getParameter("codArticulo"));
						articulo.setDesArticulo(request.getParameter("desArticulo"));
						articulo.setDesglose1(request.getParameter("desglose1"));
						articulo.setDesglose2(request.getParameter("desglose2"));
						articulo.setUnidadMedida(request.getParameter("unidadMedida"));
						articulo.setUnidadMedidaAlternativa(request.getParameter("unidadMedidaAlternativa"));
						articulo.setPrecio(Numero.desformatea(request.getParameter("precio"), null));
						articulo.setDescuento(Numero.desformatea(request.getParameter("descuento"), 0.0));
						articulo.setDescripcionAmpliada(request.getParameter("descripcionAmpliada"));
						articulo.setImporte(0.0);
						
						// Obtenemos el código de impuesto del artículo
						DatosSesionBean datosSesion = (DatosSesionBean) request.getSession().getAttribute(WebKeys.DATOS_SESION);
						ArticuloBean articuloBean = ServicioArticulos.consultar(articulo.getCodArticulo(), datosSesion);
						articulo.setCodImpuesto(articuloBean.getCodImpuesto());
					}
					
					// En función del estado del pedido se obtendrán unas cantidades u otras
					if(pedido.isEstaSolicitud()) {
						Double cantidadMedidaSolicitada = Numero.desformatea(request.getParameter("cantidadMedida"), null);
						Double cantidadSolicitada = Numero.desformatea(request.getParameter("cantidad"), null);
						articulo.setCantidadMedidaSolicitada(cantidadMedidaSolicitada);
						articulo.setCantidadSolicitada(cantidadSolicitada);
						articulo.calcularImporte(); // Sólo en este caso se calcula el importe, en el resto se calcula todo SÓLO al cambiar de estado
					}
					else if(pedido.isEstaPendienteAceptacion()) {
						Double cantidadMedidaAceptada = Numero.desformatea(request.getParameter("cantidadMedida"), null);
						Double cantidadAceptada = Numero.desformatea(request.getParameter("cantidad"), null);
						
						// Comprobar que las unidades introducidas son válidas
						validarUnidades(articulo.getCantidadSolicitada(), cantidadAceptada);
						
						articulo.setCantidadMedidaAceptada(cantidadMedidaAceptada);
						articulo.setCantidadAceptada(cantidadAceptada);
					}
					else if(pedido.isEstaPendientePreparacion()) {
						Double cantidadMedidaPreparada = Numero.desformatea(request.getParameter("cantidadMedida"), null);
						Double cantidadPreparada = Numero.desformatea(request.getParameter("cantidad"), null);
						
						// Comprobar que las unidades introducidas son válidas
						validarUnidades(articulo.getCantidadAceptada(), cantidadPreparada);
						
						articulo.setCantidadMedidaPreparada(cantidadMedidaPreparada);
						articulo.setCantidadPreparada(cantidadPreparada);
					}
					
					break;
				case 2: // pagos
					PagoPedidoVentaBean pago = (PagoPedidoVentaBean) formulario.getFormularioPestañaActiva().getRegistroActivo();
					pago.setIdMedioPagoVencimiento(Numero.desformateaLong(request.getParameter("idMedioPagoVencimiento"), null));
					pago.setDesMedioPagoVencimiento(request.getParameter("desMedioPagoVencimiento"));
					pago.setImporte(Numero.desformatea(request.getParameter("importe"), null));
					
					// No permitir que el importe introducido sea de distinto signo al del total
					if (pedido.getTotal() > 0 && pago.getImporte() < 0) {
						throw new PagoPedidoVentaConstraintViolationException("Debe introducir un importe positivo");
					}
					else if (pedido.getTotal() < 0 && pago.getImporte() > 0) {
						throw new PagoPedidoVentaConstraintViolationException("Debe introducir un importe negativo");
					}
					
					break;
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	private void leerFormularioDesgloses(FormularioPedidoVentaBean formulario, HttpServletRequest request) throws Exception {
		HttpSession sesion = request.getSession();
		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
		
		// Recuperar el padido
		PedidoVenta pedido = formulario.getRegistroActivo();
		
		// Obtener el artículo y sus precios
		String codArticulo = request.getParameter("codArticulo");
		ArticuloBean articulo = ServicioArticulos.consultar(codArticulo, datosSesion);
		PreciosArticuloTarifaBean preciosArticuloTarifa = ServicioArticulosTarifas.obtenerPreciosArticuloTarifa(articulo.getCodArticulo(), pedido.getCodTarifa(), pedido.getCodCliente(), datosSesion);
		
		// Obtener los datos del artículo a partir los inputs del formulario que cumplán el patrón
		String patron = "cantDesglose|";
		Enumeration<String> nombresParametros = request.getParameterNames(); 
		while(nombresParametros.hasMoreElements()) {
			String nombre = nombresParametros.nextElement();
			
			// Si el nombre del parámetro cumple el patrón
			if(nombre.startsWith(patron)) {
				StringTokenizer tokenizer = new StringTokenizer(nombre, "|");
				tokenizer.nextToken(); // Patron
				String desglose1 = tokenizer.nextToken(); // Desglose 1
				String desglose2 = tokenizer.nextToken(); // Desglose 2
				Double cantidad = Numero.desformatea(request.getParameter(nombre), null);
				
				// Sólo crear y añadir el artículo si se especificó cantidad
				if (cantidad != null && cantidad != 0) {
					ArticuloPedidoVentaBean articuloPedido = nuevoArticulo(formulario, request);
					
					articuloPedido.setCodArticulo(articulo.getCodArticulo());
					articuloPedido.setDesArticulo(articulo.getDesArticulo());
					articuloPedido.setDesglose1(desglose1);
					articuloPedido.setDesglose2(desglose2);
					// Si el receptor es una tienda obtener el precio de costo, si no el de venta
					if(pedido.getCliente().isEsTienda()) {
						articuloPedido.setPrecio(preciosArticuloTarifa.getPrecioCosto());
					}
					else {
						articuloPedido.setPrecio(preciosArticuloTarifa.getPrecioVenta());
					}
					articuloPedido.setDescuento(0.0);
					articuloPedido.setImporte(0.0);
					// En función del estado del pedido se establecerán unas cantidades u otras TODO: esto podría unificarse para no repetir las condiciones para establecer las cantidades
					if(pedido.isEstaSolicitud()) {
						articuloPedido.setCantidadSolicitada(cantidad);
						articuloPedido.calcularImporte(); // Sólo en este caso se calcula el importe, en el resto se calcula SÓLO al cambiar de estado
					}
					else if(pedido.isEstaPendienteAceptacion()) {
						articuloPedido.setCantidadAceptada(cantidad);
					}
					else if(pedido.isEstaPendientePreparacion()) {
						articuloPedido.setCantidadPreparada(cantidad);
					}
					articuloPedido.setCodImpuesto(articulo.getCodImpuesto());
					
	            	formulario.getFormularioPestañaActiva().aceptar();
	            	
	            	// Recalculamos los totales del pedido
	            	if(pedido.isEstaSolicitud()) {
	            		pedido.calcularTotales();
	            	}
				}
			}
		}
	}
	
	private void validarUnidades(Double unidadesIniciales, Double unidadesFinales) throws ArticuloPedidoVentaConstraintViolationException {
		// No existen unidades iniciales (solicitadas o aceptadas), así que las unidades finales (aceptadas o preparadas) no pueden ser 0 o nulas
		if (unidadesIniciales == null) {
			if (unidadesFinales == null) {
				throw new ArticuloPedidoVentaConstraintViolationException("Debe introducir un valor en las unidades");
			}
			if (unidadesFinales == 0) {
				throw new ArticuloPedidoVentaConstraintViolationException("Las unidades no pueden valer cero");
			}
		}
		// Existe cantidad aceptada
		else {
			// Las unidades tienen que ser del mismo signo
			if (unidadesIniciales > 0 && unidadesFinales < 0) {
				throw new ArticuloPedidoVentaConstraintViolationException("Debe introducir unidades positivas");
			}
			else if (unidadesIniciales < 0 && unidadesFinales > 0) {
				throw new ArticuloPedidoVentaConstraintViolationException("Debe introducir unidades negativas");
			}
			// Las unidades finales no deben superar a las iniciales
			else if (Math.abs(unidadesFinales) > Math.abs(unidadesIniciales)) {
				throw new ArticuloPedidoVentaConstraintViolationException("Las unidades introducidas no pueden superar a las iniciales (solicitadas o aceptadas)");
			}
		}
	}
}
