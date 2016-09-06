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

package com.comerzzia.persistencia.core.usuarios.perfiles;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;


public class PerfilesUsuariosDao extends MantenimientoDao {
	
	private static String TABLA = "CONFIG_USUARIOS_PERFILES_TBL";
	private static String VISTA = "CONFIG_USUARIOS_PERFILES";
	
	private static Logger log = Logger.getMLogger(PerfilesUsuariosDao.class);
	
	public static List<PerfilUsuarioBean> consultar(Connection conn, Long idUsuario) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	List<PerfilUsuarioBean> lstPerfiles = new ArrayList<PerfilUsuarioBean>();
    	String sql = null;
    	
    	sql = "SELECT ID_USUARIO, ID_PERFIL, DESPERFIL " +
    	      "FROM " + getNombreElementoConfiguracion(VISTA) +
		      "WHERE ID_USUARIO = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idUsuario);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	while (rs.next()){
        		PerfilUsuarioBean usuarioPerfil = new PerfilUsuarioBean();
        		usuarioPerfil.setIdUsuario(rs.getLong("ID_USUARIO"));
        		usuarioPerfil.setIdPerfil(rs.getLong("ID_PERFIL"));
        		usuarioPerfil.setDesPerfil(rs.getString("DESPERFIL"));
        		
        		lstPerfiles.add(usuarioPerfil);
        	}
        	
    		return lstPerfiles;
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
	
	
	public static void insert(Connection conn, PerfilUsuarioBean usuarioPerfil) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElementoConfiguracion(TABLA) + 
		      "(ID_USUARIO, ID_PERFIL) " +
		      "VALUES (?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, usuarioPerfil.getIdUsuario());
        	pstmt.setLong(2, usuarioPerfil.getIdPerfil());
        	
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
	
	
	public static void delete(Connection conn, PerfilUsuarioBean usuarioPerfil) throws SQLException {
		delete(conn, usuarioPerfil.getIdUsuario(), usuarioPerfil.getIdPerfil());
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

	public static void delete(Connection conn, Long idUsuario, Long idPerfil) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElementoConfiguracion(TABLA) +
		      "WHERE ID_USUARIO = ? " +
		        "AND ID_PERFIL = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idUsuario);
        	pstmt.setLong(2, idPerfil);

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
