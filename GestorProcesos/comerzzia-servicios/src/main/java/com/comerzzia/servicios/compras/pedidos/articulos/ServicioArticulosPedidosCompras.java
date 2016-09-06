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

package com.comerzzia.servicios.compras.pedidos.articulos;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.compras.pedidos.articulos.ArticuloPedidoCompraBean;
import com.comerzzia.persistencia.compras.pedidos.articulos.ArticulosPedidosComprasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioArticulosPedidosCompras {

	protected static Logger log = Logger.getMLogger(ServicioArticulosPedidosCompras.class);
	
	public static List<ArticuloPedidoCompraBean> consultar(Long idPedido, DatosSesionBean datosSesion) 
			throws ArticuloPedidoCompraException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			
			return consultar(conn, idPedido, datosSesion);
		}
		catch(SQLException e){
			String msg = "Error consultando artículos de un pedido de compra: " + e.getMessage();
    		log.error("consultar() - " + msg);
    		
    		throw new ArticuloPedidoCompraException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static List<ArticuloPedidoCompraBean> consultar(Connection conn, Long idPedido, DatosSesionBean datosSesion) 
			throws ArticuloPedidoCompraException {
		try {
			log.debug("consultar() - Consultando artículos del pedido de compra " + idPedido);
			
			return ArticulosPedidosComprasDao.consultar(conn, datosSesion.getConfigEmpresa(), idPedido);
		}
		catch(SQLException e) {
			String msg = "Error consultando artículos de un pedido de compra: " + e.getMessage();
    		log.error("consultar() - " + msg);
    		
    		throw new ArticuloPedidoCompraException(msg, e);
		}
	}
	
	public static void salvar(ArticuloPedidoCompraBean articulo, DatosSesionBean datosSesion, Connection conn) 
			throws ArticuloPedidoCompraException, ArticuloPedidoCompraConstraintViolationException {
	
		switch (articulo.getEstadoBean()) {
			case Estado.NUEVO:
				crear(articulo, datosSesion, conn);
				break;
		  
			case Estado.MODIFICADO:
				modificar(articulo, datosSesion, conn);
				break;
		  
			case Estado.BORRADO:
				eliminar(articulo, datosSesion, conn);
		}
	}
	
	
	public static void crear(ArticuloPedidoCompraBean articulo, DatosSesionBean datosSesion, Connection conn) 
			throws ArticuloPedidoCompraException {
		try {
			log.debug("crear() - Añadiendo artículo " + articulo.getCodArticulo() 
					+ " al pedido de compra " + articulo.getIdPedido() + " línea " + articulo.getLinea()); 
			
			ArticulosPedidosComprasDao.insert(conn, datosSesion.getConfigEmpresa(), articulo);
		}
		catch (SQLException e) {
			String msg = "Error añadiendo artículo a pedido de compra: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new ArticuloPedidoCompraException(msg, e);
		}
	}
	
	
	public static void modificar(ArticuloPedidoCompraBean articulo, DatosSesionBean datosSesion, Connection conn) 
			throws ArticuloPedidoCompraException {
		try {
			log.debug("modificar() - Modificando artículo " + articulo.getCodArticulo() 
					+ " del pedido de compra " + articulo.getIdPedido() + " línea " + articulo.getLinea()); 
			
			ArticulosPedidosComprasDao.update(conn, datosSesion.getConfigEmpresa(), articulo);
		}
		catch (SQLException e) {
			String msg = "Error modificando artículo de pedido de compra: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new ArticuloPedidoCompraException(msg, e);
		}
	}
	
	
	public static void eliminar(ArticuloPedidoCompraBean articulo, DatosSesionBean datosSesion, Connection conn) 
			throws ArticuloPedidoCompraException, ArticuloPedidoCompraConstraintViolationException {
		try {
			log.debug("eliminar() - Eliminando artículo "+ articulo.getCodArticulo() 
					+ " del pedido de compra " + articulo.getIdPedido() + " línea " + articulo.getLinea()); 
			
			ArticulosPedidosComprasDao.delete(conn, datosSesion.getConfigEmpresa(), articulo);
		}
		catch (ForeingKeyConstraintViolationException e) {
			log.info("eliminar() - No se ha podido eliminar el artículo del pedido de compra: " + e.getMessage());
			throw new ArticuloPedidoCompraConstraintViolationException("Error eliminando artículo " 
					+ articulo.getCodArticulo() + " del pedido de compra: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando artículo de pedido de compra: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new ArticuloPedidoCompraException(msg, e);
		}
	}
	
	
	public static void cambiarEstado(DatosSesionBean datosSesion, Connection conn, ArticuloPedidoCompraBean articulo) throws ArticuloPedidoCompraException {
		try {
			log.debug("cambiarEstado() - Cambiando estado del artículo "+ articulo.getCodArticulo() 
					+ " del pedido de compra " + articulo.getIdPedido() + " línea " + articulo.getLinea()); 
			
			ArticulosPedidosComprasDao.cambiarEstado(conn, datosSesion.getConfigEmpresa(), articulo);
		}
		catch (SQLException e) {
			String msg = "Error cambiando estado del artículo de pedido de compra: " + e.getMessage();
			log.error("cambiarEstado() - " + msg);
			
			throw new ArticuloPedidoCompraException(msg, e);
		}
	}
}
