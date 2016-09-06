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
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import com.comerzzia.persistencia.core.database.DatabaseDao;
import com.comerzzia.servicios.core.variables.ServicioVariables;
import com.comerzzia.servicios.core.variables.VariableConstraintViolationException;
import com.comerzzia.servicios.core.variables.VariableException;
import com.comerzzia.servicios.core.variables.VariableNotFoundException;
import com.comerzzia.servicios.core.variables.Variables;
import com.comerzzia.util.config.AppInfo;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.version.Version;


public class DatabaseComerzzia {
	
	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(DatabaseComerzzia.class);
			
	/**
	 * Versión de la Base de Datos de Comerzzia instalada
	 */
	private String version = null;
	
	/**
	 * Conexión a la Base de Datos
	 */
	private Connection conn = null;
	
	/**
	 * Ejecución de scripts
	 */
	private SqlScript scripts = null;
	
	
	/**
	 * Directorio relativo en el que se encuentran los scripts de 
	 * creación de la Base de Datos del Gestor de Procesos de Comerzzia
	 */
	private static final String DIRECTORIO = "gestorProcesos";
	
	
	/**
	 * Constructor
	 */
	public DatabaseComerzzia() {
	}
	
	
	/**
	 * Obtiene la versión de la base de datos de Comerzzia instalada
	 * @return
	 */
	public String getVersion() {
		return version;
	}
	
	
	/**
	 * Realiza una validación la Base de Datos del Gestor de Procesos de Comerzzia
	 * 
	 * Realiza una comprobación de la conexión a la base de datos.
	 * Si la conexión es correcta comprueba que el esquema de base de datos
	 * existe comprobando si existe la tabla de definición de variables
	 * de la aplicación y si la variable GENERAL.VERSION tiene valor
	 * 
	 * En caso de no existir el esquema, este se crea a partir de los
	 * script de tablas, vistas y datos base que se encuentran en el 
	 * directorio definido en el fichero de configuración de la aplicación
	 * 
	 * @throws CreacionDatabaseException Si se produce algún error en la ejecución
	 *         de los script de cración del esquema
	 * @throws ValidacionDatabaseException Si se produce algún error al validar el esquema
	 */
	public void validarEsquema() throws CreacionDatabaseException, ValidacionDatabaseException {
		try {
			log.info("Realizando validación del esquema de BBDD de Comerzzia . . .");
			
			conectar();
			log.info("Conexión a BBDD realizada correctamente");
			
			if (!existeEsquema()) {
				crearDatabase();

				if (scripts.hasErrores()) {
					log.error(". . . Se han creado los objetos en el esquema de BBDD de Comerzzia versión " + version + " con errores. Revise el log de la aplicación");
					throw new CreacionDatabaseException("Se han producido errores en la creación del esquema de Comerzzia. Revise el log de la aplicación");
				}

				log.info(". . . Se han creado correctamente todos los objetos en el esquema de BBDD de Comerzzia versión " + Version.version);
			}
			//Comprobamos versiones y actualizamos si es necesario
			else if(!comprobarVersiones()){
				//Actualizando versión
				actualizarDatabase();

				if (scripts.hasErrores()) {
					log.error(". . . Se han actualizado los objetos en el esquema de BBDD de Comerzzia versión " + Version.version + " con errores. Revise el log de la aplicación");
					throw new CreacionDatabaseException("Se han producido errores en la actualización del esquema de Comerzzia. Revise el log de la aplicación");
				}

				log.info(". . . Se han actualizado correctamente todos los objetos en el esquema de BBDD de Comerzzia versión " + Version.version);
			}
			else{
				log.info(". . . Finalizada validación de esquema de BBDD Comerzzia versión " + version);
			}
		}
		catch (Exception e) {
			String mensaje = "No se ha podido realizar la validación de la BBDD de Comerzzia: " + e.getMessage();
			log.fatal(mensaje, e);
			throw new ValidacionDatabaseException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	/**
	 * Comprueba si la conexión a la base de datos es correcta
	 * 
	 * @throws SQLException Si se produce cualquier error al realizar la conexión
	 */
	public static void comprobarConexion() throws SQLException {
		Connection conn = new Connection();
		
		try {
			log.debug("comprobarConexion() - Comprobando conexión a BBDD");
			conn.abrirConexion(Database.getConnection());
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	/**
	 * Realiza la conexión a la Base de Datos de Comerzzia
	 * 
	 * @throws SQLException
	 */
	private void conectar() throws SQLException {
		this.conn = new Connection();
		conn.abrirConexion(Database.getConnection());
	}
	
	
	/**
	 * Comprueba si esiste el esquema de la aplicación en la base de datos
	 * 
	 * Se comprueba si existe la tabla de definición de variables de la aplicación
	 * en cuyo caso se obtiene el valor de la variable VERSION. Si la tabla no
	 * existe o no existe la variable o esta no tiene valor se considera que
	 * no existe esquema de la aplicación
	 * 
	 * @return true si existe esquema de la aplicación, false en caso contrario
	 * @throws VariableException
	 * @throws SQLException
	 */
	private boolean existeEsquema() throws VariableException, SQLException {
		
		// Comprobamos si existe la tabla CONFIG_VARIABLES_DEF_TBL
		if (! DatabaseDao.existeObjeto(conn, "CONFIG_VARIABLES_DEF_TBL")) {
			return false;
		}
		
		// Obtenemos la versión instalada
		obtenerVersion();
		
		return (version != null && !version.isEmpty());
	}
	
	
	/**
	 * Obtiene la versión de la Base de Datos instalada a partir de la variable GENERAL.VERSION
	 */
	private void obtenerVersion() throws VariableException {
		try {
			version = ServicioVariables.consultarValor(Variables.GENERAL_VERSION);
		} 
		catch (VariableNotFoundException e) {
			log.info("obtenerVersion() - No existe la variable " + Variables.GENERAL_VERSION);
		}
	}
	
	/**
	 * Comprueba si la versión de la variable de comerzzia de BBDD es distinta de la del 
	 * fichero .properties que contiene la versión de comerzzia desplegada. Si las versiones
	 * son diferentes retorna false, si son iguales retorna true.
	 * @throws VariableException 
	 */
	private boolean comprobarVersiones() throws VariableException{
		//Obtenemos la versión de la variable
		obtenerVersion();
		
		if(!version.equals(Version.version)){
			log.info("comprobarVersiones() - La versión de Comerzzia instalada es distinta. Actualizando a la versión " + Version.version);
			return false;
		}
		else{
			log.info("comprobarVersiones() - La versión de Comerzzia instalada es  " + version);
			return true;
		}
	}
	
	/**
	 * Crea los objetos de base de datos de la aplicación y realiza la inserción de los datos base
	 * 
	 * Los script de creación se obtiene del directorio definido en el fichero de configuración
	 * y que han de llamarse:
	 * 
	 *   - tablas.sql : script de creación de tablas y de constreaints
	 *   - vistas.sql : script de creación de vistas
	 *   - datos.sql  : script de datos base
	 * 
	 * @throws SQLException
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @throws VariableException 
	 */
	private void crearDatabase() throws SQLException, FileNotFoundException, IOException, VariableException {
		
		log.debug("crearDatabase() - Creando BBDD de la aplicación");
		
		scripts = new SqlScript(conn);
		
		log.debug("crearDatabase() - Creando tablas . . .");
		scripts.ejecutar(getScriptComerzzia("tablas.sql"));
			
		log.debug("crearDatabase() - Creando vistas . . .");
		scripts.ejecutar(getScriptComerzzia("vistas.sql"));
		
		log.debug("crearDatabase() - Insertando datos base . . .");
		scripts.ejecutar(getScriptComerzzia("datos.sql"));
		
		// Inicializamos las variables del sistema
		inicializarVariables();
		
		// Obtenemos la versión instalada
		obtenerVersion();
	}
	
	/**
	 * Actualiza los objetos de base de datos de la aplicación.
	 * 
	 * Los script de actualización se obtiene del directorio definido en el fichero de configuración
	 * y que han de llamarse:
	 * 
	 *   - update_version.sql : script de actualización de los elementos de la BBDD
	 *   
	 * @throws SQLException
	 * @throws FileNotFoundException
	 * @throws IOException
	 * @throws VariableException 
	 */
	private void actualizarDatabase() throws SQLException, IOException {
		try{
			log.debug("actualizarDatabase() - Actualizando BBDD de la aplicación a la versión " + Version.version);
			
			scripts = new SqlScript(conn);
			
			log.debug("actualizarDatabase() - Actualizando objetos. . .");
			scripts.ejecutar(getScriptComerzzia("update_" + Version.version + ".sql"));
		}
		catch (FileNotFoundException e) {
			log.warn("actualizarDatabase() - El script de actualización 'update_" + Version.version + ".sql' no existe en el directorio '" + AppInfo.getDbInfo().getRutaBaseScripts() + "'");
			log.info("actualizarDatabase() - . . . Actualizando manualmente a la versión " + Version.version);

			//Actualizando versión de la variable GENERAL_VERSION
			actualizarVariableGeneralVersion();
		}
	}
	
	/**
	 * Actualiza el valor de la variable GENERAL_VERSION
	 */
	private void actualizarVariableGeneralVersion(){
		try{
			ServicioVariables.grabarVariableNivelGeneral(Variables.GENERAL_VERSION, Version.version);
			
			log.info("actualizarVariableGeneralVersion() - Se ha actualizado la versión de Comerzzia a la " + Version.version);
		} 
		catch (VariableConstraintViolationException e) {
			log.info("actualizarVariableGeneralVersion() - Error durante la actualización de la variable " + Variables.GENERAL_VERSION +  ": " + e.getMessage()) ;
		}
		catch (VariableException e) {
			log.info("actualizarVariableGeneralVersion() - Error durante la actualización de la variable " + Variables.GENERAL_VERSION +  ": " + e.getMessage()) ;
		} 
	}

	/**
	 * Inicializa las variables del sistema
	 */
	private void inicializarVariables() {
		try {
			VariablesComerzzia variables = new VariablesComerzzia();
			variables.inicialiar();
		}
		catch (Exception ignore) {
		}
	}
	
	
	/**
	 * Obtiene un reader sobre un fichero de script sql de Comerzzia
	 * @param nombre
	 * @return
	 * @throws FileNotFoundException
	 * @throws UnsupportedEncodingException 
	 */
	private BufferedReader getScriptComerzzia(String nombre) 
			throws FileNotFoundException, UnsupportedEncodingException {
		
		String script = AppInfo.getDbInfo().getRutaBaseScripts();
		if (!script.endsWith("/")) {
			script += "/";
		}
		
		script += DIRECTORIO + "/" + nombre;
		
		return new BufferedReader(new InputStreamReader(new FileInputStream(script), "UTF8"));
	}
}
