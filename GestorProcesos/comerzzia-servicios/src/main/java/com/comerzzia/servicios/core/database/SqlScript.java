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

package com.comerzzia.servicios.core.database;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.util.log.Logger;


public class SqlScript {
	
	/**
	 * Logger
	 */
	private static Logger log = Logger.getMLogger(SqlScript.class);
	
	
	/**
	 * Caracter de final de linea de consulta
	 */
	private final static String FINAL_QUERY = ";";
	
	
	/**
	 * Caracter de inicio de línea de comentario
	 */
	private final static String COMENTARIO = "-";
	
	
	/**
	 * Conexión de base de datos sobre la que ejecutar los scripts
	 */
	Connection conn = null;
	
	
	/**
	 * Lista de errores producidos en la ejecución de los scripts
	 */
	List<Exception> errores = new ArrayList<Exception>();
	
	
	/**
	 * Constructor
	 */
	public SqlScript() {
	}
	
	
	/**
	 * Constructor
	 * 
	 * @param conn Conexión sobre la que se ejecutarán los scripts
	 */
	public SqlScript(Connection conn) {
		setConnection(conn);
	}
	
	
	/**
	 * Establace la conexión sobre la que se ejecutarán los scripts
	 * 
	 * @param conn
	 */
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	
	/**
	 * Obtiene la conexión
	 * 
	 * @return
	 */
	public Connection getConnection() {
		return conn;
	}
	
	
	/**
	 * Devuelve el número de errores que se han producido en la ejecución de los scripts
	 * 
	 * @return
	 */
	public int getNumeroErrores() {
		return errores.size();
	}
	
	
	/**
	 * Limpia la lista de errores
	 */
	public void clearErrores() {
		errores.clear();
	}
	
	
	public boolean hasErrores() {
		return getNumeroErrores() > 0;
	}
	
	
	/**
	 * Obtiene la lista de errores
	 * 
	 * @return
	 */
	public List<Exception> getListaErrores() {
		return errores;
	}
	
	
	/**
	 * Ejecuta el script de sentencias sql contenido en el fichero indicado por su nombre
	 * 
	 * @param scriptFilename
	 * @throws SQLException
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public void ejecutar(String scriptFilename) throws SQLException, FileNotFoundException, IOException {
		ejecutar(new FileInputStream(scriptFilename));
	}
	
	
	/**
	 * Ejecuta el script
	 * 
	 * @param script
	 * @throws SQLException
	 * @throws IOException
	 */
	public void ejecutar(FileInputStream script) throws SQLException, IOException {
		ejecutar(new InputStreamReader(script));
	}
	
	
	/**
	 * Ejecuta el script
	 * 
	 * @param script
	 * @throws SQLException
	 * @throws IOException
	 */
	public void ejecutar(InputStreamReader script) throws SQLException, IOException {
		ejecutar(new BufferedReader(script));
	}
	
	
	/**
	 * Ejecuta el script
	 * 
	 * @param script
	 * @throws SQLException
	 * @throws IOException
	 */
	public void ejecutar(BufferedReader script) throws SQLException, IOException {
		Statement stmt = null;
		
		if (conn == null) {
			throw new SQLException("No se ha establecido la conexión con la base de datos");
		}
		
		try {
			String linea;
			StringBuffer query = new StringBuffer();
			
			stmt = conn.createStatement();
			
			while ((linea = script.readLine()) != null) {

				if(isComentario(linea) || linea.isEmpty()) {
			        continue;
				}

				query.append(" ").append(linea);
				
				if (isFinalSentencia(linea)) {
					try {
						String sql = query.substring(0, query.length()-1);
						log.debug(sql);
						
						stmt.execute(sql);
					} 
					catch (Exception e) {
						log.error("Error al ejecutar sentencia: " + e.getMessage());
						errores.add(e);
					}
					
					query.setLength(0);
				}
			}
			
		} 
		finally {
			try {
    			stmt.close();
    		}
    		catch(Exception ignore) {;}
		}
	}
	
	
	/**
	 * Comprueba si la linea es final de sentencia
	 * 
	 * Las sentencias terminan con el caracter definido por la constante FINAL_QUERY
	 * 
	 * @param linea
	 * @return
	 */
	private boolean isFinalSentencia(String linea) {
		
		return ((linea != null) && (linea.endsWith(FINAL_QUERY)));
	}
	
	
	/**
	 * Comprueba si la linea es un comentario
	 * 
	 * Una linea es un comentario si comienza por el caracter definido en la constante COMENTARIO
	 * 
	 * @param linea
	 * @return true si la linea es comentario, false en caso contrario
	 */
	private boolean isComentario(String linea) {

		return ((linea != null) && (linea.startsWith(COMENTARIO)));
	}
}
