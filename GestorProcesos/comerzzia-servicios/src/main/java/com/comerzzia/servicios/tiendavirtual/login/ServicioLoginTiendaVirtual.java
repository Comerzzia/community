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

package com.comerzzia.servicios.tiendavirtual.login;

import java.sql.SQLException;
import java.util.Date;

import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.tiendavirtual.clientes.ClientesTiendaVirtualDao;
import com.comerzzia.persistencia.tiendavirtual.clientes.UsuarioClienteTiendaVirtualBean;
import com.comerzzia.persistencia.tiendavirtual.config.ConfigTiendaVirtualBean;
import com.comerzzia.servicios.core.impuestos.grupos.GrupoImpuestosException;
import com.comerzzia.servicios.core.impuestos.grupos.GrupoImpuestosNotFoundException;
import com.comerzzia.servicios.core.impuestos.grupos.ServicioGruposImpuestos;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;
import com.comerzzia.util.config.AppInfo;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

/**
 * Servicio de Login para acceso a la aplicación
 * 
 */
public class ServicioLoginTiendaVirtual {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioLoginTiendaVirtual.class);


	public static ClienteBean login(UsuarioClienteTiendaVirtualBean usuarioCliente, DatosSesionTiendaVirtualBean datosSesion)
			throws InvalidLoginTiendaVirtualException, LoginTiendaVirtualException {
		Connection conn = new Connection();
		try {
			log.debug("login() - Realizando login en tienda virtual con usuario: " + usuarioCliente.getUsuario());
			conn.abrirConexion(Database.getConnection());
			
			// Obtenemos los datos del usuario
			String clave = usuarioCliente.getClave();
			ClienteBean cliente =
				ClientesTiendaVirtualDao.consultarParaLogin(conn, datosSesion.getConfigTiendaVirtual(), usuarioCliente);

			// Validamos al usuario
			if (cliente == null || !cliente.isActivo()) {
				throw new InvalidLoginTiendaVirtualException("Usuario/clave no válidos", "login.sinPermiso");
			}
			// Comprobamos la clave
			if (!usuarioCliente.isClaveValida(clave)) {
				throw new InvalidLoginTiendaVirtualException("Usuario/clave no válidos", "login.sinPermiso");
			}
			return cliente;
		} 
		catch (SQLException e) {
			log.error("login() - " + e.getMessage());
			String mensaje = "Error al consultar un usuario para hacer login : " + e.getMessage();
			throw new LoginTiendaVirtualException(mensaje, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}

	public static DatosSesionTiendaVirtualBean iniciarSesion() throws LoginTiendaVirtualException {
		try{
			DatosSesionTiendaVirtualBean datosSesion = new DatosSesionTiendaVirtualBean();
	
			// Creamos el objeto de configuración de la sesión
			ConfigTiendaVirtualBean configSesion = new ConfigTiendaVirtualBean();
			configSesion.setEsquemaTiendaVirtual(AppInfo.getDbInfo().getEsquemaEmpresa());
	
			// Actualizamos los datos de la sesión
			datosSesion.setConfigTiendaVirtual(configSesion);
			
			// consultamos grupo de impuestos
			datosSesion.setIdGrupoImpuestos(ServicioGruposImpuestos.consultar(new Date()).getIdGrupoImpuestos());
			return datosSesion;
		}
		catch(GrupoImpuestosException e){
			log.error("iniciarSesion() - Error al iniciar sesión en tienda virtual: " + e.getMessage());
			String mensaje = "Error al iniciar sesión en tienda virtual: " + e.getMessage();
			throw new LoginTiendaVirtualException(mensaje, e);
		} 
		catch (GrupoImpuestosNotFoundException e) {
			log.error("iniciarSesion() - Error al iniciar sesión en tienda virtual: " + e.getMessage());
			String mensaje = "Error al iniciar sesión en tienda virtual: " + e.getMessage();
			throw new LoginTiendaVirtualException(mensaje, e);
		}

	}
	
}
