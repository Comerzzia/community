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

package com.comerzzia.persistencia.core.contadores;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;


public class ContadoresDao extends MantenimientoDao {
	
	private static String TABLA = "CONFIG_CONTADORES_TBL";
	
	private static Logger log = Logger.getMLogger(ContadoresDao.class);
	
	
	public static Long consultarValor(Connection conn, 
			ContadorBean contador) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	Long valor = null;
    	String sql = null;
    	
    	sql = "SELECT VALOR " +
    	      "FROM " + getNombreElementoConfiguracion(TABLA) +
    	      "WHERE ID_CONTADOR = ? " +
    	      "AND CODEMP = ? " +
    	      "AND CODSERIE = ? " +
    	      "AND PERIODO = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, contador.getIdContador());
    		pstmt.setString(2, contador.getCodEmpresa());
    		pstmt.setString(3, contador.getCodSerie());
    		pstmt.setShort(4, contador.getPeriodo());
        	log.debug("consultarValor() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		valor = rs.getLong("VALOR");
        	}
        	
        	return valor;
    	}
    	finally {
    		try{
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try{
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
	
	
	public static void insert(Connection conn, ContadorBean contador) 
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElementoConfiguracion(TABLA) + 
		      "(ID_CONTADOR, CODEMP, CODSERIE, PERIODO, VALOR) " +
		      "VALUES (?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, contador.getIdContador());
        	pstmt.setString(2, contador.getCodEmpresa());
        	pstmt.setString(3, contador.getCodSerie());
        	pstmt.setShort(4, contador.getPeriodo());
        	pstmt.setLong(5, contador.getValor());
        	
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
	
	
	public static int nextValue(Connection conn, ContadorBean contador) 
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElementoConfiguracion(TABLA) +
		      "SET VALOR = VALOR + 1 " +
		      "WHERE ID_CONTADOR = ? " +
		      "AND CODEMP = ? " +
    	      "AND CODSERIE = ? " +
    	      "AND PERIODO = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, contador.getIdContador());
        	pstmt.setString(2, contador.getCodEmpresa());
        	pstmt.setString(3, contador.getCodSerie());
        	pstmt.setShort(4, contador.getPeriodo());
        	
        	log.debug("nextValue() - " + pstmt);
        	
        	return pstmt.executeUpdate();
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
