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

package com.comerzzia.servicios.general.paises;

import java.sql.SQLException;

import com.comerzzia.persistencia.general.paises.PaisBean;
import com.comerzzia.persistencia.general.paises.PaisesDao;
import com.comerzzia.persistencia.general.paises.ParametrosBuscarPaisesBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioPaises {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioPaises.class);
	
	
	public static PaginaResultados consultar(ParametrosBuscarPaisesBean param, DatosSesionBean datosSesion) throws PaisException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando paises");
			conn.abrirConexion(Database.getConnection());
			return PaisesDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar paises: " +  e.getMessage();
			
            throw new PaisException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static PaisBean consultar(String codPais, DatosSesionBean datosSesion) 
			throws PaisException, PaisNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando datos del país: " + codPais);
			conn.abrirConexion(Database.getConnection());
			PaisBean pais = PaisesDao.consultar(conn, datosSesion.getConfigEmpresa(), codPais);
			
			if (pais == null) {
				String msg = "No se ha encontrado el país con identificador: " + codPais;
				log.info("consultar() - " + msg);
				throw new PaisNotFoundException(msg);
			}
			
			return pais;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un país: " +  e.getMessage();
			
            throw new PaisException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void salvar(PaisBean pais, DatosSesionBean datosSesion) 
			throws PaisException, PaisConstraintViolationException {
	
		switch (pais.getEstadoBean()) {
			case Estado.NUEVO:
				crear(pais, datosSesion);
				break;
			      
			case Estado.MODIFICADO:
				modificar(pais, datosSesion);
				break;
			      
			case Estado.BORRADO:
				eliminar(pais.getCodPais(), datosSesion);
		}
	}
	
	
	public static void crear(PaisBean pais, DatosSesionBean datosSesion) 
			throws PaisException, PaisConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nuevo País");
			
			conn.abrirConexion(Database.getConnection());
			PaisesDao.insert(conn, datosSesion.getConfigEmpresa(), pais);
		}
		catch(KeyConstraintViolationException e){
			log.info("crear() - No se ha podido crear el país: " + e.getMessage());
			throw new PaisConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error creando país: " + e.getMessage();
    		log.error("crear() - " + msg);
    		
    		throw new PaisException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void modificar(PaisBean pais, DatosSesionBean datosSesion) throws PaisException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando País " + pais.getCodPais());
			conn.abrirConexion(Database.getConnection());
			PaisesDao.update(conn, datosSesion.getConfigEmpresa(), pais);
		}
		catch (SQLException e) {
			String msg = "Error modificando país: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new PaisException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void eliminar(String codPais, DatosSesionBean datosSesion) 
			throws PaisException, PaisConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando País " + codPais);
			conn.abrirConexion(Database.getConnection());
			PaisesDao.delete(conn, datosSesion.getConfigEmpresa(), codPais);
		}
		catch(ForeingKeyConstraintViolationException e){
			log.info("eliminar() - No se ha podido eliminar el país: "+ e.getMessage());
			throw new PaisConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
    		String msg = "Error eliminando país: " + e.getMessage();
    		log.error("eliminar() - " + msg);
    		
    		throw new PaisException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
}
