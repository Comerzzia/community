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

package com.comerzzia.servicios.general.categorizaciones;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.general.categorizaciones.CategorizacionBean;
import com.comerzzia.persistencia.general.categorizaciones.CategorizacionesDao;
import com.comerzzia.persistencia.general.categorizaciones.ParametrosBuscarCategorizacionesBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioCategorizaciones {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioCategorizaciones.class);
	
	
	public static PaginaResultados consultar(ParametrosBuscarCategorizacionesBean param, DatosSesionBean datosSesion) throws CategorizacionException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando categorizaciones");
			conn.abrirConexion(Database.getConnection());
			return CategorizacionesDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar categorizaciones: " +  e.getMessage();
			
            throw new CategorizacionException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	
	public static List<CategorizacionBean> consultarPrimarias(DatosSesionBean datosSesion) throws CategorizacionException {
		Connection conn = new Connection();
		try {
			log.debug("consultarPrimarias() - Consultando categorizaciones primarias.");
			conn.abrirConexion(Database.getConnection());
			return CategorizacionesDao.consultarCategoriasPrimarias(conn, datosSesion.getConfigEmpresa());
		}
		catch (SQLException e) {
			log.error("consultarPrimarias() - " + e.getMessage());
			String mensaje = "Error al consultar categorizaciones primarias: " +  e.getMessage();
			
            throw new CategorizacionException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	
	public static List<CategorizacionBean> consultarSecundarias(DatosSesionBean datosSesion, String codCategoria) throws CategorizacionException {
		Connection conn = new Connection();
		try {
			log.debug("consultarSecundarias() - Consultando categorizaciones secundarias.");
			conn.abrirConexion(Database.getConnection());
			return CategorizacionesDao.consultarCategoriasSecundarias(conn, datosSesion.getConfigEmpresa(), codCategoria);
		}
		catch (SQLException e) {
			log.error("consultarSecundarias() - " + e.getMessage());
			String mensaje = "Error al consultar categorizaciones secundarias: " +  e.getMessage();
			
            throw new CategorizacionException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	
	public static CategorizacionBean consultar(String codCat, DatosSesionBean datosSesion) 
			throws CategorizacionException, CategorizacionNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando datos de la categorización: " + codCat);
			conn.abrirConexion(Database.getConnection());
			CategorizacionBean categorizacion = CategorizacionesDao.consultar(conn, datosSesion.getConfigEmpresa(), codCat);
			
			if (categorizacion == null) {
				String msg = "No se ha encontrado la categorización con identificador: " + codCat;
				log.info("consultar() - " + msg);
				throw new CategorizacionNotFoundException(msg);
			}
			
			return categorizacion;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de una categorización: " +  e.getMessage();
			
            throw new CategorizacionException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void salvar(CategorizacionBean categorizacion, DatosSesionBean datosSesion) 
			throws CategorizacionException, CategorizacionConstraintViolationException {
	
		switch (categorizacion.getEstadoBean()) {
			case Estado.NUEVO:
				crear(categorizacion, datosSesion);
				break;
			      
			case Estado.MODIFICADO:
				modificar(categorizacion, datosSesion);
				break;
			      
			case Estado.BORRADO:
				eliminar(categorizacion.getCodCat(), datosSesion);
		}
	}
	
	
	public static void crear(CategorizacionBean categorizacion, DatosSesionBean datosSesion) 
			throws CategorizacionException, CategorizacionConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nueva Categorización");
			
			conn.abrirConexion(Database.getConnection());
			CategorizacionesDao.insert(conn, datosSesion.getConfigEmpresa(), categorizacion);
		}
		catch(KeyConstraintViolationException e){
			log.info("crear() - No se ha podido crear la categorización: " + e.getMessage());
			throw new CategorizacionConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error creando categorización: " + e.getMessage();
    		log.error("crear() - " + msg);
    		
    		throw new CategorizacionException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void modificar(CategorizacionBean categorizacion, DatosSesionBean datosSesion) throws CategorizacionException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando Categorización " + categorizacion.getCodCat());
			conn.abrirConexion(Database.getConnection());
			CategorizacionesDao.update(conn, datosSesion.getConfigEmpresa(), categorizacion);
		}
		catch (SQLException e) {
			String msg = "Error modificando categorización: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new CategorizacionException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void eliminar(String codCat, DatosSesionBean datosSesion) 
			throws CategorizacionException, CategorizacionConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando Categorización " + codCat);
			conn.abrirConexion(Database.getConnection());
			CategorizacionesDao.delete(conn, datosSesion.getConfigEmpresa(), codCat);
		}
		catch(ForeingKeyConstraintViolationException e){
			log.info("eliminar() - No se ha podido eliminar la categorización: "+ e.getMessage());
			throw new CategorizacionConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
    		String msg = "Error eliminando categorización: " + e.getMessage();
    		log.error("eliminar() - " + msg);
    		
    		throw new CategorizacionException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
}
