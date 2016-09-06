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

package com.comerzzia.util.log;


public class LoggerFactory implements org.apache.log4j.spi.LoggerFactory {

	private static LoggerFactory factory;
    
    
    private LoggerFactory()	{
	}
    
    
	public static LoggerFactory get() {
		if (factory == null) {
			factory = new LoggerFactory();
		}
		
		return factory;
	}


	public org.apache.log4j.Logger makeNewLoggerInstance (String name) {
        return new com.comerzzia.util.log.Logger(name);
	}
}
