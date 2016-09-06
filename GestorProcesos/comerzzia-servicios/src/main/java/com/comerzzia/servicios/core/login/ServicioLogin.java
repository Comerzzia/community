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

package com.comerzzia.servicios.core.login;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.core.empresas.EmpresaBean;
import com.comerzzia.persistencia.core.empresas.EmpresasDao;
import com.comerzzia.persistencia.core.usuarios.UsuarioBean;
import com.comerzzia.persistencia.core.usuarios.UsuariosDao;
import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenUsuarioBean;
import com.comerzzia.servicios.core.menu.ArbolMenuBean;
import com.comerzzia.servicios.core.menu.MenuException;
import com.comerzzia.servicios.core.menu.ServicioMenu;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.tiendas.usuarios.AlmacenUsuarioException;
import com.comerzzia.servicios.general.tiendas.usuarios.ServicioAlmacenesUsuarios;
import com.comerzzia.util.config.AppInfo;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

/**
 * Servicio de Login para acceso a la aplicación
 * 
 */
public class ServicioLogin {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioLogin.class);

	private static final String APLICACION = "APLICACION";
	private static final String APLICACIONES = "APLICACIONES";
	private static final String CODALMACEN_SELECCIONADO = "CODALMACEN_SELECCIONADO";
	private static final String DESALMACEN_SELECCIONADO = "DESALMACEN_SELECCIONADO";

	/**
	 * Inicia una sesión en la aplicación comprobando que el usuario y la clave
	 * son válidos y obteniendo la empresa con la que se trabaja
	 * 
	 * @param login
	 *            Nombre del usuario que inicia la sesión
	 * @param clave
	 *            Clave de acceso
	 * @return Datos de la sesión iniciada
	 * @throws InvalidLoginException
	 *             Si el usuario o la clave no son válidos
	 * @throws LoginException
	 *             Si se produce un error al iniciar la sesión
	 */
	public static DatosSesionBean iniciarSesion(String login, String clave)
			throws InvalidLoginException, LoginException {

		log.debug("iniciarSesion(): Iniciando sesión del usuario: " + login);

		// Obtenemos los datos de la sesión
		DatosSesionBean datosSesion = obtenerDatosSesion(login, clave);
		UsuarioBean usuario = datosSesion.getUsuario();

		// Y el menu de la aplicación
		try {
			String aplicacion = AppInfo.getAplicacion();
			if (usuario.getAplicacion() != null && !usuario.getAplicacion().isEmpty()) {
				aplicacion = usuario.getAplicacion();
			}
			
			ArbolMenuBean arbolMenu = ServicioMenu.obtenerMenu(aplicacion);
			datosSesion.setArbolMenu(arbolMenu);
			datosSesion.getAtributos().put(APLICACION, aplicacion);

			// Si el usuario puede cambiar de aplicación se cargará una lista
			// con los diferentes menús
			if (usuario.isPuedeCambiarAplicacion()) {
				List<String> aplicaciones = ServicioMenu
						.obtenerListaAplicaciones();
				datosSesion.getAtributos().put(APLICACIONES, aplicaciones);
			}

			// Comprobamos el número de tiendas que tiene asociado el usuario
			numeroAlmacenesUsuario(datosSesion);

		} catch (MenuException e) {
			String mensaje = "No se ha podido obtener el menú de la aplicación : "
					+ e.getMessage();
			throw new LoginException(mensaje, e);
		} catch (AlmacenUsuarioException e) {
			String mensaje = "No se ha podido obtener los almacenes del usuario "
					+ usuario.getIdUsuario() + " : " + e.getMessage();
			throw new LoginException(mensaje, e);
		}

		return datosSesion;
	}

	private static DatosSesionBean obtenerDatosSesion(String login, String clave)
			throws InvalidLoginException, LoginException {
		Connection conn = new Connection();

		try {
			DatosSesionBean datosSesion = new DatosSesionBean();

			// Creamos el objeto de configuración de la sesión
			ConfigEmpresaBean configSesion = new ConfigEmpresaBean();
			configSesion.setEsquemaEmpresa(AppInfo.getDbInfo()
					.getEsquemaEmpresa());

			// Actualizamos los datos de la sesión
			datosSesion.setConfigEmpresa(configSesion);

			// Obtenemos una conexión
			conn.abrirConexion(Database.getConnection());

			// Obtenemos los datos del usuario
			datosSesion.setUsuario(getUsuario(conn, login, clave));

			// Obtenemos los datos de la empresa
			datosSesion.setEmpresa(getEmpresa(conn, configSesion));

			return datosSesion;
		} catch (SQLException e) {
			log.error("obtenerDatosSesion() - " + e.getMessage());
			String mensaje = "Error al obtener los datos de la sesion : "
					+ e.getMessage();

			throw new LoginException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static DatosSesionBean iniciarSesion() throws InvalidLoginException, LoginException {
		Connection conn = new Connection();
		try {
			DatosSesionBean datosSesion = new DatosSesionBean();
		
			// Creamos el objeto de configuración de la sesión
			ConfigEmpresaBean configSesion = new ConfigEmpresaBean();
			configSesion.setEsquemaEmpresa(AppInfo.getDbInfo().getEsquemaEmpresa());
		
			// Actualizamos los datos de la sesión
			datosSesion.setConfigEmpresa(configSesion);
		
			// Obtenemos una conexión
			conn.abrirConexion(Database.getConnection());
		
			// Obtenemos los datos de la empresa
			datosSesion.setEmpresa(getEmpresa(conn, configSesion));
		
			return datosSesion;
		} 
		catch (SQLException e) {
			log.error("obtenerDatosSesion() - " + e.getMessage());
			String mensaje = "Error al obtener los datos de la sesion : " + e.getMessage();
			throw new LoginException(mensaje, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}

	private static UsuarioBean getUsuario(Connection conn, String login,
			String clave) throws SQLException, InvalidLoginException {

		// Obtenemos los datos del usuario
		UsuarioBean usuario = UsuariosDao.consultar(conn, login);

		// Validamos al usuario
		if (usuario != null) {
			// Comprobamos si está activo
			if (!usuario.isActivo()) {
				throw new InvalidLoginException(
						"No tiene permiso para acceder a la aplicación",
						"login.invalido");
			}
			// Comprobamos la clave
			if (!usuario.isClaveValida(clave)) {
				throw new InvalidLoginException("Usuario/clave no válidos",
						"login.sinPermiso");
			}
		} else {
			throw new InvalidLoginException("Usuario/clave no válidos",
					"login.sinPermiso");
		}

		return usuario;
	}

	private static EmpresaBean getEmpresa(Connection conn,
			ConfigEmpresaBean configSesion) throws SQLException,
			InvalidLoginException {

		// Obtenemos los datos de la empresa
		EmpresaBean empresa = EmpresasDao.consultar(conn, configSesion);
		if (empresa == null) {
			String msg = "No existe ninguna empresa definida en el sistema";
			log.error(msg);
			throw new InvalidLoginException(msg);
		}

		return empresa;
	}
	
	public static int numeroAlmacenesUsuario (DatosSesionBean datosSesion) throws AlmacenUsuarioException {
		int numeroTiendas = 0;
		List<AlmacenUsuarioBean> almacenes = ServicioAlmacenesUsuarios
				.consultar(datosSesion.getUsuario().getIdUsuario(), datosSesion);

		if (almacenes != null) {
			numeroTiendas = almacenes.size();
		}

		if (numeroTiendas == 1) {
			datosSesion.getAtributos().put(CODALMACEN_SELECCIONADO,
					almacenes.get(0).getCodAlmacen());
			datosSesion.getAtributos().put(DESALMACEN_SELECCIONADO,
					almacenes.get(0).getDesAlmacen());
		}
		
		return numeroTiendas;
	}
}
