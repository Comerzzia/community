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

package com.comerzzia.util.version;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Properties;

import com.comerzzia.util.log.Logger;

public class Version {

	/** Nombre del fichero de propiedades de la versión. */
	private static final String FILENAME = "version.properties";

    /** Logger de la clase. */
	private static Logger log = Logger.getMLogger(Version.class);
	
	/** Objeto properties del fichero de propiedades. */
	private static Properties propiedades;
	
	public static String version;

	static{
		load();
	}
	
	/** Carga el fichero properties con la configuración de la aplicación. */
	private static void load(){
		Method method = null;
		try{
			method = (java.lang.Thread.class).getMethod("getContextClassLoader", (Class<?>[])null);
			ClassLoader classLoader = (ClassLoader) method.invoke(Thread.currentThread(), (Object[])null);
			propiedades = new Properties();
			propiedades.load(classLoader.getResourceAsStream(FILENAME));
			
			version = getPropiedad("version");
		} 
		catch (IOException e) {
			log.error("load() - Error leyendo fichero properties de versión de la aplicación:  " + FILENAME);
		}
		catch(Exception e){
			log.error("load() - Error cargando fichero properties de versión de la aplicación.");
			e.printStackTrace();
		}
	}
	
	
	/** 
	 * Obtiene una propiedad a partir de su clave
	 * @param propiedad
	 * @return valor String
	 */
	private static  String getPropiedad (String propiedad){
		return propiedades.getProperty(propiedad);
	}
	
	/**
	 * Devuelve el valor de la versión almacenada en el fichero properties.
	 * @return version String
	 */
	public String getVersion(){
		return version;
	}

}
