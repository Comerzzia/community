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

package com.comerzzia.servicios.estadisticas;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.comerzzia.persistencia.compras.albaranes.AlbaranesComprasDao;
import com.comerzzia.persistencia.compras.albaranes.pagos.PagosAlbaranesComprasDao;
import com.comerzzia.persistencia.core.usuarios.UsuariosDao;
import com.comerzzia.persistencia.general.almacenes.AlmacenesDao;
import com.comerzzia.persistencia.general.articulos.ArticulosDao;
import com.comerzzia.persistencia.general.clientes.ClientesDao;
import com.comerzzia.persistencia.general.proveedores.ProveedoresDao;
import com.comerzzia.persistencia.tiendavirtual.config.ConfigTiendaVirtualBean;
import com.comerzzia.persistencia.tiendavirtual.tiendas.TiendaVirtualBean;
import com.comerzzia.persistencia.tiendavirtual.tiendas.TiendasTiendaVirtualDao;
import com.comerzzia.persistencia.ventas.albaranes.AlbaranesVentasDao;
import com.comerzzia.persistencia.ventas.albaranes.articulos.ArticulosAlbaranesVentasDao;
import com.comerzzia.persistencia.ventas.albaranes.pagos.PagosAlbaranesVentasDao;
import com.comerzzia.persistencia.ventas.pedidos.PedidosVentasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.variables.ServicioVariables;
import com.comerzzia.servicios.core.variables.VariableException;
import com.comerzzia.servicios.core.variables.VariableNotFoundException;
import com.comerzzia.util.config.AppInfo;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.util.xml.XMLDocumentException;
import com.comerzzia.util.xml.XMLDocumentUtils;

