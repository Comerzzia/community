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

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.sincronizacion.ClaseTrabajoBean;
import com.comerzzia.persistencia.sincronizacion.ListaTrabajos;
import com.comerzzia.persistencia.sincronizacion.TrabajoSincronizadorBean;
import com.comerzzia.persistencia.sincronizacion.TrabajosSincronizadorDao;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.tiendas.ServicioTiendas;
import com.comerzzia.servicios.general.tiendas.Tienda;
import com.comerzzia.servicios.general.tiendas.TiendaException;
import com.comerzzia.servicios.general.tiendas.TiendaNotFoundException;
import com.comerzzia.servicios.sincronizacion.sincronizadores.ISincronizador;
import com.comerzzia.servicios.sincronizacion.sincronizadores.SincronizadorFactory;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioSincronizador {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioSincronizador.class);
	
	
	public static List<ListaTrabajos> consultarTrabajos(DatosSesionBean datosSesion) throws TrabajoSincronizadorException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultarTrabajos() - Consultando trabajos");
			conn.abrirConexion(Database.getConnection());
			
			return TrabajosSincronizadorDao.consultarTrabajos(conn, datosSesion.getConfigEmpresa());
		}
		catch (SQLException e) {
			log.error("consultarTrabajos() - " + e.getMessage());
			String mensaje = "Error consultando trabajos: " + e.getMessage();
			
			throw new TrabajoSincronizadorException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static List<ListaTrabajos> consultarTrabajosTiendas(DatosSesionBean datosSesion) throws TrabajoSincronizadorException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultarTrabajosTiendas() - Consultando trabajos por tiendas");
			conn.abrirConexion(Database.getConnection());
			
			return TrabajosSincronizadorDao.consultarTrabajosTiendas(conn, datosSesion.getConfigEmpresa());
		}
		catch (SQLException e) {
			log.error("consultarTrabajosTiendas() - " + e.getMessage());
			String mensaje = "Error consultando trabajos por tiendas: " + e.getMessage();
			
			throw new TrabajoSincronizadorException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static List<ClaseTrabajoBean> consultarClasesTrabajos(DatosSesionBean datosSesion) throws TrabajoSincronizadorException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultarClasesTrabajos() - Consultando clases de trabajos");
			conn.abrirConexion(Database.getConnection());
			
			return TrabajosSincronizadorDao.consultarClasesTrabajos(conn, datosSesion.getConfigEmpresa());
		}
		catch (SQLException e) {
			log.error("consultarClasesTrabajos() - " + e.getMessage());
			String mensaje = "Error consultando clases de trabajos: " + e.getMessage();
			
			throw new TrabajoSincronizadorException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static TrabajoSincronizadorBean consultar(Long idTrabajo, DatosSesionBean datosSesion) throws TrabajoSincronizadorException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando trabajo de sincronizador " + idTrabajo);
			conn.abrirConexion(Database.getConnection());
			
			return TrabajosSincronizadorDao.consultar(conn, datosSesion.getConfigEmpresa(), idTrabajo);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando trabajo de sincronizador: " + e.getMessage();
			
			throw new TrabajoSincronizadorException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void modificar(TrabajoSincronizadorBean trabajo, DatosSesionBean datosSesion) 
			throws TrabajoSincronizadorException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando trabajo de sincronizador " + trabajo.getIdTrabajo());
			conn.abrirConexion(Database.getConnection());
			TrabajosSincronizadorDao.update(conn, datosSesion.getConfigEmpresa(), trabajo);
		}
		catch (SQLException e) {
			String msg = "Error modificando trabajo de sincronizador: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new TrabajoSincronizadorException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	public static void crear(TrabajoSincronizadorBean trabajo, Connection conn, DatosSesionBean datosSesion) 
			throws TrabajoSincronizadorException {
		
		try {
			log.debug("crear() - Creando trabajo de sincronizacion.");
			
			// Obtenemos el idTrabajo a partir del contador de trabajos de sincronizacion
			Long idTrabajo = ContadorTrabajoSincronizacion.obtenerContador(conn);
			trabajo.setIdTrabajo(idTrabajo);
			TrabajosSincronizadorDao.insert(conn, datosSesion.getConfigEmpresa(), trabajo);
			
		}
		catch (ContadorException e) {
			String msg = "Error creando trabajo de sincronizacion: " + e.getMessage();
			log.error("crear() - " + msg);
			throw new TrabajoSincronizadorException(msg, e);
		}
		catch (SQLException e) {
			String msg = "Error creando trabajo de sincronizacion: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new TrabajoSincronizadorException(msg, e);
		}
	}
	
	
	public synchronized static String enviarConfiguracion(String codAlmacen, DatosSesionBean datosSesion) 
			throws SincronizadorTiendasException, TrabajoSincronizadorException {
		
		ISincronizador sincronizador = null;
		
		try {
			log.debug("enviarConfiguracion() - Enviando configuración a la tienda " + codAlmacen);
			
			// Obtenemos los datos de la Tienda
			Tienda tienda = ServicioTiendas.consultar(codAlmacen, datosSesion);
			
			// Instanciamos la clase de sincronización definida para la tienda
			sincronizador = SincronizadorFactory.crear(tienda.getClaseSincronizacion());
			
			// Enviamos la configuración
			sincronizador.inicializar(tienda.getBean());
			sincronizador.enviarConfiguracion();
			
			String resumen = sincronizador.getResumenEnvioConfiguracion();
			
			log.debug("enviarConfiguracion() - Finalizado envío de configuración a la tienda " 
					+ codAlmacen + ": " + resumen);
			
			return resumen;
		} 
		catch (TiendaException e) {
			log.error("enviarConfiguracion() - Error al obtener datos de la tienda " + codAlmacen + ": " + e.getMessage());
			throw new SincronizadorTiendasException(e.getMessage(), e);
		} 
		catch (TiendaNotFoundException e) {
			log.error("enviarConfiguracion() - Error al obtener datos de la tienda " + codAlmacen + ": " + e.getMessage());
			throw new SincronizadorTiendasException(e.getMessage(), e);
		}
		catch (SincronizadorTiendasException e) {
			throw e;
		}
		catch (TrabajoSincronizadorException e) {
			throw e;
		}
		catch (Exception e) {
			log.error("enviarConfiguracion() - Error al enviar configuración a la tienda " + codAlmacen + ": " + e.getMessage(), e);
			throw new SincronizadorTiendasException(e.getMessage(), e);
		}
		finally {
			if (sincronizador != null) {
				sincronizador.finalizar();
			}
		}
	}
	
	
	public synchronized static String enviarArticulos(String codAlmacen, DatosSesionBean datosSesion) 
			throws SincronizadorTiendasException, TrabajoSincronizadorException {
		
		ISincronizador sincronizador = null;
		
		try {
			log.debug("enviarArticulos() - Enviando artículos a la tienda " + codAlmacen);
			
			// Obtenemos los datos de la Tienda
			Tienda tienda = ServicioTiendas.consultar(codAlmacen, datosSesion);
			
			// Instanciamos la clase de sincronización definida para la tienda
			sincronizador = SincronizadorFactory.crear(tienda.getClaseSincronizacion());
			
			// Sincronizamos los artículos con la tienda
			sincronizador.inicializar(tienda.getBean());
			sincronizador.enviarArticulos();
			
			String resumen = sincronizador.getResumenEnvioArticulos();
			
			log.debug("enviarArticulos() - Finalizado envío de artículos a la tienda " 
					+ codAlmacen + ": " + resumen);
			
			// Devolvemos el resumen de las operaciones realizadas
			return resumen;
		} 
		catch (TiendaException e) {
			log.error("enviarArticulos() - Error al obtener datos de la tienda " + codAlmacen + ": " + e.getMessage());
			throw new SincronizadorTiendasException(e.getMessage(), e);
		} 
		catch (TiendaNotFoundException e) {
			log.error("enviarArticulos() - Error al obtener datos de la tienda " + codAlmacen + ": " + e.getMessage());
			throw new SincronizadorTiendasException(e.getMessage(), e);
		}
		catch (SincronizadorTiendasException e) {
			throw e;
		}
		catch (TrabajoSincronizadorException e) {
			throw e;
		}
		catch (Exception e) {
			log.error("enviarArticulos() - Error al enviar artículos a la tienda " + codAlmacen + ": " + e.getMessage(), e);
			throw new SincronizadorTiendasException(e.getMessage(), e);
		}
		finally {
			if (sincronizador != null) {
				sincronizador.finalizar();
			}
		}
	}
	
	
	public synchronized static String recibirTickets(String codAlmacen, DatosSesionBean datosSesion) 
			throws SincronizadorTiendasException, TrabajoSincronizadorException {
		
		ISincronizador sincronizador = null;
		
		try {
			log.debug("recibirTickets() - Recibiendo tickets de la tienda " + codAlmacen);
			
			// Obtenemos los datos de la Tienda
			Tienda tienda = ServicioTiendas.consultar(codAlmacen, datosSesion);
			
			// Instanciamos la clase de sincronización definida para la tienda
			sincronizador = SincronizadorFactory.crear(tienda.getClaseSincronizacion());
			
			// Recibimos los tickets de la tienda
			sincronizador.inicializar(tienda.getBean());
			sincronizador.recibirTickets();
			int recibidos = sincronizador.getNumTicketsRecibidos();
			
			log.debug("recibirTickets() - Finalizada recepción de tickets de la tienda " + codAlmacen 
					+ ": Se han recibido " + recibidos + " tickets");
			
			String resumen = null;
			if (recibidos > 0) {
				resumen = "Se han recibido " + recibidos + " tickets pendientes de la tienda";
			}
			else {
				resumen = "No se ha recibido ningún ticket pendiente de la tienda";
			}
			return resumen;
		} 
		catch (TiendaException e) {
			log.error("recibirTickets() - Error al obtener datos de la tienda " + codAlmacen + ": " + e.getMessage());
			throw new SincronizadorTiendasException(e.getMessage(), e);
		} 
		catch (TiendaNotFoundException e) {
			log.error("recibirTickets() - Error al obtener datos de la tienda " + codAlmacen + ": " + e.getMessage());
			throw new SincronizadorTiendasException(e.getMessage(), e);
		}
		catch (SincronizadorTiendasException e) {
			throw e;
		}
		catch (TrabajoSincronizadorException e) {
			throw e;
		}
		catch (Exception e) {
			log.error("recibirTickets() - Error al recibir tickets de la tienda " + codAlmacen + ": " + e.getMessage(), e);
			throw new SincronizadorTiendasException(e.getMessage(), e);
		}
		finally {
			if (sincronizador != null) {
				sincronizador.finalizar();
			}
		}
	}
}
