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

package com.comerzzia.persistencia.sincronizacion.variables;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.core.variables.VariableBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;


public class VariablesTiendaDao extends MantenimientoDao {
	
	private static String TABLA_DEF = "CONFIG_VARIABLES_DEF_TBL";
	private static String TABLA = "CONFIG_VARIABLES_TBL";
	
	private static Logger log = Logger.getMLogger(VariablesTiendaDao.class);
	
	
	public static VariableBean consultarDefinicion(Connection conn, String idVariable) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	VariableBean variable = null;
    	String sql = null;
    	
    	sql = "SELECT ID_VARIABLE, VALOR_DEFECTO " +
    	      "FROM " + TABLA_DEF + " " +                      // Realizamos la consulta sin esquema
		      "WHERE ID_VARIABLE = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, idVariable);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		variable = new VariableBean();
        		variable.setIdVariable(rs.getString("ID_VARIABLE"));
        		variable.setValorDefecto(rs.getString("VALOR_DEFECTO"));
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
	
	
	public static void insert(Connection conn, ConfigEmpresaBean config, VariableBean variable) 
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
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
	
	
	public static void update(Connection conn, ConfigEmpresaBean config, VariableBean variable) 
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
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
        	
        	pstmt.executeUpdate();
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
	
	
	public static void delete(Connection conn, ConfigEmpresaBean config, String idVariable) 
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
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
