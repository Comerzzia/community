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

package com.comerzzia.servicios.general.tiendas;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.core.tipostiendas.trabajos.TrabajoTipoTiendaBean;
import com.comerzzia.persistencia.core.usuarios.UsuarioBean;
import com.comerzzia.persistencia.general.almacenes.AlmacenBean;
import com.comerzzia.persistencia.general.almacenes.AlmacenesDao;
import com.comerzzia.persistencia.general.tiendas.ParametrosBuscarTiendasBean;
import com.comerzzia.persistencia.general.tiendas.TiendaBean;
import com.comerzzia.persistencia.general.tiendas.TiendasDao;
import com.comerzzia.persistencia.general.tiendas.cajas.TiendaCajaBean;
import com.comerzzia.persistencia.general.tiendas.cajas.TiendaCajasDao;
import com.comerzzia.persistencia.general.tiendas.tarifas.TarifaTiendaBean;
import com.comerzzia.persistencia.general.tiendas.tarifas.TarifasTiendasDao;
import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenUsuarioBean;
import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenesUsuariosDao;
import com.comerzzia.persistencia.sincronizacion.TrabajoSincronizadorBean;
import com.comerzzia.persistencia.sincronizacion.TrabajosSincronizadorDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.tipostiendas.trabajos.ServicioTrabajosTiposTiendas;
import com.comerzzia.servicios.core.tipostiendas.trabajos.TrabajoTipoTiendaException;
import com.comerzzia.servicios.core.usuarios.ServicioUsuarios;
import com.comerzzia.servicios.core.usuarios.UsuarioConstraintViolationException;
import com.comerzzia.servicios.core.usuarios.UsuarioException;
import com.comerzzia.servicios.general.almacenes.AlmacenConstraintViolationException;
import com.comerzzia.servicios.general.almacenes.AlmacenException;
import com.comerzzia.servicios.general.almacenes.ClienteAlmacenConstraintViolationException;
import com.comerzzia.servicios.general.almacenes.ServicioAlmacenes;
import com.comerzzia.servicios.general.clientes.ClienteConstraintViolationException;
import com.comerzzia.servicios.general.clientes.ClienteException;
import com.comerzzia.servicios.general.clientes.ServicioClientes;
import com.comerzzia.servicios.general.tiendas.tarifas.ServicioTarifasTiendas;
import com.comerzzia.servicios.general.tiendas.tarifas.TarifaTiendaConstraintViolationException;
import com.comerzzia.servicios.general.tiendas.tarifas.TarifaTiendaException;
import com.comerzzia.servicios.general.tiendas.usuarios.AlmacenUsuarioConstraintViolationException;
import com.comerzzia.servicios.general.tiendas.usuarios.AlmacenUsuarioException;
import com.comerzzia.servicios.general.tiendas.usuarios.ServicioAlmacenesUsuarios;
import com.comerzzia.servicios.sincronizacion.ServicioSincronizador;
import com.comerzzia.servicios.sincronizacion.TrabajoSincronizadorException;
import com.comerzzia.servicios.ventas.tarifas.TarifaException;
import com.comerzzia.servicios.ventas.tarifas.TarifaNotFoundException;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;


public class ServicioTiendas {

	protected static Logger log = Logger.getMLogger(ServicioTiendas.class);
	
	
	public static PaginaResultados consultar(ParametrosBuscarTiendasBean param, DatosSesionBean datosSesion) throws TiendaException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando tiendas");
			conn.abrirConexion(Database.getConnection());
			return TiendasDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar tiendas: " +  e.getMessage();
			
            throw new TiendaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static Tienda consultar(String codAlm, DatosSesionBean datosSesion) 
			throws TiendaException, TiendaNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos de la tienda: " + codAlm);
			conn.abrirConexion(Database.getConnection());
			Tienda tienda = new Tienda(TiendasDao.consultar(conn, datosSesion.getConfigEmpresa(), codAlm));
			
			if (tienda == null) {
				String msg = "No se ha encontrado la tienda con identificador: " + codAlm;
				log.info("consultar() - " + msg);
				throw new TiendaNotFoundException(msg);
			}
			
			return tienda;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de una tienda: " +  e.getMessage();
			
