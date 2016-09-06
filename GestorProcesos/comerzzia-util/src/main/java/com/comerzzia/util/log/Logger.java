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

import org.apache.log4j.Hierarchy;
import org.apache.log4j.LogManager;
import org.apache.log4j.spi.DefaultRepositorySelector;
import org.apache.log4j.spi.RepositorySelector;


/**
 * Generador de log de la aplicación
 */
public class Logger extends org.apache.log4j.Logger {
	
	protected Logger(String name) {
        super(name);
    }
    
    static public Logger getMLogger(String name) {
	  //return (Logger) LogManager.getLogger(name, LoggerFactory.get());
      
        Hierarchy h = new Hierarchy(LogManager.getRootLogger());
        RepositorySelector repositorySelector = new DefaultRepositorySelector(h);
      
        return (Logger)repositorySelector.getLoggerRepository().getLogger(name, LoggerFactory.get());
	}
    
    static public Logger getMLogger(Class<?> clazz) {
	    return getMLogger(clazz.getName());
	}
}
