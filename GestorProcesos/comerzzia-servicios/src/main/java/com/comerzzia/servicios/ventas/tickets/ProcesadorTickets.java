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

package com.comerzzia.servicios.ventas.tickets;

import java.util.Date;

import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.Trigger;
import org.quartz.TriggerUtils;
import org.quartz.impl.StdSchedulerFactory;

import com.comerzzia.servicios.core.variables.ServicioVariables;
import com.comerzzia.servicios.core.variables.VariableNotFoundException;
import com.comerzzia.servicios.core.variables.Variables;
import com.comerzzia.servicios.ventas.tickets.TicketException;
import com.comerzzia.util.log.Logger;


public class ProcesadorTickets {
	
	/**
	 * Fichero de propiedades del scheduler del Procesador de Tickets
	 */
	private final static String PROPIEDADES = 
		"com/comerzzia/servicios/ventas/tickets/procesadorTickets.properties";
	
	
	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ProcesadorTickets.class);

	/**
	 * Procesador de Tickets
	 */
	private static ProcesadorTickets procesadorTickets = null;
	
	/**
	 * Scheduler
	 */
	private static Scheduler scheduler = null;
	
	
	private ProcesadorTickets() {
	}
	
	
	/**
	 * Obtiene la instancia del Procesador de Tickets
	 * @return
	 */
	public static ProcesadorTickets getInstance() {
		if (procesadorTickets == null) {
			procesadorTickets = new ProcesadorTickets();
		}
		
		return procesadorTickets;
	}
	
	/**
	 * Arranca el Servicio de Procesamiento de Tickets
	 * @throws TicketException
	 */
	public void arrancar() throws TicketException {
		try {
			log.info("Arrancando Servicio de Procesamiento de Tickets");
			
			if (scheduler == null) {
				SchedulerFactory sf = new StdSchedulerFactory(PROPIEDADES);  
				scheduler = sf.getScheduler();
				
				// Planificamos la tarea de Procesamiento de Tickets
				planificarTarea();
			}
						
			// Arrancamos el planificador
			scheduler.start();
		} 
		catch (SchedulerException e) {
			log.error("arrancar() - " + e.getMessage());
			throw new TicketException(e.getMessage(), e);
		}
	}
	
	/**
	 * Detiene el Servicio de Procesamiento de Tickets
	 * @throws TicketException
	 */
	public void parar() throws TicketException {
		try {
			log.info("Parando Servicio de Procesamiento de Tickets");
			
			if (scheduler != null) {
				scheduler.standby();
			}
		} 
		catch (SchedulerException e) {
			log.error("parar() - " + e.getMessage());
			throw new TicketException(e.getMessage(), e);
		}
	}
	
	/**
	 * Finaliza la ejecución del Servicio de Tratamiento de Tickets
	 * liberando todos los recursos.
	 * Una vez finalizado no se puede volver a arrancar el Servicio
	 * @throws TicketException
	 */
	public void finalizar() throws TicketException {
		try {
			log.info("Finalizando Servicio de Procesamiento de Tickets");
			
			if (scheduler != null) {
				scheduler.shutdown();
			}
		} 
		catch (SchedulerException e) {
			log.error("finalizar() - " + e.getMessage());
			throw new TicketException(e.getMessage(), e);
		}
	}
	
	/**
	 * Realiza la planificación de la tarea de sincronización de tickets
	 * con la periodicidad en segundos que indique la variable 
	 * TICKETS.PROCESAMIENTO_AUTOMATICO_TIEMPO
	 * @throws TicketException
	 */
	private void planificarTarea() throws TicketException {
		try {
			log.info("Planificando tarea de procesamiento automático de Tickets");
			
			// Obtenemos periodo de planificación
			int segundos = 120;
			try {
				String tiempo = ServicioVariables.consultarValor(Variables.TICKETS_PROCESAMIENTO_AUTOMATICO_TIEMPO);
				segundos = Integer.parseInt(tiempo);
			} 
			catch (VariableNotFoundException e) {
				log.error("planificarTarea() - No se ha encontrado la definición de la variable " + Variables.TICKETS_PROCESAMIENTO_AUTOMATICO_TIEMPO);
			}
			catch (Exception e) {
				log.error("planificarTarea() - " + e.getMessage());
			}
			
			// Creamos el trabajo
			JobDetail jobDetail = new JobDetail("ProcesarTickets", "Tickets", ProcesarTicketsJob.class);
			
			// Planificamos su ejecución
			Trigger trigger = TriggerUtils.makeSecondlyTrigger(segundos);
			trigger.setStartTime(new Date());
			trigger.setName("ProcesarTickets");
			trigger.setGroup("Tickets");
			
			// Lo registramos en el planificador
			scheduler.scheduleJob(jobDetail, trigger);
		}
		catch (SchedulerException e) {
			log.error("planificarTarea() - " + e.getMessage());
			throw new TicketException(e.getMessage(), e);
		}
	}
	
	
	/**
	 * Indica si el Servicio de Tratamiento de Tickets está parado
	 * @return true si el servicio está parado, false en caso contrario
	 */
	public boolean isParado() {
		if (scheduler == null) {
			return true;
		}
		
		try {
			return (scheduler.isInStandbyMode() || scheduler.isShutdown());
		} 
		catch (SchedulerException e) {
			return true;
		}
	}
	
	
	/**
	 * Indica si el Servicio de Tratamiento de Tickets está arrancado
	 * @return true si el servicio está arrancado, false en caso contrario
	 */
	public boolean isArrancado() {
		return !isParado();
	}
	
	
	/**
	 * Realiza la parada y arranque del Servicio de Tratamiento de Tickets
	 * @throws TicketException
	 */
	public void reiniciar() throws TicketException {
		try {
			parar();
		} 
		catch (TicketException ignore) {
		}
		
		arrancar();
	}
}
