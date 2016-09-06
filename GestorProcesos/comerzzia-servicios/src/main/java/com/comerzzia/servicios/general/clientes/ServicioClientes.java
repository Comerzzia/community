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

package com.comerzzia.servicios.general.clientes;

import java.sql.SQLException;
import java.util.Date;

import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.general.clientes.ClientesDao;
import com.comerzzia.persistencia.general.clientes.ParametrosBuscarClientesBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioClientes {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioClientes.class);
	
	
	public static PaginaResultados consultar(ParametrosBuscarClientesBean param, DatosSesionBean datosSesion) throws ClienteException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando clientes");
			conn.abrirConexion(Database.getConnection());
			return ClientesDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar clientes: " +  e.getMessage();
			
            throw new ClienteException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static ClienteBean consultar(String codCli, DatosSesionBean datosSesion) 
			throws ClienteException, ClienteNotFoundException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			ClienteBean cliente = consultar(conn, codCli, datosSesion);
			
			return cliente;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un cliente: " +  e.getMessage();
			
            throw new ClienteException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static ClienteBean consultar(Connection conn, String codCli, DatosSesionBean datosSesion) 
			throws ClienteException, ClienteNotFoundException {
		try {
			log.debug("consultar() - Consultando datos del cliente: " + codCli);
			ClienteBean cliente = ClientesDao.consultar(conn, datosSesion.getConfigEmpresa(), codCli);
			
			if (cliente == null) {
				String msg = "No se ha encontrado el cliente con identificador: " + codCli;
				log.info("consultar() - " + msg);
				
				throw new ClienteNotFoundException(msg);
			}
			
			return cliente;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un cliente: " + e.getMessage();
			
			throw new ClienteException(mensaje, e);
		}
	}
	
	
	public static ClienteBean consultarCif(String cif, DatosSesionBean datosSesion) 
			throws ClienteException, ClienteNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultarCif() - Consultando cliente por CIF: " + cif);
			conn.abrirConexion(Database.getConnection());
			ClienteBean cliente = ClientesDao.consultarCif(conn, datosSesion.getConfigEmpresa(), cif);
			
			if (cliente == null) {
				String msg = "No se ha encontrado el cliente con CIF: " + cif;
				
				throw new ClienteNotFoundException(msg);
			}
			
			return cliente;
		}
		catch (SQLException e) {
			log.error("consultarCif() - " + e.getMessage());
			String mensaje = "Error al consultar cliente por CIF: " +  e.getMessage();
			
		    throw new ClienteException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
			
	
	public static void salvar(ClienteBean cliente, DatosSesionBean datosSesion) 
			throws ClienteException, ClienteConstraintViolationException {
	
		switch (cliente.getEstadoBean()) {
			case Estado.NUEVO:
				crear(cliente, datosSesion);
				break;
			      
			case Estado.MODIFICADO:
				modificar(cliente, datosSesion);
				break;
			      
			case Estado.BORRADO:
				eliminar(cliente.getCodCli(), datosSesion);
		}
	}
	
	 public static void crear(ClienteBean cliente, DatosSesionBean datosSesion) throws ClienteException, ClienteConstraintViolationException {
		 Connection conn = new Connection();
			                 
		 try {
			log.debug("crear() - Creando nuevo Cliente");
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			crear(conn, cliente, datosSesion);
			conn.commit();
			conn.finalizaTransaccion();
		 }
		 catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error creando cliente al obtener conexión: " + e.getMessage();
			log.error("crear() - " + msg);
			throw new ClienteException(msg, e);
		 }
		 finally {
			 conn.cerrarConexion();
		 }
	 }

			         
	 public static void crear(Connection conn, ClienteBean cliente, DatosSesionBean datosSesion) 
	 		throws ClienteException, ClienteConstraintViolationException {
		try {
			log.debug("crear() - Creando nuevo Cliente");
			                         
			//Indicamos que la fecha del alta será hoy
			cliente.setFechaAlta(new Date());
			                         
			//Si se da de alta inactivo ponemos fecha de baja
			if(!cliente.isActivo()){
				cliente.setFechaBaja(new Date());
			}
			                         
			ClientesDao.insert(conn, datosSesion.getConfigEmpresa(), cliente);
		}
		catch(KeyConstraintViolationException e){
			try{
				log.info("crear() - No se ha podido crear el cliente: " + e.getMessage());
				if(ClientesDao.consultar(conn, datosSesion.getConfigEmpresa(), cliente.getCodCli()) != null){
					throw new ClienteConstraintViolationException("Ya existe un cliente con el mismo código en el sistema");
				}else if(ClientesDao.consultarCif(conn, datosSesion.getConfigEmpresa(), cliente.getCif()) != null){
					throw new ClienteConstraintViolationException("Ya existe un cliente con el mismo cif en el sistema");
				}else{
					throw new ClienteConstraintViolationException(e.getDefaultMessage());
				}
			}
			catch(SQLException e1){
				throw new ClienteException(e1.getMessage());
			}
		}
		catch (SQLException e) {
			String msg = "Error creando cliente: " + e.getMessage();
			log.error("crear() - " + msg);
			                     
			throw new ClienteException(msg, e);
		}
	}
	
	
	public static void modificar(ClienteBean cliente, DatosSesionBean datosSesion) throws ClienteException, ClienteConstraintViolationException {
		Connection conn = new Connection();
		try {
			log.debug("modificar() - Modificando Cliente " + cliente.getCodCli());
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			modificar(conn, cliente, datosSesion);
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error modificando cliente al obtener conexión: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		throw new ClienteException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	public static void modificar(Connection conn, ClienteBean cliente, DatosSesionBean datosSesion) 
			throws ClienteException, ClienteConstraintViolationException {
		try {
			log.debug("modificar() - Modificando Cliente " + cliente.getCodCli());
			
			//Si el cliente está inactivo y antes no tenía fecha de baja se pone la de hoy
			if(!cliente.isActivo() && cliente.getFechaBaja() == null){
				cliente.setFechaBaja(new Date());
			}
			//Si el cliente está activo y antes estaba de baja se pone la fecha de baja a nula
			else if(cliente.isActivo() && cliente.getFechaBaja() != null){
				cliente.setFechaBaja(null);
			}

			ClientesDao.update(conn, datosSesion.getConfigEmpresa(), cliente);
		}
		catch(KeyConstraintViolationException e){
			try{
				log.info("modificar() - No se ha podido modificar el cliente: " + e.getMessage());
				if(ClientesDao.consultarCif(conn, datosSesion.getConfigEmpresa(), cliente.getCif()) != null){
					throw new ClienteConstraintViolationException("Ya existe un cliente con el mismo cif en el sistema");
				}else{
					throw new ClienteConstraintViolationException(e.getDefaultMessage());
				}
			}
			catch(SQLException e1){
				throw new ClienteException(e1.getMessage());
			}
		}
		catch (SQLException e) {
			String msg = "Error modificando cliente: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new ClienteException(msg, e);
    	}
	}

	
	
	public static void eliminar(String codCli, DatosSesionBean datosSesion) 
			throws ClienteException, ClienteConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando Cliente " + codCli);
			conn.abrirConexion(Database.getConnection());
			ClientesDao.delete(conn, datosSesion.getConfigEmpresa(), codCli);
		}
		catch(ForeingKeyConstraintViolationException e){
			log.info("eliminar() - No se ha podido eliminar el cliente: "+ e.getMessage());
			throw new ClienteConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
    		String msg = "Error eliminando cliente: " + e.getMessage();
    		log.error("eliminar() - " + msg);
    		
    		throw new ClienteException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
}
