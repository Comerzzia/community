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

package com.comerzzia.persistencia.core.database;

import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;


public class DatabaseDao extends MantenimientoDao {

	
	/**
	 * Comprueba si existe un objeto en la base de datos
	 * 
	 * @param conn
	 * @param nombreObjeto Nombre del objeto
	 * @return true si el objeto existe, false en caso contrario
	 * @throws SQLException
	 */
	public static boolean existeObjeto(Connection conn, String nombreObjeto) throws SQLException {
		DatabaseMetaData dbm = null;
		ResultSet rs = null;
		
		try {
			dbm = conn.getMetaData();
			rs = dbm.getTables(null, null, nombreObjeto, null);
			
			if (rs.next()) {
				return true;
			}
			
			return false;
		} 
		finally {
			try {
                rs.close();
            }
            catch (Exception ignore) {
            }
		}
	}
}
