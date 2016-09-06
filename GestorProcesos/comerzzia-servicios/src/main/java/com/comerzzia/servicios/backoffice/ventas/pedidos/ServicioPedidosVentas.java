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

package com.comerzzia.servicios.backoffice.ventas.pedidos;

import java.sql.SQLException;

import com.comerzzia.persistencia.ventas.pedidos.PedidosVentasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.pedidos.PedidoVentaConstraintViolationException;
import com.comerzzia.servicios.ventas.pedidos.PedidoVentaException;
import com.comerzzia.servicios.ventas.pedidos.articulos.ArticuloPedidoVentaException;
import com.comerzzia.servicios.ventas.pedidos.articulos.ServicioArticulosPedidosVentas;
import com.comerzzia.servicios.ventas.pedidos.impuestos.ImpuestoPedidoVentaException;
import com.comerzzia.servicios.ventas.pedidos.impuestos.ServicioImpuestosPedidosVentas;
import com.comerzzia.servicios.ventas.pedidos.pagos.PagoPedidoVentaException;
import com.comerzzia.servicios.ventas.pedidos.pagos.ServicioPagosPedidosVentas;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioPedidosVentas {

	protected static Logger log = Logger.getMLogger(ServicioPedidosVentas.class);
	
	
	public static PedidoVenta consultar(Long idPedido, DatosSesionBean datosSesion) 
			throws PedidoVentaException, PedidoVentaNotFoundException, ArticuloPedidoVentaException, ImpuestoPedidoVentaException, PagoPedidoVentaException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());

			return consultar(conn, idPedido, datosSesion);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando datos de un pedido: " + e.getMessage();

			throw new PedidoVentaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static PedidoVenta consultar(Connection conn, Long idPedido, DatosSesionBean datosSesion) 
			throws PedidoVentaException, PedidoVentaNotFoundException, ArticuloPedidoVentaException, ImpuestoPedidoVentaException, PagoPedidoVentaException {
		try {
			log.debug("consultar() - Consultando datos del pedido: " + idPedido);
			
			PedidoVenta pedido = new PedidoVenta(PedidosVentasDao.consultar(conn, datosSesion.getConfigEmpresa(), idPedido));
			
			if (pedido.getBean() == null) {
				String msg = "No se ha encontrado el pedido con identificador: " + idPedido;
				log.info("consultar() - " + msg);
				
				throw new PedidoVentaNotFoundException(msg);
			}
			else {
				// Obtener la lista de artículos
				pedido.setArticulos(ServicioArticulosPedidosVentas.consultar(conn, idPedido, datosSesion));
				
				// Obtenemos el detalle de impuestos
				pedido.setDetalleImpuestos(ServicioImpuestosPedidosVentas.consultar(conn, idPedido, datosSesion));
				
				// Obtener la lista de pagos
				pedido.setPagos(ServicioPagosPedidosVentas.consultar(conn, idPedido, datosSesion));
			}

			return pedido;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando datos de un pedido: " + e.getMessage();

			throw new PedidoVentaException(mensaje, e);
		}
	}
	
	public static void eliminar(Long idPedido, DatosSesionBean datosSesion) throws PedidoVentaConstraintViolationException, PedidoVentaException {
		Connection conn = new Connection();
		
		// Comprobamos si el pedido se puede borrar
		try {
			conn.abrirConexion(Database.getConnection());
			
			PedidoVenta pedido = ServicioPedidosVentas.consultar(conn, idPedido, datosSesion);
			pedido.checkPedidoPuedeBorrarse();
			
			// TODO: estaría bien sobreescribir el método al que se llama para que reciba la conexión y no haga de nuevo las comprobaciones de eliminación
			com.comerzzia.servicios.ventas.pedidos.ServicioPedidosVentas.eliminar(idPedido, datosSesion);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error eliminando un pedido: " + e.getMessage();

			throw new PedidoVentaException(mensaje, e);
		}
		catch (PedidoVentaNotFoundException e) {
			// El pedido ya no existe
			return;
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
