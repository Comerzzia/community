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

package com.comerzzia.servicios.ventas.pedidos.articulos;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.ventas.pedidos.articulos.ArticuloPedidoVentaBean;
import com.comerzzia.persistencia.ventas.pedidos.articulos.ArticulosPedidosVentasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioArticulosPedidosVentas {

	protected static Logger log = Logger.getMLogger(ServicioArticulosPedidosVentas.class);
	
	public static List<ArticuloPedidoVentaBean> consultar(Long idPedido, DatosSesionBean datosSesion) 
			throws ArticuloPedidoVentaException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			
			return consultar(conn, idPedido, datosSesion);
		}
		catch(SQLException e){
			String msg = "Error consultando artículos de un pedido de venta: " + e.getMessage();
    		log.error("consultar() - " + msg);
    		
    		throw new ArticuloPedidoVentaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static List<ArticuloPedidoVentaBean> consultar(Connection conn, Long idPedido, DatosSesionBean datosSesion) 
			throws ArticuloPedidoVentaException {
		try {
			log.debug("consultar() - Consultando artículos del pedido de venta " + idPedido);
			
			return ArticulosPedidosVentasDao.consultar(conn, datosSesion.getConfigEmpresa(), idPedido);
		}
		catch(SQLException e) {
			String msg = "Error consultando artículos de un pedido de venta: " + e.getMessage();
    		log.error("consultar() - " + msg);
    		
    		throw new ArticuloPedidoVentaException(msg, e);
		}
	}
	
	public static void salvar(ArticuloPedidoVentaBean articulo, DatosSesionBean datosSesion, Connection conn) 
			throws ArticuloPedidoVentaException, ArticuloPedidoVentaConstraintViolationException {
	
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
	
	
	public static void crear(ArticuloPedidoVentaBean articulo, DatosSesionBean datosSesion, Connection conn) 
			throws ArticuloPedidoVentaException {
		try {
			log.debug("crear() - Añadiendo artículo " + articulo.getCodArticulo() 
					+ " al pedido de venta " + articulo.getIdPedido() + " línea " + articulo.getLinea()); 
			
			ArticulosPedidosVentasDao.insert(conn, datosSesion.getConfigEmpresa(), articulo);
		}
		catch (SQLException e) {
			String msg = "Error añadiendo artículo a pedido de venta: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new ArticuloPedidoVentaException(msg, e);
		}
	}
	
	
	public static void modificar(ArticuloPedidoVentaBean articulo, DatosSesionBean datosSesion, Connection conn) 
			throws ArticuloPedidoVentaException {
		try {
			log.debug("modificar() - Modificando artículo " + articulo.getCodArticulo() 
					+ " del pedido de venta " + articulo.getIdPedido() + " línea " + articulo.getLinea()); 
			
			ArticulosPedidosVentasDao.update(conn, datosSesion.getConfigEmpresa(), articulo);
		}
		catch (SQLException e) {
			String msg = "Error modificando artículo de pedido de venta: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new ArticuloPedidoVentaException(msg, e);
		}
	}
	
	
	public static void eliminar(ArticuloPedidoVentaBean articulo, DatosSesionBean datosSesion, Connection conn) 
			throws ArticuloPedidoVentaException, ArticuloPedidoVentaConstraintViolationException {
		try {
			log.debug("eliminar() - Eliminando artículo "+ articulo.getCodArticulo() 
					+ " del pedido de venta " + articulo.getIdPedido() + " línea " + articulo.getLinea()); 
			
			ArticulosPedidosVentasDao.delete(conn, datosSesion.getConfigEmpresa(), articulo);
		}
		catch (ForeingKeyConstraintViolationException e) {
			log.info("eliminar() - No se ha podido eliminar el artículo del pedido de venta: " + e.getMessage());
			throw new ArticuloPedidoVentaConstraintViolationException("Error eliminando artículo " 
					+ articulo.getCodArticulo() + " del pedido de venta: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando artículo de pedido de venta: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new ArticuloPedidoVentaException(msg, e);
		}
	}
	
	
	public static void cambiarEstado(DatosSesionBean datosSesion, Connection conn, ArticuloPedidoVentaBean articulo) throws ArticuloPedidoVentaException {
		try {
			log.debug("cambiarEstado() - Cambiando estado del artículo "+ articulo.getCodArticulo() 
					+ " del pedido de venta " + articulo.getIdPedido() + " línea " + articulo.getLinea()); 
			
			ArticulosPedidosVentasDao.cambiarEstado(conn, datosSesion.getConfigEmpresa(), articulo);
		}
		catch (SQLException e) {
			String msg = "Error cambiando estado del artículo de pedido de venta: " + e.getMessage();
			log.error("cambiarEstado() - " + msg);
			
			throw new ArticuloPedidoVentaException(msg, e);
		}
	}
}
