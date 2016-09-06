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

package com.comerzzia.servicios.general.proveedores;

import java.sql.SQLException;
import java.util.Date;

import com.comerzzia.persistencia.general.proveedores.ParametrosBuscarProveedoresBean;
import com.comerzzia.persistencia.general.proveedores.ProveedorBean;
import com.comerzzia.persistencia.general.proveedores.ProveedoresDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioProveedores {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioProveedores.class);

	public static PaginaResultados consultar(
			ParametrosBuscarProveedoresBean param, DatosSesionBean datosSesion)
			throws ProveedorException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando proveedores");
			conn.abrirConexion(Database.getConnection());
			return ProveedoresDao.consultar(conn, datosSesion
					.getConfigEmpresa(), param);
		} catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar proveedores: "
					+ e.getMessage();

			throw new ProveedorException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static ProveedorBean consultar(String codPro,
			DatosSesionBean datosSesion) throws ProveedorException,
			ProveedorNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos del proveedor: "
					+ codPro);
			conn.abrirConexion(Database.getConnection());
			ProveedorBean proveedor = ProveedoresDao.consultar(conn,
					datosSesion.getConfigEmpresa(), codPro);

			if (proveedor == null) {
				String msg = "No se ha encontrado el proveedor con identificador: "
						+ codPro;
				log.info("consultar() - " + msg);
				throw new ProveedorNotFoundException(msg);
			}

			return proveedor;
		} catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un proveedor: "
					+ e.getMessage();

			throw new ProveedorException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static void salvar(ProveedorBean proveedor,
			DatosSesionBean datosSesion) throws ProveedorException,
			ProveedorConstraintViolationException {

		switch (proveedor.getEstadoBean()) {
		case Estado.NUEVO:
			crear(proveedor, datosSesion);
			break;

		case Estado.MODIFICADO:
			modificar(proveedor, datosSesion);
			break;

		case Estado.BORRADO:
			eliminar(proveedor.getCodPro(), datosSesion);
		}
	}

	public static void crear(ProveedorBean proveedor,
			DatosSesionBean datosSesion) throws ProveedorException,
			ProveedorConstraintViolationException {
		Connection conn = new Connection();

		try {
			log.debug("crear() - Creando nuevo Proveedor");

			conn.abrirConexion(Database.getConnection());

			// Indicamos que la fecha del alta será hoy
			proveedor.setFechaAlta(new Date());

			// Si se da de alta inactivo ponemos fecha de baja
			if (!proveedor.isActivo()) {
				proveedor.setFechaBaja(new Date());
			}

			ProveedoresDao.insert(conn, datosSesion.getConfigEmpresa(),
					proveedor);
		} catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear el proveedor: "
					+ e.getMessage());
			throw new ProveedorConstraintViolationException(e
					.getDefaultMessage());
		} catch (SQLException e) {
			String msg = "Error creando proveedor: " + e.getMessage();
			log.error("crear() - " + msg);

			throw new ProveedorException(msg, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static void modificar(ProveedorBean proveedor,
			DatosSesionBean datosSesion) throws ProveedorException {
		Connection conn = new Connection();

		try {
			log.debug("modificar() - Modificando Proveedor "
					+ proveedor.getCodPro());
			conn.abrirConexion(Database.getConnection());

			// Si el proveedor está inactivo y antes no tenía fecha de baja se
			// pone la de hoy
			if (!proveedor.isActivo() && proveedor.getFechaBaja() == null) {
				proveedor.setFechaBaja(new Date());
			}
			// Si el proveedor está activo y antes estaba de baja se pone la
			// fecha
			// de baja a nula
			else if (proveedor.isActivo() && proveedor.getFechaBaja() != null) {
				proveedor.setFechaBaja(null);
			}

			ProveedoresDao.update(conn, datosSesion.getConfigEmpresa(),
					proveedor);
		} catch (SQLException e) {
			String msg = "Error modificando proveedor: " + e.getMessage();
			log.error("modificar() - " + msg);

			throw new ProveedorException(msg, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static void eliminar(String codPro, DatosSesionBean datosSesion)
			throws ProveedorException, ProveedorConstraintViolationException {
		Connection conn = new Connection();

		try {
			log.debug("eliminar() - Eliminando Proveedor " + codPro);
			conn.abrirConexion(Database.getConnection());
			ProveedoresDao.delete(conn, datosSesion.getConfigEmpresa(), codPro);
		} catch (ForeingKeyConstraintViolationException e) {
			log.info("eliminar() - No se ha podido eliminar el proveedor: "
					+ e.getMessage());
			throw new ProveedorConstraintViolationException(e
					.getDefaultMessage());
		} catch (SQLException e) {
			String msg = "Error eliminando proveedor: " + e.getMessage();
			log.error("eliminar() - " + msg);

			throw new ProveedorException(msg, e);
		} finally {
			conn.cerrarConexion();
		}
	}
}
