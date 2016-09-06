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

package com.comerzzia.servicios.core.usuarios;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.core.usuarios.ParametrosBuscarUsuariosBean;
import com.comerzzia.persistencia.core.usuarios.UsuarioBean;
import com.comerzzia.persistencia.core.usuarios.UsuariosDao;
import com.comerzzia.persistencia.core.usuarios.perfiles.PerfilUsuarioBean;
import com.comerzzia.persistencia.core.usuarios.perfiles.PerfilesUsuariosDao;
import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenUsuarioBean;
import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenesUsuariosDao;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.usuarios.perfiles.PerfilUsuarioConstraintViolationException;
import com.comerzzia.servicios.core.usuarios.perfiles.PerfilUsuarioException;
import com.comerzzia.servicios.core.usuarios.perfiles.ServicioPerfilesUsuarios;
import com.comerzzia.servicios.general.tiendas.usuarios.AlmacenUsuarioConstraintViolationException;
import com.comerzzia.servicios.general.tiendas.usuarios.AlmacenUsuarioException;
import com.comerzzia.servicios.general.tiendas.usuarios.ServicioAlmacenesUsuarios;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioUsuarios {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioUsuarios.class);

	public static PaginaResultados consultar(ParametrosBuscarUsuariosBean param)
			throws UsuarioException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando usuarios");
			conn.abrirConexion(Database.getConnection());
			return UsuariosDao.consultar(conn, param);
		} catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar usuarios: " + e.getMessage();

			throw new UsuarioException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static UsuarioBean consultar(Long idUsuario)
			throws UsuarioException, UsuarioNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos del usuario: "
					+ idUsuario);
			conn.abrirConexion(Database.getConnection());
			UsuarioBean usuario = UsuariosDao.consultar(conn, idUsuario);

			if (usuario == null) {
				String msg = "No se ha encontrado el usuario con identificador: "
						+ idUsuario;
				log.info("consultar() - " + msg);
				throw new UsuarioNotFoundException(msg);
			}

			return usuario;
		} catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un usuario: "
					+ e.getMessage();

			throw new UsuarioException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}
	
	public static List<UsuarioBean> consultar() throws UsuarioException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando todos los usuarios");
			conn.abrirConexion(Database.getConnection());
			return UsuariosDao.consultar(conn);
		} catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar todos los usuaios: " + e.getMessage();

			throw new UsuarioException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static void salvar(UsuarioBean usuario, DatosSesionBean datosSesion) throws UsuarioException,
			UsuarioConstraintViolationException {

		switch (usuario.getEstadoBean()) {
		case Estado.NUEVO:
			crear(usuario, datosSesion);
			break;

		case Estado.MODIFICADO:
			modificar(usuario, datosSesion);
			break;

		case Estado.BORRADO:
			eliminar(usuario.getIdUsuario(), datosSesion);
		}
	}

	public static void crear(UsuarioBean usuario, DatosSesionBean datosSesion) throws UsuarioException,
			UsuarioConstraintViolationException {
		Connection conn = new Connection();

		try {
			log.debug("crear() - Creando nuevo Usuario");

			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();

			crear(usuario, datosSesion, conn);

			conn.commit();
			conn.finalizaTransaccion();
			
		} catch (SQLException e) {
			conn.deshacerTransaccion();

			String msg = "Error creando usuario: " + e.getMessage();
			log.error("crear() - " + msg);

			throw new UsuarioException(msg, e);
		} finally {
			conn.cerrarConexion();
		}
	}
	
	public static void crear(UsuarioBean usuario, DatosSesionBean datosSesion, Connection conn) throws UsuarioException,
			UsuarioConstraintViolationException {
		
		try {
			log.debug("crear() - Creando nuevo Usuario");
		
			// Obtenemos el idUsuario a partir del contador de usuarios
			Long idUsuario = ContadorUsuarios.obtenerContador(conn);
			usuario.setIdUsuario(idUsuario);
		
			UsuariosDao.insert(conn, usuario);
			salvarPerfilesUsuario(usuario, conn);
			salvarAlmacenesUsuario(usuario, conn, datosSesion);
		
		} catch (ContadorException e) {
			String msg = "Error creando usuario: " + e.getMessage();
			log.error("crear() - " + msg);
		
			throw new UsuarioException(msg, e);
		} 
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear el usuario: "
					+ e.getMessage());
			throw new UsuarioConstraintViolationException(e.getDefaultMessage());
		} 
		catch (AlmacenUsuarioException e) {
			String msg = "Error creando usuario: " + e.getMessage();
			log.error("modificar() - " + msg);
		
			throw new UsuarioException(msg, e);
		} 
		catch (AlmacenUsuarioConstraintViolationException e) {
			String msg = "Error creando usuario: " + e.getMessage();
			log.error("modificar() - " + msg);
		
			throw new UsuarioConstraintViolationException(msg, e);
		} 
		catch (SQLException e) {
			String msg = "Error creando usuario: " + e.getMessage();
			log.error("crear() - " + msg);
		
			throw new UsuarioException(msg, e);
		}
	}

	public static void modificar(UsuarioBean usuario, DatosSesionBean datosSesion) throws UsuarioException,
			UsuarioConstraintViolationException {
		Connection conn = new Connection();

		try {
			log.debug("modificar() - Modificando Usuario "
					+ usuario.getIdUsuario());

			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();

			UsuariosDao.update(conn, usuario);
			salvarPerfilesUsuario(usuario, conn);
			salvarAlmacenesUsuario(usuario, conn, datosSesion);

			conn.commit();
			conn.finalizaTransaccion();
		
		} catch (AlmacenUsuarioException e) {
			conn.deshacerTransaccion();

			String msg = "Error modificando usuario: " + e.getMessage();
			log.error("modificar() - " + msg);

			throw new UsuarioException(msg, e);
		} catch (AlmacenUsuarioConstraintViolationException e) {
			conn.deshacerTransaccion();

			String msg = "Error modificando usuario: " + e.getMessage();
			log.error("modificar() - " + msg);

			throw new UsuarioConstraintViolationException(msg, e);
		} catch (SQLException e) {
			conn.deshacerTransaccion();

			String msg = "Error modificando usuario: " + e.getMessage();
			log.error("modificar() - " + msg);

			throw new UsuarioException(msg, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static void eliminar(Long idUsuario, DatosSesionBean datosSesion) throws UsuarioException,
			UsuarioConstraintViolationException {
		Connection conn = new Connection();

		try {
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();

			log.debug("eliminar() - Eliminando Perfiles Usuario " + idUsuario);
			PerfilesUsuariosDao.delete(conn, idUsuario);

			log.debug("eliminar() - Eliminando Almacenes Usuario " + idUsuario);
			AlmacenesUsuariosDao.delete(conn, datosSesion.getConfigEmpresa(), idUsuario);

			log.debug("eliminar() - Eliminando Usuario " + idUsuario);
			UsuariosDao.delete(conn, idUsuario);

			conn.commit();
			conn.finalizaTransaccion();

		} catch (ForeingKeyConstraintViolationException e) {
			conn.deshacerTransaccion();

			log.info("eliminar() - No se ha podido eliminar el usuario: "
					+ e.getMessage());
			throw new UsuarioConstraintViolationException(e.getDefaultMessage());
		} catch (SQLException e) {
			conn.deshacerTransaccion();

			String msg = "Error eliminando usuario: " + e.getMessage();
			log.error("eliminar() - " + msg);

			throw new UsuarioException(msg, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static void cambiarClaveUsuario(Long idUsuario, String clave)
			throws UsuarioException {
		Connection conn = new Connection();

		try {
			log.debug("cambiarClaveUsuario() - Cambiando clave del usuario "
					+ idUsuario);
			conn.abrirConexion(Database.getConnection());
			UsuariosDao.cambiarClaveUsuario(conn, idUsuario, clave);
		} catch (SQLException e) {
			String msg = "Error actualizando clave de usario: "
					+ e.getMessage();
			log.error("cambiarClaveUsuario() - " + msg);

			throw new UsuarioException(msg, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	private static void salvarPerfilesUsuario(UsuarioBean usuario,
			Connection conn) throws PerfilUsuarioException,
			PerfilUsuarioConstraintViolationException {

		if (usuario.isPerfilesCargados()) {
			for (PerfilUsuarioBean perfilUsuario : usuario.getLstPerfiles()) {
				// Actualizamos PK del objeto
				perfilUsuario.setIdUsuario(usuario.getIdUsuario());

				ServicioPerfilesUsuarios.salvar(perfilUsuario, conn);
			}
		}
	}

	private static void salvarAlmacenesUsuario(UsuarioBean usuario,
			Connection conn, DatosSesionBean datosSesion) throws AlmacenUsuarioException,
			AlmacenUsuarioConstraintViolationException {

		if (usuario.isAlmacenesCargados()) {
			for (AlmacenUsuarioBean almacenUsuario : usuario.getLstAlmacenes()) {
				// Actualizamos PK del objeto
				almacenUsuario.setIdUsuario(usuario.getIdUsuario());

				ServicioAlmacenesUsuarios.salvar(almacenUsuario, conn, datosSesion);
			}
		}
	}
}
