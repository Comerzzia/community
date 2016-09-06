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

package com.comerzzia.servicios.general.articulos.fotos;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.general.articulos.fotos.FotoArticuloBean;
import com.comerzzia.persistencia.general.articulos.fotos.FotosArticulosDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioFotosArticulos {

	protected static Logger log = Logger
			.getMLogger(ServicioFotosArticulos.class);

	public static List<FotoArticuloBean> consultar(String codArticulo,
			DatosSesionBean datosSesion) throws FotoArticuloException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando fotos del artículo "
					+ codArticulo);

			conn.abrirConexion(Database.getConnection());
			return FotosArticulosDao.consultar(conn, datosSesion
					.getConfigEmpresa(), codArticulo);
		} catch (SQLException e) {
			String msg = "Error consultando fotos: " + e.getMessage();
			log.error("consultar() - " + msg);

			throw new FotoArticuloException(msg, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static FotoArticuloBean consultar(String codArticulo,String tipoFoto, DatosSesionBean datosSesion)
			throws FotoArticuloException {
		Connection conn = new Connection();
		try {
			log.debug("consultar() - Consultando foto " + tipoFoto + " del artículo " + codArticulo);

			conn.abrirConexion(Database.getConnection());
			return FotosArticulosDao.consultar(conn, datosSesion.getConfigEmpresa(), codArticulo, tipoFoto);
		} 
		catch (SQLException e) {
			String msg = "Error consultando foto: " + e.getMessage();
			log.error("consultar() - " + msg);
			throw new FotoArticuloException(msg, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}

	public static void salvar(FotoArticuloBean foto,
			DatosSesionBean datosSesion, Connection conn)
			throws FotoArticuloException,
			FotoArticuloConstraintViolationException {

		switch (foto.getEstadoBean()) {
		case Estado.NUEVO:
			crear(foto, datosSesion, conn);
			break;

		case Estado.MODIFICADO:
			modificar(foto, datosSesion, conn);
			break;

		case Estado.BORRADO:
			eliminar(foto, datosSesion, conn);
		}
	}

	public static void crear(FotoArticuloBean foto,
			DatosSesionBean datosSesion, Connection conn)
			throws FotoArticuloException,
			FotoArticuloConstraintViolationException {

		try {
			log.debug("crear() - Creando nueva foto " + foto.getTipoFoto()
					+ " para el artículo " + foto.getCodArticulo());

			FotosArticulosDao
					.insert(conn, datosSesion.getConfigEmpresa(), foto);
		} catch (KeyConstraintViolationException e) {
			log.debug("crear() - Modificando foto " + foto.getTipoFoto()
					+ " del artículo " + foto.getCodArticulo());

			try {
				FotosArticulosDao.update(conn, datosSesion.getConfigEmpresa(),
						foto);
			} catch (SQLException e1) {
				String msg = "Error modificando foto: " + e.getMessage();
				log.error("crear() - " + msg);

				throw new FotoArticuloException(msg, e);
			}
		} catch (SQLException e) {
			String msg = "Error creando nueva foto: " + e.getMessage();
			log.error("crear() - " + msg);

			throw new FotoArticuloException(msg, e);
		}
	}

	public static void modificar(FotoArticuloBean foto,
			DatosSesionBean datosSesion, Connection conn)
			throws FotoArticuloException {

		try {
			log.debug("modificar() - Modificando foto " + foto.getTipoFoto()
					+ " del artículo " + foto.getCodArticulo());

			FotosArticulosDao
					.update(conn, datosSesion.getConfigEmpresa(), foto);
		} catch (SQLException e) {
			String msg = "Error modificando foto: " + e.getMessage();
			log.error("modificar() - " + msg);

			throw new FotoArticuloException(msg, e);
		}
	}

	public static void eliminar(FotoArticuloBean foto,
			DatosSesionBean datosSesion, Connection conn)
			throws FotoArticuloException,
			FotoArticuloConstraintViolationException {

		try {
			log.debug("eliminar() - Eliminando foto " + foto.getTipoFoto()
					+ " del artículo " + foto.getCodArticulo());

			FotosArticulosDao
					.delete(conn, datosSesion.getConfigEmpresa(), foto);
		} catch (ForeingKeyConstraintViolationException e) {
			log.info("eliminar() - No se ha podido eliminar la foto: "
					+ e.getMessage());
			throw new FotoArticuloConstraintViolationException(
					"Error eliminando foto: " + e.getDefaultMessage());
		} catch (SQLException e) {
			String msg = "Error eliminando foto: " + e.getMessage();
			log.error("eliminar() - " + msg);

			throw new FotoArticuloException(msg, e);
		}
	}
}
