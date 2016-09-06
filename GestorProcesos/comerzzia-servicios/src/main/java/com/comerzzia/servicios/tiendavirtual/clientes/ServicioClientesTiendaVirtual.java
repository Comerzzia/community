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

package com.comerzzia.servicios.tiendavirtual.clientes;

import java.sql.SQLException;
import java.util.Date;

import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.general.clientes.ClientesDao;
import com.comerzzia.persistencia.tiendavirtual.clientes.ClientesTiendaVirtualDao;
import com.comerzzia.persistencia.tiendavirtual.clientes.UsuarioClienteTiendaVirtualBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.clientes.ClienteConstraintViolationException;
import com.comerzzia.servicios.general.clientes.ClienteException;
import com.comerzzia.servicios.general.clientes.ServicioClientes;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioClientesTiendaVirtual {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioClientesTiendaVirtual.class);

	public static ClienteBean consultar(String cif, DatosSesionTiendaVirtualBean datosSesion) 
			throws ClienteTiendaVirtualException, ClienteTiendaVirtualNotFoundException {
		Connection conn = new Connection();
		try {
			log.debug("consultar() - Consultando cliente con CIF: " + cif);
			conn.abrirConexion(Database.getConnection());
			ClienteBean cliente = ClientesTiendaVirtualDao.consultar(conn, datosSesion.getConfigTiendaVirtual(), cif);

			if (cliente == null || !cliente.isActivo()) {
				String msg = "No se ha encontrado el cliente con CIF " + cif;
				throw new ClienteTiendaVirtualNotFoundException(msg);
			}
			return cliente;
		} 
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar cliente por CIF: " + e.getMessage();
			throw new ClienteTiendaVirtualException(mensaje, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static UsuarioClienteTiendaVirtualBean consultarUsuarioCliente(String usuario, DatosSesionTiendaVirtualBean datosSesion) 
			throws ClienteTiendaVirtualException, ClienteTiendaVirtualNotFoundException {
		Connection conn = new Connection();
		try {
			log.debug("consultarUsuarioCliente() - Consultando usuario cliente: " + usuario);
			conn.abrirConexion(Database.getConnection());
			UsuarioClienteTiendaVirtualBean usuarioCliente = ClientesTiendaVirtualDao.consultarUsuarioCliente(conn, datosSesion.getConfigTiendaVirtual(), usuario);
		
			if (usuarioCliente == null) {
				String msg = "No se ha encontrado el usuario cliente con nombre de usuario " + usuario;
				throw new ClienteTiendaVirtualNotFoundException(msg);
			}
			return usuarioCliente;
		} 
		catch (SQLException e) {
			log.error("consultarUsuarioCliente() - " + e.getMessage());
			String mensaje = "Error al consultar usuario cliente por su nombre: " + e.getMessage();
			throw new ClienteTiendaVirtualException(mensaje, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}

	
	public static void salvarCliente(Connection conn, DatosSesionTiendaVirtualBean datosSesion, ClienteBean cliente, UsuarioClienteTiendaVirtualBean usuario) 
			throws ClienteTiendaVirtualException, ClienteTiendaVirtualRegistroException{
		try {
			log.debug("salvarCliente() - Salvando datos de cliente de tienda virtual.");

			// consultamos el cliente en la empresa utilizando su cif como códio de cliente		
			ClienteBean clienteEmpresa = ClientesDao.consultar(conn, datosSesion.getDatosSesionEmpresa().getConfigEmpresa(), cliente.getCif());
			if (clienteEmpresa == null){ // si no lo encontramos, lo buscamos por cif
				clienteEmpresa = ClientesDao.consultarCif(conn, datosSesion.getDatosSesionEmpresa().getConfigEmpresa(), cliente.getCif());
			}
			if (usuario.isEstadoNuevo()){
				registrarNuevoCliente(conn, datosSesion, clienteEmpresa, cliente, usuario);
			}
			else{
				actualizarCliente(conn, datosSesion, clienteEmpresa, cliente);
			}
			// devolvemos el código del cliente de la empresa por si se necesita para realizar un pedido
			if (clienteEmpresa == null){
				cliente.setCodCli(cliente.getCif());
			}
			else{
				cliente.setCodCli(clienteEmpresa.getCodCli());
			}
		}
		catch (SQLException e) {
			log.error("salvarCliente() - " + e.getMessage());
			String mensaje = "Error al salvar un cliente de la tienda virtual: " + e.getMessage();
			throw new ClienteTiendaVirtualException(mensaje, e);
		} 
	}




	private static void actualizarCliente(Connection conn, DatosSesionTiendaVirtualBean datosSesion, 
					ClienteBean clienteEmpresa, ClienteBean cliente) 
			throws ClienteTiendaVirtualRegistroException, SQLException, ClienteTiendaVirtualException {
		try{
			// si el cliente de empresa no existe (lo han borrado) lo creamos de nuevo
			if (clienteEmpresa == null){ 
				cliente.setActivo(true);
				cliente.setCodCli(cliente.getCif());
				cliente.setFechaAlta(new Date());
				ServicioClientes.crear(cliente, datosSesion.getDatosSesionEmpresa());
			}
			// si existe, comprobamos si el cliente está activo
			else if (!clienteEmpresa.isActivo()){
				log.warn("actualizarCliente() - Se está intentando actualizar un cliente que está inactivo.");
				throw new ClienteTiendaVirtualRegistroException("No es posible realizar una compra con el cif de cliente indicado.");
			}
			else{
				// actualizamos cliente de empresa
				actualizarClienteEmpresa(conn, datosSesion.getDatosSesionEmpresa(), clienteEmpresa, cliente);
			}

			// consultamos el cliente de la tienda utilizando el cif
			ClienteBean clienteTienda = ClientesTiendaVirtualDao.consultar(conn, datosSesion.getConfigTiendaVirtual(), cliente.getCif());
	
			// comprobamos si el cliente de la tienda está activo
			if (!clienteTienda.isActivo()){
				log.warn("actualizarCliente() - Se está intentando actualizar un cliente de tienda que está inactivo.");
				throw new ClienteTiendaVirtualRegistroException("No es posible realizar una compra con el cif de cliente indicado.");
			}
	
			// actualizamos cliente de la tienda
			actualizarClienteTienda(conn, datosSesion, clienteTienda, cliente);
		}
		catch(ClienteConstraintViolationException e){
			// no es posible que salte esta excepción, ya que estamos modificando datos que no hacen saltar ninguna constraint
			throw new ClienteTiendaVirtualRegistroException("No es posible realizar una compra con el cif de cliente indicado.");
		} 
		catch (ClienteException e) {
			String msg = "Errro al registrar nuevo cliente desde la tienda virtual. " + e.getMessage();
			log.error("registrarNuevoCliente() - " + msg);
			throw new ClienteTiendaVirtualException(msg, e);
		}
		
	}


	private static void registrarNuevoCliente(Connection conn, DatosSesionTiendaVirtualBean datosSesion, ClienteBean clienteEmpresa, 
				ClienteBean nuevoCliente, UsuarioClienteTiendaVirtualBean usuario) 
			throws SQLException, ClienteTiendaVirtualException, ClienteTiendaVirtualRegistroException {
		ClienteBean clienteTienda = null;
		try{
			// preparamos los datos del nuevo cliente por si lo insertamos
			nuevoCliente.setActivo(true);
			nuevoCliente.setCodCli(nuevoCliente.getCif());
			nuevoCliente.setFechaAlta(new Date());

			// si el cliente existe en la empresa pero está inactivo, no podremos dejar que realice un pedido.
			if (clienteEmpresa != null && !clienteEmpresa.isActivo()){
				log.warn("registrarNuevoCliente() - Se está intentando registrar un cliente que está inactivo.");
				throw new ClienteTiendaVirtualRegistroException("No es posible realizar una compra con el cif de cliente indicado.");
			}
			// si tenemos cliente de empresa, consultamos el cliente de la tienda utilizando el cif
			if (clienteEmpresa != null){
				clienteTienda = ClientesTiendaVirtualDao.consultar(conn, datosSesion.getConfigTiendaVirtual(), clienteEmpresa.getCif());
			}
			// si el cliente se encuentra registrado tanto en la empresa como en la tienda, ya está registrado y tendrá que hacer login
			if (clienteEmpresa != null && clienteTienda != null){
				throw new ClienteTiendaVirtualRegistroException("El cliente indicado ya se encuentra registrado, haga login con su usuario y contraseña para continuar.");
			}
			// si el cliente de empresa no existe, lo creamos
			if (clienteEmpresa == null){ 
				ServicioClientes.crear(nuevoCliente, datosSesion.getDatosSesionEmpresa());
			}
			else{
				// si el cliente de empresa existe y está activo, lo actualizaremos
				actualizarClienteEmpresa(conn, datosSesion.getDatosSesionEmpresa(), clienteEmpresa, nuevoCliente);
			}
			// insertamos cliente en la tienda
			ClientesTiendaVirtualDao.insertarClienteTienda(conn, datosSesion.getConfigTiendaVirtual(), nuevoCliente);
			
			// insertamos usuario de tienda
			try{
				usuario.setActivo(true);
				usuario.setCif(nuevoCliente.getCif());
				ClientesTiendaVirtualDao.insertarUsuarioCliente(conn, datosSesion.getConfigTiendaVirtual(), usuario);
			}
			catch(KeyConstraintViolationException e){
				// se está intentando insertar un usuario de tienda con un nombre de usuario que ya existe
				throw new ClienteTiendaVirtualRegistroException("El nombre de usuario indicado ya existe.");
			}
		}
		catch(ClienteConstraintViolationException e){
			// no es posible que salte esta excepción, ya que antes de intentar crear el cliente 
			// lo hemos consultado para ver que no existe
			throw new ClienteTiendaVirtualRegistroException("No es posible realizar una compra con el cif de cliente indicado.");
		} 
		catch (ClienteException e) {
			String msg = "Errro al registrar nuevo cliente desde la tienda virtual. " + e.getMessage();
			log.error("registrarNuevoCliente() - " + msg);
			throw new ClienteTiendaVirtualException(msg, e);
		}
	}
	
	private static void actualizarClienteEmpresa(Connection conn, DatosSesionBean datosSesionEmpresa, 
				ClienteBean clienteEmpresa, ClienteBean nuevoCliente) throws ClienteException, ClienteConstraintViolationException{ 
		clienteEmpresa.setCp(nuevoCliente.getCp());
		clienteEmpresa.setDesCli(nuevoCliente.getDesCli());
		clienteEmpresa.setDomicilio(nuevoCliente.getDomicilio());
		clienteEmpresa.setEmail(nuevoCliente.getEmail());
		clienteEmpresa.setObservaciones(nuevoCliente.getObservaciones());
		clienteEmpresa.setPoblacion(nuevoCliente.getPoblacion());
		clienteEmpresa.setTelefono1(nuevoCliente.getTelefono1());
		clienteEmpresa.setTelefono2(nuevoCliente.getTelefono2());
		clienteEmpresa.setProvincia(nuevoCliente.getProvincia());
		ServicioClientes.modificar(conn, clienteEmpresa, datosSesionEmpresa);
	}
	
	private static void actualizarClienteTienda(Connection conn, DatosSesionTiendaVirtualBean datosSesion, 
				ClienteBean clienteTienda, ClienteBean nuevoCliente) throws SQLException{
		clienteTienda.setCp(nuevoCliente.getCp());
		clienteTienda.setDesCli(nuevoCliente.getDesCli());
		clienteTienda.setDomicilio(nuevoCliente.getDomicilio());
		clienteTienda.setEmail(nuevoCliente.getEmail());
		clienteTienda.setObservaciones(nuevoCliente.getObservaciones());
		clienteTienda.setPoblacion(nuevoCliente.getPoblacion());
		clienteTienda.setTelefono1(nuevoCliente.getTelefono1());
		clienteTienda.setTelefono2(nuevoCliente.getTelefono2());
		clienteTienda.setProvincia(nuevoCliente.getProvincia());
		ClientesTiendaVirtualDao.actualizarClienteTienda(conn, datosSesion.getConfigTiendaVirtual(), clienteTienda);
	}
	
	
	
}
