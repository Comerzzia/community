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

package com.comerzzia.persistencia.almacenes.traspasos.detalles;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class DetallesTraspasosAlmacenesDao extends MantenimientoDao {

	private static String TABLA = "D_ALMACENES_TRASPASOS_DET_TBL";
	private static String VISTA = "D_ALMACENES_TRASPASOS_DET";
	
	private static Logger log = Logger.getMLogger(DetallesTraspasosAlmacenesDao.class);
	
	public static List<DetalleTraspasoAlmacenesBean> consultar(Connection conn, ConfigEmpresaBean config, Long idTraspaso) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		List<DetalleTraspasoAlmacenesBean> detalles = null;
		
		sql = "SELECT ID_TRASPASO, " +
					 "LINEA, " +
					 "CODART, " +
					 "DESGLOSE1, " +
					 "DESGLOSE2, " +
					 "UNIDAD_MEDIDA, " +
					 "CANTIDAD_MEDIDA_PROPUESTA, " +
					 "CANTIDAD_PROPUESTA, " +
					 "CANTIDAD_MEDIDA_PEDIDA, " +
					 "CANTIDAD_PEDIDA, " +
					 "CANTIDAD_MEDIDA_SERVIDA, " +
					 "CANTIDAD_SERVIDA, " +
					 "PRECIO, " +
					 "FECHA_BAJA, " +
					 "OBSERVACIONES, " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
			   "WHERE ID_PROV_ALBARAN = ? " +
			"ORDER BY LINEA";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idTraspaso);
			
			log.debug("consultar() - " + pstmt);
			rs = pstmt.executeQuery();
			
			detalles = new ArrayList<DetalleTraspasoAlmacenesBean>();
			while (rs.next()) {
				DetalleTraspasoAlmacenesBean detalle = new DetalleTraspasoAlmacenesBean();
				detalle.setIdTraspaso(rs.getLong("ID_TRASPASO"));
				detalle.setLinea(rs.getLong("LINEA"));
				detalle.setCodArticulo(rs.getString("CODART"));
				detalle.setDesglose1(rs.getString("DESGLOSE1"));
				detalle.setDesglose2(rs.getString("DESGLOSE2"));
				detalle.setUnidadMedida(rs.getString("UNIDAD_MEDIDA"));
				detalle.setCantidadMedidaPropuesta(rs.getDouble("CANTIDAD_MEDIDA_PROPUESTA"));
				detalle.setCantidadPropuesta(rs.getDouble("CANTIDAD_PROPUESTA"));
				detalle.setCantidadMedidaPedida(rs.getDouble("CANTIDAD_MEDIDA_PEDIDA"));
				detalle.setCantidadPedida(rs.getDouble("CANTIDAD_PEDIDA"));
				detalle.setCantidadMedidaServida(rs.getDouble("CANTIDAD_MEDIDA_SERVIDA"));
				detalle.setCantidadServida(rs.getDouble("CANTIDAD_SERVIDA"));
				detalle.setPrecio(rs.getDouble("PRECIO"));
				detalle.setFechaBaja(rs.getDate("FECHA_BAJA"));
				detalle.setObservaciones(rs.getString("OBSERVACIONES"));
				
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
	
	public static void insert(Connection conn, ConfigEmpresaBean config, DetalleTraspasoAlmacenesBean detalle) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
				"(" +
				 "ID_TRASPASO, " +
				 "LINEA, " +
				 "CODART, " +
				 "DESGLOSE1, " +
				 "DESGLOSE2, " +
				 "UNIDAD_MEDIDA, " +
				 "CANTIDAD_MEDIDA_PROPUESTA, " +
				 "CANTIDAD_PROPUESTA, " +
				 "CANTIDAD_MEDIDA_PEDIDA, " +
				 "CANTIDAD_PEDIDA, " +
				 "CANTIDAD_MEDIDA_SERVIDA, " +
				 "CANTIDAD_SERVIDA, " +
				 "PRECIO, " +
				 "FECHA_BAJA, " +
				 "OBSERVACIONES, " +
				") " +
			  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, detalle.getIdTraspaso());
			pstmt.setLong(2, detalle.getLinea());
			pstmt.setString(3, detalle.getCodArticulo());
			pstmt.setString(4, detalle.getDesglose1());
			pstmt.setString(5, detalle.getDesglose2());
			pstmt.setString(6, detalle.getUnidadMedida());
			pstmt.setDouble(7, detalle.getCantidadMedidaPropuesta());
			pstmt.setDouble(8, detalle.getCantidadPropuesta());
			pstmt.setDouble(9, detalle.getCantidadMedidaPedida());
			pstmt.setDouble(10, detalle.getCantidadPedida());
			pstmt.setDouble(11, detalle.getCantidadMedidaServida());
			pstmt.setDouble(12, detalle.getCantidadServida());
			pstmt.setDouble(13, detalle.getPrecio());
			pstmt.setDate(14, detalle.getFechaBaja());
			pstmt.setString(15, detalle.getObservaciones());
			
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
	
	public static void update(Connection conn, ConfigEmpresaBean config, DetalleTraspasoAlmacenesBean detalle) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
				 "SET LINEA = ?, " +
				 "CODART = ?, " +
				 "DESGLOSE1 = ?, " +
				 "DESGLOSE2 = ?, " +
				 "UNIDAD_MEDIDA = ?, " +
				 "CANTIDAD_MEDIDA_PROPUESTA = ?, " +
				 "CANTIDAD_PROPUESTA = ?, " +
				 "CANTIDAD_MEDIDA_PEDIDA = ?, " +
				 "CANTIDAD_PEDIDA = ?, " +
				 "CANTIDAD_MEDIDA_SERVIDA = ?, " +
				 "CANTIDAD_SERVIDA = ?, " +
				 "PRECIO = ?, " +
				 "FECHA_BAJA = ?, " +
				 "OBSERVACIONES = ?, " +
			   "WHERE ID_TRASPASO = ? " +
			   	 "AND LINEA = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, detalle.getCodArticulo());
			pstmt.setString(2, detalle.getDesglose1());
			pstmt.setString(3, detalle.getDesglose2());
			pstmt.setString(4, detalle.getUnidadMedida());
			pstmt.setDouble(5, detalle.getCantidadMedidaPropuesta());
			pstmt.setDouble(6, detalle.getCantidadPropuesta());
			pstmt.setDouble(7, detalle.getCantidadMedidaPedida());
			pstmt.setDouble(8, detalle.getCantidadPedida());
			pstmt.setDouble(9, detalle.getCantidadMedidaServida());
			pstmt.setDouble(10, detalle.getCantidadServida());
			pstmt.setDouble(11, detalle.getPrecio());
			pstmt.setDate(12, detalle.getFechaBaja());
			pstmt.setString(13, detalle.getObservaciones());
			pstmt.setLong(14, detalle.getIdTraspaso());
			pstmt.setLong(15, detalle.getLinea());
			
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
	
	public static void delete(Connection conn, ConfigEmpresaBean config, DetalleTraspasoAlmacenesBean detalle) throws SQLException {
		delete(conn, config, detalle.getIdTraspaso(), detalle.getLinea());
	}
	
	/**
	 * Elimina una línea de un traspaso
	 * 
	 * @param conn
	 * @param config
	 * @param idTraspaso
	 * @param linea
	 * @throws SQLException
	 */
	public static void delete(Connection conn, ConfigEmpresaBean config, Long idTraspaso, Long linea) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
			   "WHERE ID_PROV_ALBARAN = ? " +
			   	 "AND LINEA = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idTraspaso);
        	pstmt.setLong(2, linea);
        	
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
	 * Elimina todas las líneas de un traspaso
	 * 
	 * @param conn
	 * @param config
	 * @param idTraspaso
	 * @throws SQLException
	 */
	public static void delete(Connection conn, ConfigEmpresaBean config, Long idTraspaso) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
			   "WHERE ID_TRASPASO = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idTraspaso);
        	
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
