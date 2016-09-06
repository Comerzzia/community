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

package com.comerzzia.web.backoffice.ventas.pedidos.acciones;

import java.util.Enumeration;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.articulos.ArticuloBean;
import com.comerzzia.persistencia.general.articulos.codigosbarras.CodigoBarrasArticuloBean;
import com.comerzzia.persistencia.ventas.pedidos.articulos.ArticuloPedidoVentaBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.articulos.ArticuloDesgloses;
import com.comerzzia.servicios.general.articulos.ServicioArticulos;
import com.comerzzia.servicios.general.articulos.codigosbarras.ServicioCodigosBarrasArticulos;
import com.comerzzia.servicios.ventas.pedidos.PedidoVenta;
import com.comerzzia.servicios.ventas.pedidos.PedidoVentaConstraintViolationException;
import com.comerzzia.servicios.ventas.pedidos.ServicioPedidosVentas;
import com.comerzzia.servicios.ventas.tarifas.articulos.PreciosArticuloTarifaBean;
import com.comerzzia.servicios.ventas.tarifas.articulos.ServicioArticulosTarifas;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.backoffice.ventas.pedidos.ui.FormularioPedidoVentaBackofficeBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;


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
			FormularioPedidoVentaBackofficeBean formulario = (FormularioPedidoVentaBackofficeBean) sesion.getAttribute(WebKeys.FORMULARIO_PEDIDO_VENTA_BACKOFFICE);
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
                	switch (formulario.getPestañaActiva()) {
	    				case 1:  // Artículos
	    					nuevoArticulo(formulario, request);
	    					
	    					break;
	    			}
                }
                // Editar un registro de la pestaña activa
                else if (operacion.equals("editarRegistroPestaña")) {
                	formulario.getFormularioPestañaActiva().setModoEdicion(Integer.parseInt(indice));
                }
                // Eliminar un registro de la pesaña activa
                else if (operacion.equals("eliminarRegistroPestaña")) {
                	PedidoVenta pedido = formulario.getRegistroActivo();
                	
                	switch (formulario.getPestañaActiva()) {
                		case 1:  // Artículos
                        	pedido.eliminarLineaPedido(Integer.parseInt(indice));
                        	pedido.calcularTotales();
                        	
                        	break;
                	}
                }
                // Aceptar cambios del formulario de la pestaña activa
                if (operacion.equals("aceptarRegistroPestaña")) {
                	PedidoVenta pedido = formulario.getRegistroActivo();
                	boolean enInsercion = false;
                	
                	switch (formulario.getPestañaActiva()) {
            			case 1:  // Artículos
                        	leerFormularioRegistro(formulario, request);
                        	enInsercion = formulario.getFormularioPestañaActiva().isEnInsercion();
                        	formulario.getFormularioPestañaActiva().aceptar();
                        	
                        	// Recalculamos los totales del pedido
                        	pedido.calcularTotales();
                        	
                        	// Si estábamos en modo inserción continuamos añadiendo artículos
                        	if (enInsercion) {
                        		nuevoArticulo(formulario, request);
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
	
	private ArticuloPedidoVentaBean nuevoArticulo(FormularioPedidoVentaBackofficeBean formulario, HttpServletRequest request) throws Exception {
		PedidoVenta pedido = formulario.getRegistroActivo();
		ArticuloPedidoVentaBean articulo = new ArticuloPedidoVentaBean();
		pedido.setEstadoLineaSolicitada(articulo);
		formulario.getFormularioPestañaActiva().setModoInsercion(articulo);
		
		return articulo;
	}
	
	/**
	 * Lee los campos del formulario principal y del formulario de la pestaña activa
	 * actualizando los atributos del registro activo
	 * @param formulario
	 * @param request
	 */
	private void leerFormulario(FormularioPedidoVentaBackofficeBean formulario, HttpServletRequest request) throws Exception {
		DatosSesionBean datosSesion = (DatosSesionBean) request.getSession().getAttribute(WebKeys.DATOS_SESION);
		PedidoVenta pedido = formulario.getRegistroActivo();
		
		if (formulario.isEditable()) {
			switch (formulario.getPestañaActiva()) {
				case 0:  // Cabecera
					// Si no tiene artículos guardamos los datos del almacén
					if(!pedido.isTieneArticulos()){
						pedido.setConceptoAlmacen(request.getParameter("codConceptoAlmacen"), request.getParameter("codAlmacen"), datosSesion);
					}
					pedido.setFecha(Fechas.getFecha(request.getParameter("fecha")));
					try {
						pedido.setFechaSuministroPrevista(Fechas.getFecha(request.getParameter("fechaSuministroPrevista")));
					} catch (FechaException ignore) {}
		        	pedido.setObservaciones(request.getParameter("observaciones"));
		        	
		        	break;
			}
		}
	}
	
	
	private void leerFormularioRegistro(FormularioPedidoVentaBackofficeBean formulario, HttpServletRequest request) throws Exception {
		if (formulario.getFormularioPestañaActiva().isEditable()) {
			switch (formulario.getPestañaActiva()) {
				case 1:  // Artículos
					ArticuloPedidoVentaBean articulo = (ArticuloPedidoVentaBean) formulario.getFormularioPestañaActiva().getRegistroActivo();
					articulo.setCodArticulo(request.getParameter("codArticulo"));
					articulo.setDesArticulo(request.getParameter("desArticulo"));
					articulo.setDesglose1(request.getParameter("desglose1"));
					articulo.setDesglose2(request.getParameter("desglose2"));
					articulo.setUnidadMedida(request.getParameter("unidadMedida"));
					articulo.setUnidadMedidaAlternativa(request.getParameter("unidadMedidaAlternativa"));
					articulo.setCantidadMedidaSolicitada(Numero.desformatea(request.getParameter("cantidadMedida"), null));
					articulo.setCantidadSolicitada(Numero.desformatea(request.getParameter("cantidad"), null));
					articulo.setPrecio(Numero.desformatea(request.getParameter("precio"), null));
					articulo.setDescuento(Numero.desformatea(request.getParameter("descuento"), 0.0));
					articulo.calcularImporte();
					articulo.setDescripcionAmpliada(request.getParameter("descripcionAmpliada"));
					
					// Obtenemos el código de impuesto del artículo
					DatosSesionBean datosSesion = (DatosSesionBean) request.getSession().getAttribute(WebKeys.DATOS_SESION);
					ArticuloBean articuloBean = ServicioArticulos.consultar(articulo.getCodArticulo(), datosSesion);
					articulo.setCodImpuesto(articuloBean.getCodImpuesto());
					
					break;
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	private void leerFormularioDesgloses(FormularioPedidoVentaBackofficeBean formulario, HttpServletRequest request) throws Exception {
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
}
