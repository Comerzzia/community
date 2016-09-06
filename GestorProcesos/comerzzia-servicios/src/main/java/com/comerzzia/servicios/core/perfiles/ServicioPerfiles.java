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

package com.comerzzia.servicios.core.perfiles;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.core.perfiles.ParametrosBuscarPerfilesBean;
import com.comerzzia.persistencia.core.perfiles.PerfilBean;
import com.comerzzia.persistencia.core.perfiles.PerfilesDao;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioPerfiles {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioPerfiles.class);
	
	public static PaginaResultados consultar(ParametrosBuscarPerfilesBean param) throws PerfilException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando perfiles");
			conn.abrirConexion(Database.getConnection());
			return PerfilesDao.consultar(conn, param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar perfiles: " +  e.getMessage();
			
            throw new PerfilException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static List<PerfilBean> consultar() throws PerfilException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando todos los perfiles");
			conn.abrirConexion(Database.getConnection());
			return PerfilesDao.consultar(conn);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar todos los perfiles: " +  e.getMessage();
			
            throw new PerfilException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	
	public static PerfilBean consultar(Long idPerfil) 
			throws PerfilException, PerfilNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando datos del perfil con identificador: " + idPerfil);
			conn.abrirConexion(Database.getConnection());
			PerfilBean perfil = PerfilesDao.consultar(conn, idPerfil);
			
			if (perfil == null) {
				String msg = "No se ha encontrado el perfil con identificador: " + idPerfil;
				log.info("consultar() - " + msg);
				throw new PerfilNotFoundException(msg);
			}
			
			return perfil;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un perfil: " +  e.getMessage();
			
            throw new PerfilException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void salvar(PerfilBean perfil, DatosSesionBean datosSesion) 
			throws PerfilException, PerfilConstraintViolationException {
	
		switch (perfil.getEstadoBean()) {
			case Estado.NUEVO:
				crear(perfil, datosSesion);
				break;
			      
			case Estado.MODIFICADO:
				modificar(perfil);
				break;
			      
			case Estado.BORRADO:
				eliminar(perfil.getIdPerfil());
		}
	}
	
	
	public static void crear(PerfilBean perfil, DatosSesionBean datosSesion) 
			throws PerfilException, PerfilConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nuevo perfil");
			
			// Obtenemos valor del contador
			Long idPerfil = ContadorPerfiles.obtenerContadorDefinitivo();
			perfil.setIdPerfil(idPerfil);
			
			conn.abrirConexion(Database.getConnection());
			PerfilesDao.insert(conn, perfil);
		}
		catch (ContadorException e) {
			String msg = "Error creando perfil: " + e.getMessage();
    		log.error("crear() - " + msg);
    		
			throw new PerfilException(msg, e);
		}
		catch(KeyConstraintViolationException e){
			log.info("crear() - No se ha podido crear el perfil: " + e.getMessage());
			throw new PerfilConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error creando perfil: " + e.getMessage();
    		log.error("crear() - " + msg);
    		
    		throw new PerfilException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void modificar(PerfilBean perfil) throws PerfilException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando Perfil " + perfil.getIdPerfil());
			conn.abrirConexion(Database.getConnection());
			PerfilesDao.update(conn, perfil);
		}
		catch (SQLException e) {
			String msg = "Error modificando perfil: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new PerfilException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void eliminar(Long idPerfil) 
			throws PerfilException, PerfilConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando perfil " + idPerfil);
			conn.abrirConexion(Database.getConnection());
			PerfilesDao.delete(conn, idPerfil);
		}
		catch(ForeingKeyConstraintViolationException e){
			log.info("eliminar() - No se ha podido eliminar el perfil: "+ e.getMessage());
			throw new PerfilConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
    		String msg = "Error eliminando perfil: " + e.getMessage();
    		log.error("eliminar() - " + msg);
    		
    		throw new PerfilException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
}
