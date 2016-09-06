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

package com.comerzzia.web.compras.facturas.conformacion.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.compras.facturas.detalle.DetalleFacturaCompraBean;
import com.comerzzia.persistencia.compras.facturas.pagos.PagoFacturaCompraBean;
import com.comerzzia.servicios.compras.facturas.FacturaCompra;
import com.comerzzia.servicios.compras.facturas.FacturaCompraException;
import com.comerzzia.servicios.compras.facturas.FacturaCompraNotFoundException;
import com.comerzzia.servicios.compras.facturas.ServicioFacturasCompras;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.compras.facturas.conformacion.ui.FormularioConformacionFacturasBean;

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
			DatosSesionBean datosSesion = (DatosSesionBean)sesion.getAttribute(WebKeys.DATOS_SESION);
			
			// Obtenemos la operación solicitada
			String operacion = request.getParameter("operacion");
			String indice = request.getParameter("indice");
			log.debug("ejecutar() - operacion=" + operacion + " indice=" + indice);
			
			// Actualizamos el formulario
			FormularioConformacionFacturasBean formulario = (FormularioConformacionFacturasBean) sesion.getAttribute(WebKeys.FORMULARIO_CONFORMACION_FACTURAS);
			if (operacion == null || !operacion.equals("cancelar")) {
				leerFormulario(formulario, request);
			}
			
            if (operacion != null) {
            	// Cambiar pestaña activa
                if (operacion.equals("pestaña")) {  
                	formulario.setPestañaActiva(Integer.parseInt(indice));
                	if(formulario.getPestañaActiva() == 2){ // Medios de pago
                		//Primero comprobamos si el nº de factura del proveedor(referencia) ya existe 
                		try{
                			// Obtenemos la Factura
                			FacturaCompra factura = (FacturaCompra) formulario.getRegistroActivo();
                			//Comprobamos si existe
                			ServicioFacturasCompras.consultar(factura, datosSesion);
                			setMensajeError(request, "Ya existe el nº de factura para este proveedor.");
                			formulario.setPestañaActiva(0);
                			return getControlador().getAccion("verFormulario").ejecutar(request);
                		}
                		catch (FacturaCompraNotFoundException ignore) {;}

                		// Si tenemos algún formulario en edición forzamos a que se acepten o cancelen los cambios
                    	int pestaña = formulario.getIndicePrimeraPestañaEditable();
                    	if (pestaña != -1 && pestaña != 2) {
                    		formulario.setPestañaActiva(pestaña);
                    		setMensajeError(request, "Debe aceptar o cancelar los cambios de la línea antes de pasar a definir los pagos de la factura.");
                    	}
                	}
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
	    				case 1:  // Lineas
	    					DetalleFacturaCompraBean detalleFactura = new DetalleFacturaCompraBean();
	    					formulario.getFormularioPestañaActiva().setModoInsercion(detalleFactura);
	    					break;
	    				case 2:  // Medios de pago
                			// Obtenemos la Factura
                			FacturaCompra factura = (FacturaCompra) formulario.getRegistroActivo();
                			//Creamos un nuevo medio de pago
                			PagoFacturaCompraBean medioPago = new PagoFacturaCompraBean();
	    					medioPago.setImporte(factura.calcularDiferenciaImportePagos());
	    					formulario.getFormularioPestañaActiva().setModoInsercion(medioPago);
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
                	if(formulario.getPestañaActiva() == 1){ // Lineas
                		((FacturaCompra)formulario.getRegistroActivo()).reCalculaImpuestos();
                	}
                }
                // Aceptar cambios del formulario de la pestaña activa
                else if (operacion.equals("aceptarRegistroPestaña")) {
                	leerFormularioRegistro(formulario, request);
                	formulario.getFormularioPestañaActiva().aceptar();
                	if(formulario.getPestañaActiva() == 1){ // Lineas
                		((FacturaCompra)formulario.getRegistroActivo()).reCalculaImpuestos();
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
                		setMensajeError(request, "Debe aceptar o cancelar los cambios de la línea antes de salvar la factura");
                	}
                	else {
                		return getControlador().getAccion("salvar").ejecutar(request);
                	}
                }
                // Cancelar cambios en el formulario
                else if (operacion.equals("cancelar")) {
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
	
	private void leerFormulario(FormularioConformacionFacturasBean formulario, HttpServletRequest request) throws FechaException {
		if (formulario.isEnInsercion()) {
			switch (formulario.getPestañaActiva()) {
				case 0:  // Cabecera
					FacturaCompra factura = (FacturaCompra) formulario.getRegistroActivo();
					factura.setDesProveedor(request.getParameter("desProveedor"));
					factura.setDomicilio(request.getParameter("domicilio"));
					factura.setPoblacion(request.getParameter("poblacion"));
					factura.setProvincia(request.getParameter("provincia"));
					factura.setCp(request.getParameter("cp"));
					factura.setCif(request.getParameter("cif"));
					factura.setFechaRecFactura(Fechas.getFecha(request.getParameter("fechaRecFactura")));
					factura.setFechaFacturaProveedor(Fechas.getFecha(request.getParameter("fechaFacturaProveedor")));
					factura.setReferencia(request.getParameter("referencia"));
					factura.setConcepto(request.getParameter("concepto"));
					factura.setCodSerie(request.getParameter("codSerie"));
					factura.setDesSerie(request.getParameter("desSerie"));
					factura.setObservaciones(request.getParameter("observaciones"));
					
					break;
			}
		}
	}
	
	private void leerFormularioRegistro(FormularioConformacionFacturasBean formulario, HttpServletRequest request) throws FechaException, FacturaCompraException {
		switch (formulario.getPestañaActiva()) {
			case 1:  // Lineas
				if (formulario.getFormularioPestañaActiva().isEditable()) {
					DetalleFacturaCompraBean detalleFactura = (DetalleFacturaCompraBean) formulario.getFormularioPestañaActiva().getRegistroActivo();
					detalleFactura.setCodImpuesto(request.getParameter("codImpuesto"));
					detalleFactura.setDesImpuesto(request.getParameter("desImpuesto"));
					detalleFactura.setConcepto(request.getParameter("concepto"));
					detalleFactura.setPrecio(Numero.desformatea(request.getParameter("base"), 0.0));
					((FacturaCompra)formulario.getRegistroActivo()).calculaImpuestosDetalle(detalleFactura);
				}
				break;
			case 2:  // Medios de pago
				if (formulario.getFormularioPestañaActiva().isEditable()) {
					PagoFacturaCompraBean medioPago = (PagoFacturaCompraBean) formulario.getFormularioPestañaActiva().getRegistroActivo();
					medioPago.setIdMedioPagoVencimiento(Numero.desformateaLong(request.getParameter("idMedioPagoVencimiento"), null));
					medioPago.setDesMedioPagoVencimiento(request.getParameter("desMedioPagoVencimiento"));
					medioPago.setImporte(Numero.desformatea(request.getParameter("importe"), 0.0));
				}
				break;
		}
	}
}
