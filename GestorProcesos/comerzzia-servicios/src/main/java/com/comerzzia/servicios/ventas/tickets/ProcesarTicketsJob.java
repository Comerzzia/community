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

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.tickets.ServicioTickets;
import com.comerzzia.servicios.ventas.tickets.TicketException;
import com.comerzzia.util.config.AppInfo;


public class ProcesarTicketsJob implements Job {

	
	public ProcesarTicketsJob()  {
	}
	
	
	public void execute(JobExecutionContext context) throws JobExecutionException {
		// TODO: ver desde donde iniciamos esta sesión
		//       En un entorno multiempresa, cada una deberá tener un usuario
		//       para sincronización, y se ejecutarán tantas planificaciones como
		//       empresas existan
		DatosSesionBean datosSesion = new DatosSesionBean();
		ConfigEmpresaBean configSesion = new ConfigEmpresaBean();
		configSesion.setEsquemaEmpresa(AppInfo.getDbInfo().getEsquemaEmpresa());
		datosSesion.setConfigEmpresa(configSesion);
		
		try {
			ServicioTickets.procesarTicketsPendientes(datosSesion);
		} 
		catch (TicketException e) {
			throw new JobExecutionException("Error al ejecutar la tarea de procesamiento de tickets: " + e.getMessage(), e);
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new JobExecutionException("Error al ejecutar la tarea de procesamiento de tickets: " + e.getMessage(), e);
		}
	}
}
