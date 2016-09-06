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

package com.comerzzia.servicios.general.series;

import java.sql.SQLException;

import com.comerzzia.persistencia.general.series.ParametrosBuscarSeriesBean;
import com.comerzzia.persistencia.general.series.SerieBean;
import com.comerzzia.persistencia.general.series.SeriesDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;


public class ServicioSeries {

	protected static Logger log = Logger.getMLogger(ServicioSeries.class);
	
	
	public static PaginaResultados consultar(ParametrosBuscarSeriesBean param, DatosSesionBean datosSesion) throws SerieException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando series");
			conn.abrirConexion(Database.getConnection());
			return SeriesDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar series: " +  e.getMessage();
			
            throw new SerieException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static SerieBean consultar(String codSerie, DatosSesionBean datosSesion) 
			throws SerieException, SerieNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos de la serie: " + codSerie);
			conn.abrirConexion(Database.getConnection());
			SerieBean serie = SeriesDao.consultar(conn, datosSesion.getConfigEmpresa(), codSerie);
			
			if (serie == null) {
				String msg = "No se ha encontrado la serie con identificador: " + codSerie;
				log.info("consultar() - " + msg);
				throw new SerieNotFoundException(msg);
			}
			
			return serie;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de una serie: " +  e.getMessage();
			
		    throw new SerieException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}	
	
	
	public static void salvar(SerieBean serie, DatosSesionBean datosSesion) 
			throws SerieException, SerieConstraintViolationException {

		switch (serie.getEstadoBean()) {
			case Estado.NUEVO:
				crear(serie, datosSesion);
				break;
	      
			case Estado.MODIFICADO:
				modificar(serie, datosSesion);
				break;
	      
			case Estado.BORRADO:
				eliminar(serie.getCodSerie(), datosSesion);
		}
	}
	
	
	public static void crear(SerieBean serie, DatosSesionBean datosSesion) 
			throws SerieException, SerieConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			crear(serie, datosSesion, conn);
		}
		catch (SQLException e) {
			String msg = "Error creando nueva serie: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new SerieException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void crear(SerieBean serie, DatosSesionBean datosSesion, Connection conn) 
			throws SerieException, SerieConstraintViolationException {
		try {
			log.debug("crear() - Creando nueva Serie");
			SeriesDao.insert(conn, datosSesion.getConfigEmpresa(), serie);
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear la serie: " + e.getMessage());
			throw new SerieConstraintViolationException("Error creando nueva serie: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error creando nueva serie: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new SerieException(msg, e);
		}
	}
	
	
	public static void modificar(SerieBean serie, DatosSesionBean datosSesion) throws SerieException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			modificar(serie, datosSesion, conn);
		}
		catch (SQLException e) {
			String msg = "Error modificando serie: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new SerieException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void modificar(SerieBean serie, DatosSesionBean datosSesion, Connection conn) 
			throws SerieException {
		try {
			log.debug("modificar() - Modificando Serie " + serie.getCodSerie());
			SeriesDao.update(conn, datosSesion.getConfigEmpresa(), serie);
		}
		catch (SQLException e) {
			String msg = "Error modificando serie: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new SerieException(msg, e);
    	}
	}
	
	
	public static void eliminar(String codSerie, DatosSesionBean datosSesion) 
			throws SerieException, SerieConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando Serie " + codSerie);
			conn.abrirConexion(Database.getConnection());
			SeriesDao.delete(conn, datosSesion.getConfigEmpresa(),codSerie);
		}
		catch(ForeingKeyConstraintViolationException e){
			log.info("eliminar() - No se ha podido eliminar la serie: "+ e.getMessage());
			throw new SerieConstraintViolationException("Error eliminando serie: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando serie: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new SerieException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
