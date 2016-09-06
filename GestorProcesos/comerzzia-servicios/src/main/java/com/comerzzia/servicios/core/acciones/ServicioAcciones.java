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

package com.comerzzia.servicios.core.acciones;

import java.sql.SQLException;

import com.comerzzia.persistencia.core.acciones.AccionBean;
import com.comerzzia.persistencia.core.acciones.AccionesDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioAcciones {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioAcciones.class);
	
	
	public static AccionBean obtenerAccion(String accion) throws AccionException {
		Connection conn = new Connection();
		
		log.debug("obtenerAccion(): Obteniendo la accion " + accion);
		
		try {
			conn.abrirConexion(Database.getConnection());
			return AccionesDao.consultar(conn, accion);
		}
		catch (SQLException e) {
			log.error("obtenerAccion() - " + e.getMessage());
			String mensaje = "Error al obtener la acción " + 
							  accion + " : " +  e.getMessage();
			
            throw new AccionException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static AccionBean obtenerAccion(Long idAccion) throws AccionException, AccionNotFoundException {
		Connection conn = new Connection();
		
		log.debug("obtenerAccion(): Obteniendo la accion " + idAccion);
		
		try {
			conn.abrirConexion(Database.getConnection());
			AccionBean accion = AccionesDao.consultar(conn, idAccion);
			if (accion==null){
				throw new AccionNotFoundException("No se ha encontrado la acción consultada con identificador: " + idAccion);
			}
			return accion;
		}
		catch (SQLException e) {
			log.error("obtenerAccion() - " + e.getMessage());
			String mensaje = "Error al obtener la acción " + 
					idAccion + " : " +  e.getMessage();
			
            throw new AccionException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

}
