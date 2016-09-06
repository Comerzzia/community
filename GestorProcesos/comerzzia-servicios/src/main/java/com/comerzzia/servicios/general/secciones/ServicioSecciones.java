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

package com.comerzzia.servicios.general.secciones;

import java.sql.SQLException;

import com.comerzzia.persistencia.general.secciones.ParametrosBuscarSeccionesBean;
import com.comerzzia.persistencia.general.secciones.SeccionBean;
import com.comerzzia.persistencia.general.secciones.SeccionesDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;


public class ServicioSecciones {

	protected static Logger log = Logger.getMLogger(ServicioSecciones.class);
	
	
	public static PaginaResultados consultar(ParametrosBuscarSeccionesBean param, DatosSesionBean datosSesion) throws SeccionException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando secciones");
			conn.abrirConexion(Database.getConnection());
			return SeccionesDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar secciones: " +  e.getMessage();
			
            throw new SeccionException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static SeccionBean consultar(String codSeccion, DatosSesionBean datosSesion) 
			throws SeccionException, SeccionNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos de la sección: " + codSeccion);
			conn.abrirConexion(Database.getConnection());
			SeccionBean seccion = SeccionesDao.consultar(conn, datosSesion.getConfigEmpresa(), codSeccion);
			
			if (seccion == null) {
				String msg = "No se ha encontrado la sección con identificador: " + codSeccion;
				log.info("consultar() - " + msg);
				throw new SeccionNotFoundException(msg);
			}
			
			return seccion;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de una sección: " +  e.getMessage();
			
		    throw new SeccionException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}	
	
	
	public static void salvar(SeccionBean seccion, DatosSesionBean datosSesion) 
			throws SeccionException, SeccionConstraintViolationException {

		switch (seccion.getEstadoBean()) {
			case Estado.NUEVO:
				crear(seccion, datosSesion);
				break;
	      
			case Estado.MODIFICADO:
				modificar(seccion, datosSesion);
				break;
	      
			case Estado.BORRADO:
				eliminar(seccion.getCodSeccion(), datosSesion);
		}
	}
	
	
	public static void crear(SeccionBean seccion, DatosSesionBean datosSesion) 
			throws SeccionException, SeccionConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nueva Sección");
			
			conn.abrirConexion(Database.getConnection());
			SeccionesDao.insert(conn, datosSesion.getConfigEmpresa(), seccion);
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear la sección: " + e.getMessage());
			throw new SeccionConstraintViolationException("Error creando nueva sección: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error creando nueva sección: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new SeccionException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void modificar(SeccionBean seccion, DatosSesionBean datosSesion) throws SeccionException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando Sección " + seccion.getCodSeccion());
			conn.abrirConexion(Database.getConnection());
			SeccionesDao.update(conn, datosSesion.getConfigEmpresa(), seccion);
		}
		catch (SQLException e) {
			String msg = "Error modificando sección: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new SeccionException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void eliminar(String codSeccion, DatosSesionBean datosSesion) 
			throws SeccionException, SeccionConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando Sección " + codSeccion);
			conn.abrirConexion(Database.getConnection());
			SeccionesDao.delete(conn, datosSesion.getConfigEmpresa(),codSeccion);
		}
		catch(ForeingKeyConstraintViolationException e){
			log.info("eliminar() - No se ha podido eliminar la sección: "+ e.getMessage());
			throw new SeccionConstraintViolationException("Error eliminando sección: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando sección: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new SeccionException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
