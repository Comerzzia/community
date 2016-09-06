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

package com.comerzzia.servicios.general.sectores;

import java.sql.SQLException;

import com.comerzzia.persistencia.general.sectores.ParametrosBuscarSectoresBean;
import com.comerzzia.persistencia.general.sectores.SectorBean;
import com.comerzzia.persistencia.general.sectores.SectoresDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;


public class ServicioSectores {

	protected static Logger log = Logger.getMLogger(ServicioSectores.class);
	
	
	public static PaginaResultados consultar(ParametrosBuscarSectoresBean param, DatosSesionBean datosSesion) throws SectorException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando sectores:");
			conn.abrirConexion(Database.getConnection());
			return SectoresDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar sectores: " +  e.getMessage();
			
            throw new SectorException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static SectorBean consultar(String codSec, DatosSesionBean datosSesion) 
			throws SectorException, SectorNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos del sector: " + codSec);
			conn.abrirConexion(Database.getConnection());
			SectorBean sector = SectoresDao.consultar(conn, datosSesion.getConfigEmpresa(), codSec);
			
			if (sector == null) {
				String msg = "No se ha encontrado el sector con identificador: " + codSec;
				log.info("consultar() - " + msg);
				throw new SectorNotFoundException(msg);
			}
			
			return sector;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un sector: " +  e.getMessage();
			
		    throw new SectorException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}	
	
	
	public static void salvar(SectorBean sector, DatosSesionBean datosSesion) 
			throws SectorException, SectorConstraintViolationException {

		switch (sector.getEstadoBean()) {
			case Estado.NUEVO:
				crear(sector, datosSesion);
				break;
	      
			case Estado.MODIFICADO:
				modificar(sector, datosSesion);
				break;
	      
			case Estado.BORRADO:
				eliminar(sector.getCodSec(), datosSesion);
		}
	}
	
	
	public static void crear(SectorBean sector, DatosSesionBean datosSesion) 
			throws SectorException, SectorConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nuevo Sector:");
			
			conn.abrirConexion(Database.getConnection());
			SectoresDao.insert(conn, datosSesion.getConfigEmpresa(), sector);
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear el sector: " + e.getMessage());
			throw new SectorConstraintViolationException("Error creando nuevo sector: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error creando nuevo sector: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new SectorException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void modificar(SectorBean sector, DatosSesionBean datosSesion) throws SectorException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando Sector " + sector.getCodSec());
			conn.abrirConexion(Database.getConnection());
			SectoresDao.update(conn, datosSesion.getConfigEmpresa(), sector);
		}
		catch (SQLException e) {
			String msg = "Error modificando sector: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new SectorException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void eliminar(String codSec, DatosSesionBean datosSesion) 
			throws SectorException, SectorConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando sector " + codSec);
			conn.abrirConexion(Database.getConnection());
			SectoresDao.delete(conn, datosSesion.getConfigEmpresa(),codSec);
		}
		catch(ForeingKeyConstraintViolationException e){
			log.info("eliminar() - No se ha podido eliminar el sector: "+ e.getMessage());
			throw new SectorConstraintViolationException("Error eliminando sector: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando sector: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new SectorException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
