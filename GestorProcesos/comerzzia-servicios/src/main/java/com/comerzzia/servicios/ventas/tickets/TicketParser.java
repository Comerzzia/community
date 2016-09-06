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

package com.comerzzia.servicios.ventas.tickets;

import java.util.ArrayList;
import java.util.List;

import org.w3c.dom.Element;

import com.comerzzia.persistencia.core.impuestos.ImpuestoBean;
import com.comerzzia.persistencia.general.almacenes.AlmacenBean;
import com.comerzzia.persistencia.general.almacenes.AlmacenesDao;
import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.general.clientes.ClientesDao;
import com.comerzzia.persistencia.general.mediospago.vencimientos.VencimientoBean;
import com.comerzzia.persistencia.general.mediospago.vencimientos.VencimientosDao;
import com.comerzzia.persistencia.general.tiendas.TiendaBean;
import com.comerzzia.persistencia.general.tiendas.TiendasDao;
import com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean;
import com.comerzzia.persistencia.ventas.albaranes.articulos.ArticuloAlbaranVentaBean;
import com.comerzzia.persistencia.ventas.albaranes.pagos.PagoAlbaranVentaBean;
import com.comerzzia.persistencia.ventas.tickets.TicketBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.albaranes.AlbaranVenta;
import com.comerzzia.servicios.ventas.tarifas.TarifaException;
import com.comerzzia.servicios.ventas.tarifas.articulos.ArticuloTarifaNotFoundException;
import com.comerzzia.servicios.ventas.tarifas.articulos.PreciosArticuloTarifaBean;
import com.comerzzia.servicios.ventas.tarifas.articulos.ServicioArticulosTarifas;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.xml.XMLDocumentUtils;


public class TicketParser {
	
