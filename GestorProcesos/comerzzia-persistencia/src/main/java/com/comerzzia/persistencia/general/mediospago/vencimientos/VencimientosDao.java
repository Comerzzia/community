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

package com.comerzzia.persistencia.general.mediospago.vencimientos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class VencimientosDao extends MantenimientoDao {

	private static String TABLA = "D_MEDIOS_PAGO_VEN_TBL";
	private static String VISTA = "D_MEDIOS_PAGO_VEN";
	
	private static Logger log = Logger.getMLogger(VencimientosDao.class);
	
	public static List<VencimientoBean> consultar(Connection conn, ConfigEmpresaBean config, String codMedioPago) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		List<VencimientoBean> lstVencimientos = new ArrayList<VencimientoBean>();
		
		sql = "SELECT ID_MEDPAG_VEN, DESMEDPAG_VEN, NUMERO_VENCIMIENTOS, DIAS_CADENCIA, " +
				"DIAS_ENTRE_VENCIMIENTOS, DIAS_NATURALES, ACTIVO " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
				"WHERE CODMEDPAG = ?" +
				"ORDER BY ID_MEDPAG_VEN";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codMedioPago);
			
		    log.debug("consultar() - " + sql);
		    rs = pstmt.executeQuery();
		    
		    while (rs.next()) {
		        VencimientoBean vencimiento = new VencimientoBean();
		        vencimiento.setCodMedioPago(codMedioPago);
//		        vencimiento.setCodVencimiento(rs.getLong("CODMEDPAG_VEN"));
		        vencimiento.setDesVencimiento(rs.getString("DESMEDPAG_VEN"));
		        vencimiento.setNumeroVencimientos(rs.getLong("NUMERO_VENCIMIENTOS"));
		        vencimiento.setDiasCadencia(rs.getLong("DIAS_CADENCIA"));
		        vencimiento.setDiasEntreVencimientos(rs.getLong("DIAS_ENTRE_VENCIMIENTOS"));
		        vencimiento.setDiasNaturales(rs.getString("DIAS_NATURALES"));
		        vencimiento.setActivo(rs.getString("ACTIVO"));
		        vencimiento.setIdMedioPagoVencimiento(rs.getLong("ID_MEDPAG_VEN"));
		        
		        lstVencimientos.add(vencimiento);
		    }
		    
		    return lstVencimientos;
		}
		finally {
			try {
		        rs.close();
		    }
		    catch (Exception ignore) {;}
		    try {
		    	pstmt.close();
		    }
		    catch (Exception ignore) {;}
		}
	}

	public static VencimientoBean consultar(Connection conn, ConfigEmpresaBean config, Long idMedioPagoVencimiento) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		VencimientoBean vencimiento = null;
		
		sql = "SELECT CODMEDPAG, DESMEDPAG_VEN, NUMERO_VENCIMIENTOS, DIAS_CADENCIA, " +
				"DIAS_ENTRE_VENCIMIENTOS, DIAS_NATURALES, ACTIVO " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
				"WHERE ID_MEDPAG_VEN = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idMedioPagoVencimiento);
			
		    log.debug("consultar() - " + pstmt);
		    rs = pstmt.executeQuery();
		    
		    while (rs.next()) {
		    	vencimiento = new VencimientoBean();
		        vencimiento.setIdMedioPagoVencimiento(idMedioPagoVencimiento);
		        vencimiento.setCodMedioPago(rs.getString("CODMEDPAG"));
		        vencimiento.setDesVencimiento(rs.getString("DESMEDPAG_VEN"));
		        vencimiento.setNumeroVencimientos(rs.getLong("NUMERO_VENCIMIENTOS"));
		        vencimiento.setDiasCadencia(rs.getLong("DIAS_CADENCIA"));
		        vencimiento.setDiasEntreVencimientos(rs.getLong("DIAS_ENTRE_VENCIMIENTOS"));
		        vencimiento.setDiasNaturales(rs.getString("DIAS_NATURALES"));
		        vencimiento.setActivo(rs.getString("ACTIVO"));
		    }
		    
		    return vencimiento;
		}
		finally {
			try {
		        rs.close();
		    }
		    catch (Exception ignore) {;}
		    try {
		    	pstmt.close();
		    }
		    catch (Exception ignore) {;}
		}
	}

	public static List<VencimientoBean> consultarVencimientosEfectivos(Connection conn, ConfigEmpresaBean config) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		List<VencimientoBean> lstVencimientos = new ArrayList<VencimientoBean>();
		
		sql = "SELECT ID_MEDPAG_VEN, DESMEDPAG_VEN " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
				"WHERE EFECTIVO = 'S'" +
				"AND VISIBLE_VENTA = 'S'" +
				"AND ACTIVO = 'S'" +
				"ORDER BY ID_MEDPAG_VEN";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			
		    log.debug("consultar() - " + sql);
		    rs = pstmt.executeQuery();
		    
		    while (rs.next()) {
		        VencimientoBean vencimiento = new VencimientoBean();
		        vencimiento.setIdMedioPagoVencimiento(rs.getLong("ID_MEDPAG_VEN"));
		        vencimiento.setDesVencimiento(rs.getString("DESMEDPAG_VEN"));
		        
		        lstVencimientos.add(vencimiento);
		    }
		    
		    return lstVencimientos;
		}
		finally {
			try {
		        rs.close();
		    }
		    catch (Exception ignore) {;}
		    try {
		    	pstmt.close();
		    }
		    catch (Exception ignore) {;}
		}
	}
	
	
	public static void insert(Connection conn, ConfigEmpresaBean config, VencimientoBean vencimiento) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(ID_MEDPAG_VEN, CODMEDPAG, DESMEDPAG_VEN, NUMERO_VENCIMIENTOS, " +
		      "DIAS_CADENCIA, DIAS_ENTRE_VENCIMIENTOS, DIAS_NATURALES, ACTIVO) " +
		      "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, vencimiento.getIdMedioPagoVencimiento());
			pstmt.setString(2, vencimiento.getCodMedioPago());
        	pstmt.setString(3, vencimiento.getDesVencimiento());
        	pstmt.setLong(4, vencimiento.getNumeroVencimientos());
        	pstmt.setLong(5, vencimiento.getDiasCadencia());
        	pstmt.setLong(6, vencimiento.getDiasEntreVencimientos());
        	pstmt.setString(7, vencimiento.getDiasNaturales());
        	pstmt.setString(8, vencimiento.getActivo());
        	
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
    
    
    public static void update(Connection conn, ConfigEmpresaBean config, VencimientoBean vencimiento) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET DESMEDPAG_VEN = ?, NUMERO_VENCIMIENTOS = ?, DIAS_CADENCIA = ?, " +
		      "DIAS_ENTRE_VENCIMIENTOS = ?, DIAS_NATURALES = ?, ACTIVO = ? " +
		      "WHERE ID_MEDPAG_VEN = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);		
        	pstmt.setString(1, vencimiento.getDesVencimiento());
        	pstmt.setLong(2, vencimiento.getNumeroVencimientos());
        	pstmt.setLong(3, vencimiento.getDiasCadencia());
        	pstmt.setLong(4, vencimiento.getDiasEntreVencimientos());
        	pstmt.setString(5, vencimiento.getDiasNaturales());
        	pstmt.setString(6, vencimiento.getActivo());
        	pstmt.setLong(7, vencimiento.getIdMedioPagoVencimiento());
        	
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
        
    
    public static void delete(Connection conn, ConfigEmpresaBean config, VencimientoBean vencimiento) throws SQLException {
		delete(conn, config, vencimiento.getIdMedioPagoVencimiento());
	}
    	
    	
    public static void delete(Connection conn, ConfigEmpresaBean config, Long idMedioPagoVencimiento) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE ID_MEDPAG_VEN = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idMedioPagoVencimiento);
        	
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
    
    public static void delete(Connection conn, ConfigEmpresaBean config, String codMedioPago) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODMEDPAG = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, codMedioPago);
        	
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
