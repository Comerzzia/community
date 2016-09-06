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

package com.comerzzia.persistencia.core.usuarios;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;


public class UsuariosDao extends MantenimientoDao {
	
	private static String TABLA = "CONFIG_USUARIOS_TBL";
	
	private static Logger log = Logger.getMLogger(UsuariosDao.class);
	
	
	public static PaginaResultados consultar(Connection conn,
			ParametrosBuscarUsuariosBean param) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<UsuarioBean> resultados = new ArrayList<UsuarioBean>(param.getTamañoPagina());
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
                		UsuarioBean usuario = new UsuarioBean();
                		usuario.setIdUsuario(rs.getLong("ID_USUARIO"));
                		usuario.setUsuario(rs.getString("USUARIO"));
                		usuario.setDesUsuario(rs.getString("DESUSUARIO"));
                		usuario.setActivo(rs.getString("ACTIVO"));
                		usuario.setAplicacion(rs.getString("APLICACION_POR_DEFECTO"));
                		usuario.setPuedeCambiarAplicacion(rs.getString("PUEDE_CAMBIAR_APLICACION"));
                		resultados.add(usuario);
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
	
	
	public static String obtenerConsulta(ParametrosBuscarUsuariosBean param) {
		String sql = null;
		
		sql = "SELECT ID_USUARIO, USUARIO, DESUSUARIO, CLAVE, ACTIVO, APLICACION_POR_DEFECTO," +
				     "PUEDE_CAMBIAR_APLICACION " +
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
	
	
	public static String obtenerConsultaCount(ParametrosBuscarUsuariosBean param) {
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
	
	
	private static String getClausulaWhere(ParametrosBuscarUsuariosBean param) {
		String where = "";
		
		// CODUSUARIO
		if (!param.getUsuario().isEmpty()) {
			where = "USUARIO LIKE '" + param.getUsuario() + "%' ";
		}
		
		// DESUSUARIO
		if (!param.getDesUsuario().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "UPPER(DESUSUARIO) LIKE UPPER('" + param.getDesUsuario() + "%') ";
		}
		
		//ACTIVO
		if (!param.getActivo().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "ACTIVO = '" + param.getActivo() + "' ";
		}

		return where;
	}
	
	
	public static UsuarioBean consultar(Connection conn, Long idUsuario) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	UsuarioBean usuario = null;
    	String sql = null;
    	
    	sql = "SELECT ID_USUARIO, USUARIO, DESUSUARIO, CLAVE, ACTIVO, APLICACION_POR_DEFECTO," +
    			     "PUEDE_CAMBIAR_APLICACION " +
    	      "FROM " + getNombreElementoConfiguracion(TABLA) +
		      "WHERE ID_USUARIO = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idUsuario);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		usuario = new UsuarioBean();
        		usuario.setIdUsuario(rs.getLong("ID_USUARIO"));
        		usuario.setUsuario(rs.getString("USUARIO"));
        		usuario.setDesUsuario(rs.getString("DESUSUARIO"));
        		usuario.setClave(rs.getString("CLAVE"));
        		usuario.setActivo(rs.getString("ACTIVO"));
        		usuario.setAplicacion(rs.getString("APLICACION_POR_DEFECTO"));
        		usuario.setPuedeCambiarAplicacion(rs.getString("PUEDE_CAMBIAR_APLICACION"));
        	}
        	
    		return usuario;
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
	

	public static UsuarioBean consultar(Connection conn, String login) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	UsuarioBean usuario = null;
    	String sql = null;
    	
    	sql = "SELECT ID_USUARIO, USUARIO, DESUSUARIO, CLAVE, ACTIVO, APLICACION_POR_DEFECTO," +
    			     "PUEDE_CAMBIAR_APLICACION " +
    	      "FROM " + getNombreElementoConfiguracion(TABLA) +
		      "WHERE USUARIO = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, login);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		usuario = new UsuarioBean();
        		usuario.setIdUsuario(rs.getLong("ID_USUARIO"));
        		usuario.setUsuario(rs.getString("USUARIO"));
        		usuario.setDesUsuario(rs.getString("DESUSUARIO"));
        		usuario.setClave(rs.getString("CLAVE"));
        		usuario.setActivo(rs.getString("ACTIVO"));
        		usuario.setAplicacion(rs.getString("APLICACION_POR_DEFECTO"));
        		usuario.setPuedeCambiarAplicacion(rs.getString("PUEDE_CAMBIAR_APLICACION"));
        	}
        	
