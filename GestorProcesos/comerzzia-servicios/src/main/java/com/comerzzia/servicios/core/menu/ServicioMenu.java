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

package com.comerzzia.servicios.core.menu;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.core.menu.MenuBean;
import com.comerzzia.persistencia.core.menu.MenuDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioMenu {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioMenu.class);
	
	
	public static ArbolMenuBean obtenerMenu(String aplicacion) throws MenuException {
		MenuBean menu = null;
		ArbolMenuBean arbolMenu= new ArbolMenuBean();
		Connection conn = new Connection();
		
		log.debug("obtenerMenu(): Obteniendo el menu de la aplicación " + aplicacion);
		
		try {
			conn.abrirConexion(Database.getConnection());
			menu = MenuDao.consultar(conn, aplicacion);
			
			arbolMenu.setMenu(menu);
			
			return arbolMenu;
		}
		catch (SQLException e) {
			log.error("obtenerMenu() - " + e.getMessage());
			String mensaje = "Error al obtener el menú de la aplicación " + 
			                 aplicacion + " : " +  e.getMessage();
			
            throw new MenuException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static List<String> obtenerListaAplicaciones() throws MenuException {
		Connection conn = new Connection();
		
		log.debug("obtenerListaAplicaciones(): Obteniendo la lista de aplicaciones");
		
		try {
			conn.abrirConexion(Database.getConnection());
			List<String> lista = MenuDao.consultarAplicaciones(conn);
			
			return lista;
		}
		catch (SQLException e) {
			log.error("obtenerListaAplicaciones() - " + e.getMessage());
			String mensaje = "Error al obtener la lista de aplicaciones: " +  e.getMessage();
			
            throw new MenuException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
