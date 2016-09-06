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

package com.comerzzia.persistencia.compras.albaranes.articulos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;

public class ArticulosAlbaranesComprasDao extends MantenimientoDao {

	private static String TABLA = "D_PROV_ALBARANES_DET_TBL";
	private static String VISTA = "D_PROV_ALBARANES_DET";
	
	private static Logger log = Logger.getMLogger(ArticulosAlbaranesComprasDao.class);
	
	public static List<ArticuloAlbaranCompraBean> consultar(Connection conn, ConfigEmpresaBean config, Long idAlbaran) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		List<ArticuloAlbaranCompraBean> detalles = null;
		
		sql = "SELECT ID_PROV_ALBARAN, " +
					 "LINEA, " +
					 "FECHA, " +
					 "CODART, " +
					 "DESGLOSE1, " +
					 "DESGLOSE2, " +
					 "DESART, " +
					 "DESCRIPCION_AMPLIADA, " +
					 "UNIDAD_MEDIDA, " +
					 "CANTIDAD_MEDIDA, " +
					 "CANTIDAD, " +
					 "PRECIO, " +
					 "DESCUENTO, " +
					 "IMPORTE, " +
					 "CODIMP, " +
					 "ID_PROV_PEDIDO, " +
					 "PEDIDO_LINEA " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
			   "WHERE ID_PROV_ALBARAN = ? " +
			"ORDER BY LINEA";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idAlbaran);
			
			log.debug("consultar() - " + pstmt);
			rs = pstmt.executeQuery();
			
			detalles = new ArrayList<ArticuloAlbaranCompraBean>();
			while (rs.next()) {
				ArticuloAlbaranCompraBean detalle = new ArticuloAlbaranCompraBean();
				detalle.setIdAlbaran(rs.getLong("ID_PROV_ALBARAN"));
				detalle.setLinea(rs.getInt("LINEA"));
				detalle.setCodArticulo(rs.getString("CODART"));
				detalle.setDesArticulo(rs.getString("DESART"));
				detalle.setDesglose1(rs.getString("DESGLOSE1"));
				detalle.setDesglose2(rs.getString("DESGLOSE2"));
				detalle.setFecha(rs.getDate("FECHA"));
				detalle.setDescripcionAmpliada(rs.getString("DESCRIPCION_AMPLIADA"));
				detalle.setUnidadMedida(rs.getString("UNIDAD_MEDIDA"));
				detalle.setCantidadMedida(rs.getDouble("CANTIDAD_MEDIDA"));
				detalle.setCantidad(rs.getDouble("CANTIDAD"));
				detalle.setPrecio(rs.getDouble("PRECIO"));
				detalle.setDescuento(rs.getDouble("DESCUENTO"));
				detalle.setImporte(rs.getDouble("IMPORTE"));
				detalle.setCodImpuesto(rs.getString("CODIMP"));
				detalle.setIdPedido((rs.getString("ID_PROV_PEDIDO") != null) ? rs.getLong("ID_PROV_PEDIDO") : null);
				detalle.setPedidoLinea((rs.getString("PEDIDO_LINEA") != null) ? rs.getInt("PEDIDO_LINEA") : null);
				
				detalles.add(detalle);
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
	
	public static ArticuloAlbaranCompraBean consultar(Connection conn, ConfigEmpresaBean config, 
			Long idAlbaran, Integer linea) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		ArticuloAlbaranCompraBean articulo = null;
		
		sql = "SELECT ID_PROV_ALBARAN, " +
					 "LINEA, " +
					 "FECHA, " +
					 "CODART, " +
					 "DESGLOSE1, " +
					 "DESGLOSE2, " +
					 "DESART, " +
					 "DESCRIPCION_AMPLIADA, " +
					 "UNIDAD_MEDIDA, " +
					 "CANTIDAD_MEDIDA, " +
					 "CANTIDAD, " +
					 "PRECIO, " +
					 "DESCUENTO, " +
					 "IMPORTE, " +
					 "CODIMP, " +
					 "ID_PROV_PEDIDO, " +
					 "PEDIDO_LINEA " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
			   "WHERE ID_PROV_ALBARAN = ? " +
			   "AND LINEA = ?";
		
		try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idAlbaran);
    		pstmt.setInt(2, linea);
    		
    		log.debug("consultar() - " + pstmt);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
            	articulo = new ArticuloAlbaranCompraBean();
            	articulo.setIdAlbaran(rs.getLong("ID_PROV_ALBARAN"));
            	articulo.setLinea(rs.getInt("LINEA"));
            	articulo.setCodArticulo(rs.getString("CODART"));
            	articulo.setDesArticulo(rs.getString("DESART"));
            	articulo.setDesglose1(rs.getString("DESGLOSE1"));
            	articulo.setDesglose2(rs.getString("DESGLOSE2"));
            	articulo.setFecha(rs.getDate("FECHA"));
            	articulo.setDescripcionAmpliada(rs.getString("DESCRIPCION_AMPLIADA"));
				articulo.setUnidadMedida(rs.getString("UNIDAD_MEDIDA"));
				articulo.setCantidadMedida(rs.getDouble("CANTIDAD_MEDIDA"));
				articulo.setCantidad(rs.getDouble("CANTIDAD"));
				articulo.setPrecio(rs.getDouble("PRECIO"));
				articulo.setDescuento(rs.getDouble("DESCUENTO"));
				articulo.setImporte(rs.getDouble("IMPORTE"));
				articulo.setCodImpuesto(rs.getString("CODIMP"));
				articulo.setIdPedido((rs.getString("ID_PROV_PEDIDO") != null) ? rs.getLong("ID_PROV_PEDIDO") : null);
				articulo.setPedidoLinea((rs.getString("PEDIDO_LINEA") != null) ? rs.getInt("PEDIDO_LINEA") : null);
            }
            
            return articulo;
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
	
	public static void insert(Connection conn, ConfigEmpresaBean config, ArticuloAlbaranCompraBean detalle) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
				"(" +
				"ID_PROV_ALBARAN, " +
				"LINEA, " +
				"FECHA, " +
				"CODART, " +
				"DESGLOSE1, " +
				"DESGLOSE2, " +
				"DESART, " +
				"DESCRIPCION_AMPLIADA, " +
				"UNIDAD_MEDIDA, " +
				"CANTIDAD_MEDIDA, " +
				"CANTIDAD, " +
				"PRECIO, " +
				"DESCUENTO, " +
				"IMPORTE, " +
				"CODIMP, " +
				"ID_PROV_PEDIDO, " +
				"PEDIDO_LINEA" +
				") " +
			  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, detalle.getIdAlbaran());
			pstmt.setInt(2, detalle.getLinea());
			pstmt.setDate(3, Fechas.toSqlDate(detalle.getFecha()));
			pstmt.setString(4, detalle.getCodArticulo());
			pstmt.setString(5, detalle.getDesglose1());
			pstmt.setString(6, detalle.getDesglose2());
			pstmt.setString(7, detalle.getDesArticulo());
			pstmt.setString(8, detalle.getDescripcionAmpliada());
			pstmt.setString(9, detalle.getUnidadMedida());
			pstmt.setDouble(10, detalle.getCantidadMedida());
			pstmt.setDouble(11, detalle.getCantidad());
			pstmt.setDouble(12, detalle.getPrecio());
			pstmt.setDouble(13, detalle.getDescuento());
			pstmt.setDouble(14, detalle.getImporte());
			pstmt.setString(15, detalle.getCodImpuesto());
			pstmt.setLong(16, detalle.getIdPedido());
			pstmt.setInt(17, detalle.getPedidoLinea());
			
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
	
	public static void update(Connection conn, ConfigEmpresaBean config, ArticuloAlbaranCompraBean detalle) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
				 "SET FECHA = ?, " +
				 	 "CODART = ?, " +
				 	 "DESGLOSE1 = ?, " +
				 	 "DESGLOSE2 = ?, " +
				 	 "DESART = ?, " +
				 	 "DESCRIPCION_AMPLIADA = ?, " +
				 	 "UNIDAD_MEDIDA = ?, " +
				 	 "CANTIDAD_MEDIDA = ?, " +
				 	 "CANTIDAD = ?, " +
				 	 "PRECIO = ?, " +
				 	 "DESCUENTO = ?, " +
				 	 "IMPORTE = ?, " +
				 	 "CODIMP = ?, " +
				 	 "ID_PROV_PEDIDO = ?, " +
				 	 "PEDIDO_LINEA = ? " +
			   "WHERE ID_PROV_ALBARAN = ? " +
			   	 "AND LINEA = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setDate(1, Fechas.toSqlDate(detalle.getFecha()));
			pstmt.setString(2, detalle.getCodArticulo());
			pstmt.setString(3, detalle.getDesglose1());
			pstmt.setString(4, detalle.getDesglose2());
			pstmt.setString(5, detalle.getDesArticulo());
			pstmt.setString(6, detalle.getDescripcionAmpliada());
			pstmt.setString(7, detalle.getUnidadMedida());
			pstmt.setDouble(8, detalle.getCantidadMedida());
			pstmt.setDouble(9, detalle.getCantidad());
			pstmt.setDouble(10, detalle.getPrecio());
			pstmt.setDouble(11, detalle.getDescuento());
			pstmt.setDouble(12, detalle.getImporte());
			pstmt.setString(13, detalle.getCodImpuesto());
			pstmt.setLong(14, detalle.getIdPedido());
			pstmt.setInt(15, detalle.getPedidoLinea());
			pstmt.setLong(16, detalle.getIdAlbaran());
			pstmt.setInt(17, detalle.getLinea());
			
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
	
	public static void delete(Connection conn, ConfigEmpresaBean config, ArticuloAlbaranCompraBean detalle) throws SQLException {
		delete(conn, config, detalle.getIdAlbaran(), detalle.getLinea());
	}
	
	/**
	 * Elimina una línea de un albarán
	 * 
	 * @param conn
	 * @param config
	 * @param idAlbaran
	 * @param linea
	 * @throws SQLException
	 */
	public static void delete(Connection conn, ConfigEmpresaBean config, Long idAlbaran, Integer linea) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
			   "WHERE ID_PROV_ALBARAN = ? " +
			   	 "AND LINEA = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idAlbaran);
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
	 * @param idAlbaran
	 * @throws SQLException
	 */
	public static void delete(Connection conn, ConfigEmpresaBean config, Long idAlbaran) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
			   "WHERE ID_PROV_ALBARAN = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idAlbaran);
        	
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
}
