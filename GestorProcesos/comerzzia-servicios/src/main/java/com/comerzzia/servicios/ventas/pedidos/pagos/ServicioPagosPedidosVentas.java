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

package com.comerzzia.servicios.ventas.pedidos.pagos;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.ventas.pedidos.pagos.PagoPedidoVentaBean;
import com.comerzzia.persistencia.ventas.pedidos.pagos.PagosPedidosVentasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioPagosPedidosVentas {

	protected static Logger log = Logger.getMLogger(ServicioPagosPedidosVentas.class);
	
	
	public static List<PagoPedidoVentaBean> consultar(Long idPedido, DatosSesionBean datosSesion) 
			throws PagoPedidoVentaException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			
			return consultar(conn, idPedido, datosSesion);
		}
		catch(SQLException e){
			String msg = "Error consultando pagos de un pedido de venta: " + e.getMessage();
			log.error("consultar() - " + msg);
			
			throw new PagoPedidoVentaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static List<PagoPedidoVentaBean> consultar(Connection conn, Long idPedido, DatosSesionBean datosSesion) 
			throws PagoPedidoVentaException {
		try {
			log.debug("consultar() - Consultando pagos del pedido de venta " + idPedido);
			
			return PagosPedidosVentasDao.consultar(conn, datosSesion.getConfigEmpresa(), idPedido);
		}
		catch(SQLException e){
			String msg = "Error consultando pagos de un pedido de venta: " + e.getMessage();
			log.error("consultar() - " + msg);
			
			throw new PagoPedidoVentaException(msg, e);
		}
	}
	

	public static void salvar(PagoPedidoVentaBean pago, DatosSesionBean datosSesion, Connection conn)throws PagoPedidoVentaException, PagoPedidoVentaConstraintViolationException {
	
		switch (pago.getEstadoBean()) {
			case Estado.NUEVO:
				crear(pago, datosSesion, conn);
				break;
		  
			case Estado.MODIFICADO:
				modificar(pago, datosSesion, conn);
				break;
		  
			case Estado.BORRADO:
				eliminar(pago, datosSesion, conn);
		}
	}
	
	
	public static void crear(PagoPedidoVentaBean pago, DatosSesionBean datosSesion, Connection conn) 
			throws PagoPedidoVentaException {
		try {
			log.debug("crear() - Añadiendo pago al pedido de venta " + pago.getIdPedido()); 
			
			PagosPedidosVentasDao.insert(conn, pago, datosSesion.getConfigEmpresa());
		}
		catch (SQLException e) {
			String msg = "Error añadiendo pago a pedido de venta: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new PagoPedidoVentaException(msg, e);
		}
	}
	
	
	public static void modificar(PagoPedidoVentaBean pago, DatosSesionBean datosSesion, Connection conn) 
			throws PagoPedidoVentaException {
		try {
			log.debug("modificar() - Modificando pago del pedido de venta " + pago.getIdPedido()); 
			
			PagosPedidosVentasDao.update(conn, datosSesion.getConfigEmpresa(), pago);
		}
		catch (SQLException e) {
			String msg = "Error modificando pago de pedido de venta: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new PagoPedidoVentaException(msg, e);
		}
	}
	
	
	public static void eliminar(PagoPedidoVentaBean pago, DatosSesionBean datosSesion, Connection conn) 
			throws PagoPedidoVentaException, PagoPedidoVentaConstraintViolationException {
		try {
			log.debug("eliminar() - Eliminando pago del pedido de venta " + pago.getIdPedido()); 
			
			PagosPedidosVentasDao.delete(conn, datosSesion.getConfigEmpresa(), pago);
		}
		catch (ForeingKeyConstraintViolationException e) {
			log.info("eliminar() - No se ha podido eliminar el pago del pedido de venta: " + e.getMessage());
			throw new PagoPedidoVentaConstraintViolationException("Error eliminando pago con vencimiento " 
					+ pago.getIdMedioPagoVencimiento() + " del pedido de venta: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando pago de pedido de venta: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new PagoPedidoVentaException(msg, e);
		}
	}
}
