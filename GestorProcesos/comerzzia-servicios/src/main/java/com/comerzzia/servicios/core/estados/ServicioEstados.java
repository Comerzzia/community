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

package com.comerzzia.servicios.core.estados;

import java.sql.SQLException;

import com.comerzzia.persistencia.core.estados.Estados;
import com.comerzzia.persistencia.core.estados.EstadosDao;
import com.comerzzia.persistencia.core.estados.EstadosSubestados;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioEstados {

	private static Logger log = Logger.getMLogger(ServicioEstados.class);
	
	
	public static Estados consultar(String proceso) throws EstadoException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando estados del proceso " + proceso);
			
			conn.abrirConexion(Database.getConnection());
			
			return new Estados(EstadosDao.consultar(conn, proceso));
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando estados : " +  e.getMessage();
			
            throw new EstadoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static EstadosSubestados consultarSubestados(String proceso) throws EstadoException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando estados y subestados del proceso " + proceso);
			
			conn.abrirConexion(Database.getConnection());
			
			return new EstadosSubestados(EstadosDao.consultarSubestados(conn, proceso));
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando estados : " +  e.getMessage();
			
            throw new EstadoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
