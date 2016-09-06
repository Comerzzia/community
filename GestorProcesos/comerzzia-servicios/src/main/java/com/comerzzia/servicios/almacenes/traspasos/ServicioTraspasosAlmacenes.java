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

package com.comerzzia.servicios.almacenes.traspasos;

import java.sql.SQLException;

import com.comerzzia.persistencia.almacenes.traspasos.ParametrosBuscarTraspasosAlmacenesBean;
import com.comerzzia.persistencia.almacenes.traspasos.TraspasoAlmacenesBean;
import com.comerzzia.persistencia.almacenes.traspasos.TraspasosAlmacenesDao;
import com.comerzzia.persistencia.almacenes.traspasos.detalles.DetalleTraspasoAlmacenesBean;
import com.comerzzia.persistencia.almacenes.traspasos.detalles.DetallesTraspasosAlmacenesDao;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioTraspasosAlmacenes {

protected static Logger log = Logger.getMLogger(ServicioTraspasosAlmacenes.class);
	
	public static PaginaResultados consultar(ParametrosBuscarTraspasosAlmacenesBean param, DatosSesionBean datosSesion) 
			throws TraspasoAlmacenesException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando traspasos");
			conn.abrirConexion(Database.getConnection());
			
			return TraspasosAlmacenesDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando traspasos: " +  e.getMessage();
			
            throw new TraspasoAlmacenesException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static TraspasoAlmacenesBean consultar(Long idTraspaso, DatosSesionBean datosSesion) 
			throws TraspasoAlmacenesException, TraspasoAlmacenesNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando datos del traspaso: " + idTraspaso);
			conn.abrirConexion(Database.getConnection());
			TraspasoAlmacenesBean traspaso = TraspasosAlmacenesDao.consultar(conn, datosSesion.getConfigEmpresa(), idTraspaso);

			if (traspaso == null) {
				String msg = "No se ha encontrado el traspaso con identificador: " + idTraspaso;
				log.info("consultar() - " + msg);
				
				throw new TraspasoAlmacenesNotFoundException(msg);
			}

			return traspaso;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando datos de un traspaso: " + e.getMessage();

			throw new TraspasoAlmacenesException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void salvar(TraspasoAlmacenesBean traspaso, DatosSesionBean datosSesion) throws TraspasoAlmacenesConstraintViolationException, TraspasoAlmacenesException {
		switch (traspaso.getEstadoBean()) {
			case Estado.NUEVO:
				crear(traspaso, datosSesion);
				break;
			      
			case Estado.MODIFICADO:
				modificar(traspaso, datosSesion);
				break;
			      
			case Estado.BORRADO:
				eliminar(traspaso.getIdTraspaso(), datosSesion);
		}
	}
	
	public static void crear(TraspasoAlmacenesBean traspaso, DatosSesionBean datosSesion) throws TraspasoAlmacenesConstraintViolationException, TraspasoAlmacenesException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nuevo traspaso de almacenes");
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			//obtenemos el identificador
			traspaso.setIdTraspaso(ContadorTraspasosAlmacenes.obtenerContadorId(conn));
			
			TraspasosAlmacenesDao.insert(conn, datosSesion.getConfigEmpresa(), traspaso);
			actualizarDetalles(conn, datosSesion, traspaso);
			
			conn.finalizaTransaccion();
		}
		catch (ContadorException e) {
			try {
				conn.rollback();
				log.debug("crear() - rollback");
			}
			catch (Exception ignore) {
				log.error("crear() - Error al hacer rollback");
			}
			
			String msg = "Error creando traspaso de almacenes: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new TraspasoAlmacenesException(msg, e);
		}
		catch (KeyConstraintViolationException e) {
			try {
				conn.rollback();
				log.debug("crear() - rollback");
			}
			catch (Exception ignore) {
				log.error("crear() - Error al hacer rollback");
			}
			
			log.info("crear() - No se ha podido crear el traspaso de almacenes: " + e.getMessage());
			
			throw new TraspasoAlmacenesConstraintViolationException("Error creando nuevo traspaso de almacenes: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			try {
				conn.rollback();
				log.debug("crear() - rollback");
			}
			catch (Exception ignore) {
				log.error("crear() - Error al hacer rollback");
			}
			
			String msg = "Error creando traspaso de almacenes: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new TraspasoAlmacenesException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void modificar(TraspasoAlmacenesBean traspaso, DatosSesionBean datosSesion) throws TraspasoAlmacenesConstraintViolationException, TraspasoAlmacenesException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando traspaso de almacenes: " + traspaso.getIdTraspaso());
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			TraspasosAlmacenesDao.update(conn, datosSesion.getConfigEmpresa(), traspaso);
			actualizarDetalles(conn, datosSesion, traspaso);
			
			conn.finalizaTransaccion();
		}
		catch (KeyConstraintViolationException e) {
			try {
				conn.rollback();
				log.debug("modificar() - rollback");
			}
			catch (Exception ignore) {
				log.error("modificar() - Error al hacer rollback");
			}
			
			log.info("modificar() - No se ha podido modificar el traspaso de almacenes: " + e.getMessage());
			
			throw new TraspasoAlmacenesConstraintViolationException("Error modificando traspaso de almacenes: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			try {
				conn.rollback();
				log.debug("modificar() - rollback");
			}
			catch (Exception ignore) {
				log.error("modificar() - Error al hacer rollback");
			}
			
			String msg = "Error modificando traspaso de almacenes: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new TraspasoAlmacenesException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void eliminar(Long idTraspaso, DatosSesionBean datosSesion) throws TraspasoAlmacenesConstraintViolationException, TraspasoAlmacenesException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando traspaso de almacenes " + idTraspaso);
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			TraspasosAlmacenesDao.delete(conn, datosSesion.getConfigEmpresa(), idTraspaso);
			DetallesTraspasosAlmacenesDao.delete(conn, datosSesion.getConfigEmpresa(), idTraspaso);
			
			conn.finalizaTransaccion();
		}
		catch (KeyConstraintViolationException e) {
			try {
				conn.rollback();
				log.debug("eliminar() - rollback");
			}
			catch (Exception ignore) {
				log.error("eliminar() - Error al hacer rollback");
			}
			
			log.info("eliminar() - No se ha podido eliminar el traspaso de almacenes: " + e.getMessage());
			
			throw new TraspasoAlmacenesConstraintViolationException("Error eliminando traspaso de almacenes: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			try {
				conn.rollback();
				log.debug("eliminar() - rollback");
			}
			catch (Exception ignore) {
				log.error("eliminar() - Error al hacer rollback");
			}
			
			String msg = "Error eliminando traspaso de almacenes: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new TraspasoAlmacenesException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	private static void actualizarDetalles(Connection conn, DatosSesionBean datosSesion, TraspasoAlmacenesBean traspaso) throws SQLException {
		if (traspaso.isDetallesCargados()) {
			for (DetalleTraspasoAlmacenesBean detalle : traspaso.getDetalles()) {
				switch (detalle.getEstadoBean()) {
				case Estado.NUEVO:
					log.debug("actualizarDetalles() - Registrando detalle del traspaso de almacenes " + detalle.getIdTraspaso());
					DetallesTraspasosAlmacenesDao.insert(conn, datosSesion.getConfigEmpresa(), detalle);
					break;

				case Estado.MODIFICADO:
					log.debug("actualizarDetalles() - Modificando detalle del traspaso de almacenes " + detalle.getIdTraspaso());
					DetallesTraspasosAlmacenesDao.update(conn, datosSesion.getConfigEmpresa(), detalle);
					break;

				case Estado.BORRADO:
					log.debug("actualizarDetalles() - Eliminando detalle del traspaso de almacenes " + detalle.getIdTraspaso());
					DetallesTraspasosAlmacenesDao.delete(conn, datosSesion.getConfigEmpresa(), detalle);
					break;
				}
			}
		}
	}
}
