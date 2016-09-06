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

package com.comerzzia.servicios.general.tiendas.usuarios;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenUsuarioBean;
import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenesUsuariosDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioAlmacenesUsuarios {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioAlmacenesUsuarios.class);

	public static List<AlmacenUsuarioBean> consultar(Long idUsuario, DatosSesionBean datosSesion)
			throws AlmacenUsuarioException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando almacenes para el usuario con identificador " + idUsuario);
			conn.abrirConexion(Database.getConnection());
			return AlmacenesUsuariosDao.consultar(conn, datosSesion.getConfigEmpresa(), idUsuario);

		} catch (SQLException e) {
			String msg = "Error consultando almacenes de usuario: "
					+ e.getMessage();
			log.error("consultar() - " + msg);

			throw new AlmacenUsuarioException(msg, e);
		} finally {
			conn.cerrarConexion();
		}
	}
	
	public static List<AlmacenUsuarioBean> consultar(String codAlmacen, DatosSesionBean datosSesion) throws AlmacenUsuarioException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando usuarios para el almacen " + codAlmacen);
			conn.abrirConexion(Database.getConnection());
			return AlmacenesUsuariosDao.consultar(conn, datosSesion.getConfigEmpresa(), codAlmacen);
		
		} catch (SQLException e) {
			String msg = "Error consultando usuarios de almacen: " + e.getMessage();
			log.error("consultar() - " + msg);
		
			throw new AlmacenUsuarioException(msg, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static void salvar(AlmacenUsuarioBean almacenUsuario, Connection conn, DatosSesionBean datosSesion)
			throws AlmacenUsuarioException,	AlmacenUsuarioConstraintViolationException {
		switch (almacenUsuario.getEstadoBean()) {
			case Estado.NUEVO:
				crear(almacenUsuario, conn, datosSesion);
				break;
	
			case Estado.BORRADO:
				eliminar(almacenUsuario, conn, datosSesion);
				break;
		}
	}

	public static void crear(AlmacenUsuarioBean almacenUsuario, Connection conn, DatosSesionBean datosSesion)
			throws AlmacenUsuarioException,
			AlmacenUsuarioConstraintViolationException {
		try {
			log.debug("crear() - Añadiendo nuevo almacén "
					+ almacenUsuario.getCodAlmacen()
					+ " al usuario con identificador "
					+ almacenUsuario.getIdUsuario());

			AlmacenesUsuariosDao.insert(conn, datosSesion.getConfigEmpresa(), almacenUsuario);
		} catch (KeyConstraintViolationException e) {
			log
					.info("crear() - No se ha podido crear el almacén para un usuario: "
							+ e.getMessage());
			throw new AlmacenUsuarioConstraintViolationException(
					"Error creando almacén para un usuario: "
							+ "El almacén "
							+ almacenUsuario.getCodAlmacen()
							+ " ya está registrado en el sistema para el usuario con identificador "
							+ almacenUsuario.getIdUsuario());
		} catch (SQLException e) {
			String msg = "Error creando nuevo almacén para un usuario: "
					+ e.getMessage();
			log.error("crear() - " + msg);

			throw new AlmacenUsuarioException(msg, e);
		}
	}

	public static void eliminar(AlmacenUsuarioBean almacenUsuario,
			Connection conn, DatosSesionBean datosSesion) throws AlmacenUsuarioException,
			AlmacenUsuarioConstraintViolationException {
		try {
			log.debug("eliminar() - Eliminando almacén "
					+ almacenUsuario.getCodAlmacen()
					+ " para el usuario con identificador "
					+ almacenUsuario.getIdUsuario());

			AlmacenesUsuariosDao.delete(conn, datosSesion.getConfigEmpresa(), almacenUsuario);
		} catch (ForeingKeyConstraintViolationException e) {
			log.info("eliminar() - No se ha podido eliminar el almacén: "
					+ e.getMessage());
			throw new AlmacenUsuarioConstraintViolationException(
					"Error eliminando el almacén: " + e.getDefaultMessage());
		} catch (SQLException e) {
			String msg = "Error eliminando el almacén: " + e.getMessage();
			log.error("eliminar() - " + msg);

			throw new AlmacenUsuarioException(msg, e);
		}
	}
}
