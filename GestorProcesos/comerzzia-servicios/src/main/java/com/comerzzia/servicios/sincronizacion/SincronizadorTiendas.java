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

package com.comerzzia.servicios.sincronizacion;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import org.quartz.CronExpression;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.SimpleTrigger;
import org.quartz.Trigger;
import org.quartz.TriggerListener;
import org.quartz.impl.StdSchedulerFactory;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.sincronizacion.ClaseTrabajoBean;
import com.comerzzia.persistencia.sincronizacion.ListaTrabajos;
import com.comerzzia.persistencia.sincronizacion.TrabajoSincronizadorBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.variables.ServicioVariables;
import com.comerzzia.servicios.core.variables.Variables;
import com.comerzzia.servicios.ventas.tickets.TicketException;
import com.comerzzia.util.config.AppInfo;
import com.comerzzia.util.log.Logger;


public class SincronizadorTiendas implements TriggerListener {

	/**
	 * Grupo de los trabajos del Sincronizador en el Scheduler
	 */
	private static final String GRUPO = "Sincronizador";
	
	
	/**
	 * Fichero de propiedades del scheduler del Sincronizador
	 */
	private final static String PROPIEDADES = 
		"com/comerzzia/servicios/sincronizacion/sincronizadorTiendas.properties";
	
	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(SincronizadorTiendas.class);
	
	/**
	 * Sincronizador de Tiendas
	 */
	private static SincronizadorTiendas sincronizador = null;
	
