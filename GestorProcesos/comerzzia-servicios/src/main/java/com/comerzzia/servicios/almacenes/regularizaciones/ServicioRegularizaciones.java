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

package com.comerzzia.servicios.almacenes.regularizaciones;

import java.sql.SQLException;

import com.comerzzia.persistencia.almacenes.regularizaciones.ParametrosBuscarRegularizacionesBean;
import com.comerzzia.persistencia.almacenes.regularizaciones.RegularizacionesDao;
import com.comerzzia.servicios.almacenes.stocks.ServicioStocksAlmacenes;
import com.comerzzia.servicios.almacenes.stocks.StockAlmacenException;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioRegularizaciones {

	protected static Logger log = Logger
			.getMLogger(ServicioRegularizaciones.class);

	public static PaginaResultados consultar(
			ParametrosBuscarRegularizacionesBean param,
			DatosSesionBean datosSesion) throws RegularizacionException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando Regularizaciones");
			conn.abrirConexion(Database.getConnection());
			return RegularizacionesDao.consultar(conn, datosSesion
					.getConfigEmpresa(), param);
		} catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar regularizaciones: "
					+ e.getMessage();

			throw new RegularizacionException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static Regularizacion consultar(Long idRegularizacion,
			DatosSesionBean datosSesion) throws RegularizacionException,
			RegularizacionNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos de la regularización: "
					+ idRegularizacion);
			conn.abrirConexion(Database.getConnection());
			Regularizacion regularizacion = new Regularizacion(
					RegularizacionesDao.consultar(conn, datosSesion
							.getConfigEmpresa(), idRegularizacion));

			if (regularizacion == null) {
				String msg = "No se ha encontrado la regularización con identificador: "
						+ idRegularizacion;
				log.info("consultar() - " + msg);
				throw new RegularizacionNotFoundException(msg);
			}

			return regularizacion;
		} catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de una regularización: "
					+ e.getMessage();

			throw new RegularizacionException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static void salvar(Regularizacion regularizacion,
			DatosSesionBean datosSesion) throws RegularizacionException,
			RegularizacionConstraintViolationException {

		switch (regularizacion.getEstadoBean()) {
		case Estado.NUEVO:
			crear(regularizacion, datosSesion);
		}
	}

	public static void crear(Regularizacion regularizacion,
			DatosSesionBean datosSesion) throws RegularizacionException,
			RegularizacionConstraintViolationException {
		Connection conn = new Connection();

		try {
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();

			crear(regularizacion, datosSesion, conn);

			conn.commit();
			conn.finalizaTransaccion();
		} catch (SQLException e) {
			conn.deshacerTransaccion();

			String msg = "Error creando regularización: " + e.getMessage();
			log.error("crear() - " + msg);

			throw new RegularizacionException(msg, e);
		} finally {
			conn.cerrarConexion();
		}
	}
	
	public static void crear(Regularizacion regularizacion,
			DatosSesionBean datosSesion, Connection conn) throws RegularizacionException,
			RegularizacionConstraintViolationException {
		
		try {
			log.debug("crear() - Creando nueva Regularización");
			
			regularizacion.setIdRegularizacion(ContadorRegularizaciones
					.obtenerContador(conn));
			RegularizacionesDao.insert(conn, datosSesion.getConfigEmpresa(),
					regularizacion.getBean());

			// Actualizamos el stock del artículo en el almacén
			ServicioStocksAlmacenes.sumarStock(conn, regularizacion
					.getCodAlmacen(), regularizacion.getBean(), datosSesion);

		} catch (ContadorException e) {
			conn.deshacerTransaccion();

			String msg = "Error creando regularización: " + e.getMessage();
			log.error("crear() - " + msg);

			throw new RegularizacionException(msg, e);
		} catch (SQLException e) {
			conn.deshacerTransaccion();

			String msg = "Error creando regularización: " + e.getMessage();
			log.error("crear() - " + msg);

			throw new RegularizacionException(msg, e);
		} catch (StockAlmacenException e) {
			conn.deshacerTransaccion();

			String msg = "Error creando regularización: " + e.getMessage();
			log.error("crear() - " + msg);

			throw new RegularizacionException(msg, e);
		}
	}
}
