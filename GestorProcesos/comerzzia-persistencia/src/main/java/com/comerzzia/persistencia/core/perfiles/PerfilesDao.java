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

package com.comerzzia.persistencia.core.perfiles;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.usuarios.UsuarioBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class PerfilesDao extends MantenimientoDao {

	private static String TABLA = "CONFIG_PERFILES_TBL";
	
	private static Logger log = Logger.getMLogger(PerfilesDao.class);
	
	public static PaginaResultados consultar(Connection conn,  
			ParametrosBuscarPerfilesBean param) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<PerfilBean> resultados = new ArrayList<PerfilBean>(param.getTamañoPagina());
    	PaginaResultados paginaResultados = new PaginaResultados(param, resultados);
    	
    	// Consultas
    	String sql = obtenerConsulta(param);
    	String sqlCount = obtenerConsultaCount(param);
        
    	try {
    		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    		
    		// Obtenemos número de resultados
        	log.debug("consultar() - " + sqlCount);
        	rs = stmt.executeQuery(sqlCount);
        	if (rs.next()){
        		paginaResultados.setTotalResultados(rs.getInt(1));
        	}
        	rs.close();
        	
        	// Si tenemos resultados, obtenemos la pagina requerida
            if (paginaResultados.getTotalResultados() > 0) {
            	log.debug("consultar() - " + sql);
                rs = stmt.executeQuery(sql);
                
                int contador = 0;
                if (rs.absolute(paginaResultados.getInicio())) {
                    do {
                    	PerfilBean perfil = new PerfilBean();
                    	perfil.setIdPerfil(rs.getLong("ID_PERFIL"));
                    	perfil.setDesPerfil(rs.getString("DESPERFIL"));
                    	
                		resultados.add(perfil);
                        contador++;
                    } while (rs.next() && contador < paginaResultados.getTamañoPagina());                   
                }        		
        	}
            
            return paginaResultados;
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
	
	public static String obtenerConsulta(ParametrosBuscarPerfilesBean param) {
		String sql = null;
		
		sql = "SELECT ID_PERFIL, DESPERFIL " +
		      "FROM " + getNombreElementoConfiguracion(TABLA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }
        
        // Clausula ORDER BY
        if (!param.getOrden().isEmpty()) {
        	sql += "ORDER BY " + param.getOrden();
        }
        
		return sql;
	}
	
	
	public static String obtenerConsultaCount(ParametrosBuscarPerfilesBean param) {
		String sql = null;
		
		sql = "SELECT COUNT(*) " +
		      "FROM " + getNombreElementoConfiguracion(TABLA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }
        
		return sql;
	}
	
	
	private static String getClausulaWhere(ParametrosBuscarPerfilesBean param) {
		String where = "";
		
		// DESPERFIL
		if (!param.getDesPerfil().isEmpty()) {
			where = "UPPER(DESPERFIL) LIKE UPPER('" + param.getDesPerfil() + "%') ";
		}
		
		return where;
	}

	
	public static List<PerfilBean> consultar(Connection conn) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	String sql = null;
		List<PerfilBean> resultados = new ArrayList<PerfilBean>();
    	
    	sql = "SELECT ID_PERFIL, DESPERFIL " +
    	      "FROM " + getNombreElementoConfiguracion(TABLA);;
    	
    	try {
    		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

    		log.debug("consultar() - " + sql);
        	
    		rs = stmt.executeQuery(sql);
        	while (rs.next()){
        		PerfilBean perfil = new PerfilBean();
        		perfil.setIdPerfil(rs.getLong("ID_PERFIL"));
        		perfil.setDesPerfil(rs.getString("DESPERFIL"));
        		
        		resultados.add(perfil);
        	}
        	
    		return resultados;
    	}
    	finally {
    		try{
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try{
    			stmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}

	
	public static PerfilBean consultar(Connection conn, Long idPerfil) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	PerfilBean perfil = null;
    	String sql = null;
    	
    	sql = "SELECT ID_PERFIL, DESPERFIL " +
    	      "FROM " + getNombreElementoConfiguracion(TABLA) +
		      "WHERE ID_PERFIL = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idPerfil);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		perfil = new PerfilBean();
        		perfil.setIdPerfil(rs.getLong("ID_PERFIL"));
        		perfil.setDesPerfil(rs.getString("DESPERFIL"));
        	}
        	
    		return perfil;
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
	
	public static void insert(Connection conn, PerfilBean perfil) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElementoConfiguracion(TABLA) + 
		      "(ID_PERFIL, DESPERFIL) " +
		      "VALUES (?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, perfil.getIdPerfil());
        	pstmt.setString(2, perfil.getDesPerfil());
        	
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
	
	
	public static void update(Connection conn, PerfilBean perfil) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElementoConfiguracion(TABLA) +
		      "SET DESPERFIL = ? " +
		      "WHERE ID_PERFIL = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, perfil.getDesPerfil());
        	pstmt.setLong(2, perfil.getIdPerfil());
        	
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
	
	public static void delete(Connection conn, UsuarioBean usuario) throws SQLException {
		delete(conn, usuario.getIdUsuario());
	}
	
	
	public static void delete(Connection conn, Long idPerfil) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElementoConfiguracion(TABLA) +
		      "WHERE ID_PERFIL = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idPerfil);
        	
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
