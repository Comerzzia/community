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

package com.comerzzia.servicios.general.tiendas.tarifas;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.general.tiendas.tarifas.TarifaTiendaBean;
import com.comerzzia.persistencia.general.tiendas.tarifas.TarifasTiendasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.tiendas.Tienda;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioTarifasTiendas {

	protected static Logger log = Logger
			.getMLogger(ServicioTarifasTiendas.class);

	public static List<TarifaTiendaBean> consultar(String codAlmacen,
			DatosSesionBean datosSesion) throws TarifaTiendaException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando tarifas de la tienda "
					+ codAlmacen);
			conn.abrirConexion(Database.getConnection());

			return TarifasTiendasDao.consultar(conn, datosSesion
					.getConfigEmpresa(), codAlmacen);
		} catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar tarifas de la tienda "
					+ codAlmacen + ": " + e.getMessage();

			throw new TarifaTiendaException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}
	
	public static TarifaTiendaBean consultarTarifa (String codAlmacen,String codTarifa, DatosSesionBean datosSesion) throws TarifaTiendaException{
		Connection conn = new Connection();

		try {
			log.debug("consultarTarifa() - Consultando tarifa: " + codTarifa+ " de la tienda " + codAlmacen);
			conn.abrirConexion(Database.getConnection());

			return TarifasTiendasDao.consultarTarifa(conn, datosSesion.getConfigEmpresa(), codAlmacen, codTarifa);
		} catch (SQLException e) {
			log.error("consultarTarifa() - " + e.getMessage());
			String mensaje = "Error al consultar la tarifa: " + codTarifa +" de la tienda " + codAlmacen + ": " + e.getMessage();

			throw new TarifaTiendaException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static void actualizarTarifasTiendas(Connection conn,
			Tienda tienda, DatosSesionBean datosSesion)
			throws TarifaTiendaException,
			TarifaTiendaConstraintViolationException {

		// Tarifas
		if (tienda.isTarifasCargadas()) {
			for (int i = 0; i < tienda.getNumCajas(); i++) {
				salvar(conn, tienda.getTarifa(i), datosSesion);
			}
		}
	}

	public static void salvar(Connection conn, TarifaTiendaBean tarifa,
			DatosSesionBean datosSesion) throws TarifaTiendaException,
			TarifaTiendaConstraintViolationException {

		switch (tarifa.getEstadoBean()) {
		case Estado.NUEVO:
			crear(conn, tarifa, datosSesion);
			break;
			
		case Estado.MODIFICADO:
			modificar(conn, tarifa, datosSesion);
			break;

		case Estado.BORRADO:
			eliminar(conn, tarifa.getCodAlmacen(), tarifa.getCodTarifa(),
					datosSesion);
		}
	}


	public static void crear(Connection conn, TarifaTiendaBean tarifa,
			DatosSesionBean datosSesion) throws TarifaTiendaException,
			TarifaTiendaConstraintViolationException {

		try {
			log.debug("crear() - Creando nueva tarifa en la tienda "
					+ tarifa.getCodAlmacen());
			TarifasTiendasDao.insert(conn, datosSesion.getConfigEmpresa(),
					tarifa);
		} catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear la tarifa de la tienda "
					+ tarifa.getCodAlmacen() + ": " + e.getMessage());
			throw new TarifaTiendaConstraintViolationException(
					"Error creando nueva tarifa de la tienda "
							+ tarifa.getCodAlmacen() + ": "
							+ e.getDefaultMessage());
		} catch (SQLException e) {
			String msg = "Error creando nueva tarifa de la tienda "
					+ tarifa.getCodAlmacen() + ": " + e.getMessage();
			log.error("crear() - " + msg);

			throw new TarifaTiendaException(msg, e);
		}
	}
	
	private static void modificar(Connection conn, TarifaTiendaBean tarifa,
			DatosSesionBean datosSesion) throws TarifaTiendaConstraintViolationException, TarifaTiendaException {
		try {
			log.debug("modificar() - Modificando tarifa : " + tarifa.getCodTarifa() + " en la tienda " + tarifa.getCodAlmacen());
			TarifasTiendasDao.update(conn, datosSesion.getConfigEmpresa(), tarifa);
		} catch (KeyConstraintViolationException e) {
			log.info("modificar() - No se ha podido modificar la tarifa "+ tarifa.getCodTarifa() +" de la tienda " + tarifa.getCodAlmacen() + ": " + e.getMessage());
			throw new TarifaTiendaConstraintViolationException(
					"Error modificando la tarifa: " + tarifa.getCodTarifa()+" de la tienda " + tarifa.getCodAlmacen() + ": " + e.getDefaultMessage());
		} catch (SQLException e) {
			String msg = "Error modificando la tarifa " + tarifa.getCodTarifa()+" de la tienda " + tarifa.getCodAlmacen() + ": " + e.getMessage();
			log.error("modificar() - " + msg);

			throw new TarifaTiendaException(msg, e);
		}
		
	}

	public static void eliminar(Connection conn, String codAlmacen,
			String codTarifa, DatosSesionBean datosSesion)
			throws TarifaTiendaException,
			TarifaTiendaConstraintViolationException {

		try {
			log.debug("eliminar() - Eliminando tarifa " + codTarifa
					+ " de la tienda " + codAlmacen);
			TarifasTiendasDao.delete(conn, datosSesion.getConfigEmpresa(),
					codAlmacen, codTarifa);
		} catch (ForeingKeyConstraintViolationException e) {
			log.info("eliminar() - No se ha podido eliminar la tarifa: "
					+ e.getMessage());
			throw new TarifaTiendaConstraintViolationException(
					"Error eliminando caja: " + e.getDefaultMessage());
		} catch (SQLException e) {
			String msg = "Error eliminando caja: " + e.getMessage();
			log.error("eliminar() - " + msg);

			throw new TarifaTiendaException(msg, e);
		}
	}
}