	/**
	 * Scheduler
	 */
	private static Scheduler scheduler = null;
	
	
	
	
	/**
	 * Constructor
	 */
	private SincronizadorTiendas() {
	}
	
	
	/**
	 * Obtiene la instancia del Sincronizador de Tiendas
	 * @return
	 */
	public static SincronizadorTiendas getInstance() {
		if (sincronizador == null) {
			sincronizador = new SincronizadorTiendas();
		}
		
		return sincronizador;
	}
	
	
	/**
	 * Arranca el Sincronizador de Tiendas
	 * @throws TicketException
	 */
	public void arrancar() throws SincronizadorTiendasException {
		// Si ya está arrancado no continuamos
		if (isArrancado()) {
			return ;
		}
		
		try {
			log.info("Arrancando Sincronizador de Tiendas");
			
			if (scheduler == null) {
				Properties propiedades = getProperties();
				SchedulerFactory sf = new StdSchedulerFactory(propiedades);  
				scheduler = sf.getScheduler();
				
				// Registramos el propio Sincronizador como listener para
				// controlar la ejecución de las tareas
				scheduler.addTriggerListener(this);
			}
			
			// Arrancamos el planificador
			scheduler.start();
			
			// Registramos los trabajos
			registrarTrabajos();
			
			// Planificamos los trabajos en ejecucion
			planificarTrabajos();
		} 
		catch (Exception e) {
			log.error("arrancar() - " + e.getMessage());
			throw new SincronizadorTiendasException(e.getMessage(), e);
		}
	}
	
	
	private Properties getProperties() throws SincronizadorTiendasException {
		try{
			// Obtenemos los propiedades del Scheduler
			Properties propiedades = new Properties();
			InputStream in = Thread.currentThread().getContextClassLoader().getResourceAsStream(PROPIEDADES);
			if (in == null) {
				String mensaje = "No se ha encontrado el fichero de propiedades del scheduler del Sincronizador";
				log.error("getProperties() - " + mensaje);
				throw new SincronizadorTiendasException(mensaje);
			}
			
			in = new BufferedInputStream(in);
			propiedades.load(in);
			
			try {
				// Establacemos en número máximo de trabajos simultáneos
				propiedades.setProperty("org.quartz.threadPool.threadCount", 
						ServicioVariables.consultarValor(Variables.SINCRONIZADOR_MAX_TRABAJOS_SIMULTANEOS));
			} 
			catch (Exception e) {
				log.error("getProperties() - Error al establecer número máximo de trabajos del Sincronizador: " + e.getMessage());
			}
			
			return propiedades;
		} 
		catch(IOException e){
			log.error("getProperties() - Error al leer el fichero de propiedades del scheduler: " + e.getMessage());
			throw new SincronizadorTiendasException(e.getMessage(), e);
		}
	}
	
	
	private void registrarTrabajos() throws SincronizadorTiendasException {
		try {
			// Obtenemos las clases de trabajos y las registramos en el Scheduler
			List<ClaseTrabajoBean> clasesTrabajos = ServicioSincronizador.consultarClasesTrabajos(getDatosSesionSincronizacion());
			
			for (ClaseTrabajoBean claseTrabajo : clasesTrabajos) {
				JobDetail jobDetail = new JobDetail(claseTrabajo.getTrabajo(), GRUPO, Class.forName(claseTrabajo.getClase()));
				jobDetail.setDurability(true);
				scheduler.addJob(jobDetail, true);
			}
		} 
		catch (TrabajoSincronizadorException e) {
			log.error("registrarTrabajos() - " + e.getMessage());
			throw new SincronizadorTiendasException(e.getMessage(), e);
		} 
		catch (SchedulerException e) {
			log.error("registrarTrabajos() - " + e.getMessage());
			throw new SincronizadorTiendasException(e.getMessage(), e);
		} 
		catch (ClassNotFoundException e) {
			log.error("registrarTrabajos() - No se ha encontrado la clase del trabajo: " + e.getMessage());
			throw new SincronizadorTiendasException("No se ha encontrado la clase del trabajo " + e.getMessage(), e);
		}
	}
	
	
	private void planificarTrabajos() throws SincronizadorTiendasException {
		// Obtenemos los trabajos y los registramos en el scheduler como tareas
		try {
			List<ListaTrabajos> listaTrabajos = ServicioSincronizador.consultarTrabajos(getDatosSesionSincronizacion());
			for (ListaTrabajos trabajos : listaTrabajos) {
				for (TrabajoSincronizadorBean trabajo : trabajos.getListaTrabajos()) {
					if (trabajo.isArrancado()) {
						try {
							arrancarTrabajo(trabajo);
						}
						catch (Exception e) {
							log.error("Error al arrancar trabajo " + trabajo.getIdTrabajo() + ": " + e.getMessage(), e);
							
							// Paramos el trabajo y lo marcamos como Erroneo
							try {
								pararTrabajo(trabajo);
							}
							catch (Exception ignore) {
							}
							
							try {
								trabajo.setResultado(TrabajoSincronizadorBean.ESTADO_ERROR);
								trabajo.setObservaciones("Error al arrancar el trabajo: " + e.getMessage());
								ServicioSincronizador.modificar(trabajo, getDatosSesionSincronizacion());
							}
							catch (Exception ex) {
								log.error("Error al establacer un trabajo erroneo en el arranque del sincronizador " + e.getMessage(), e);
							}
						}
					}
				}
			}
		} 
		catch (TrabajoSincronizadorException e) {
			log.error("planificarTareas() - Error al planificar tarea: " + e.getMessage());
			throw new SincronizadorTiendasException("Error al planificar tarea: " + e.getMessage(), e);
		} 
	}
	
	
	/**
	 * Detiene el Servicio de Procesamiento de Tickets
	 * @throws TicketException
	 */
	public void parar() throws SincronizadorTiendasException {
		try {
			log.info("Parando Sincronizador de Tiendas");
			
			if (scheduler != null) {
				scheduler.standby();
				
				// Eliminamos todos los trabajos registrados
				String[] triggers = scheduler.getTriggerNames(GRUPO);
				if (triggers != null) {
					for (String triggerName : triggers) {
						scheduler.unscheduleJob(triggerName, GRUPO);
					}
				}
			}
		} 
		catch (SchedulerException e) {
			log.error("parar() - " + e.getMessage());
			throw new SincronizadorTiendasException(e.getMessage(), e);
		}
	}
	
	
	/**
	 * Finaliza la ejecución del Sincronizador de Tiendas
	 * liberando todos los recursos.
	 * Una vez finalizado no se puede volver a arrancar
	 * @throws SincronizadorTiendasException
	 */
	public void finalizar() throws SincronizadorTiendasException {
		try {
			log.info("Finalizando Sincronizador de Tiendas");
			
			if (scheduler != null) {
				scheduler.shutdown();
			}
		} 
		catch (SchedulerException e) {
			log.error("finalizar() - " + e.getMessage());
			throw new SincronizadorTiendasException(e.getMessage(), e);
		}
	}
	
	
	/**
	 * Indica si el Sincronizador de Tiendas está parado
	 * @return true si el sincronizador está parado, false en caso contrario
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
	 * Indica si el Sincronizador de Tiendas está arrancado
	 * @return true si el sincronizador está arrancado, false en caso contrario
	 */
	public boolean isArrancado() {
		return !isParado();
	}
	
	
	/**
	 * Realiza la parada y arranque del Sincronizador de Tiendas
	 * @throws SincronizadorTiendasException
	 */
	public void reiniciar() throws SincronizadorTiendasException {
		try {
			parar();
		} 
		catch (SincronizadorTiendasException ignore) {
		}
		
		arrancar();
	}
	
	
	private Trigger obtenerTrigger(TrabajoSincronizadorBean trabajo) {
		Trigger trigger = new SimpleTrigger();
		trigger.setStartTime(trabajo.getFechaProximaEjecucion());
		trigger.setName(trabajo.getNombre());
		trigger.setGroup(GRUPO);
		trigger.getJobDataMap().put("codAlmacen", trabajo.getCodAlmacen());
		trigger.getJobDataMap().put("idTrabajo", trabajo.getIdTrabajo());
		trigger.setJobGroup(GRUPO);
		trigger.setJobName(trabajo.getTrabajo());
		trigger.addTriggerListener(getName());
		
		return trigger;
	}
	
	
	public void pararTrabajo(Long idTrabajo) throws SincronizadorTiendasException {
		try {
			// Obtenemos el trabajo y lo paramos
			TrabajoSincronizadorBean trabajo = ServicioSincronizador.consultar(idTrabajo, getDatosSesionSincronizacion());
			pararTrabajo(trabajo);
		} 
		catch (TrabajoSincronizadorException e) {
			log.error("pararTrabajo() - Error al detener un trabajo: " + e.getMessage());
			throw new SincronizadorTiendasException("Error al detener un trabajo: " + e.getMessage(), e);
		}
		catch (SincronizadorTiendasException e) {
			throw e;
		}
		catch (Exception e) {
			log.error("pararTrabajo() - Error al detener un trabajo: " + e.getMessage(), e);
			throw new SincronizadorTiendasException("Error al detener un trabajo: " + e.getMessage(), e);
		}
	}
	
	
	public void pararTrabajo(TrabajoSincronizadorBean trabajo) throws SincronizadorTiendasException {
		try {
			log.debug("SINCRONIZADOR: parando trabajo " + trabajo.getIdTrabajo());
			
			// Paramos la ejecución del trabajo
			trabajo.parar();
			if (scheduler != null) {
				scheduler.unscheduleJob(trabajo.getNombre(), GRUPO);
			}
			
			// Actualizamos su estado
			ServicioSincronizador.modificar(trabajo, getDatosSesionSincronizacion());
			
			log.debug("SINCRONIZADOR: trabajo " + trabajo.getIdTrabajo() + " parado correctamente");
		} 
		catch (Exception e) {
			log.error("pararTrabajo() - Error al detener un trabajo: " + e.getMessage(), e);
			throw new SincronizadorTiendasException("Error al detener un trabajo: " + e.getMessage(), e);
		}
	}
	
	
	public void pausarTrabajo(Long idTrabajo) throws SincronizadorTiendasException {
		try {
			// Obtenemos el trabajo y lo pausamos
			TrabajoSincronizadorBean trabajo = ServicioSincronizador.consultar(idTrabajo, getDatosSesionSincronizacion());
			pausarTrabajo(trabajo);
		} 
		catch (TrabajoSincronizadorException e) {
			log.error("pausarTrabajo() - Error al pausar un trabajo: " + e.getMessage());
			throw new SincronizadorTiendasException("Error al pausar un trabajo: " + e.getMessage(), e);
		}
		catch (SincronizadorTiendasException e) {
			throw e;
		}
		catch (Exception e) {
			log.error("pausarTrabajo() - Error al pausar un trabajo: " + e.getMessage(), e);
			throw new SincronizadorTiendasException("Error al pausar un trabajo: " + e.getMessage(), e);
		}
	}
	
	
	public void pausarTrabajo(TrabajoSincronizadorBean trabajo) throws SincronizadorTiendasException {
		try {
			log.debug("SINCRONIZADOR: pausando trabajo " + trabajo.getIdTrabajo());
			
			// Pausamos la ejecución del trabajo
			trabajo.pausar();
			if (scheduler != null) {
				scheduler.unscheduleJob(trabajo.getNombre(), GRUPO);
			}
			
			// Actualizamos su estado
			ServicioSincronizador.modificar(trabajo, getDatosSesionSincronizacion());
			
			log.debug("SINCRONIZADOR: trabajo " + trabajo.getIdTrabajo() + " pausado correctamente");
		}
		catch (Exception e) {
			log.error("pausarTrabajo() - Error al pausar un trabajo: " + e.getMessage(), e);
			throw new SincronizadorTiendasException("Error al pausar un trabajo: " + e.getMessage(), e);
		} 
	}
	
	
	public void arrancarTrabajo(Long idTrabajo) throws SincronizadorTiendasException {
		try {
			// Obtenemos el trabajo y lo arrancamos
			TrabajoSincronizadorBean trabajo = ServicioSincronizador.consultar(idTrabajo, getDatosSesionSincronizacion());
			arrancarTrabajo(trabajo);
		} 
		catch (TrabajoSincronizadorException e) {
			log.error("arrancarTrabajo() - Error al arrancar un trabajo: " + e.getMessage());
			throw new SincronizadorTiendasException("Error al arrancar un trabajo: " + e.getMessage(), e);
		}
		catch (SincronizadorTiendasException e) {
			throw e;
		}
		catch (Exception e) {
			log.error("arrancarTrabajo() - Error al arrancar un trabajo: " + e.getMessage(), e);
			throw new SincronizadorTiendasException("Error al arrancar un trabajo: " + e.getMessage(), e);
		}
	}
	
	
	public void arrancarTrabajo(TrabajoSincronizadorBean trabajo) throws SincronizadorTiendasException {
		try {
			log.debug("SINCRONIZADOR: arrancando trabajo " + trabajo.getIdTrabajo());
			
			// Arrancamos el trabajo y planificamos su ejecución
			trabajo.arrancar();
			trabajo.setFechaInicio(null);
			
			// Si el planificador está arrancado
			if (this.isArrancado()) {
				// Establecemos fecha inicio del trabajo a la fecha y ahora actual
				trabajo.setFechaInicio(new Date());
				
				// Si el trabajo no tiene fecha de próxima ejecución o esta ha pasado la establacemos
				// al siguiente minuto de la fecha de inicio
				if (trabajo.getFechaProximaEjecucion() == null 
						|| trabajo.getFechaProximaEjecucion().before(trabajo.getFechaInicio())) {
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(trabajo.getFechaInicio());
					calendar.clear(Calendar.MILLISECOND);
					calendar.add(Calendar.MINUTE, 1);
					calendar.clear(Calendar.SECOND);
					trabajo.setFechaProximaEjecucion(calendar.getTime());
				}
				
				// Planificamos la ejecución del trabajo
				Trigger trigger = obtenerTrigger(trabajo);
				scheduler.scheduleJob(trigger);
			}
			
			// Actualizamos su estado
			ServicioSincronizador.modificar(trabajo, getDatosSesionSincronizacion());
			
			log.debug("SINCRONIZADOR: trabajo " + trabajo.getIdTrabajo() + " arrancado correctamente");
		}
		catch (Exception e) {
			log.error("arrancarTrabajo() - Error al arrancar un trabajo: " + e.getMessage(), e);
			throw new SincronizadorTiendasException("Error al arrancar un trabajo: " + e.getMessage(), e);
		}
	}
	
	
	private void replanificarTrabajo(TrabajoSincronizadorBean trabajo) throws SincronizadorTiendasException {
		try {
			log.debug("SINCRONIZADOR: replanificando trabajo " + trabajo.getIdTrabajo());
			
			trabajo.setFechaProximaEjecucion(getSiguienteFechaEjecucion(trabajo));
			
			// Y replanificamos su ejecución
			Trigger trigger = obtenerTrigger(trabajo);
			scheduler.rescheduleJob(trigger.getName(), GRUPO, trigger);
			
			// Actualizamos su estado
			ServicioSincronizador.modificar(trabajo, getDatosSesionSincronizacion());
			
			log.debug("SINCRONIZADOR: trabajo " + trabajo.getIdTrabajo() + " replanificado correctamente");
		} 
		catch (Exception e) {
			log.error("replanificarTrabajo() - Error al replanificar un trabajo: " + e.getMessage(), e);
			throw new SincronizadorTiendasException("Error al replanificar un trabajo: " + e.getMessage(), e);
		}
	}
	
	
	private Date getSiguienteFechaEjecucion(TrabajoSincronizadorBean trabajo) throws SincronizadorTiendasException {
		CronExpression cron = getCronExpresion(trabajo);
		return cron.getNextValidTimeAfter(trabajo.getFechaUltimaEjecucion());
	}
	
	
	private CronExpression getCronExpresion(TrabajoSincronizadorBean trabajo) throws SincronizadorTiendasException {
		try {
			String cronExpresion = null;
			
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(trabajo.getFechaProximaEjecucion());
			
			String cantidad = trabajo.getCantidadIntervalo();
			String medida = trabajo.getMedidaIntervalo();
			String dias = trabajo.getDiasIntervalo();
			
			if (medida.equals("m")) {
				cronExpresion = "0 */" + cantidad + " * * * ";
			}
			else if (medida.equals("h")) {
				cronExpresion = "0 " + calendar.get(Calendar.MINUTE) + " */" + cantidad + " * * ";
			}
			else if (medida.equals("d")) {
				cronExpresion = "0 " + calendar.get(Calendar.MINUTE) + " " +
					+ calendar.get(Calendar.HOUR_OF_DAY) + " */" + cantidad + " * ";
			}
			
			if (dias != null) {
				// TODO: parsear los días para completar la expresion cron
			}
			else {
				cronExpresion += "?";
			}
			
			//log.debug("SINCRONIZADOR: cron = " + cronExpresion);
			
			return new CronExpression(cronExpresion);
		} 
		catch (Exception e) {
			log.error("getCronExpresion() - Error al crear la expresión cron del intervalo " 
					+ trabajo.getIntervalo() + " del trabajo " + trabajo.getIdTrabajo() 
						+ " : " + e.getMessage());
			
			throw new SincronizadorTiendasException("No se ha podido obtener la planificación del trabajo");
		}
	}
	
	
	@Override
	public String getName() {
		return "Sincronizador de Tiendas";
	}


