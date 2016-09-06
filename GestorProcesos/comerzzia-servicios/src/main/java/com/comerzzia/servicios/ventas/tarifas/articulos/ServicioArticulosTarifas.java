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

package com.comerzzia.servicios.ventas.tarifas.articulos;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloHistoricoTarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticulosTarifaDao;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ParametrosBuscarArticulosTarifaBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.tarifas.TarifaException;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioArticulosTarifas {

	protected static Logger log = Logger.getMLogger(ServicioArticulosTarifas.class);


	/** Consulta los detalles de un artículo para una tarifa indicada. 
	 * @param codTar
	 * @param codArt
	 * @param datosSesion
	 * @return ArticuloTarifaBean
	 * @throws ArticuloTarifaException
	 * @throws ArticuloTarifaNotFoundException
	 */
	public static ArticuloTarifaBean consultarArticuloTarifa(String codTar, String codArt, DatosSesionBean datosSesion)
			throws ArticuloTarifaException, ArticuloTarifaNotFoundException { 
		Connection conn = new Connection();
		try {
			conn.abrirConexion(Database.getConnection());
			return consultarArticuloTarifa(conn, codTar, codArt, datosSesion);
		} 
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando artículo de una tarifa: "+ e.getMessage();
			throw new ArticuloTarifaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	/** Consulta los detalles de un artículo para una tarifa indicada. Recibe objeto conexión por parámetro. 
	 * @param conn
	 * @param codTar
	 * @param codArt
	 * @param datosSesion
	 * @return ArticuloTarifaBean
	 * @throws ArticuloTarifaException
	 * @throws ArticuloTarifaNotFoundException
	 */
	public static ArticuloTarifaBean consultarArticuloTarifa(Connection conn, String codTar, String codArt, DatosSesionBean datosSesion)
			throws ArticuloTarifaException, ArticuloTarifaNotFoundException { 
		try {
			log.debug("consultar() - Consultando datos del artículo " + codArt + " de la tarifa " + codTar);
			ArticuloTarifaBean articuloTarifa = ArticulosTarifaDao.consultar(conn, datosSesion.getConfigEmpresa(), codTar, codArt);
			if (articuloTarifa == null) {
				String msg = "No se ha encontrado artículo " + codArt + " de la tarifa " + codTar;
				log.info("consultar() - " + msg);
				throw new ArticuloTarifaNotFoundException(msg);
			}
			return articuloTarifa;
		} 
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando artículo de una tarifa: "+ e.getMessage();
			throw new ArticuloTarifaException(mensaje, e);
		}
	}

	public static PaginaResultados consultar(ParametrosBuscarArticulosTarifaBean param,
			DatosSesionBean datosSesion) throws ArticuloTarifaException {
		Connection conn = new Connection();
		try {
			log.debug("consultar() - Consultando artículos de la tarifa " + param.getCodTar());
			conn.abrirConexion(Database.getConnection());
			return ArticulosTarifaDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		} 
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar artículos de la tarifa " + param.getCodTar() + ": " + e.getMessage();
			throw new ArticuloTarifaException(mensaje, e);
		} 
		finally {
			if (conn!=null){
				conn.cerrarConexion();
			}
		}
	}

	@SuppressWarnings("unchecked")
	public static List<ArticuloTarifaBean> consultarTarifasArticulo(String codArticulo, DatosSesionBean datosSesion) 
			throws ArticuloTarifaException {
		ParametrosBuscarArticulosTarifaBean param = new ParametrosBuscarArticulosTarifaBean();
		param.setCodArt(codArticulo);
		param.setSinPaginar(true);
		return (List<ArticuloTarifaBean>) consultar(param, datosSesion).getPagina();
	}

	@SuppressWarnings("unchecked")
	public static List<ArticuloTarifaBean> consultarArticulosTarifa(String codTarifa, DatosSesionBean datosSesion) 
			throws ArticuloTarifaException {
		ParametrosBuscarArticulosTarifaBean param = new ParametrosBuscarArticulosTarifaBean();
		param.setCodTar(codTarifa);
		param.setSinPaginar(true);
		return (List<ArticuloTarifaBean>) consultar(param, datosSesion).getPagina();
	}

	public static void salvar(Connection conn, ArticuloTarifaBean articulo, DatosSesionBean datosSesion) 
		throws ArticuloTarifaException,	ArticuloTarifaConstraintViolationException {

		switch (articulo.getEstadoBean()) {
			case Estado.NUEVO:
				crear(conn, articulo, datosSesion);
				break;
	
			case Estado.MODIFICADO:
				modificar(conn, articulo, datosSesion);
				break;
	
			case Estado.BORRADO:
				eliminar(conn, articulo.getCodTar(), articulo.getCodArt(), datosSesion);
				break;
		}
	}

	public static void crear(Connection conn, ArticuloTarifaBean articulo, DatosSesionBean datosSesion) 
			throws ArticuloTarifaException,	ArticuloTarifaConstraintViolationException {
		try {
			log.debug("crearArticulo() - Creando nuevo artículo "
					+ articulo.getCodArt() + " para la tarifa "
					+ articulo.getCodTar());
			ArticulosTarifaDao.insert(conn, datosSesion.getConfigEmpresa(), articulo);
		} 
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear el artículo " + articulo.getCodArt() + " para la tarifa "
							+ articulo.getCodTar() + ": " + e.getMessage());
			throw new ArticuloTarifaConstraintViolationException(
					"Error añadiendo artículo " + articulo.getCodArt() + " a la tarifa " + articulo.getCodTar() + ": " + e.getDefaultMessage());
		} 
		catch (SQLException e) {
			String msg = "Error creando nuevo artículo " + articulo.getCodArt() + " para la tarifa " + articulo.getCodTar() + ": " + e.getMessage();
			log.error("crear() - " + msg);
			throw new ArticuloTarifaException(msg, e);
		}
	}

	public static void modificar(Connection conn, ArticuloTarifaBean articulo, DatosSesionBean datosSesion) 
			throws ArticuloTarifaException {
		try { 
			log.debug("modificar() - Modificando artículo " + articulo.getCodArt() + " de la tarifa " + articulo.getCodTar());
			ArticulosTarifaDao.update(conn, datosSesion.getConfigEmpresa(),articulo);
		} 
		catch (SQLException e) {
			String msg = "Error modificando artículo: " + e.getMessage();
			log.error("modificar() - " + msg);
			throw new ArticuloTarifaException(msg, e);
		} 
	}

	public static void eliminar(Connection conn, String codTar, String codArt, DatosSesionBean datosSesion) 
			throws ArticuloTarifaException, ArticuloTarifaConstraintViolationException {
		try {
			log.debug("eliminarArticulo() - Eliminando artículo " + codArt + " de la tarifa " + codTar);
			ArticulosTarifaDao.delete(conn, datosSesion.getConfigEmpresa(), codTar, codArt);
		} 
		catch (ForeingKeyConstraintViolationException e) {
			log.info("eliminarArticulo() - No se ha podido eliminar el artículo " + codArt + ": " + e.getMessage());
			throw new ArticuloTarifaConstraintViolationException("Error eliminando artículo " + codArt + ": " + e.getDefaultMessage());
		} 
		catch (SQLException e) {
			String msg = "Error eliminando artículo: " + e.getMessage();
			log.error("eliminarArticulo() - " + msg);
			throw new ArticuloTarifaException(msg, e);
		} 
	}


	/** Salva un artículo tarifa en el histórico, indicando el usuario de sesión y la fecha y hora actual. */
	public static void salvarHistorico(Connection conn, ArticuloTarifaBean articulo, boolean borrado, DatosSesionBean datosSesion) 
			throws ArticuloTarifaException{
		try{
			log.debug("salvarHistorico() - Salvando artículo " + articulo.getCodArt() +
						" de la tarifa " + articulo.getCodTar() + " en el histórico.");
			ArticuloHistoricoTarifaBean articuloHist = new ArticuloHistoricoTarifaBean(articulo);
			articuloHist.setFechaModificacion(new Date());
			articuloHist.setIdUsuario(datosSesion.getUsuario().getIdUsuario());
			articuloHist.setBorrado(borrado);
			ArticulosTarifaDao.insertHistorico(conn, datosSesion.getConfigEmpresa(), articuloHist);
		}
		catch(SQLException e){
			String msg = "Error salvando artículo " + articulo.getCodArt() 
						+ " de la tarifa " + articulo.getCodTar() + " en histórico: " + e.getMessage();
			log.error("salvarHistorico() - " + msg);
			throw new ArticuloTarifaException(msg, e);
		}
	}
	
	
	
	/**
	 * Este método obtiene los precios de un artículo dado a partir del código
	 * de artículo en cuestión, un código de tarifa y un código de cliente,
	 * siendo el código de artículo obligatorio y estos dos últimos parámetros
	 * opcionales.
	 * 
	 * Si el método sólo recibe un código de artículo, buscará los precios para
	 * la tarifa GENERAL; si además se recibe el código de tarifa, buscará el
	 * precio para la tarifa dada y si se recibe un código de cliente buscará
	 * los precios para la tarifa cuyo código coincide con el del cliente
	 * indicado.
	 * 
	 * 
	 * @param codArt
	 * @param codTar
	 * @param codCli
	 * @return
	 * @throws TarifaException
	 * @throws ArticuloTarifaNotFoundException
	 */ // TODO: TARIFAS: mirar para que es este método y ver todo lo que usa y cómo está hecho
	public static PreciosArticuloTarifaBean obtenerPreciosArticuloTarifa(String codArt, String codTar, String codCli,DatosSesionBean datosSesion) 
			throws TarifaException, ArticuloTarifaNotFoundException {
		Connection conn = new Connection();
		ArticuloTarifaBean articuloTarifa = null;
		try {
			log.debug("obtenerPreciosArticuloTarifa() - Obteniendo precios del artículo: " + codArt + " . . .");
			conn.abrirConexion(Database.getConnection());

			// Obtener el artículo para la tarifa que cuyo código coincide con el del cliente
			if (codCli != null && !codCli.isEmpty()) {
				log.debug("obtenerPreciosArticuloTarifa() - . . . y para la tarifa " + codCli);
				try{
					articuloTarifa = consultarArticuloTarifa(conn, codCli, codArt, datosSesion);
				}
				catch (ArticuloTarifaNotFoundException e) {;}
			}
			// Obtener el artículo para la tarifa indicada
			if (articuloTarifa == null && codTar != null && !codTar.isEmpty()) {
				log.debug("obtenerPreciosArticuloTarifa() - . . . y para la tarifa " + codTar);
				try{
					articuloTarifa = consultarArticuloTarifa(conn, codTar, codArt, datosSesion);
				}
				catch (ArticuloTarifaNotFoundException e) {;}
			}
			// Obtener el artículo para la tarifa GENERAL
			if (articuloTarifa == null) {
				log.debug("obtenerPreciosArticuloTarifa() - . . . y para la tarifa GENERAL");
				articuloTarifa = consultarArticuloTarifa(conn, TarifaBean.TARIFA_GENERAL, codArt, datosSesion);
			}
			PreciosArticuloTarifaBean preciosArticuloTarifa = new PreciosArticuloTarifaBean();
			preciosArticuloTarifa.setCodTar(articuloTarifa.getCodTar());
			preciosArticuloTarifa.setCodArt(articuloTarifa.getCodArt());
			preciosArticuloTarifa.setFactorMarcaje(articuloTarifa.getFactorMarcaje());
			preciosArticuloTarifa.setPrecioCosto(articuloTarifa.getPrecioCosto());
			preciosArticuloTarifa.setPrecioVenta(articuloTarifa.getPrecioVenta());
			preciosArticuloTarifa.setVersion(articuloTarifa.getVersion());
			return preciosArticuloTarifa;
		} 
		catch (SQLException e) {
			log.error("obtenerPreciosArticuloTarifa() - " + e.getMessage());
			String mensaje = "Error obteniendo precios del artículo de una tarifa: " + e.getMessage();
			throw new TarifaException(mensaje, e);
		} 
		catch (ArticuloTarifaException e) {
			log.error("obtenerPreciosArticuloTarifa() - " + e.getMessage());
			String mensaje = "Error obteniendo precios del artículo de una tarifa: " + e.getMessage();
			throw new TarifaException(mensaje, e);
		} 
		catch (ArticuloTarifaNotFoundException e) {
			log.info("El artículo " + codArt + " no existe para ninguna tarifa");
			throw e;
		} 
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static PreciosArticuloTarifaBean obtenerPreciosArticuloTarifa(
			String codArt, String codTar,
			DatosSesionBean datosSesion) throws TarifaException,
			ArticuloTarifaNotFoundException {
		return obtenerPreciosArticuloTarifa(codArt, codTar, null, datosSesion);	
	}
	
	public static PreciosArticuloTarifaBean obtenerPreciosArticuloTarifa(
			String codArt,
			DatosSesionBean datosSesion) throws TarifaException,
			ArticuloTarifaNotFoundException {
		return obtenerPreciosArticuloTarifa(codArt, null, null, datosSesion);	
	}
	
	/** Borra un artículo tarifa del histórico. */
	public static void borrarHistorico(Connection conn, String codArt, DatosSesionBean datosSesion) 
			throws ArticuloTarifaException{
		try{
			log.debug("borrarHistorico() - Borrando el artículo " + codArt + " del histórico de las tarifas");
			
			ArticulosTarifaDao.deleteHistorico(conn, datosSesion.getConfigEmpresa(), codArt);
		}
		catch(SQLException e){
			String msg = "Error borrando artículo " + codArt + " del histórico de las tarifas: " + e.getMessage();
			log.error("borrarHistorico() - " + msg);
			throw new ArticuloTarifaException(msg, e);
		}
	}
}
