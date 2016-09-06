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

package com.comerzzia.servicios.core.empresas;

import java.sql.SQLException;

import com.comerzzia.persistencia.core.empresas.AsistenteConfiguracionEmpresaBean;
import com.comerzzia.persistencia.core.empresas.EmpresaBean;
import com.comerzzia.persistencia.core.empresas.EmpresasDao;
import com.comerzzia.persistencia.core.tipostiendas.TipoTiendaBean;
import com.comerzzia.persistencia.general.almacenes.AlmacenBean;
import com.comerzzia.persistencia.general.almacenes.AlmacenesDao;
import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.general.mediospago.MedioPagoBean;
import com.comerzzia.persistencia.general.tiendas.tarifas.TarifaTiendaBean;
import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenUsuarioBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.tipostiendas.ServicioTiposTiendas;
import com.comerzzia.servicios.core.variables.ServicioVariables;
import com.comerzzia.servicios.core.variables.Variables;
import com.comerzzia.servicios.general.almacenes.AlmacenConstraintViolationException;
import com.comerzzia.servicios.general.almacenes.ServicioAlmacenes;
import com.comerzzia.servicios.general.clientes.ClienteConstraintViolationException;
import com.comerzzia.servicios.general.clientes.ServicioClientes;
import com.comerzzia.servicios.general.mediospago.ServicioMediosPago;
import com.comerzzia.servicios.general.tiendas.ServicioTiendas;
import com.comerzzia.servicios.general.tiendas.Tienda;
import com.comerzzia.servicios.general.tiendas.TiendaConstraintViolationException;
import com.comerzzia.servicios.sincronizacion.SincronizadorTiendas;
import com.comerzzia.servicios.sincronizacion.sincronizadores.ConfigSincronizacionFactory;
import com.comerzzia.servicios.sincronizacion.sincronizadores.IConfigSincronizacion;
import com.comerzzia.servicios.ventas.tarifas.ServicioTarifas;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioEmpresas {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioEmpresas.class);
	
	public static EmpresaBean consultar(DatosSesionBean datosSesion) 
		throws EmpresaException, EmpresaNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando datos de la empresa");
			conn.abrirConexion(Database.getConnection());
			EmpresaBean empresa = EmpresasDao.consultar(conn, datosSesion.getConfigEmpresa());
			
			if (empresa == null) {
				String msg = "No se ha encontrado la empresa";
				log.info("consultar() - " + msg);
				throw new EmpresaNotFoundException(msg);
			}
			
			return empresa;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de la empresa: " +  e.getMessage();
			
		    throw new EmpresaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static EmpresaBean consultar(String codEmp, DatosSesionBean datosSesion) 
			throws EmpresaException, EmpresaNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando datos de la empresa: " + codEmp);
			conn.abrirConexion(Database.getConnection());
			EmpresaBean empresa = EmpresasDao.consultar(conn, datosSesion.getConfigEmpresa(), codEmp);
			
			if (empresa == null) {
				String msg = "No se ha encontrado la empresa: " + codEmp;
				log.info("consultar() - " + msg);
				throw new EmpresaNotFoundException(msg);
			}
			
			return empresa;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de la empresa: " +  e.getMessage();
			
		    throw new EmpresaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void salvar(EmpresaBean empresa, DatosSesionBean datosSesion) 
		throws EmpresaException, EmpresaConstraintViolationException {
	
		switch (empresa.getEstadoBean()) {
			case Estado.NUEVO:
				crear(empresa, datosSesion);
				break;
			case Estado.MODIFICADO:
				modificar(empresa, datosSesion);
				break;
		}
	}
	
	public static void crear(EmpresaBean empresa, DatosSesionBean datosSesion) 
			throws EmpresaException, EmpresaConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nueva empresa");
			
			conn.abrirConexion(Database.getConnection());
			EmpresasDao.insert(conn, datosSesion.getConfigEmpresa(), empresa);
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear la empresa: " + e.getMessage());
			throw new EmpresaConstraintViolationException("Error creando nueva empresa: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error creando nueva empresa: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new EmpresaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static void modificar(EmpresaBean empresa, DatosSesionBean datosSesion) throws EmpresaException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando Empresa " + empresa.getCodEmp());
			conn.abrirConexion(Database.getConnection());
			EmpresasDao.update(conn, datosSesion.getConfigEmpresa(), empresa);
		}
		catch (SQLException e) {
			String msg = "Error modificando empresa: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new EmpresaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void salvarLogotipo(EmpresaBean empresa, DatosSesionBean datosSesion) 
	throws EmpresaException, EmpresaConstraintViolationException {

		Connection conn = new Connection();

		try {
			log.debug("salvarLogotipo() - Guardando logotipo para la empresa " + empresa.getCodEmp());
			conn.abrirConexion(Database.getConnection());
			EmpresasDao.actualizarLogotipo(conn, datosSesion.getConfigEmpresa(), empresa);
		} catch (SQLException e) {
			String msg = "Error guardando logotipo: " + e.getMessage();
			log.error("salvarLogotipo() - " + msg);

			throw new EmpresaException(msg, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static byte[] obtenerLogo(DatosSesionBean datosSesion, String codEmp) throws EmpresaException {
		Connection conn = new Connection();
		byte [] logo = null;
		try {
			log.debug("obtenerLogo() - Obteniendo logotipo para la empresa " + codEmp);
			conn.abrirConexion(Database.getConnection());
			logo = EmpresasDao.obtenerLogo(conn, datosSesion.getConfigEmpresa(), codEmp);
		} catch (SQLException e) {
			String msg = "Error guardando logotipo: " + e.getMessage();
			log.error("salvarLogotipo() - " + msg);

			throw new EmpresaException(msg, e);
		} finally {
			conn.cerrarConexion();
		}
		return logo;
	}
	
	public static void crearEmpresaDesdeAsistente (DatosSesionBean datosSesion, AsistenteConfiguracionEmpresaBean asistente) throws EmpresaException {
		Connection conn = new Connection();
		
		try {
			log.debug("crearEmpresaDesdeAsistente() - Creando empresa desde asistente");
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			// Crear la empresa
			try {
				log.debug("crearEmpresaDesdeAsistente() - Insertando nueva empresa " + asistente.getEmpresa().getCodEmp());
				EmpresasDao.insert(conn, datosSesion.getConfigEmpresa(), asistente.getEmpresa());
			}
			// Si ya existe actualizar
			catch (KeyConstraintViolationException e) {
				log.debug("crearEmpresaDesdeAsistente() - " + e.getDefaultMessage());
				log.debug("crearEmpresaDesdeAsistente() - Modificando empresa " + asistente.getEmpresa().getCodEmp());
				EmpresasDao.update(conn, datosSesion.getConfigEmpresa(), asistente.getEmpresa());
			}
			
			// Guardar logotipo
			log.debug("crearEmpresaDesdeAsistente() - Guardando logotipo para la empresa " + asistente.getEmpresa().getCodEmp());
			EmpresasDao.actualizarLogotipo(conn, datosSesion.getConfigEmpresa(), asistente.getEmpresa());
			
			// Creamos el cliente
			ClienteBean cliente = ServicioAlmacenes.obtenerCliente(datosSesion, asistente.getAlmacen());
			try {
				log.debug("crearEmpresaDesdeAsistente() - Creando cliente " + cliente.getCodCli() + " para el almacén " + asistente.getAlmacen().getCodAlm());
				ServicioClientes.crear(conn, cliente, datosSesion);
			}
			// Si existe el cliente lo actualizamos
			catch (ClienteConstraintViolationException e) {
				log.debug("crearEmpresaDesdeAsistente() - Modificando cliente " + cliente.getCodCli() + " para el almacén " + asistente.getAlmacen().getCodAlm());
				ServicioClientes.modificar(conn, cliente, datosSesion);
			}
			
			// Asignar al almacén los datos de cliente asociado
			asistente.getAlmacen().setCodCliente(cliente.getCodCli());
			
			
			// Crear almacén
			try {
				log.debug("crearEmpresaDesdeAsistente() - Creando almacén " + asistente.getAlmacen().getCodAlm() + " para la empresa " + asistente.getEmpresa().getCodEmp());
				ServicioAlmacenes.crear(asistente.getAlmacen(), datosSesion, conn);
			}
			// Si existe el almacén modificar únicamente las propiedades solicitadas en el asistente
			catch (AlmacenConstraintViolationException e) {
				log.debug("crearEmpresaDesdeAsistente() - Modificando el almacén " + asistente.getAlmacen().getCodAlm() + " de la empresa " + asistente.getEmpresa().getCodEmp());
				
				AlmacenBean almacen = ServicioAlmacenes.consultar(asistente.getAlmacen().getCodAlm(), datosSesion);
				asistente.getAlmacen().setCodCliente(almacen.getCodCliente());
				asistente.getAlmacen().setActivo(almacen.getActivo());
				
				AlmacenesDao.update(conn, datosSesion.getConfigEmpresa(), asistente.getAlmacen());
				ServicioAlmacenes.modificar(asistente.getAlmacen(), datosSesion, conn);
			}
			
			// Si se marcó la opción de venta al público crear tienda con: mismo almacén, tipo online, tarifa GENERAL y usuario de la sesión
    		if(asistente.isVentaPublico()) {
    			log.debug("crearEmpresaDesdeAsistente() - Creando tienda tipo online para el almacén " + asistente.getAlmacen().getCodAlm());
    			
				Tienda tienda = new Tienda();
				tienda.setEstadoBean(Estado.NUEVO);
				tienda.setCodAlm(asistente.getAlmacen().getCodAlm());
				
				// Asignar tipo de tienda y configuración
				tienda.setIdTipoTienda(new Long(1), datosSesion);
				TipoTiendaBean tipoTienda = ServicioTiposTiendas.consultar(tienda.getIdTipoTienda(), datosSesion);
				IConfigSincronizacion config = ConfigSincronizacionFactory.crear(tipoTienda.getClaseConfiguracion());
				tienda.getBean().setConfiguracion(config.getXmlConfiguracion());
				
				// Asignar medio de pago
				MedioPagoBean medioPagoContadoEfectivo = ServicioMediosPago.consultarEfectivoContado(datosSesion, conn);
				tienda.setCodMedioPago(medioPagoContadoEfectivo.getCodMedioPago());
				tienda.setCodConceptoAlmacen("0000");
				
				// Asignar tarifa general
				TarifaTiendaBean tarifaTienda = new TarifaTiendaBean();
				tarifaTienda.setEstadoBean(Estado.NUEVO);
				tarifaTienda.setCodTarifa(ServicioTarifas.consultarTarifaGeneral(datosSesion).getCodTar());
				tarifaTienda.setVersionTarifa(0L);
				tarifaTienda.setVersionTarifaRevisada(0L);
				tienda.addTarifa(tarifaTienda);
				
				// Asignar usuario
				AlmacenUsuarioBean usuario = new AlmacenUsuarioBean();
				usuario.setEstadoBean(Estado.NUEVO);
				usuario.setCodAlmacen(tienda.getCodAlm());
				usuario.setIdUsuario(datosSesion.getUsuario().getIdUsuario());
				tienda.getUsuarios().add(usuario);
				tienda.setUsuariosCargados(true);
				
				// Crear la tienda
				try {
					ServicioTiendas.crearTienda(datosSesion, conn, tienda);
				}
				// Si existe no hacer nada
				catch (TiendaConstraintViolationException ignore) {}
    		}
    		
    		// Guardar las variables
    		ServicioVariables.grabarVariableNivelGeneral(Variables.ARTICULOS_DESGLOSE1_TITULO, asistente.getTituloDesglose1());
    		ServicioVariables.grabarVariableNivelGeneral(Variables.ARTICULOS_DESGLOSE2_TITULO, asistente.getTituloDesglose2());
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			log.debug("crearEmpresaDesdeAsistente() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			String msg = "Error creando empresa desde asistente: " + e.getMessage();
			log.error("crearEmpresaDesdeAsistente() - " + msg);
			
			throw new EmpresaException(msg, e);
		}
		catch (Exception e) {
			log.debug("crearEmpresaDesdeAsistente() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			String msg = "Error creando empresa desde asistente: " + e.getMessage();
			log.error("crearEmpresaDesdeAsistente() - " + msg);
			
			throw new EmpresaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
		
		try {
			// Si el sincronizador está arrancado, lo reiniciamos para que tome 
			// los cambios de la tienda creada
			if (SincronizadorTiendas.getInstance().isArrancado()) {
				SincronizadorTiendas.getInstance().reiniciar();
			}
		}
		catch (Exception ignore) {
		}
	}
}
