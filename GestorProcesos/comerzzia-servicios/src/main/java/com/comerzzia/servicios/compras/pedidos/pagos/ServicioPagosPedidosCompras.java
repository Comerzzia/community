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

package com.comerzzia.servicios.compras.pedidos.pagos;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.compras.pedidos.pagos.PagoPedidoCompraBean;
import com.comerzzia.persistencia.compras.pedidos.pagos.PagosPedidosComprasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioPagosPedidosCompras {

	protected static Logger log = Logger.getMLogger(ServicioPagosPedidosCompras.class);
	
	
	public static List<PagoPedidoCompraBean> consultar(Long idPedido, DatosSesionBean datosSesion) 
			throws PagoPedidoCompraException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			
			return consultar(conn, idPedido, datosSesion);
		}
		catch(SQLException e){
			String msg = "Error consultando pagos de un pedido de compra: " + e.getMessage();
			log.error("consultar() - " + msg);
			
			throw new PagoPedidoCompraException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static List<PagoPedidoCompraBean> consultar(Connection conn, Long idPedido, DatosSesionBean datosSesion) 
			throws PagoPedidoCompraException {
		try {
			log.debug("consultar() - Consultando pagos del pedido de compra " + idPedido);
			
			return PagosPedidosComprasDao.consultar(conn, datosSesion.getConfigEmpresa(), idPedido);
		}
		catch(SQLException e){
			String msg = "Error consultando pagos de un pedido de compra: " + e.getMessage();
			log.error("consultar() - " + msg);
			
			throw new PagoPedidoCompraException(msg, e);
		}
	}
	

	public static void salvar(PagoPedidoCompraBean pago, DatosSesionBean datosSesion, Connection conn)throws PagoPedidoCompraException, PagoPedidoCompraConstraintViolationException {
	
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
	
	
	public static void crear(PagoPedidoCompraBean pago, DatosSesionBean datosSesion, Connection conn) 
			throws PagoPedidoCompraException {
		try {
			log.debug("crear() - Añadiendo pago al pedido de compra " + pago.getIdPedido()); 
			
			PagosPedidosComprasDao.insert(conn, pago, datosSesion.getConfigEmpresa());
		}
		catch (SQLException e) {
			String msg = "Error añadiendo pago a pedido de compra: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new PagoPedidoCompraException(msg, e);
		}
	}
	
	
	public static void modificar(PagoPedidoCompraBean pago, DatosSesionBean datosSesion, Connection conn) 
			throws PagoPedidoCompraException {
		try {
			log.debug("modificar() - Modificando pago del pedido de compra " + pago.getIdPedido()); 
			
			PagosPedidosComprasDao.update(conn, datosSesion.getConfigEmpresa(), pago);
		}
		catch (SQLException e) {
			String msg = "Error modificando pago de pedido de compra: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new PagoPedidoCompraException(msg, e);
		}
	}
	
	
	public static void eliminar(PagoPedidoCompraBean pago, DatosSesionBean datosSesion, Connection conn) 
			throws PagoPedidoCompraException, PagoPedidoCompraConstraintViolationException {
		try {
			log.debug("eliminar() - Eliminando pago del pedido de compra " + pago.getIdPedido()); 
			
			PagosPedidosComprasDao.delete(conn, datosSesion.getConfigEmpresa(), pago);
		}
		catch (ForeingKeyConstraintViolationException e) {
			log.info("eliminar() - No se ha podido eliminar el pago del pedido de compra: " + e.getMessage());
			throw new PagoPedidoCompraConstraintViolationException("Error eliminando pago con vencimiento " 
					+ pago.getIdMedioPagoVencimiento() + " del pedido de compra: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando pago de pedido de compra: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new PagoPedidoCompraException(msg, e);
		}
	}
}
