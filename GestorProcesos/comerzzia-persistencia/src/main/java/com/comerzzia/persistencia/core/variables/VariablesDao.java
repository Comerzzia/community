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

package com.comerzzia.persistencia.core.variables;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;


public class VariablesDao extends MantenimientoDao {
	
	private static String TABLA = "CONFIG_VARIABLES_TBL";
	private static String VISTA = "CONFIG_VARIABLES";
	
	private static Logger log = Logger.getMLogger(VariablesDao.class);
	
	public static VariableBean consultar(Connection conn, String idVariable) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	VariableBean variable = null;
    	String sql = null;
    	
    	sql = "SELECT ID_VARIABLE, DESCRIPCION, VALOR_DEFECTO, VALOR, PESO " +
    	      "FROM " + getNombreElementoConfiguracion(VISTA) +
		      "WHERE ID_VARIABLE = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, idVariable);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		variable = new VariableBean();
        		variable.setIdVariable(rs.getString("ID_VARIABLE"));
        		variable.setDescripcion(rs.getString("DESCRIPCION"));
        		variable.setValorDefecto(rs.getString("VALOR_DEFECTO"));
        		variable.setValor(rs.getString("VALOR"));
        		variable.setPeso(rs.getLong("PESO"));
        	}
        	
    		return variable;
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
	
	public static void insert(Connection conn, VariableBean variable) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElementoConfiguracion(TABLA) + 
		      "(ID_VARIABLE, PESO, ID_USUARIO, ID_GRUPO, CODEMP, VALOR) " +
		      "VALUES (?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, variable.getIdVariable());
        	pstmt.setLong(2, variable.getPeso());
        	pstmt.setLong(3, variable.getIdUsuario());
        	pstmt.setLong(4, variable.getIdGrupo());
        	pstmt.setString(5, variable.getCodEmpresa());
        	pstmt.setString(6, variable.getValor());
        	
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
	
	public static int update(Connection conn, VariableBean variable) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElementoConfiguracion(TABLA) +
		      "SET PESO = ?, ID_USUARIO = ?, ID_GRUPO = ?, CODEMP = ?, VALOR = ? " +
		      "WHERE ID_VARIABLE = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);			
        	pstmt.setLong(1, variable.getPeso());
        	pstmt.setLong(2, variable.getIdUsuario());
        	pstmt.setLong(3, variable.getIdGrupo());
        	pstmt.setString(4, variable.getCodEmpresa());
        	pstmt.setString(5, variable.getValor());
        	pstmt.setString(6, variable.getIdVariable());
        	
        	log.debug("update() - " + pstmt);
        	
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
	
	public static void delete(Connection conn, String idVariable) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElementoConfiguracion(TABLA) +
		      "WHERE ID_VARIABLE = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, idVariable);
        	
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