	@Override
	public void triggerComplete(Trigger trigger, JobExecutionContext context, int triggerInstructionCode) {
		try {
			// Obtenemos la información del trabajo completado
			JobDataMap dataMap = context.getMergedJobDataMap();
			long idTrabajo = dataMap.getLong("idTrabajo");
			String observaciones = dataMap.getString("observaciones");
			Exception error = (Exception) dataMap.get("exception");
			
			log.debug("SINCRONIZADOR: Ha finalizado la ejecución del trabajo " + idTrabajo);
			
			// Obtenemos el trabajo
			DatosSesionBean datosSesion = getDatosSesionSincronizacion();
			TrabajoSincronizadorBean trabajo = ServicioSincronizador.consultar(idTrabajo, datosSesion);
			
			// Establacemos fecha de ultima ejecución del trabajo
			trabajo.setFechaUltimaEjecucion(new Date());
			
			if (error == null) {
				trabajo.setResultado(TrabajoSincronizadorBean.ESTADO_OK);
				trabajo.setObservaciones(observaciones);
			}
			else {
				trabajo.setResultado(TrabajoSincronizadorBean.ESTADO_ERROR);
				trabajo.setObservaciones(error.getMessage());
				
				// TODO: añadir posibilidad de reintentos si el trabajo falla
			}
			
			// Si el trabajo es periodico volvemos a planificar su ejecución
			if (trabajo.isPlanificado()) {
				replanificarTrabajo(trabajo);
			}
			else {
				// Paramos el trabajo
				pararTrabajo(trabajo);
			}
		} 
		catch (TrabajoSincronizadorException e) {
			log.error("SINCRONIZADOR: Error al completar ejecución del trabajo: " + e.getMessage(), e);
		} 
		catch (SincronizadorTiendasException e) {
			log.error("SINCRONIZADOR: Error al completar ejecución del trabajo: " + e.getMessage(), e);
		}
	}


	@Override
	public void triggerFired(Trigger trigger, JobExecutionContext context) {
		log.debug("SINCRONIZADOR: Se ha lanzado la ejecución del trabajo " + trigger.getName());
	}


	@Override
	public void triggerMisfired(Trigger trigger) {
		log.warn("SINCRONIZADOR: La ejecución del trabajo " + trigger.getName() + " ha caducado");
	}


	@Override
	public boolean vetoJobExecution(Trigger trigger, JobExecutionContext context) {
		return false;
	}
	
	
	public static DatosSesionBean getDatosSesionSincronizacion() {
		// TODO: ver desde donde iniciamos esta sesión
		//       En un entorno multiempresa, cada una deberá tener un usuario
		//       para sincronización, y se ejecutarán tantas sincronizaciones como
		//       empresas existan
		DatosSesionBean datosSesion = new DatosSesionBean();
		ConfigEmpresaBean configEmpresa = new ConfigEmpresaBean();
		configEmpresa.setEsquemaEmpresa(AppInfo.getDbInfo().getEsquemaEmpresa());
		datosSesion.setConfigEmpresa(configEmpresa);
		
		return datosSesion;
	}
}
