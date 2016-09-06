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

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.general.clientes.ClientesDao;
import com.comerzzia.persistencia.ventas.tickets.ResumenTicketsPendientesBean;
import com.comerzzia.persistencia.ventas.tickets.TicketBean;
import com.comerzzia.persistencia.ventas.tickets.TicketsDao;
import com.comerzzia.persistencia.ventas.tickets.errores.ErrorTicketBean;
import com.comerzzia.persistencia.ventas.tickets.errores.ErroresTicketsDao;
import com.comerzzia.persistencia.ventas.tickets.historico.HistoricoTicketBean;
import com.comerzzia.persistencia.ventas.tickets.historico.HistoricoTicketsDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.clientes.ClienteConstraintViolationException;
import com.comerzzia.servicios.general.clientes.ClienteException;
import com.comerzzia.servicios.general.clientes.ServicioClientes;
import com.comerzzia.servicios.ventas.albaranes.AlbaranVenta;
import com.comerzzia.servicios.ventas.albaranes.ServicioAlbaranesVentas;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioTickets {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioTickets.class);

	
	/**
	 * Obtiene el numero de tickets pendientes de procesar agrupados por almacen y fecha
	 * @param datosSesion
	 * @return
	 * @throws TicketException
	 */
	public static List<ResumenTicketsPendientesBean> consultarResumenPendientes(DatosSesionBean datosSesion) throws TicketException{
		Connection conn = new Connection();

		try {
			log.debug("consultarResumenPendiente() - Consultando resumen de tickets pendientes de procesar");
			conn.abrirConexion(Database.getConnection());
			return TicketsDao.consultarResumenPendientes(conn, datosSesion.getConfigEmpresa());
		}
		catch (SQLException e) {
			log.error("consultarResumenPendiente() - " + e.getMessage());
			String mensaje = "Error al consultar resumen de tickets pendientes de procesar: " +  e.getMessage();
			
            throw new TicketException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	/**
	 * Obtiene la lista de tickets pendientes de procesar
	 * @param datosSesion
	 * @return
	 * @throws TicketException
	 */
	public static List<TicketBean> consultarPendientes(DatosSesionBean datosSesion) throws TicketException{
		Connection conn = new Connection();

		try {
			log.debug("consultarPendientes() - Consultando tickets pendientes de procesar");
			conn.abrirConexion(Database.getConnection());
			return TicketsDao.consultarPendientes(conn, datosSesion.getConfigEmpresa());
		}
		catch (SQLException e) {
			log.error("consultarPendientes() - " + e.getMessage());
			String mensaje = "Error al consultar tickets pendientes de procesar: " +  e.getMessage();
			
            throw new TicketException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	/**
	 * Procesa todos los tickets pendientes, generando para cada uno su albarán correspondiente.
	 * @see ServicioAlbaranesVentas#crearAlbaranDesdeTicket(String, Long)
	 * @param datosSesion
	 * @throws TicketException
	 */
	public synchronized static void procesarTicketsPendientes(DatosSesionBean datosSesion) throws TicketException {
		Connection conn = new Connection();
		
		// Contadores
		int procesados = 0;
		int correctos = 0;
		int erroneos = 0;
		
		try {
			log.debug("procesarTicketsPendientes() - Procesando tickets pendientes");
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			// Obtenemos la lista de tickets pendientes de procesar
			List<TicketBean> tickets = TicketsDao.consultarPendientes(conn, datosSesion.getConfigEmpresa());
			
			// Procesamos cada ticket
			for (TicketBean ticket : tickets) {
				procesados++;
				log.debug("procesarTicketsPendientes() - Pasando ticket " + ticket.getUidTicket() + " a albarán");
				
				try {
					// Creamos el albarán a partir del ticket
					crearAlbaran(conn, datosSesion, ticket);
					
					// Guardamos el ticket en la tabla de históricos
					insertarTicketHistorico(conn, datosSesion, ticket);
					correctos++;
				} 
				catch (Exception e) {
					// Si se produce un error lo pasamos a tickets con errores deshaciendo lo hecho
					erroneos++;
					log.debug("procesarTicketsPendientes() - deshaciendo transacción del albarán creado para el ticket " + ticket.getUidTicket());
					conn.deshacerTransaccion();
					
					log.error("procesarTicketsPendientes() - Error procesando ticket " + ticket.getUidTicket() + ": " + e.getMessage());
					
					insertarTicketError(conn, datosSesion, ticket, e.getMessage());
				}
				
				// Confirmamos los cambios del ticket procesado
				conn.commit();
			}
			
			conn.finalizaTransaccion();
		}
		catch (Exception e) {
			log.debug("procesarTicketsPendientes() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			log.error("procesarTicketsPendientes() - " + e.getMessage());
			String mensaje = "Error al procesar tickets pendientes: " +  e.getMessage();
			
	        throw new TicketException(mensaje, e);
		} 
		finally {
			conn.cerrarConexion();
			
			log.debug("Se han procesado " + procesados + " tickets  " + 
					"[Correctos: " + correctos + "]  [Erroneos: " + erroneos + "]");
		}
	}
	
	
	private static void crearAlbaran(Connection conn, DatosSesionBean datosSesion, TicketBean ticket) 
			throws TicketException {
		try {
			// Obtenemos el albarán a partir del XML del ticket
			TicketParser ticketParser = new TicketParser(conn, datosSesion, ticket);
			AlbaranVenta albaran = ticketParser.parse();
			
			// Comprobamos si existe el cliente
			ClienteBean cliente = ClientesDao.consultar(conn, datosSesion.getConfigEmpresa(), albaran.getCodCliente());
			// Si no existe lo buscamos por su nif
			if (cliente == null) {
				cliente = ClientesDao.consultarCif(conn, datosSesion.getConfigEmpresa(), albaran.getCodCliente());
				// Si tampoco existe lo creamos
				if (cliente == null) {
					cliente = albaran.getCliente();
					cliente.setEstadoBean(Estado.NUEVO);
					cliente.setCif(cliente.getCodCli());  // El CODCLI que viene en el ticket es el CIF del cliente
					cliente.setActivo(true);
					
					ServicioClientes.crear(conn, cliente, datosSesion);
				}
				else {  // Si existe lo establacemos como cliente del albarán
					albaran.cambiarCliente(cliente);
				}
			}
			
			ServicioAlbaranesVentas.crear(albaran, datosSesion, conn);
		}
		catch (ClienteException e) {
			throw new TicketException("Error al dar de alta el cliente del albarán: " + e.getMessage());
		}
		catch (ClienteConstraintViolationException e) {
			throw new TicketException("Error al dar de alta el cliente del albarán: " + e.getMessage());
		}
		catch (TicketException e) {
			throw e;
		}
		catch (Exception e) {
			throw new TicketException("Error al crear el albarán del ticket: " + e.getMessage());
		}
	}
	
	
	public static synchronized void crearAlbaranDesdeTicketError(String uidTicket, DatosSesionBean datosSesion) throws TicketException, TicketConstraintViolationException {
		Connection conn = new Connection();
		ErrorTicketBean ticket = null;
		
		try {
			log.debug("crearAlbaranDesdeTicketError() - Pasando ticket " + uidTicket + " a albarán");
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();

			// Obtenemos los datos del ticket
			ticket = ErroresTicketsDao.consultar(conn, uidTicket, datosSesion.getConfigEmpresa());

			// Creamos el albarán
			crearAlbaran(conn, datosSesion, ticket);
			
			// Guardamos el ticket en la tabla de históricos
			log.debug("crearAlbaranDesdeTicketError() - Guardando el ticket en la tabla de históricos");
			guardarTicketHistoricoDesdeError(conn, datosSesion, ticket);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (Exception e) {
			conn.deshacerTransaccion();
			
			log.error("crearAlbaranDesdeTicketError() - Error procesando ticket " + ticket.getUidTicket() + ": " + e.getMessage());
			
			//Insertamos el ticket en la tabla de tickets erróneos
			try {
				actualizarTicketError(conn, datosSesion, uidTicket, e.getMessage());
				conn.commit();
				conn.finalizaTransaccion();
			}
			catch (Exception ignore) {
			}
			
			throw new TicketException(e.getMessage(), e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	private static void insertarTicketHistorico(Connection conn, DatosSesionBean datosSesion, 
			TicketBean ticket) throws SQLException {
		
		// Instanciamos el objeto del histórico de tickets
		HistoricoTicketBean historico = new HistoricoTicketBean(ticket);
		historico.setFechaProceso(new Date());
		
		// Primero lo insertamos en la tabla de históricos
		HistoricoTicketsDao.insert(conn, datosSesion.getConfigEmpresa(), historico);
		
		// Después lo eliminamos de la tabla de tickets
		TicketsDao.delete(conn, datosSesion.getConfigEmpresa(), ticket);
	}
	
	
	private static void insertarTicketError(Connection conn, DatosSesionBean datosSesion, 
			TicketBean ticket, String mensajeError) throws SQLException {
		
		// Instanciamos el objeto del error de ticket
		ErrorTicketBean error = new ErrorTicketBean(ticket);
		error.setFechaProceso(new Date());
		if (mensajeError != null && mensajeError.length() > 254) {
			error.setMensajeError(mensajeError.substring(0, 254));
		}
		else {
			error.setMensajeError(mensajeError);
		}
		
		// Primero lo insertamos en la tabla de errores
		ErroresTicketsDao.insert(conn, datosSesion.getConfigEmpresa(), error);
		
		// Después lo eliminamos de la tabla de tickets
		TicketsDao.delete(conn, datosSesion.getConfigEmpresa(), ticket);
	}


	private static void guardarTicketHistoricoDesdeError(Connection conn, DatosSesionBean datosSesion, 
			ErrorTicketBean ticket) throws SQLException{
		
		// Instanciamos el objeto del histórico de tickets
		HistoricoTicketBean historico = new HistoricoTicketBean(ticket);
		historico.setFechaProceso(new Date());
		
		// Primero lo insertamos en la tabla de históricos
		HistoricoTicketsDao.insert(conn, datosSesion.getConfigEmpresa(), historico);
		
		// Después lo eliminamos de la tabla de tickets erroneos
		ErroresTicketsDao.delete(conn, datosSesion.getConfigEmpresa(), ticket.getUidTicket());
	}
	
	
	private static void actualizarTicketError(Connection conn, DatosSesionBean datosSesion, String uidTicket, String mensajeError) {
		try {
			ErrorTicketBean error = new ErrorTicketBean();
			error.setUidTicket(uidTicket);
			error.setFechaProceso(new Date());
			if (mensajeError != null && mensajeError.length() > 254) {
				error.setMensajeError(mensajeError.substring(0, 254));
			}
			else {
				error.setMensajeError(mensajeError);
			}
			
			ErroresTicketsDao.updateError(conn, datosSesion.getConfigEmpresa(), error);
		} 
		catch (Exception e) {
			log.error("actualizarTicketError() - Error: " + e.getMessage(), e);
		}
	}
}
