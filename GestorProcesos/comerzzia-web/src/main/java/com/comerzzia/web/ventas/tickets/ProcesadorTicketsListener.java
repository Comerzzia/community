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

package com.comerzzia.web.ventas.tickets;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.comerzzia.servicios.core.variables.ServicioVariables;
import com.comerzzia.servicios.core.variables.VariableException;
import com.comerzzia.servicios.core.variables.VariableNotFoundException;
import com.comerzzia.servicios.core.variables.Variables;
import com.comerzzia.servicios.ventas.tickets.ProcesadorTickets;
import com.comerzzia.servicios.ventas.tickets.TicketException;
import com.comerzzia.util.log.Logger;

/**
 * Application Lifecycle Listener implementation class ProcesadorTicketsListener
 *
 */
public class ProcesadorTicketsListener implements ServletContextListener {
	
	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ProcesadorTicketsListener.class);

    /**
     * Constructor. 
     */
    public ProcesadorTicketsListener() {
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0) {
        try {
        	String automatico = ServicioVariables.consultarValor(Variables.TICKETS_PROCESAMIENTO_AUTOMATICO);
        	
        	if (automatico.equals("S")) {
        		ProcesadorTickets.getInstance().arrancar();
        	}
		}
        catch (VariableException e) {
        	log.error("(contextInitialized) - " + e.getMessage());
		} 
        catch (VariableNotFoundException e) {
        	log.error("(contextInitialized) - No se ha encontrado la definición de la variable " + Variables.TICKETS_PROCESAMIENTO_AUTOMATICO);
		}
        catch (TicketException e) {
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
			ProcesadorTickets.getInstance().finalizar();
		} 
        catch (TicketException e) {
        	log.error("(contextDestroyed) - " + e.getMessage());
		}
    }
}