	private Connection conn = null;
	private DatosSesionBean datosSesion = null;
	private TicketBean ticket = null;
	private AlbaranVentaBean albaran = null;
	private AlmacenBean almacen = null;
	private ClienteBean clienteAlbaran = null;
	private ClienteBean clienteAlmacen = null;
	
	
	public TicketParser(Connection conn, DatosSesionBean datosSesion, TicketBean ticket) {
		this.conn = conn;
		this.datosSesion = datosSesion;
		this.ticket = ticket;
		this.albaran = new AlbaranVentaBean();
	}

	
	public AlbaranVenta parse() throws TicketException {
		try {
			// Parseamos el XML 
			Element root = ticket.getXml().getDocumentElement();

			// Inicializamos el obejeto que contiene los datos del albarán
			albaran.setEstadoBean(Estado.NUEVO);
			
			// Extraemos los datos de la cabecera
			Element cabecera = XMLDocumentUtils.getElement(root, "cabecera", false);
			// Generamos la cabecera
			obtenerCabeceraAlbaran(cabecera);
			
			// Extraemos los detalles
			Element detalles = XMLDocumentUtils.getElement(root, "lineas", false);
			// Generamos los detalles
			obtenerDetallesAlbaran(detalles);
			
			// Obtenemos los impuestos
			Element impuestos = XMLDocumentUtils.getElement(cabecera, "lineasimpuestos", false);
			obtenerImpuestosAlbaran(impuestos);
			
			// Extraemos los pagos
			Element pagos = XMLDocumentUtils.getElement(root, "pagos", false);
			// Generamos los pagos
			obtenerPagosAlbaran(pagos);
			
			// Obtenemos el albarán de venta con el cliente
			AlbaranVenta albaranVenta = new AlbaranVenta(albaran);
			albaranVenta.setCliente(clienteAlbaran);
			
			return albaranVenta;
		} 
		catch (Exception e) {
			throw new TicketException("Error al tratar XML de ticket: " + e.getMessage(), e);
		}
	}
	
	
	private void obtenerCabeceraAlbaran(Element cabecera) throws Exception {
		// Obtenemos la tienda a la que pertenece el ticket
		String codTienda = XMLDocumentUtils.getTagValueAsString(cabecera, "tienda", false);
		
		// Obtenemos los datos de la tienda
		TiendaBean tienda = TiendasDao.consultar(conn, datosSesion.getConfigEmpresa(), codTienda);
		if (tienda == null) {
			throw new TicketException("No se ha encontrado la tienda " + tienda);
		}
		
		// Obtenemos los datos del almacén de la tienda
		almacen = AlmacenesDao.consultar(conn, datosSesion.getConfigEmpresa(), codTienda);
		if (almacen == null) {
			throw new TicketException("No se ha encontrado el almacén asociado a la tienda " + tienda);
		}
		
		// Obtenemos los datos del cliente del almacén
		clienteAlmacen = ClientesDao.consultar(conn, datosSesion.getConfigEmpresa(), almacen.getCodCliente());
		if (clienteAlmacen == null) {
			throw new TicketException("No se ha encontrado el cliente " + almacen.getCodCliente() + " asociado al almacén " + almacen.getCodAlm());
		}
		
		// Establecemos datos de la cabecera del albarán
		albaran.setCodEmpresa(almacen.getCodEmp());
		albaran.setCodSerie(almacen.getCodAlm());
		albaran.setCodConceptoAlmacen(tienda.getCodConceptoAlmacen());
		albaran.setCodAlmacen(almacen.getCodAlm());
		String fecha = XMLDocumentUtils.getTagValueAsString(cabecera, "fecha", false);
		albaran.setPeriodo(Short.parseShort(fecha.substring(0, fecha.indexOf("-"))));
		albaran.setFecha(Fechas.getFecha(fecha.substring(0, fecha.indexOf("T")), "yyyy-MM-dd"));
		albaran.setFechaSuministro(Fechas.getFecha(fecha.substring(0, fecha.indexOf("T")), "yyyy-MM-dd"));
		albaran.setReferenciaCliente(albaran.getCodAlmacen() + "/" + ticket.getIdTicket());
		albaran.setUidTicket(XMLDocumentUtils.getTagValueAsString(cabecera, "uid_ticket", false));
		albaran.setHora(fecha.substring(fecha.indexOf("T") + 1, fecha.length() - 3));
		albaran.setCodCaja(XMLDocumentUtils.getTagValueAsString(cabecera, "codcaja", false));

		//Obtenemos los datos del cliente
		Element cliente = XMLDocumentUtils.getElement(cabecera, "cliente", false);
		clienteAlbaran = new ClienteBean();
		clienteAlbaran.setCodCli(XMLDocumentUtils.getTagValueAsString(cliente, "codcli", false));
		clienteAlbaran.setDesCli(XMLDocumentUtils.getTagValueAsString(cliente, "descli", false));
		clienteAlbaran.setIdTratImp(XMLDocumentUtils.getTagValueAsLong(cliente, "id_trat_impuestos", false));
		
		albaran.setCodCliente(clienteAlbaran.getCodCli());
		albaran.setIdGrupoImpuestos(XMLDocumentUtils.getTagValueAsLong(cliente, "id_grupo_impuestos", false));
		albaran.setIdTratamientoImpuestos(clienteAlbaran.getIdTratImp());

		//Obtenemos los datos del usuario
		Element usuario = XMLDocumentUtils.getElement(cabecera, "cajero", false);
		albaran.setIdUsuario(XMLDocumentUtils.getTagValueAsLong(usuario, "id_usuario", false));
		
		//Obtenemos los totales
		Element totales = XMLDocumentUtils.getElement(cabecera, "totales", false);
		albaran.setBase(XMLDocumentUtils.getTagValueAsDouble(totales, "base", false));
		albaran.setImpuestos(XMLDocumentUtils.getTagValueAsDouble(totales, "impuestos", false));
		albaran.setTotal(XMLDocumentUtils.getTagValueAsDouble(totales, "total", false));
	}

