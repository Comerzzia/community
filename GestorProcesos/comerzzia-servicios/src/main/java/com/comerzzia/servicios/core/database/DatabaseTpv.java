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
import com.comerzzia.persistencia.core.variables.VariableBean;
import com.comerzzia.persistencia.sincronizacion.variables.VariablesTiendaDao;
import com.comerzzia.servicios.core.variables.VariableException;
import com.comerzzia.servicios.core.variables.Variables;
import com.comerzzia.util.config.AppInfo;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.log.Logger;


public abstract class DatabaseTpv {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(DatabaseTpv.class);
	
	/**
	 * Versión de la Base de Datos del TPV instalada
	 */
	private String version = null;
	
	/**
	 * Conexión a la Base de Datos del TPV
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
	protected static final String DIRECTORIO = "tpv";
	
	
	/**
	 * Constructor
	 * 
	 * @param conn Conexión con la Base de Datos del TPV
	 */
	public DatabaseTpv(Connection conn) {
		this.conn = conn;
	}
	
	
	/**
	 * Realiza una validación la Base de Datos del Gestor de Procesos de Comerzzia
	 * 
	 * Realiza una comprobación de la conexión a la base de datos.
	 * Realiza una comprobación del esquema de base de datos del TPV sobre la conexión
	 * facilitada, comprobando si existe la tabla de definición de variables
	 * de la aplicación y si la variable GENERAL.VERSION tiene valor
	 * 
	 * En caso de no existir el esquema, este se crea a partir de los
	 * script de tablas, vistas y datos base que se encuentran en el 
	 * directorio definido en el fichero de configuración de la aplicación
	 * y en el subdirectorio definido según el gestor de base de datos utilizado
	 * 
	 * @throws CreacionDatabaseException Si se produce algún error en la ejecución
	 *         de los script de cración del esquema
	 * @throws ValidacionDatabaseException Si se produce algún error al validar el esquema
	 */
	public void validarEsquema() throws CreacionDatabaseException, ValidacionDatabaseException {
		try {
			log.info("Realizando validación del esquema de BBDD del TPV . . .");
			
			if (!existeEsquema()) {
				crearDatabase();
				
				if (scripts.hasErrores()) {
					log.error(". . . Se han creado los objetos en el esquema de BBDD del TPV versión " + version + " con errores. Revise el log de la aplicación");
					throw new CreacionDatabaseException("Se han producido errores en la creación del esquema del TPV. Revise el log de la aplicación");
				}
				else {
					log.info(". . . Se han creado correctamente todos objetos en el esquema de BBDD del TPV versión " + version);
				}
			}
			else {
				log.info(". . . Finalizada validación de esquema de BBDD del TPV versión " + version);
			}
		}
		catch (CreacionDatabaseException e) {
			throw e;
		}
		catch (Exception e) {
			String mensaje = "No se ha podido realizar la validación de la BBDD del TPV: " + e.getMessage();
			log.error(mensaje, e);
			throw new ValidacionDatabaseException(mensaje, e);
		}
	}
	
	
	/**
	 * Comprueba si esiste el esquema del TPV en la base de datos
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
	 * Obtiene la versión de la Base de Datos de TPV instalada a partir de la variable TPV.VERSION
	 */
	private void obtenerVersion() throws SQLException {
		VariableBean variable = VariablesTiendaDao.consultarDefinicion(conn, Variables.TPV_VERSION);
		
		if (variable == null) {
			log.info("obtenerVersion() - No existe la variable " + Variables.TPV_VERSION);
		}
		else {
			version = variable.getValorDefecto();
		}
	}
	
	
	/**
	 * Crea los objetos de base de datos del TPV y realiza la inserción de los datos base
	 * 
	 * Los script de creación se obtiene del directorio definido en el fichero de configuración
	 * y en el subdirectorio definido según el gestor de base de datos utilizado. Estos han de llamarse:
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
		log.debug("crearDatabase() - Creando BBDD del TPV");
		
		scripts = new SqlScript(conn);
		
		log.debug("crearDatabase() - Creando tablas . . .");
		scripts.ejecutar(getScriptTpv("tablas.sql"));
			
		log.debug("crearDatabase() - Creando vistas . . .");
		scripts.ejecutar(getScriptTpv("vistas.sql"));
		
		log.debug("crearDatabase() - Insertando datos base . . .");
		scripts.ejecutar(getScriptTpv("datos.sql"));
			

		// Obtenemos la versión instalada
		obtenerVersion();
	}
	
	
	/**
	 * Obtiene un reader sobre un fichero de script sql del TPV
	 * en función del subdirectorio indicado según el gestor
	 * de base de datos utilizado
	 * @param nombre
	 * @return
	 * @throws FileNotFoundException
	 * @throws UnsupportedEncodingException 
	 */
	private BufferedReader getScriptTpv(String nombre) 
			throws FileNotFoundException, UnsupportedEncodingException {
		
		String script = AppInfo.getDbInfo().getRutaBaseScripts();
		if (!script.endsWith("/")) {
			script += "/";
		}
		
		script += DIRECTORIO + "/" + getSubdirectorio() + "/" + nombre;
		
		return new BufferedReader(new InputStreamReader(new FileInputStream(script), "UTF8"));
	}
	
	
	/**
	 * Obtiene el subdirectorio en el que se encuentran los script en función
	 * del sistema gestor de base de datos
	 * 
	 * @return Directorio que contiene los script de creación del esquema
	 */
	protected abstract String getSubdirectorio();
}