		    throw new TiendaException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}	
	
	
	public static void salvar(Tienda tienda, DatosSesionBean datosSesion) 
			throws TiendaException, TiendaConstraintViolationException, AlmacenException, AlmacenConstraintViolationException, ClienteAlmacenConstraintViolationException, ClienteException, ClienteConstraintViolationException, TarifaException, TarifaNotFoundException {

		switch (tienda.getEstadoBean()) {
			case Estado.NUEVO:
				crear(tienda, datosSesion);
				break;
	      
			case Estado.MODIFICADO:
				modificar(tienda, datosSesion);
				break;
	      
			case Estado.BORRADO:
				eliminar(tienda.getCodAlm(), datosSesion);
		}
	}
	
	
	public static void crear(Tienda tienda, DatosSesionBean datosSesion) 
			throws TiendaException, TiendaConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nueva tienda");
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			// Crear el cliente si así se decició en el asistente
			if(tienda.getCliente() != null) {
				ServicioClientes.crear(conn, tienda.getCliente(), datosSesion);
				tienda.setCodCliente(tienda.getCliente().getCodCli());
			}
			
			if(!tienda.getUsuariosNuevos().isEmpty()){
				crearUsuariosNuevos(tienda, datosSesion, conn);
			}
			
			//Isertamos primero el almacen y despues la tienda relacionada	
			ServicioAlmacenes.crear(obtenerAlmacen(tienda), datosSesion, conn);
			
			TiendasDao.insert(conn, datosSesion.getConfigEmpresa(), tienda.getBean());
			
			salvarTarifasTienda(tienda, conn, datosSesion);
			salvarTrabajosTipoTienda(tienda, conn, datosSesion);
			salvarUsuariosTienda(tienda, conn, datosSesion);
			
			// Si la tienda es de tipo TIENDA VIRTUAL crear la caja
			if(tienda.getIdTipoTienda() == Tienda.TIPO_TIENDA_TIENDA_VIRTUAL) {
				String configuracion = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><Parametros><almacenCentral>0000</almacenCentral></Parametros>";
				TiendaCajasDao.insert(conn, datosSesion.getConfigEmpresa(), new TiendaCajaBean(tienda.getCodAlm(), Tienda.CODIGO_CAJA_TIENDA_VIRTUAL, Tienda.UID_TPV_TIENDA_VIRTUAL, configuracion));
			}
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (KeyConstraintViolationException e) {
			conn.deshacerTransaccion();
			
			log.info("crear() - No se ha podido crear la tienda: " + e.getMessage());
			throw new TiendaConstraintViolationException("Error creando nueva tienda: " + e.getDefaultMessage());
		}
		catch (ClienteException e) {
			conn.deshacerTransaccion();
			
			log.info("crear() - No se ha podido crear el cliente: " + e.getMessage());
			throw new TiendaException(e.getMessage());
		}
		catch (ClienteConstraintViolationException e) {
			conn.deshacerTransaccion();
			
			log.info("crear() - No se ha podido crear el cliente: " + e.getMessage());
			throw new TiendaConstraintViolationException(e.getMessage());
		}
		catch (UsuarioException e) {
			conn.deshacerTransaccion();
			
			log.info("crear() - No se ha podido crear el nuevo usuario: " + e.getMessage());
			throw new TiendaException(e.getMessage());
		}
		catch (UsuarioConstraintViolationException e) {
			conn.deshacerTransaccion();
			
			log.info("crear() - No se ha podido crear el nuevo usuario: " + e.getMessage());
			throw new TiendaConstraintViolationException(e.getMessage());
		}
		catch (AlmacenException e) {
			conn.deshacerTransaccion();
			
			log.info("crear() - No se ha podido crear el almacén: " + e.getMessage());
			throw new TiendaException(e.getMessage());
		}
		catch (AlmacenConstraintViolationException e) {
			conn.deshacerTransaccion();
			
			log.info("crear() - No se ha podido crear el almacén: " + e.getMessage());
			throw new TiendaConstraintViolationException(e.getMessage());
		}
		catch (TrabajoSincronizadorException e) {
			conn.deshacerTransaccion();
			
			log.info("crear() - No se han podido crear los trabajos de sincronizacion: " + e.getMessage());
			throw new TiendaException(e.getMessage());
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			
			String msg = "Error creando nueva tienda: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new TiendaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void modificar(Tienda tienda, DatosSesionBean datosSesion) 
			throws TiendaException, TiendaConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando tienda " + tienda.getCodAlm());
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			AlmacenesDao.update(conn, datosSesion.getConfigEmpresa(), obtenerAlmacen(tienda));
			TiendasDao.update(conn, datosSesion.getConfigEmpresa(), tienda.getBean());
			
			salvarTarifasTienda(tienda, conn, datosSesion);
			salvarUsuariosTienda(tienda, conn, datosSesion);
			
			//salvarCajas(conn, tienda, datosSesion);			
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			
			String msg = "Error modificando tienda: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new TiendaException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void eliminar(String codAlm, DatosSesionBean datosSesion) 
			throws TiendaException, TiendaConstraintViolationException {
		Connection conn = new Connection();
		Tienda tienda = null;
		
		try {
			tienda = consultar(codAlm, datosSesion);
		}
		catch (TiendaNotFoundException e1) {
			// La tienda ya no existe
			return;
		}
		
		try {
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();

			log.debug("eliminar() - Eliminando tarifas de la tienda " + codAlm);
			TarifasTiendasDao.delete(conn, datosSesion.getConfigEmpresa(), codAlm);
			
			log.debug("eliminar() - Eliminando usuarios de la tienda " + codAlm);
			AlmacenesUsuariosDao.delete(conn, datosSesion.getConfigEmpresa(), codAlm);
			
			log.debug("eliminar() - Eliminando trabajos de sincronizacion de la tienda " + codAlm);
			TrabajosSincronizadorDao.delete(conn, datosSesion.getConfigEmpresa(), codAlm);

			log.debug("eliminar() - Eliminando tienda " + codAlm);
			TiendasDao.delete(conn, datosSesion.getConfigEmpresa(),codAlm);
			AlmacenesDao.delete(conn, datosSesion.getConfigEmpresa(),codAlm);
			
			// Si la tienda es de tipo TIENDA VIRTUAL eliminar la caja
			if(tienda.getIdTipoTienda() == Tienda.TIPO_TIENDA_TIENDA_VIRTUAL) {
				TiendaCajasDao.delete(conn, datosSesion.getConfigEmpresa(), Tienda.UID_TPV_TIENDA_VIRTUAL);
			}
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch(ForeingKeyConstraintViolationException e){
			conn.deshacerTransaccion();
			
			log.info("eliminar() - No se ha podido eliminar la tienda: "+ e.getMessage());
			throw new TiendaConstraintViolationException("Error eliminando tienda: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			
			String msg = "Error eliminando tienda: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new TiendaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	/*private static void salvarCajas(Connection conn, Tienda tienda, DatosSesionBean datosSesion) 
	throws CajaException, CajaConstraintViolationException {

		if (tienda.isCajasCargadas()) {
			for (CajaBean caja : tienda.getCajas()) {
				// Actualizamos PK del objeto
				caja.setCodAlm(tienda.getCodAlm());
				
				ServicioCajas.salvar(conn, caja, datosSesion);
			}
		}
	}*/
	
	public static void crearTienda(DatosSesionBean datosSesion, Connection conn, Tienda tienda) 
			throws TiendaException, TiendaConstraintViolationException {
		try {
			log.debug("crear() - Creando nueva tienda");
			TiendasDao.insert(conn, datosSesion.getConfigEmpresa(), tienda.getBean());
			
			salvarTarifasTienda(tienda, conn, datosSesion);
			salvarTrabajosTipoTienda(tienda, conn, datosSesion);
			salvarUsuariosTienda(tienda, conn, datosSesion);
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear la tienda: " + e.getMessage());
			throw new TiendaConstraintViolationException("Error creando nueva tienda: " + e.getDefaultMessage());
		}
		catch (TrabajoSincronizadorException e) {
			conn.deshacerTransaccion();
			
			log.info("crear() - No se han podido crear los trabajos de sincronizacion: " + e.getMessage());
			throw new TiendaException(e.getMessage());
		}
		catch (SQLException e) {
			String msg = "Error creando nueva tienda: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new TiendaException(msg, e);
		}
	}
	
	public static boolean existe(String codAlm, DatosSesionBean datosSesion) 
			throws TiendaException, TiendaNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("existe() - Comprobando si existe la tienda: " + codAlm);
			conn.abrirConexion(Database.getConnection());
			return TiendasDao.consultar(conn, datosSesion.getConfigEmpresa(), codAlm) != null;
		}
		catch (SQLException e) {
			String mensaje = "Error comprobando si existe la tienda " + codAlm + ": " +  e.getMessage();
			log.error("existe() - " + mensaje);			
			
		    throw new TiendaException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}	
	
	/**
	 * Este método comprueba si existe alguna tienda del tipo cuyo ID es el que se recibe com parámetro.
	 * 
	 * @param datosSesion
	 * @param idTipoTienda
	 * @return
	 * @throws TiendaException 
	 */
	public static boolean existeTipoTienda(DatosSesionBean datosSesion, Long idTipoTienda) throws TiendaException {
		Connection conn = new Connection();
		
		try {
			log.debug("existeTipoTienda() - Comprobando si existe el tipo de tienda: " + idTipoTienda);
			conn.abrirConexion(Database.getConnection());
			
			ParametrosBuscarTiendasBean param = new ParametrosBuscarTiendasBean();
			param.setIdTipoTienda(idTipoTienda);
			param.setNumPagina(1);
			
			return consultar(param, datosSesion).getPagina().size() > 0;
		}
		catch (SQLException e) {
			String mensaje = "Error comprobando la existencia del tipo de tienda: " +  e.getMessage();
			log.error("existeTipoTienda() - " + mensaje);			
			
		    throw new TiendaException(mensaje, e);
		}
		catch (TiendaException e) {
			String mensaje = "Error comprobando la existencia de una tienda del : " +  e.getMessage();
			log.error("existeTipoTienda() - " + mensaje);			
			
		    throw e;
		}
		finally{
			conn.cerrarConexion();
		}
	}
	
	private static AlmacenBean obtenerAlmacen(Tienda tienda){
		AlmacenBean almacen = new AlmacenBean();
		
		almacen.setCodAlm(tienda.getCodAlm());
		almacen.setDesAlm(tienda.getDesAlm());
		almacen.setDomicilio(tienda.getDomicilio());
		almacen.setPoblacion(tienda.getPoblacion());
		almacen.setProvincia(tienda.getProvincia());
		almacen.setCp(tienda.getCp());
		almacen.setTelefono1(tienda.getTelefono1());
		almacen.setTelefono2(tienda.getTelefono2());
		almacen.setFax(tienda.getFax());
		almacen.setPersonaContacto(tienda.getPersonaContacto());
		almacen.setCodEmp(tienda.getCodEmp());
		almacen.setCodCliente(tienda.getCodCliente());
		almacen.setActivo(tienda.getActivo());
		almacen.setEstadoBean(tienda.getEstadoBean());
		
		return almacen;
		
	}
	
	public static List<TiendaBean> consultarTiendasUsuario(Long idUsuario, DatosSesionBean datosSesion) throws TiendaException{
		Connection conn = new Connection();
		
		try {
			log.debug("consultaTiendasUsuario() - Consultando tiendas para el usuario " + idUsuario);
			conn.abrirConexion(Database.getConnection());
			return TiendasDao.consultarTiendasUsuario(idUsuario, conn, datosSesion.getConfigEmpresa());
		}
		catch (SQLException e) {
			log.error("consultaTiendasUsuario() - " + e.getMessage());
			String mensaje = "Error al consultar tiendas para el usuario "+ idUsuario + ": " +  e.getMessage();
			
            throw new TiendaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	private static void salvarTarifasTienda(Tienda tienda,
			Connection conn, DatosSesionBean datosSesion) throws TarifaTiendaException,
			TarifaTiendaConstraintViolationException {

		if (tienda.isTarifasCargadas()) {
			for (TarifaTiendaBean tarifaTienda : tienda.getTarifas()) {
				// Actualizamos PK del objeto
				tarifaTienda.setCodAlmacen(tienda.getCodAlm());

				ServicioTarifasTiendas.salvar(conn, tarifaTienda, datosSesion);
			}
		}
	}
	
	private static void salvarTrabajosTipoTienda(Tienda tienda, Connection conn, DatosSesionBean datosSesion) 
			throws TrabajoTipoTiendaException, TrabajoSincronizadorException{
		
		List<TrabajoTipoTiendaBean> trabajos = ServicioTrabajosTiposTiendas.consultar(tienda.getIdTipoTienda(), conn);
		for (TrabajoTipoTiendaBean trabajoTipoTienda : trabajos){
			TrabajoSincronizadorBean trabajo = new TrabajoSincronizadorBean();
			trabajo.setTrabajo(trabajoTipoTienda.getTrabajo());
			trabajo.setClase(trabajoTipoTienda.getClase());
			trabajo.setCodAlmacen(tienda.getCodAlm());
			trabajo.setIntervalo(trabajoTipoTienda.getIntervalo());
			trabajo.parar();
			
			ServicioSincronizador.crear(trabajo, conn, datosSesion);
		}	
	}
	
	private static void salvarUsuariosTienda(Tienda tienda,	Connection conn, DatosSesionBean datosSesion) 
			throws AlmacenUsuarioException,	AlmacenUsuarioConstraintViolationException {

		if (tienda.isUsuariosCargados()) {
			for (AlmacenUsuarioBean usuarioTienda : tienda.getUsuarios()) {
				// Actualizamos PK del objeto
				usuarioTienda.setCodAlmacen(tienda.getCodAlm());

				ServicioAlmacenesUsuarios.salvar(usuarioTienda, conn, datosSesion);
			}
		}
	}
	
	private static void crearUsuariosNuevos(Tienda tienda, DatosSesionBean datosSesion, Connection conn) 
			throws UsuarioException, UsuarioConstraintViolationException{
		
		for (UsuarioBean usuarioNuevo : tienda.getUsuariosNuevos()){
			ServicioUsuarios.crear(usuarioNuevo, datosSesion, conn);
			// Añadimos el usuario creado a la lista de usuarios seleccionados
			AlmacenUsuarioBean usuario = new AlmacenUsuarioBean();
    		usuario.setEstadoBean(Estado.NUEVO);
    		usuario.setIdUsuario(usuarioNuevo.getIdUsuario());
    		usuario.setUsuario(usuarioNuevo.getUsuario());
    		usuario.setDesUsuario(usuarioNuevo.getDesUsuario());
			tienda.addUsuario(usuario);
		}
	}
}
