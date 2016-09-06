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

package com.comerzzia.persistencia.ventas.albaranes.articulos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;

public class ArticulosAlbaranesVentasDao extends MantenimientoDao {
	
	private static String TABLA_CABECERA = "D_CLIE_ALBARANES_CAB_TBL";
	private static String TABLA = "D_CLIE_ALBARANES_DET_TBL";
	private static String VISTA = "D_CLIE_ALBARANES_DET";
	
	private static Logger log = Logger.getMLogger(ArticulosAlbaranesVentasDao.class);
	
	public static List<ArticuloAlbaranVentaBean> consultar(Connection conn, ConfigEmpresaBean config, Long idAlbaran)throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		List<ArticuloAlbaranVentaBean> detalles = null;
		
		sql = "SELECT ID_CLIE_ALBARAN, " +
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
					 "PRECIO_TOTAL, " +
					 "DESCUENTO, " +
					 "IMPORTE, " +
					 "IMPORTE_TOTAL, " +
					 "PRECIO_COSTO, " +
					 "CODIMP, " +
					 "ID_CLIE_PEDIDO, " +
					 "PEDIDO_LINEA " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
			   "WHERE ID_CLIE_ALBARAN = ? " +
			"ORDER BY LINEA";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idAlbaran);
			
			log.debug("consultar() - " + pstmt);
			rs = pstmt.executeQuery();
			
			detalles = new ArrayList<ArticuloAlbaranVentaBean>();
			while (rs.next()) {
				ArticuloAlbaranVentaBean detalle = new ArticuloAlbaranVentaBean();
				detalle.setIdAlbaran(rs.getLong("ID_CLIE_ALBARAN"));
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
				detalle.setPrecioTotal(rs.getDouble("PRECIO_TOTAL"));
				detalle.setDescuento(rs.getDouble("DESCUENTO"));
				detalle.setImporte(rs.getDouble("IMPORTE"));
				detalle.setImporteTotal(rs.getDouble("IMPORTE_TOTAL"));
				detalle.setPrecioCosto(rs.getDouble("PRECIO_COSTO"));
				detalle.setCodImpuesto(rs.getString("CODIMP"));
				detalle.setIdPedido((rs.getString("ID_CLIE_PEDIDO") != null) ? rs.getLong("ID_CLIE_PEDIDO") : null);
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

	public static List<ArticuloAlbaranVentaBean> consultarDetallePedido(Connection conn, ConfigEmpresaBean config, Long idPedido)throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		List<ArticuloAlbaranVentaBean> detalles = null;
		
		sql = "SELECT ID_CLIE_ALBARAN, " +
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
					 "PRECIO_TOTAL, " +
					 "DESCUENTO, " +
					 "IMPORTE, " +
					 "IMPORTE_TOTAL, " +
					 "PRECIO_COSTO, " +
					 "CODIMP, " +
					 "ID_CLIE_PEDIDO, " +
					 "PEDIDO_LINEA " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
			   "WHERE ID_CLIE_PEDIDO = ? " +
			"ORDER BY LINEA";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idPedido);
			
			log.debug("consultar() - " + pstmt);
			rs = pstmt.executeQuery();
			
			detalles = new ArrayList<ArticuloAlbaranVentaBean>();
			while (rs.next()) {
				ArticuloAlbaranVentaBean detalle = new ArticuloAlbaranVentaBean();
				detalle.setIdAlbaran(rs.getLong("ID_CLIE_ALBARAN"));
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
				detalle.setPrecioTotal(rs.getDouble("PRECIO_TOTAL"));
				detalle.setDescuento(rs.getDouble("DESCUENTO"));
				detalle.setImporte(rs.getDouble("IMPORTE"));
				detalle.setImporteTotal(rs.getDouble("IMPORTE_TOTAL"));
				detalle.setPrecioCosto(rs.getDouble("PRECIO_COSTO"));
				detalle.setCodImpuesto(rs.getString("CODIMP"));
				detalle.setIdPedido((rs.getString("ID_CLIE_PEDIDO") != null) ? rs.getLong("ID_CLIE_PEDIDO") : null);
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

	public static ArticuloAlbaranVentaBean consultar(Connection conn, ConfigEmpresaBean config,Long idAlbaran, Integer linea) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		ArticuloAlbaranVentaBean articulo = null;
		
		sql = "SELECT ID_CLIE_ALBARAN, " +
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
					 "PRECIO_TOTAL, " +
					 "DESCUENTO, " +
					 "IMPORTE, " +
					 "IMPORTE_TOTAL, " +
					 "PRECIO_COSTO, " +
					 "CODIMP, " +
					 "ID_CLIE_PEDIDO, " +
					 "PEDIDO_LINEA " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
			   "WHERE ID_CLIE_ALBARAN = ? " +
			   "AND LINEA = ?";
		
		try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idAlbaran);
    		pstmt.setInt(2, linea);
    		
    		log.debug("consultar() - " + pstmt);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
            	articulo = new ArticuloAlbaranVentaBean();
            	articulo.setIdAlbaran(rs.getLong("ID_CLIE_ALBARAN"));
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
				articulo.setPrecioTotal(rs.getDouble("PRECIO_TOTAL"));
				articulo.setDescuento(rs.getDouble("DESCUENTO"));
				articulo.setImporte(rs.getDouble("IMPORTE"));
				articulo.setImporteTotal(rs.getDouble("IMPORTE_TOTAL"));
				articulo.setPrecioCosto(rs.getDouble("PRECIO_COSTO"));
				articulo.setCodImpuesto(rs.getString("CODIMP"));
				articulo.setIdPedido((rs.getString("ID_CLIE_PEDIDO") != null) ? rs.getLong("ID_CLIE_PEDIDO") : null);
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

	public static void insert(Connection conn, ArticuloAlbaranVentaBean detalle, ConfigEmpresaBean config) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
				"(" +
				"ID_CLIE_ALBARAN, " +
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
				"PRECIO_TOTAL, " +
				"DESCUENTO, " +
				"IMPORTE, " +
				"IMPORTE_TOTAL, " +
				"CODIMP, " +
				"PRECIO_COSTO, " +
				"ID_CLIE_PEDIDO, " +
				"PEDIDO_LINEA" +
				") " +
			  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, detalle.getIdAlbaran());
			pstmt.setLong(2, detalle.getLinea());
			pstmt.setDate(3, Fechas.toSqlDate(new Date()));
			pstmt.setString(4, detalle.getCodArticulo());
			pstmt.setString(5, detalle.getDesglose1());
			pstmt.setString(6, detalle.getDesglose2());
			pstmt.setString(7, detalle.getDesArticulo());
			pstmt.setString(8, detalle.getDescripcionAmpliada());
			pstmt.setString(9, detalle.getUnidadMedida());
			pstmt.setDouble(10, detalle.getCantidadMedida());
			pstmt.setDouble(11, detalle.getCantidad());
			pstmt.setDouble(12, detalle.getPrecio());
			pstmt.setDouble(13, detalle.getPrecioTotal());
			pstmt.setDouble(14, detalle.getDescuento());
			pstmt.setDouble(15, detalle.getImporte());
			pstmt.setDouble(16, detalle.getImporteTotal());
			pstmt.setString(17, detalle.getCodImpuesto());
			pstmt.setDouble(18, detalle.getPrecioCosto());
			pstmt.setLong(19, detalle.getIdPedido());
			pstmt.setInt(20, detalle.getPedidoLinea());
			
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

	public static void update(Connection conn, ConfigEmpresaBean config, ArticuloAlbaranVentaBean detalle) throws SQLException {
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
				 	 "PRECIO_TOTAL = ?, " +
				 	 "DESCUENTO = ?, " +
				 	 "IMPORTE = ?, " +
				 	 "IMPORTE_TOTAL = ?, " +
				 	 "PRECIO_COSTO = ?, " +
				 	 "CODIMP = ?, " +
				 	 "ID_CLIE_PEDIDO = ?, " +
				 	 "PEDIDO_LINEA = ? " +
			   "WHERE ID_CLIE_ALBARAN = ? " +
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
			pstmt.setDouble(11, detalle.getPrecioTotal());
			pstmt.setDouble(12, detalle.getDescuento());
			pstmt.setDouble(13, detalle.getImporte());
			pstmt.setDouble(14, detalle.getImporteTotal());
			pstmt.setDouble(15, detalle.getPrecioCosto());
			pstmt.setString(16, detalle.getCodImpuesto());
			pstmt.setLong(17, detalle.getIdPedido());
			pstmt.setInt(18, detalle.getPedidoLinea());
			pstmt.setLong(19, detalle.getIdAlbaran());
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
	
	public static void delete(Connection conn, ConfigEmpresaBean config, ArticuloAlbaranVentaBean detalle) throws SQLException {
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
			   "WHERE ID_CLIE_ALBARAN = ? " +
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
			   "WHERE ID_CLIE_ALBARAN = ?";
		
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
	
	public static Double consultarTotalLineasTickets(Connection conn, ConfigEmpresaBean config, String codEmpresa) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	Double total = null;
    	
    	// Consultas
    	String sql = "SELECT COUNT(*) " +
	      		       "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + "DETALLES, "
	      		       		   + getNombreElemento(config.getEsquemaEmpresa(), TABLA_CABECERA) + "CABECERA " + 
	      		   	  "WHERE CABECERA.ID_CLIE_ALBARAN = DETALLES.ID_CLIE_ALBARAN " +
	      		   	  	"AND CODEMP = ? " +
	      		   	  	"AND CABECERA.UID_TICKET IS NOT NULL ";
        
    	try {
    		pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codEmpresa);
			log.debug("consultarTotalLineasTickets() - " + pstmt);
        	
    		rs = pstmt.executeQuery();
        	if (rs.next()){
        		total = rs.getDouble(1);
        	}
        	
        	return total;
    	}
    	finally {
    		try {
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
}
