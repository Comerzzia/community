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

package com.comerzzia.persistencia.sincronizacion.usuarios;

import java.sql.SQLException;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.core.usuarios.UsuarioBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;


public class UsuariosTiendaDao extends MantenimientoDao {
	
	private static String TABLA = "CONFIG_USUARIOS_TBL";
	
	private static Logger log = Logger.getMLogger(UsuariosTiendaDao.class);
	
	
	
	public static void insert(Connection conn, ConfigEmpresaBean config, 
			UsuarioBean usuario) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(ID_USUARIO, USUARIO, DESUSUARIO, CLAVE, ACTIVO, APLICACION_POR_DEFECTO, " + 
		      "PUEDE_CAMBIAR_APLICACION) " +
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
	
	
	public static void update(Connection conn, ConfigEmpresaBean config, 
			UsuarioBean usuario) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "SET DESUSUARIO = ?, ACTIVO = ?,APLICACION_POR_DEFECTO = ?, " + 
		      "PUEDE_CAMBIAR_APLICACION = ?, CLAVE = ? " +
		      "WHERE ID_USUARIO = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, usuario.getDesUsuario());
        	pstmt.setString(2, usuario.getActivo());
			pstmt.setString(3, usuario.getAplicacion());
        	pstmt.setString(4, usuario.getPuedeCambiarAplicacion());
        	pstmt.setString(5, usuario.getClave());
        	pstmt.setLong(6, usuario.getIdUsuario());
        	
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
}