public class ServicioEstadisticas {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioEstadisticas.class);

	private static final String TAG_ESTADISTICAS                    = "estadisticas";
	private static final String TAG_FECHA                           = "fecha";
	private static final String TAG_VERSION                         = "version";
	private static final String TAG_EMPRESA                         = "empresa";
	private static final String TAG_NOMBRE_EMPRESA                  = "nombre";
	private static final String TAG_REGISTRO_MERCANTIL              = "registroMercantil";
	private static final String TAG_CIF                             = "cif";
	private static final String TAG_VOLUMEN                         = "volumen";
	private static final String TAG_CLIENTES                        = "clientes";
	private static final String TAG_PROVEEDORES                     = "proveedores";
	private static final String TAG_ARTICULOS                       = "articulos";
	private static final String TAG_USUARIOS                        = "usuarios";
	private static final String TAG_ALMACENES                       = "almacenes";
	private static final String TAG_MOVIMIENTOS_ALMACEN             = "movimientos";
	private static final String TAG_TRANSACCIONES                   = "transacciones";
	private static final String TAG_TICKETS_EMPRESA                 = "ticketsEmpresa";
	private static final String TAG_ALBARANES_VENTA_EMPRESA         = "albaranesVentaEmpresa";
	private static final String TAG_ALBARANES_COMPRA_EMPRESA        = "albaranesCompraEmpresa";
	private static final String TAG_PEDIDOS_TIENDA_VIRTUAL          = "pedidosTiendaVirtual";
	private static final String TAG_LINEAS_TICKETS                  = "lineasTickets";
	private static final String TAG_TRANSACCIONES_VENTA             = "transaccionesVenta";
	private static final String TAG_VENTA                           = "venta";
	private static final String TAG_TRANSACCIONES_VENTA_TOTAL       = "transaccionesVentaTotal";
	private static final String TAG_TRANSACCIONES_VENTA_FORMA_PAGO  = "transaccionesVentaFormaPago";
	private static final String TAG_TRANSACCIONES_COMPRA            = "transaccionesCompra";
	private static final String TAG_COMPRA                          = "compra";
	private static final String TAG_TRANSACCIONES_COMPRA_TOTAL      = "transaccionesCompraTotal";
	private static final String TAG_TRANSACCIONES_COMPRA_FORMA_PAGO = "transaccionesCompraFormaPago";
	
	public static String generarEstadisticas(DatosSesionBean datosSesion) throws EstadisticaException {
		try {
			log.debug("generarEstadisticas() - Inicio de la generación de estadísiticas");
			
			Estadisticas estadisticas = consultar(datosSesion);
			String xmlEstadisticas = generarXMLEstadisticas(estadisticas); 
			
			log.debug("generarEstadisticas() - Fin de la generación de estadísiticas");
			
			return xmlEstadisticas;
		}
		catch (EstadisticaException e) {
			throw e;
		}
	}
	
	private static Estadisticas consultar(DatosSesionBean datosSesion)throws EstadisticaException{
		Estadisticas estadisticas = new Estadisticas();
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando datos necesarios para generar las estadísticas");
			conn.abrirConexion(Database.getConnection());
		
			//Indicamos la fecha de la generación de las estadísticas
			estadisticas.setFecha(new Date());
			
			//Indicamos la versión de la aplicación
			estadisticas.setVersion(ServicioVariables.consultar("GENERAL.VERSION").getValor());
			
			//Insertamos el objeto que contiene todos los datos de la empresa
			estadisticas.setDatosEmpresa(datosSesion.getEmpresa());
			
			//Consultamos el volumen de negocio
			estadisticas.setVolumenNegocio(consultarVolumenNegocio(conn, datosSesion));
			
			//Consultamos las transacciones del negocio
			estadisticas.setTransaccionNegocio(consultarTransaccionesNegocio(conn, datosSesion));
						
			return estadisticas;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando estadísticas: " + e.getMessage();
		
			throw new EstadisticaException(mensaje, e);
		} 
		catch (VariableException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando estadísticas: " + e.getMessage();
		
			throw new EstadisticaException(mensaje, e);
		}
		catch (VariableNotFoundException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando estadísticas: " + e.getMessage();
		
			throw new EstadisticaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	private static VolumenNegocio consultarVolumenNegocio(Connection conn, DatosSesionBean datosSesion)throws EstadisticaException{
		VolumenNegocio volumenNegocio = new VolumenNegocio();
		
		try {
			log.debug("consultarVolumenNegocio() - Consultando volumen de negocio");
		
			//Total clientes
			volumenNegocio.setNumeroClientes(ClientesDao.consultarTotalClientes(conn, datosSesion.getConfigEmpresa()));

			//Total proveedores
			volumenNegocio.setNumeroProveedores(ProveedoresDao.consultarTotalProveedores(conn, datosSesion.getConfigEmpresa()));
			
			//Total artículos
			volumenNegocio.setNumeroArticulos(ArticulosDao.consultarTotalArticulos(conn, datosSesion.getConfigEmpresa()));
			
			//Total usuarios
			volumenNegocio.setNumeroUsuarios(UsuariosDao.consultarTotalUsuarios(conn, datosSesion.getConfigEmpresa()));
			
			//Total almacenes
			volumenNegocio.setNumeroAlmacenes(AlmacenesDao.consultarTotalAlmacenes(conn, datosSesion.getConfigEmpresa()));
			
			//TODO: Total movimientos almacén
			volumenNegocio.setNumeroMovimientosAlmacen(0L);
			
			return volumenNegocio;
		}
		catch (SQLException e) {
			log.error("consultarVolumenNegocio() - " + e.getMessage());
			String mensaje = "Error consultando estadísticas: " + e.getMessage();
		
			throw new EstadisticaException(mensaje, e);
		}
	}
	
	private static TransaccionesNegocio consultarTransaccionesNegocio(Connection conn, DatosSesionBean datosSesion)throws EstadisticaException{
		TransaccionesNegocio transaccionesNegocio = new TransaccionesNegocio();
		
		try {
			log.debug("consultarTransaccionesNegocio() - Consultando transacciones de negocio");
		
			//Total de tickets
			transaccionesNegocio.setNumeroTicketsEmpresa(AlbaranesVentasDao.consultarTotalTickets(conn, datosSesion.getConfigEmpresa(), datosSesion.getEmpresa().getCodEmp()));
			
			//Total de líneas por tickets
			Double totalLineasTickets = 0D;
			if(transaccionesNegocio.getNumeroTicketsEmpresa() > 0){
				Double totalLineas = ArticulosAlbaranesVentasDao.consultarTotalLineasTickets(conn, datosSesion.getConfigEmpresa(), datosSesion.getEmpresa().getCodEmp());
				totalLineasTickets = totalLineas / transaccionesNegocio.getNumeroTicketsEmpresa();
			}
			transaccionesNegocio.setNumeroLineasTickets(Numero.redondea(totalLineasTickets, 2));
			
			//Total albaranes de venta
			transaccionesNegocio.setNumeroAlbaranesVentaEmpresa(AlbaranesVentasDao.consultarTotalAlbaranesVentas(conn, datosSesion.getConfigEmpresa(), datosSesion.getEmpresa().getCodEmp()));

			//Total albaranes de compra
			transaccionesNegocio.setNumeroAlbaranesCompraEmpresa(AlbaranesComprasDao.consultarTotalAlbaranesCompras(conn, datosSesion.getConfigEmpresa(), datosSesion.getEmpresa().getCodEmp()));
			
			//Total pedidos tienda on line
			ConfigTiendaVirtualBean configTiendaVirtual = new ConfigTiendaVirtualBean();
			configTiendaVirtual.setEsquemaTiendaVirtual(AppInfo.getDbInfo().getEsquemaEmpresa());
			TiendaVirtualBean tienda = TiendasTiendaVirtualDao.consultar(conn, configTiendaVirtual, TiendaVirtualBean.UID_TIENDA_VIRTUAL);
			if (tienda != null) {
				transaccionesNegocio.setNumeroPedidosTiendaVirtual(PedidosVentasDao.consultarTotalPedidosAlmacen(conn, datosSesion.getConfigEmpresa(), tienda.getCodAlmacen()));
			}
			else {
				transaccionesNegocio.setNumeroPedidosTiendaVirtual(0L);
			}
			
			//Total de transacciones ventas por forma de pago
			transaccionesNegocio.setNumeroTransaccionesVentaFormaPago(PagosAlbaranesVentasDao.consultarTotalAlbaranesVentasFormaPago(conn, datosSesion.getConfigEmpresa()));
			
			//Total de transacciones compras por forma de pago
			transaccionesNegocio.setNumeroTransaccionesCompraFormaPago(PagosAlbaranesComprasDao.consultarTotalAlbaranesComprasFormaPago(conn, datosSesion.getConfigEmpresa()));
			
			return transaccionesNegocio;
		}
		catch (SQLException e) {
			log.error("consultarTransaccionesNegocio() - " + e.getMessage());
			String mensaje = "Error consultando estadísticas: " + e.getMessage();
		
			throw new EstadisticaException(mensaje, e);
		}
	}

	@SuppressWarnings("unchecked")
	private static String generarXMLEstadisticas(Estadisticas estadisticas) throws EstadisticaException{
		try{
			Document document = XMLDocumentUtils.createDocument();
			Element root = (Element) document.createElement(TAG_ESTADISTICAS);
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			XMLDocumentUtils.appendChild(document, root, TAG_FECHA, sdf.format(estadisticas.getFecha()));
			XMLDocumentUtils.appendChild(document, root, TAG_VERSION, estadisticas.getVersion());
			
			Element empresa = (Element) document.createElement(TAG_EMPRESA);
			XMLDocumentUtils.appendChild(document, empresa, TAG_NOMBRE_EMPRESA, estadisticas.getDesEmpresa());
			XMLDocumentUtils.appendChild(document, empresa, TAG_REGISTRO_MERCANTIL, estadisticas.getRegistroMercantil());
			XMLDocumentUtils.appendChild(document, empresa, TAG_CIF, estadisticas.getCif());
			root.appendChild(empresa);

			Element volumen = (Element) document.createElement(TAG_VOLUMEN);
			XMLDocumentUtils.appendChild(document, volumen, TAG_CLIENTES, estadisticas.getNumeroClientes());
			XMLDocumentUtils.appendChild(document, volumen, TAG_PROVEEDORES, estadisticas.getNumeroProveedores());
			XMLDocumentUtils.appendChild(document, volumen, TAG_ARTICULOS, estadisticas.getNumeroArticulos());
			XMLDocumentUtils.appendChild(document, volumen, TAG_USUARIOS, estadisticas.getNumeroUsuarios());
			XMLDocumentUtils.appendChild(document, volumen, TAG_ALMACENES, estadisticas.getNumeroAlmacenes());
			XMLDocumentUtils.appendChild(document, volumen, TAG_MOVIMIENTOS_ALMACEN, estadisticas.getNumeroMovimientosAlmacen());
			root.appendChild(volumen);

			Element transacciones = (Element) document.createElement(TAG_TRANSACCIONES);
			XMLDocumentUtils.appendChild(document, transacciones, TAG_TICKETS_EMPRESA, estadisticas.getNumeroTicketsEmpresa());
			XMLDocumentUtils.appendChild(document, transacciones, TAG_LINEAS_TICKETS, Numero.formatea(estadisticas.getNumeroLineasTickets()));
			XMLDocumentUtils.appendChild(document, transacciones, TAG_ALBARANES_VENTA_EMPRESA, estadisticas.getNumeroAlbaranesVentaEmpresa());
			XMLDocumentUtils.appendChild(document, transacciones, TAG_ALBARANES_COMPRA_EMPRESA, estadisticas.getNumeroAlbaranesCompraEmpresa());
			XMLDocumentUtils.appendChild(document, transacciones, TAG_PEDIDOS_TIENDA_VIRTUAL, estadisticas.getNumeroPedidosTiendaVirtual());
			
			Element transaccionesVenta = (Element) document.createElement(TAG_TRANSACCIONES_VENTA);
			int cont = 0;
			Iterator it = estadisticas.getNumeroTransaccionesVentaFormaPago().entrySet().iterator();
			while (it.hasNext()) {
				Map.Entry e = (Map.Entry)it.next();
				Element venta = (Element) document.createElement(TAG_VENTA);
				venta.setAttribute("id_venta", Integer.toString(cont));
				XMLDocumentUtils.appendChild(document, venta, TAG_TRANSACCIONES_VENTA_FORMA_PAGO, (String)e.getKey());
				XMLDocumentUtils.appendChild(document, venta, TAG_TRANSACCIONES_VENTA_TOTAL, (Long)e.getValue());
				transaccionesVenta.appendChild(venta);
				cont++;
			}
			transacciones.appendChild(transaccionesVenta);
			
			Element transaccionesCompra = (Element) document.createElement(TAG_TRANSACCIONES_COMPRA);
			cont = 0;
			it = estadisticas.getNumeroTransaccionesCompraFormaPago().entrySet().iterator();
			while (it.hasNext()) {
				Map.Entry e = (Map.Entry)it.next();
				Element compra = (Element) document.createElement(TAG_COMPRA);
				compra.setAttribute("id_compra", Integer.toString(cont));
				XMLDocumentUtils.appendChild(document, compra, TAG_TRANSACCIONES_COMPRA_FORMA_PAGO, (String)e.getKey());
				XMLDocumentUtils.appendChild(document, compra, TAG_TRANSACCIONES_COMPRA_TOTAL, (Long)e.getValue());
				transaccionesCompra.appendChild(compra);
				cont++;
			}
			transacciones.appendChild(transaccionesCompra);

			root.appendChild(transacciones);

			document.appendChild(root);
			
			return XMLDocumentUtils.DocumentToString(document);
		} 
		catch (XMLDocumentException e) {
			log.error("generarXMLEstadisticas() - " + e.getMessage());
			String mensaje = "Error generando xml de estadísticas: " + e.getMessage();
		
			throw new EstadisticaException(mensaje, e);
		}
		catch (Exception e) {
			log.error("generarXMLEstadisticas() - " + e.getMessage());
			String mensaje = "Error generando xml de estadísticas: " + e.getMessage();
		
			throw new EstadisticaException(mensaje, e);
		}
	}
}
