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

package com.comerzzia.servicios.core.usuarios.perfiles;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.core.usuarios.perfiles.PerfilUsuarioBean;
import com.comerzzia.persistencia.core.usuarios.perfiles.PerfilesUsuariosDao;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioPerfilesUsuarios {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioPerfilesUsuarios.class);

	public static List<PerfilUsuarioBean> consultar(Long idUsuario) throws PerfilUsuarioException{
		Connection conn = new Connection();
		
		try {
			log.debug("consultarPerfilesUsuarios() - Consultando perfiles para el usuario con identificador " + idUsuario);
			conn.abrirConexion(Database.getConnection());
			return PerfilesUsuariosDao.consultar(conn, idUsuario);
			
		}
		catch(SQLException e){
			String msg = "Error consultando perfiles de usuario: " + e.getMessage();
    		log.error("consultarPerfilesUsuarios() - " + msg);
    		
    		throw new PerfilUsuarioException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	

	public static void salvar(PerfilUsuarioBean perfilUsuario, Connection conn)throws PerfilUsuarioException, PerfilUsuarioConstraintViolationException{
		switch (perfilUsuario.getEstadoBean()) {
			case Estado.NUEVO:
				crear(perfilUsuario, conn);
				break;
		  
			case Estado.BORRADO:
				eliminar(perfilUsuario, conn);
		}
	}


	public static void crear(PerfilUsuarioBean perfilUsuario, Connection conn) throws PerfilUsuarioException, PerfilUsuarioConstraintViolationException{
		try {
			log.debug("crear() - Añadiendo nuevo perfil " + perfilUsuario.getIdPerfil() 
					+ " al usuario con identificador " + perfilUsuario.getIdUsuario()); 
			
			PerfilesUsuariosDao.insert(conn, perfilUsuario);
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear el perfil para un usuario: " + e.getMessage());
			throw new PerfilUsuarioConstraintViolationException("Error creando perfil para un usuario: " 
					+ "El perfil " + perfilUsuario.getIdPerfil() + " ya está registrada en el sistema para el usuario con identificador " + perfilUsuario.getIdUsuario());
		}
		catch (SQLException e) {
			String msg = "Error creando nuevo perfil para un usuario: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new PerfilUsuarioException(msg, e);
		}
	}
	
	
	public static void eliminar(PerfilUsuarioBean perfilUsuario, Connection conn) throws PerfilUsuarioException, PerfilUsuarioConstraintViolationException{
		try {
			log.debug("eliminar() - Eliminando perfil " + perfilUsuario.getIdPerfil() 
					+ " para el usuario con identificador " + perfilUsuario.getIdUsuario());
			
			PerfilesUsuariosDao.delete(conn, perfilUsuario);
		}
		catch (ForeingKeyConstraintViolationException e) {
			log.info("eliminar() - No se ha podido eliminar el perfil: " + e.getMessage());
			throw new PerfilUsuarioConstraintViolationException("Error eliminando el perfil: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando el perfil: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new PerfilUsuarioException(msg, e);
		}
	}

}
