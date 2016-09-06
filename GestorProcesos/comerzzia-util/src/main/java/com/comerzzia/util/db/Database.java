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

package com.comerzzia.util.db;

import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.comerzzia.util.config.AppInfo;


/**
 * Acceso a base de datos
 */
public class Database {

	/**
	 * Devuelve una conexión con la base de datos definida por el datasourceName
	 * pasado
	 * 
	 * @throws java.sql.SQLException
	 * @return
	 * @param datasourceName
	 */
	public static java.sql.Connection getConnection(String datasourceName) throws SQLException {
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup(datasourceName);
			return ds.getConnection();
		}
		catch (NamingException e) {
			throw new SQLException("Error al conectar con la base de datos: " + e.getMessage());
		}
	}
	
	
	/**
     * Devuelve una conexión con la base de datos de MIC2000
     * @throws java.sql.SQLException
     * @return 
     */
    public static java.sql.Connection getConnection() throws SQLException {
    	return getConnection(AppInfo.getDbInfo().getDatasource());
    }
}