    		return usuario;
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
	
	public static List<UsuarioBean> consultar(Connection conn) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	String sql = null;
		List<UsuarioBean> resultados = new ArrayList<UsuarioBean>();
    	
		sql = "SELECT ID_USUARIO, USUARIO, DESUSUARIO " +
	     	  "FROM " + getNombreElementoConfiguracion(TABLA);
    	
    	try {
    		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

    		log.debug("consultar() - " + sql);
        	
    		rs = stmt.executeQuery(sql);
        	while (rs.next()){
        		UsuarioBean usuario = new UsuarioBean();
        		usuario.setIdUsuario(rs.getLong("ID_USUARIO"));
        		usuario.setUsuario(rs.getString("USUARIO"));
        		usuario.setDesUsuario(rs.getString("DESUSUARIO"));
        		
        		resultados.add(usuario);
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
	
	
	public static void insert(Connection conn, UsuarioBean usuario) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElementoConfiguracion(TABLA) + 
		      "(ID_USUARIO, USUARIO, DESUSUARIO, CLAVE, ACTIVO, APLICACION_POR_DEFECTO, PUEDE_CAMBIAR_APLICACION) " +
		      "VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, usuario.getIdUsuario());
        	pstmt.setString(2, usuario.getUsuario());
        	pstmt.setString(3, usuario.getDesUsuario());
        	pstmt.setString(4, usuario.getClave());
        	pstmt.setString(5, usuario.getActivo());
        	pstmt.setString(6, usuario.getAplicacion());
        	pstmt.setString(7, usuario.getPuedeCambiarAplicacion());
        	
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
	
	
	public static void update(Connection conn, UsuarioBean usuario) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElementoConfiguracion(TABLA) +
		      "SET DESUSUARIO = ?, ACTIVO = ?,APLICACION_POR_DEFECTO = ?, PUEDE_CAMBIAR_APLICACION = ? " +
		      "WHERE ID_USUARIO = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, usuario.getDesUsuario());
        	pstmt.setString(2, usuario.getActivo());
			pstmt.setString(3, usuario.getAplicacion());
        	pstmt.setString(4, usuario.getPuedeCambiarAplicacion());
        	pstmt.setLong(5, usuario.getIdUsuario());
        	
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
	
	
	public static void cambiarClaveUsuario(Connection conn, Long idUsuario, String clave) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElementoConfiguracion(TABLA) +
		      "SET CLAVE = ? " +
		      "WHERE ID_USUARIO = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, clave);
        	pstmt.setLong(2, idUsuario);
        	
        	log.debug("cambiarClaveUsuario() - " + pstmt);
        	
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
	
	
	public static void delete(Connection conn, Long idUsuario) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElementoConfiguracion(TABLA) +
		      "WHERE ID_USUARIO = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idUsuario);
        	
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

	public static Long consultarTotalUsuarios(Connection conn, ConfigEmpresaBean config) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	Long total = null;
    	
    	// Consultas
    	String sql = "SELECT COUNT(*) " +
	      						"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA);
        
    	try {
    		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    		log.debug("consultarTotalUsuarios() - " + sql);
        	
    		rs = stmt.executeQuery(sql);
        	if (rs.next()){
        		total = rs.getLong(1);
        	}
        	
        	return total;
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
