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

package com.comerzzia.persistencia.ventas.pedidos.articulos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class ArticulosPedidosVentasDao extends MantenimientoDao {

	private static String TABLA = "D_CLIE_PEDIDOS_DET_TBL";
	private static String VISTA = "D_CLIE_PEDIDOS_DET";
	
	private static Logger log = Logger.getMLogger(ArticulosPedidosVentasDao.class);
	
	public static List<ArticuloPedidoVentaBean> consultar(Connection conn, ConfigEmpresaBean config, Long idPedido) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		List<ArticuloPedidoVentaBean> detalles = null;
		
		sql = "SELECT ID_CLIE_PEDIDO, " +
					 "LINEA, " +
					 "CODART, " +
					 "DESART, " +
					 "DESGLOSE1, " +
					 "DESGLOSE2, " +
					 "DESCRIPCION_AMPLIADA, " +
					 "UNIDAD_MEDIDA, " +
					 "UNIDAD_MEDIDA_ALTERNATIVA, " +
					 "CANTIDAD_MEDIDA_SOLICITADA, " +
					 "CANTIDAD_SOLICITADA, " +
					 "CANTIDAD_MEDIDA_ACEPTADA, " +
					 "CANTIDAD_ACEPTADA, " +
					 "CANTIDAD_MEDIDA_PREPARADA, " +
					 "CANTIDAD_PREPARADA, " +
					 "PRECIO, " +
					 "DESCUENTO, " +
					 "IMPORTE, " +
					 "CODIMP, " +
					 "LESTADO, " +
					 "LSUBESTADO, " +
					 "LDESESTADO " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
			   "WHERE ID_CLIE_PEDIDO = ? " +
			"ORDER BY LINEA";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idPedido);
			
			log.debug("consultar() - " + pstmt);
			rs = pstmt.executeQuery();
			
			detalles = new ArrayList<ArticuloPedidoVentaBean>();
			while (rs.next()) {
				ArticuloPedidoVentaBean articulo = new ArticuloPedidoVentaBean();
				articulo.setIdPedido(rs.getLong("ID_CLIE_PEDIDO"));
				articulo.setLinea(rs.getInt("LINEA"));
				articulo.setCodArticulo(rs.getString("CODART"));
				articulo.setDesArticulo(rs.getString("DESART"));
				articulo.setDesglose1(rs.getString("DESGLOSE1"));
				articulo.setDesglose2(rs.getString("DESGLOSE2"));
				articulo.setDescripcionAmpliada(rs.getString("DESCRIPCION_AMPLIADA"));
				articulo.setUnidadMedida(rs.getString("UNIDAD_MEDIDA"));
				articulo.setUnidadMedidaAlternativa(rs.getString("UNIDAD_MEDIDA_ALTERNATIVA"));
				articulo.setCantidadMedidaSolicitada((rs.getString("CANTIDAD_MEDIDA_SOLICITADA") != null) ? rs.getDouble("CANTIDAD_MEDIDA_SOLICITADA") : null);
				articulo.setCantidadSolicitada((rs.getString("CANTIDAD_SOLICITADA") != null) ? rs.getDouble("CANTIDAD_SOLICITADA") : null);
				articulo.setCantidadMedidaAceptada((rs.getString("CANTIDAD_MEDIDA_ACEPTADA") != null) ? rs.getDouble("CANTIDAD_MEDIDA_ACEPTADA") : null);
				articulo.setCantidadAceptada((rs.getString("CANTIDAD_ACEPTADA") != null) ? rs.getDouble("CANTIDAD_ACEPTADA") : null);
				articulo.setCantidadMedidaPreparada((rs.getString("CANTIDAD_MEDIDA_PREPARADA") != null) ? rs.getDouble("CANTIDAD_MEDIDA_PREPARADA") : null);
				articulo.setCantidadPreparada((rs.getString("CANTIDAD_PREPARADA") != null) ? rs.getDouble("CANTIDAD_PREPARADA") : null);
				articulo.setPrecio(rs.getDouble("PRECIO"));
				articulo.setDescuento(rs.getDouble("DESCUENTO"));
				articulo.setImporte(rs.getDouble("IMPORTE"));
				articulo.setCodImpuesto(rs.getString("CODIMP"));
				articulo.setLineaEstado((rs.getString("LESTADO") != null) ? rs.getInt("LESTADO") : null);
				articulo.setLineaSubEstado((rs.getString("LSUBESTADO") != null) ? rs.getInt("LSUBESTADO") : null);
				articulo.setLineaDesEstado(rs.getString("LDESESTADO"));
				
				detalles.add(articulo);
			}
			
			return detalles;
		}
		finally {
			try {
				rs.close();
			} catch (Exception ignore) {}
			
			try {
				pstmt.close();
			} catch (Exception ignore) {}
		}
	}
	
	public static void insert(Connection conn, ConfigEmpresaBean config, ArticuloPedidoVentaBean articulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
				"(" +
				"ID_CLIE_PEDIDO, " +
				"LINEA, " +
				"CODART, " +
				"DESGLOSE1, " +
				"DESGLOSE2, " +
				"DESART, " +
				"DESCRIPCION_AMPLIADA, " +
				"UNIDAD_MEDIDA, " +
				"CANTIDAD_MEDIDA_SOLICITADA, " +
				"CANTIDAD_SOLICITADA, " +
				"CANTIDAD_MEDIDA_ACEPTADA, " +
				"CANTIDAD_ACEPTADA, " +
				"CANTIDAD_MEDIDA_PREPARADA, " +
				"CANTIDAD_PREPARADA, " +
				"PRECIO, " +
				"DESCUENTO, " +
				"IMPORTE, " +
				"CODIMP, " +
				"LESTADO, " +
				"LSUBESTADO, " +
				"ID_CLIE_PEDIDO_ORIGEN, " +
				"LINEA_PEDIDO_ORIGEN " +
				") " +
			  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, articulo.getIdPedido());
			pstmt.setInt(2, articulo.getLinea());
			pstmt.setString(3, articulo.getCodArticulo());
			pstmt.setString(4, articulo.getDesglose1());
			pstmt.setString(5, articulo.getDesglose2());
			pstmt.setString(6, articulo.getDesArticulo());
			pstmt.setString(7, articulo.getDescripcionAmpliada());
			pstmt.setString(8, articulo.getUnidadMedida());
			pstmt.setDouble(9, articulo.getCantidadMedidaSolicitada());
			pstmt.setDouble(10, articulo.getCantidadSolicitada());
			pstmt.setDouble(11, articulo.getCantidadMedidaAceptada());
			pstmt.setDouble(12, articulo.getCantidadAceptada());
			pstmt.setDouble(13, articulo.getCantidadMedidaPreparada());
			pstmt.setDouble(14, articulo.getCantidadPreparada());
			pstmt.setDouble(15, articulo.getPrecio());
			pstmt.setDouble(16, articulo.getDescuento());
			pstmt.setDouble(17, articulo.getImporte());
			pstmt.setString(18, articulo.getCodImpuesto());
			pstmt.setInt(19, articulo.getLineaEstado());
			pstmt.setInt(20, articulo.getLineaSubEstado());
			pstmt.setLong(21, articulo.getIdPedidoOrigen());
			pstmt.setInt(22, articulo.getLineaPedidoOrigen());
			
        	log.debug("insert() - " + pstmt);
        	pstmt.execute();
		}
		catch (SQLException e) {
			throw getDaoException(e);
		}
		finally {
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
	
	public static void update(Connection conn, ConfigEmpresaBean config, ArticuloPedidoVentaBean detalle) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
				 "SET CODART = ?, " +
				 	 "DESGLOSE1 = ?, " +
				 	 "DESGLOSE2 = ?, " +
				 	 "DESART = ?, " +
				 	 "DESCRIPCION_AMPLIADA = ?, " +
				 	 "UNIDAD_MEDIDA = ?, " +
				 	 "CANTIDAD_MEDIDA_SOLICITADA = ?, " +
				 	 "CANTIDAD_SOLICITADA = ?, " +
				 	 "CANTIDAD_MEDIDA_ACEPTADA = ?, " +
				 	 "CANTIDAD_ACEPTADA = ?, " +
				 	 "CANTIDAD_MEDIDA_PREPARADA = ?, " +
				 	 "CANTIDAD_PREPARADA = ?, " +
				 	 "PRECIO = ?, " +
				 	 "DESCUENTO = ?, " +
				 	 "IMPORTE = ?, " +
				 	 "CODIMP = ?, " +
				 	 "LESTADO = ?, " +
				 	 "LSUBESTADO = ? " +
			   "WHERE ID_CLIE_PEDIDO = ? " +
			   	 "AND LINEA = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, detalle.getCodArticulo());
			pstmt.setString(2, detalle.getDesglose1());
			pstmt.setString(3, detalle.getDesglose2());
			pstmt.setString(4, detalle.getDesArticulo());
			pstmt.setString(5, detalle.getDescripcionAmpliada());
			pstmt.setString(6, detalle.getUnidadMedida());
			pstmt.setDouble(7, detalle.getCantidadMedidaSolicitada());
			pstmt.setDouble(8, detalle.getCantidadSolicitada());
			pstmt.setDouble(9, detalle.getCantidadMedidaAceptada());
			pstmt.setDouble(10, detalle.getCantidadAceptada());
			pstmt.setDouble(11, detalle.getCantidadMedidaPreparada());
			pstmt.setDouble(12, detalle.getCantidadPreparada());
			pstmt.setDouble(13, detalle.getPrecio());
			pstmt.setDouble(14, detalle.getDescuento());
			pstmt.setDouble(15, detalle.getImporte());
			pstmt.setString(16, detalle.getCodImpuesto());
			pstmt.setInt(17, detalle.getLineaEstado());
			pstmt.setInt(18, detalle.getLineaSubEstado());
			pstmt.setLong(19, detalle.getIdPedido());
			pstmt.setInt(20, detalle.getLinea());
			
        	log.debug("update() - " + pstmt);
        	pstmt.execute();
		}
		catch (SQLException e) {
			throw getDaoException(e);
		}
		finally {
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
	
	public static void delete(Connection conn, ConfigEmpresaBean config, ArticuloPedidoVentaBean detalle) throws SQLException {
		delete(conn, config, detalle.getIdPedido(), detalle.getLinea());
	}
	
	/**
	 * Elimina una línea de un albarán
	 * 
	 * @param conn
	 * @param config
	 * @param idPedido
	 * @param linea
	 * @throws SQLException
	 */
	public static void delete(Connection conn, ConfigEmpresaBean config, Long idPedido, Integer linea) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
			   "WHERE ID_CLIE_PEDIDO = ? " +
			   	 "AND LINEA = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idPedido);
        	pstmt.setInt(2, linea);
        	
        	log.debug("delete() - " + pstmt);
        	pstmt.execute();
		}
		catch (SQLException e) {
			throw getDaoException(e);
		}
		finally {
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
	
	/**
	 * Elimina todas las líneas de un albarán
	 * 
	 * @param conn
	 * @param config
	 * @param idPedido
	 * @throws SQLException
	 */
	public static void delete(Connection conn, ConfigEmpresaBean config, Long idPedido) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
			   "WHERE ID_CLIE_PEDIDO = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idPedido);
        	
        	log.debug("delete() - " + pstmt);
        	pstmt.execute();
		}
		catch (SQLException e) {
			throw getDaoException(e);
		}
		finally {
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
	
	public static void cambiarEstado(Connection conn, ConfigEmpresaBean config, ArticuloPedidoVentaBean articulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
				 "SET LESTADO = ?, " +
				 	 "LSUBESTADO = ? " +
			   "WHERE ID_CLIE_PEDIDO = ? " +
			     "AND LINEA = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setInt(1, articulo.getLineaEstado());
			pstmt.setInt(2, articulo.getLineaSubEstado());
			pstmt.setLong(3, articulo.getIdPedido());
			pstmt.setLong(4, articulo.getLinea());
			
        	log.debug("cambiarEstado() - " + pstmt);
        	pstmt.execute();
		}
		catch (SQLException e) {
			throw getDaoException(e);
		}
		finally {
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
}