	private void obtenerDetallesAlbaran(Element detalles) throws Exception {
		// Obtenemos los artículos del ticket
		List<Element> lstElementos = XMLDocumentUtils.getChildElements(detalles);
		
		for (int i=0; i<lstElementos.size(); i++){
			Element linea = lstElementos.get(i);
				
			ArticuloAlbaranVentaBean articulo = new ArticuloAlbaranVentaBean();
			articulo.setEstadoBean(Estado.NUEVO);
			articulo.setLinea(Integer.parseInt(XMLDocumentUtils.getAttribute(linea, "idlinea", false)));
			articulo.setCodArticulo(XMLDocumentUtils.getTagValueAsString(linea, "codart", false));
			articulo.setDesglose1(XMLDocumentUtils.getTagValueAsString(linea, "desglose1", false));
			articulo.setDesglose2(XMLDocumentUtils.getTagValueAsString(linea, "desglose2", false));
			articulo.setDesArticulo(XMLDocumentUtils.getTagValueAsString(linea, "desart", false));
			articulo.setCantidad(XMLDocumentUtils.getTagValueAsDouble(linea, "cantidad", false));
			articulo.setCantidadMedida(XMLDocumentUtils.getTagValueAsDouble(linea, "cantidad_medida", true));
			articulo.setUnidadMedida(XMLDocumentUtils.getTagValueAsString(linea, "unidad_medida", true));
			articulo.setPrecio(XMLDocumentUtils.getTagValueAsDouble(linea, "precio", false));
			articulo.setPrecioTotal(XMLDocumentUtils.getTagValueAsDouble(linea, "precio_total", false));
			articulo.setImporte(XMLDocumentUtils.getTagValueAsDouble(linea, "importe", false));
			articulo.setImporteTotal(XMLDocumentUtils.getTagValueAsDouble(linea, "importe_total", false));
			articulo.setCodImpuesto(XMLDocumentUtils.getTagValueAsString(linea, "codImp", false));
			articulo.setDescuento(XMLDocumentUtils.getTagValueAsDouble(linea, "descuento", true));
			
			// Establecemos el precio de costo del artículo a partir de la tarifa del cliente de la tienda
			try {
				PreciosArticuloTarifaBean precios = ServicioArticulosTarifas.obtenerPreciosArticuloTarifa(articulo.getCodArticulo(), 
						clienteAlmacen.getCodTar(), clienteAlmacen.getCodCli(), datosSesion);
				articulo.setPrecioCosto(precios.getPrecioCosto());
			} 
			catch (TarifaException e) {
				throw new TicketException("Error al obtener precio de costo del artículo " 
						+ articulo.getCodArticulo() + ": " + e.getMessage());
			} 
			catch (ArticuloTarifaNotFoundException e) {
				throw new TicketException("Error al obtener precio de costo del artículo " 
						+ articulo.getCodArticulo() + ": El artículo no existe en ninguna tarifa");
			}
			
			// Añadimos el artículo al albarán
			albaran.getArticulos().add(articulo);
		}
	}

	private void obtenerImpuestosAlbaran(Element impuestos) throws Exception {
		List<Element> lstElementos = XMLDocumentUtils.getChildElements(impuestos);
		List<ImpuestoBean> listaImpuestos = new ArrayList<ImpuestoBean>();
		
		for (int i=0; i<lstElementos.size(); i++){
			Element linea = lstElementos.get(i);
				
			ImpuestoBean impuesto = new ImpuestoBean();
			impuesto.setCodImpuesto(XMLDocumentUtils.getTagValueAsString(linea, "codImp", false));
			impuesto.setBase(XMLDocumentUtils.getTagValueAsDouble(linea, "base", false));
			impuesto.setImpuestos(XMLDocumentUtils.getTagValueAsDouble(linea, "impuestos", false));
				
			listaImpuestos.add(impuesto);
		}
		
		albaran.getDetalleImpuestos().setListaImpuestos(listaImpuestos);
	}
	
	
	private void obtenerPagosAlbaran(Element pagos) throws Exception {
		List<Element> lstElementos = XMLDocumentUtils.getChildElements(pagos);
		
		for (int i=0; i<lstElementos.size(); i++){
			Element linea = lstElementos.get(i);
			
			// Si es un nodo de pago
			if (linea.getNodeName().equals("pago")) {
				// Obtenemos el primer vencimiento de la forma del pago del ticket
				String codMedioPago = XMLDocumentUtils.getTagValueAsString(linea, "codmedpag", false);
				List<VencimientoBean> vencimientos = VencimientosDao.consultar(conn, datosSesion.getConfigEmpresa(), codMedioPago);
				if (vencimientos.size() == 0) {
					throw new TicketException("No se han definido vencimientos para el medio de pago " + codMedioPago);
				}
				
				PagoAlbaranVentaBean pago = new PagoAlbaranVentaBean();
				pago.setEstadoBean(Estado.NUEVO);
				pago.setLinea(i);
				pago.setIdMedioPagoVencimiento(vencimientos.get(0).getIdMedioPagoVencimiento());
				pago.setImporte(XMLDocumentUtils.getTagValueAsDouble(linea, "importe", false));
				pago.setNumeroOperacion(XMLDocumentUtils.getTagValueAsString(linea, "numero_operacion", true));

				albaran.addPago(pago);
			}
		}
	}
}
