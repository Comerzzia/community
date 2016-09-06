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

package com.comerzzia.servicios.general.almacenes;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.general.almacenes.AlmacenBean;
import com.comerzzia.persistencia.general.almacenes.AlmacenesDao;
import com.comerzzia.persistencia.general.almacenes.ParametrosBuscarAlmacenesBean;
import com.comerzzia.persistencia.general.almacenes.articulos.AlmacenArticuloBean;
import com.comerzzia.persistencia.general.almacenes.articulos.AlmacenesArticulosDao;
import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.general.series.SerieBean;
import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.almacenes.articulos.AlmacenArticuloException;
import com.comerzzia.servicios.general.clientes.ClienteConstraintViolationException;
import com.comerzzia.servicios.general.clientes.ClienteException;
import com.comerzzia.servicios.general.clientes.ServicioClientes;
import com.comerzzia.servicios.general.series.SerieConstraintViolationException;
import com.comerzzia.servicios.general.series.SerieException;
import com.comerzzia.servicios.general.series.ServicioSeries;
import com.comerzzia.servicios.ventas.tarifas.ServicioTarifas;
import com.comerzzia.servicios.ventas.tarifas.TarifaException;
import com.comerzzia.servicios.ventas.tarifas.TarifaNotFoundException;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioAlmacenes {

	protected static Logger log = Logger.getMLogger(ServicioAlmacenes.class);

	public static PaginaResultados consultar(
			ParametrosBuscarAlmacenesBean param, DatosSesionBean datosSesion)
			throws AlmacenException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando almacenes");
			conn.abrirConexion(Database.getConnection());
			return AlmacenesDao.consultar(conn, datosSesion.getConfigEmpresa(),
					param);
		} catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar almacenes: " + e.getMessage();

			throw new AlmacenException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static AlmacenBean consultar(String codAlm,
			DatosSesionBean datosSesion) throws AlmacenException,
			AlmacenNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos del almacén: " + codAlm);
			conn.abrirConexion(Database.getConnection());
			AlmacenBean almacen = AlmacenesDao.consultar(conn, datosSesion
					.getConfigEmpresa(), codAlm);

			if (almacen == null) {
				String msg = "No se ha encontrado el almacén con identificador: "
						+ codAlm;
				log.info("consultar() - " + msg);
				throw new AlmacenNotFoundException(msg);
			}

			return almacen;
		} catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un almacén: "
					+ e.getMessage();

			throw new AlmacenException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static List<AlmacenBean> consultar(DatosSesionBean datosSesion) throws AlmacenException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando todos los almacenes");
			conn.abrirConexion(Database.getConnection());
			return AlmacenesDao.consultar(conn, datosSesion.getConfigEmpresa());
		} catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar todos los almacenes: "
					+ e.getMessage();

			throw new AlmacenException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}
	
	public static AlmacenBean consultarPorCliente(DatosSesionBean datosSesion, String codCliente)
			throws AlmacenException, AlmacenNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultarPorCliente() - Consultando datos del almacén a partir del cliente asignado: " + codCliente);
			
			conn.abrirConexion(Database.getConnection());
			
			return AlmacenesDao.consultarPorCliente(conn, datosSesion.getConfigEmpresa(), codCliente);
		}
		catch (SQLException e) {
			String mensaje = "Error consultando almacén por cliente " + codCliente + ": " + e.getMessage();
			log.error("consultarPorCliente() - " + mensaje);
	
			throw new AlmacenException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}	
	
	public static void salvar(AlmacenBean almacen, DatosSesionBean datosSesion)
			throws AlmacenException, AlmacenConstraintViolationException {

		switch (almacen.getEstadoBean()) {
		case Estado.NUEVO:
			crear(almacen, datosSesion);
			break;

		case Estado.MODIFICADO:
			modificar(almacen, datosSesion);
			break;

		case Estado.BORRADO:
			eliminar(almacen.getCodAlm(), datosSesion);
		}
	}

	public static void crear(AlmacenBean almacen, DatosSesionBean datosSesion)
			throws AlmacenException, AlmacenConstraintViolationException {
		Connection conn = new Connection();

		try {
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			crear(almacen, datosSesion, conn);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			log.debug("crear() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			String msg = "Error creando nuevo almacén: " + e.getMessage();
			log.error("crear() - " + msg);

			throw new AlmacenException(msg, e);
		}
		catch (AlmacenConstraintViolationException e) {
			log.debug("crear() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		catch (AlmacenException e) {
			log.debug("crear() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static void crear(AlmacenBean almacen, DatosSesionBean datosSesion, Connection conn) 
			throws AlmacenException, AlmacenConstraintViolationException {

		log.debug("crear() - Creando nuevo Almacén");
		
		// Si no se tiene cliente asociado al almacén, crearlo con los mismos datos
		if (almacen.getCodCliente() == null || almacen.getCodCliente().isEmpty()) {
			ClienteBean cliente = obtenerCliente(datosSesion, almacen);

			try {
				// Creación del Cliente
				ServicioClientes.crear(conn, cliente, datosSesion);
				
				// Asignar al almacén los datos de cliente asociado
				almacen.setCodCliente(cliente.getCodCli());
				almacen.setDesCliente(cliente.getDesCli());
			}
			catch (ClienteConstraintViolationException e) {
				String msg = "No se ha podido crear el cliente: " + e.getMessage();
				log.error("crear() - " + msg);

				throw new AlmacenConstraintViolationException(e.getMessage());
			}
			catch (ClienteException e) {
				String msg = "No se ha podido crear el cliente: " + e.getMessage();
				log.error("crear() - " + msg);

				throw new AlmacenException(msg, e);
			}
		}
		
		// Crear el almacén
		try {
			AlmacenesDao.insert(conn, datosSesion.getConfigEmpresa(), almacen);
		}
		catch (KeyConstraintViolationException e) {
			String msg = null;
			log.info("crear() - No se ha podido crear el almacén: " + e.getMessage());
			
			// Comprobar si la excepción se produce por violación de la PK o de la UK
			try {
				if(AlmacenesDao.consultarPorCliente(conn, datosSesion.getConfigEmpresa(), almacen.getCodCliente()) != null) {
					msg = "Ya existe un registro con el mismo cliente asociado en el sistema";
				}
				else {
					msg = e.getDefaultMessage();
				}
			}
			catch (SQLException ignore) {
				msg = e.getDefaultMessage();
			}
			
			throw new AlmacenConstraintViolationException("Error creando nuevo almacén: " + msg);
		}
		catch (SQLException e) {
			String msg = "Error creando nuevo almacén: " + e.getMessage();
			log.error("crear() - " + msg);

			throw new AlmacenException(msg, e);
		}
		
		// Crear la serie del almacén
		SerieBean serie = new SerieBean();
		serie.setCodSerie(almacen.getCodAlm());
		serie.setDesSerie(almacen.getDesAlm());
		try {
			ServicioSeries.crear(serie, datosSesion, conn);
		}
		catch (SerieConstraintViolationException ignore) { 
			try {
				// Si existe actualizamos su descripción con la del nuevo almacén
				ServicioSeries.modificar(serie, datosSesion, conn);
			} 
			catch (SerieException e) {
				String msg = "Error creando la serie del nuevo almacén: " + e.getMessage();
				log.error("crear() - " + msg);

				throw new AlmacenException(msg, e);
			}
		}
		catch (SerieException e) {
			String msg = "Error creando la serie del nuevo almacén: " + e.getMessage();
			log.error("crear() - " + msg);

			throw new AlmacenException(msg, e);
		}
	}
	
	public static ClienteBean obtenerCliente(DatosSesionBean datosSesion, AlmacenBean almacen) throws AlmacenException {
		// Inicializar el cliente con los datos del almacén
		ClienteBean cliente = new ClienteBean();
		cliente.setCodCli(almacen.getCodAlm());
		cliente.setDesCli(almacen.getDesAlm());
		cliente.setNombreComercial(almacen.getDesAlm());
		cliente.setCif(almacen.getCodAlm());
		cliente.setDomicilio(almacen.getDomicilio());
		cliente.setPoblacion(almacen.getPoblacion());
		cliente.setProvincia(almacen.getProvincia());
		cliente.setCp(almacen.getCp());
		cliente.setTelefono1(almacen.getTelefono1());
		cliente.setTelefono2(almacen.getTelefono2());
		cliente.setFax(almacen.getFax());
		cliente.setPersonaContacto(almacen.getPersonaContacto());
		
		// Obtener la tarifa GENERAL, a partir de la cuál se asignará el tratamiento de impuestos al cliente
		try {
			TarifaBean tarifa = ServicioTarifas.consultarTarifaGeneral(datosSesion);
			cliente.setIdTratImp(tarifa.getIdTratImpuestos());
		}
		catch (TarifaNotFoundException e) {
			String msg = "Error consultando tarifa general: "+ e.getMessage();
			log.error("crear() - " + msg);

			throw new AlmacenException(msg, e);
		}
		catch (TarifaException e) {
			String msg = "Error consultando tarifa general: " + e.getMessage();
			log.error("crear() - " + msg);

			throw new AlmacenException(msg, e);
		}
		
		return cliente;
	}
	
	
	public static void modificar(AlmacenBean almacen, DatosSesionBean datosSesion) 
			throws AlmacenException {
		Connection conn = new Connection();

		try {
			conn.abrirConexion(Database.getConnection());
			modificar(almacen, datosSesion, conn);
		} 
		catch (SQLException e) {
			String msg = "Error modificando almacén: " + e.getMessage();
			log.error("modificar() - " + msg);

			throw new AlmacenException(msg, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void modificar(AlmacenBean almacen, DatosSesionBean datosSesion, Connection conn) 
			throws AlmacenException {
		try {
			log.debug("modificar() - Modificando Almacén " + almacen.getCodAlm());
			
			// Actualizamos datos del almacén
			AlmacenesDao.update(conn, datosSesion.getConfigEmpresa(), almacen);
			
			try {
				// Modificamos la serie del almacén
				SerieBean serie = new SerieBean();
				serie.setCodSerie(almacen.getCodAlm());
				serie.setDesSerie(almacen.getDesAlm());
				ServicioSeries.modificar(serie, datosSesion, conn);
			} 
			catch (Exception ignore) {
			}
		} 
		catch (SQLException e) {
			String msg = "Error modificando almacén: " + e.getMessage();
			log.error("modificar() - " + msg);

			throw new AlmacenException(msg, e);
		}
	}

	
	public static void eliminar(String codAlm, DatosSesionBean datosSesion)
			throws AlmacenException, AlmacenConstraintViolationException {
		Connection conn = new Connection();

		try {
			log.debug("eliminar() - Eliminando Almacén " + codAlm);
			conn.abrirConexion(Database.getConnection());
			AlmacenesDao.delete(conn, datosSesion.getConfigEmpresa(), codAlm);
		} catch (ForeingKeyConstraintViolationException e) {
			log.info("eliminar() - No se ha podido eliminar el almacén: "
					+ e.getMessage());
			throw new AlmacenConstraintViolationException(
					"Error eliminando almacén: " + e.getDefaultMessage());
		} catch (SQLException e) {
			String msg = "Error eliminando almacén: " + e.getMessage();
			log.error("eliminar() - " + msg);

			throw new AlmacenException(msg, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static synchronized void actualizarStockMinimo(Connection conn,
			Double stockMinimo, String codArt, String codAlm, String desglose1,
			String desglose2, ConfigEmpresaBean config)
			throws AlmacenArticuloException {
		try {

			log
					.debug("actualizarStockMinimo() - Obteniendo todos los datos del almacén del artículo");
			AlmacenArticuloBean almacenArticulo = AlmacenesArticulosDao
					.consultar(conn, config, codArt, codAlm, desglose1,
							desglose2);

			if (almacenArticulo == null) {
				almacenArticulo = new AlmacenArticuloBean(codAlm, codArt,
						desglose1, desglose2);
			}

			almacenArticulo.setStockMinimo(stockMinimo);

			if (AlmacenesArticulosDao.updateStockMinimo(conn, config,
					almacenArticulo) == 0) {
				AlmacenesArticulosDao.insert(conn, config, almacenArticulo);
			}

		} catch (SQLException e) {
			String msg = "Error actualizando stock minimo: " + e.getMessage();
			log.error("actualizarStockMinimo() - " + msg);

			throw new AlmacenArticuloException(msg, e);
		}
	}

	public static synchronized void actualizarStockMaximo(Connection conn,
			Double stockMaximo, String codArt, String codAlm, String desglose1,
			String desglose2, ConfigEmpresaBean config)
			throws AlmacenArticuloException {
		try {

			log
					.debug("actualizarStockMaximo() - Obteniendo todos los datos del almacén del artículo");
			AlmacenArticuloBean almacenArticulo = AlmacenesArticulosDao
					.consultar(conn, config, codArt, codAlm, desglose1,
							desglose2);

			if (almacenArticulo == null) {
				almacenArticulo = new AlmacenArticuloBean(codAlm, codArt,
						desglose1, desglose2);
			}

			almacenArticulo.setStockMaximo(stockMaximo);

			if (AlmacenesArticulosDao.updateStockMaximo(conn, config,
					almacenArticulo) == 0) {
				AlmacenesArticulosDao.insert(conn, config, almacenArticulo);
			}

		} catch (SQLException e) {
			String msg = "Error actualizando stock maximo: " + e.getMessage();
			log.error("actualizarStockMaximo() - " + msg);

			throw new AlmacenArticuloException(msg, e);
		}
	}

	public static List<AlmacenArticuloBean> consultarAlmacenesArticulo(String codArticulo, DatosSesionBean datosSesion)
			throws AlmacenArticuloException {
		Connection conn = new Connection();

		try {
			log.debug("consultarAlmacenesArticulo() - Consultando almacenes del articulo " + codArticulo);
			conn.abrirConexion(Database.getConnection());
			return AlmacenesArticulosDao.consultar(conn, datosSesion.getConfigEmpresa(), codArticulo);
		} catch (SQLException e) {
			log.error("consultarAlmacenesArticulo() - " + e.getMessage());
			String mensaje = "Error al consultar almacene del articulo: " + e.getMessage();

			throw new AlmacenArticuloException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static boolean existe(String codAlm, DatosSesionBean datosSesion)
			throws AlmacenException, AlmacenNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("existe() - Comprobando si existe el almacén: " + codAlm);
			conn.abrirConexion(Database.getConnection());
			return AlmacenesDao.consultar(conn, datosSesion.getConfigEmpresa(),
					codAlm) != null;

		} catch (SQLException e) {
			String mensaje = "Error al comprobar si existe el almacén "
					+ codAlm + ": " + e.getMessage();
			log.error("existe() - " + mensaje);

			throw new AlmacenException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}
}
