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

package com.comerzzia.servicios.sincronizacion.trabajos;

import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.comerzzia.servicios.sincronizacion.ServicioSincronizador;
import com.comerzzia.servicios.sincronizacion.SincronizadorTiendas;


public class EnviarConfiguracionJob implements Job {

	/**
	 * Constructor
	 */
	public EnviarConfiguracionJob() {
	}
	
	
	/* (non-Javadoc)
	 * @see org.quartz.Job#execute(org.quartz.JobExecutionContext)
	 */
	public void execute(JobExecutionContext context) throws JobExecutionException {
		JobDataMap dataMap = context.getMergedJobDataMap();
		
		try {
			// Recibimos como parámetro el almacén a sincronizar
		    String codAlmacen = dataMap.getString("codAlmacen");
		    if (codAlmacen == null) {
		    	throw new JobExecutionException("Error al ejecutar la tarea de envío de configuración: " 
		    			+ "No se ha recibido el parámetro con el almacén de destino");
		    }
		    
			String resumen = ServicioSincronizador.enviarConfiguracion(codAlmacen, SincronizadorTiendas.getDatosSesionSincronizacion());
			dataMap.put("observaciones", resumen);
		}
		catch (Exception e) {
			dataMap.put("exception", e);
		}
	}
}
