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

package com.comerzzia.persistencia.general.tiendas.cajas;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class CajasDao extends MantenimientoDao {

private static String TABLA = "D_TIENDAS_CAJAS_TBL";
	
	private static Logger log = Logger.getMLogger(CajasDao.class);
	
	public static List<CajaBean> consultar(Connection conn, ConfigEmpresaBean config, String codAlm) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		List<CajaBean> lstCajas = new ArrayList<CajaBean>();
		
		sql = "SELECT CODALM, CODCAJA, IDENTIFICADOR_CAJA, CONFIGURACION " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
				"WHERE CODALM = ? " +
				"ORDER BY CODCAJA";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codAlm);
			
		    log.debug("consultar() - " + sql);
		    rs = pstmt.executeQuery();
		    
		    while (rs.next()) {
		        CajaBean caja = new CajaBean();
		        caja.setCodAlm(rs.getString("CODALM"));
		        caja.setCodCaja(rs.getString("CODCAJA"));
		        caja.setIdentificadorCaja(rs.getString("IDENTIFICADOR_CAJA"));
		        caja.setConfiguracion(rs.getBlob("CONFIGURACION"));
		        
		        lstCajas.add(caja);
		    }
		    
		    return lstCajas;
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
    
    
    public static void insert(Connection conn, ConfigEmpresaBean config, CajaBean caja) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(CODALM, CODCAJA, IDENTIFICADOR_CAJA, CONFIGURACION) " +
		      "VALUES (?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, caja.getCodAlm());
        	pstmt.setString(2, caja.getCodCaja());
        	pstmt.setString(3, caja.getIdentificadorCaja());
        	pstmt.setBlob(4, caja.getConfiguracion());
        	
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
    
    
    public static void update(Connection conn, ConfigEmpresaBean config, CajaBean caja) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET IDENTIFICADOR_CAJA = ?, CONFIGURACION = ? "+
		      "WHERE CODALM = ? AND CODCAJA = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);		
        	
        	pstmt.setString(1, caja.getIdentificadorCaja());
        	pstmt.setBlob(2, caja.getConfiguracion());
        	pstmt.setString(3, caja.getCodAlm());
        	pstmt.setString(4, caja.getCodCaja());
        	
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
        
    
    public static void delete(Connection conn, ConfigEmpresaBean config, CajaBean caja) throws SQLException {
		delete(conn, config, caja.getCodAlm(), caja.getCodCaja());
	}
    	
    	
    public static void delete(Connection conn, ConfigEmpresaBean config, String codAlm, String codCaja) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODALM = ? AND CODCAJA = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, codAlm);
        	pstmt.setString(2, codCaja);
        	
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
    
    public static void delete(Connection conn, ConfigEmpresaBean config, String codAlm) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODALM = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, codAlm);
        	
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
