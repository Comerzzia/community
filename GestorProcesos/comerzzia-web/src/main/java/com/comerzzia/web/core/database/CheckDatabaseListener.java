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

package com.comerzzia.web.core.database;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.comerzzia.servicios.core.database.DatabaseComerzzia;


/**
 * Application Lifecycle Listener implementation class CheckDatabaseListener
 *
 */
public class CheckDatabaseListener implements ServletContextListener {

    /**
     * Constructor. 
     */
    public CheckDatabaseListener() {
    }

    
	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0) {
    	try {
    		// Realizamos la comprobación de la bbdd de la aplicación
        	DatabaseComerzzia db = new DatabaseComerzzia();
			db.validarEsquema();
		}
    	catch (Exception ignore) {
		}
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0) {
    }
}
