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

package com.comerzzia.persistencia.ventas.albaranes.pagos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class PagosAlbaranesVentasDao extends MantenimientoDao {
	
	private static String TABLA = "D_CLIE_ALBARANES_PAG_TBL";
	private static String VISTA = "D_CLIE_ALBARANES_PAG";
	
	private static Logger log = Logger.getMLogger(PagosAlbaranesVentasDao.class);
	
	public static List<PagoAlbaranVentaBean> consultar(Connection conn, ConfigEmpresaBean config, Long idAlbaran) throws SQLException {
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<PagoAlbaranVentaBean> pagos = null;
		
		sql = "SELECT ID_CLIE_ALBARAN, " +
		 			 "LINEA, " +
		 			 "ID_MEDPAG_VEN, " +
		 			 "DESMEDPAG_VEN, " +
		 			 "IMPORTE, " +
		 			 "NUMERO_OPERACION " +
		 		"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		 	   "WHERE ID_CLIE_ALBARAN = ? " +
		 	"ORDER BY LINEA";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idAlbaran);
			
        	log.debug("consultar() - " + pstmt);
        	rs = pstmt.executeQuery();
        	
        	pagos = new ArrayList<PagoAlbaranVentaBean>();
        	while (rs.next()) {
        		PagoAlbaranVentaBean pago = new PagoAlbaranVentaBean();
        		pago.setIdAlbaran(rs.getLong("ID_CLIE_ALBARAN"));
        		pago.setLinea(rs.getInt("LINEA"));
        		pago.setIdMedioPagoVencimiento(rs.getLong("ID_MEDPAG_VEN"));
        		pago.setDesMedioPagoVencimiento(rs.getString("DESMEDPAG_VEN"));
        		pago.setImporte(rs.getDouble("IMPORTE"));
        		pago.setNumeroOperacion(rs.getString("NUMERO_OPERACION"));
        		
        		pagos.add(pago);
        	}
        	
        	return pagos;
		}
		catch (SQLException e) {
			throw getDaoException(e);
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
	
	public static void insert(Connection conn, PagoAlbaranVentaBean pago, ConfigEmpresaBean config) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +  
				"(" +
				"ID_CLIE_ALBARAN, " +
				"LINEA, " +
				"ID_MEDPAG_VEN, " +
				"IMPORTE, " +
				"NUMERO_OPERACION" +
				") " +
			  "VALUES (?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, pago.getIdAlbaran());
			pstmt.setInt(2, pago.getLinea());
			pstmt.setLong(3, pago.getIdMedioPagoVencimiento());
			pstmt.setDouble(4, pago.getImporte());
			pstmt.setString(5, pago.getNumeroOperacion());
			
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

	public static void update(Connection conn, ConfigEmpresaBean config, PagoAlbaranVentaBean pago) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		     	 "SET ID_MEDPAG_VEN = ?, " +
		     	 	 "IMPORTE = ?, " +
		     	 	 "NUMERO_OPERACION = ? " +
		       "WHERE ID_CLIE_ALBARAN = ? " +
		         "AND LINEA = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, pago.getIdMedioPagoVencimiento());
			pstmt.setDouble(2, pago.getImporte());
			pstmt.setString(3, pago.getNumeroOperacion());
			pstmt.setLong(4, pago.getIdAlbaran());
			pstmt.setInt(5, pago.getLinea());
			
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

	public static void delete(Connection conn, ConfigEmpresaBean config, PagoAlbaranVentaBean pago) throws SQLException {
		delete(conn, config, pago.getIdAlbaran(), pago.getLinea());
	}
	
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
	
	public static void delete(Connection conn, ConfigEmpresaBean config, Long idAlbaran) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
			   "WHERE ID_CLIE_ALBARAN = ? ";
		
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

	public static HashMap<String, Long> consultarTotalAlbaranesVentasFormaPago(Connection conn, ConfigEmpresaBean config) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	HashMap<String, Long> totales = new HashMap<String, Long>();
    	
    	String sql = "SELECT ID_MEDPAG_VEN, DESMEDPAG_VEN, COUNT(*) AS TOTAL " +
	      		       "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) + 
	      		   	  "GROUP BY ID_MEDPAG_VEN, DESMEDPAG_VEN";
        
    	try {
    		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			log.debug("consultarTotalAlbaranesVentasFormaPago() - " + sql);
        	
    		rs = stmt.executeQuery(sql);
        	while (rs.next()){
        		String key = rs.getString("DESMEDPAG_VEN");
        		if(!totales.containsKey(key)){
        			totales.put(key, rs.getLong("TOTAL"));
        		}
        	}
        	
        	return totales;
    	}
    	finally {
    		try {
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try {
    			stmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}

}
