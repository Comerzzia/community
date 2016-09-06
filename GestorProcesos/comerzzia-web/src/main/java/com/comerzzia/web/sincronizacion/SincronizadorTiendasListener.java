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

package com.comerzzia.web.sincronizacion;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.comerzzia.servicios.core.variables.ServicioVariables;
import com.comerzzia.servicios.core.variables.VariableException;
import com.comerzzia.servicios.core.variables.VariableNotFoundException;
import com.comerzzia.servicios.core.variables.Variables;
import com.comerzzia.servicios.sincronizacion.SincronizadorTiendas;
import com.comerzzia.servicios.sincronizacion.SincronizadorTiendasException;
import com.comerzzia.util.log.Logger;


/**
 * Application Lifecycle Listener implementation class SincronizadorTiendasListener
 *
 */
public class SincronizadorTiendasListener implements ServletContextListener {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(SincronizadorTiendasListener.class);
			
    /**
     * Constructor. 
     */
    public SincronizadorTiendasListener() {
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0) {
    	try {
        	String automatico = ServicioVariables.consultarValor(Variables.SINCRONIZADOR_ARRANQUE_AUTOMATICO);
        	
        	if (automatico.equals("S")) {
        		SincronizadorTiendas.getInstance().arrancar();
        	}
		}
        catch (VariableException e) {
        	log.error("(contextInitialized) - " + e.getMessage());
		} 
        catch (VariableNotFoundException e) {
        	log.error("(contextInitialized) - No se ha encontrado la definición de la variable " + Variables.SINCRONIZADOR_ARRANQUE_AUTOMATICO);
		}
        catch (SincronizadorTiendasException e) {
        	log.error("(contextInitialized) - " + e.getMessage());
		}
        catch (Exception e) {
        	log.error("(contextInitialized) - " + e.getMessage(), e);
        }
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0) {
    	try {
    		SincronizadorTiendas.getInstance().finalizar();
		} 
        catch (SincronizadorTiendasException e) {
        	log.error("(contextDestroyed) - " + e.getMessage());
		}
    }
}
