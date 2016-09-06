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

package com.comerzzia.servicios.general.familias;

import java.sql.SQLException;

import com.comerzzia.persistencia.general.familias.FamiliaBean;
import com.comerzzia.persistencia.general.familias.FamiliasDao;
import com.comerzzia.persistencia.general.familias.ParametrosBuscarFamiliasBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;


public class ServicioFamilias {

	protected static Logger log = Logger.getMLogger(ServicioFamilias.class);
	
	
	public static PaginaResultados consultar(ParametrosBuscarFamiliasBean param, DatosSesionBean datosSesion) throws FamiliaException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando familias");
			conn.abrirConexion(Database.getConnection());
			return FamiliasDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar familias: " +  e.getMessage();
			
            throw new FamiliaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static FamiliaBean consultar(String codFam, DatosSesionBean datosSesion) 
			throws FamiliaException, FamiliaNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos de la familia: " + codFam);
			conn.abrirConexion(Database.getConnection());
			FamiliaBean familia = FamiliasDao.consultar(conn, datosSesion.getConfigEmpresa(), codFam);
			
			if (familia == null) {
				String msg = "No se ha encontrado la familia con identificador: " + codFam;
				log.info("consultar() - " + msg);
				throw new FamiliaNotFoundException(msg);
			}
			
			return familia;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de una familia: " +  e.getMessage();
			
		    throw new FamiliaException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}	
	
	
	public static void salvar(FamiliaBean familia, DatosSesionBean datosSesion) 
			throws FamiliaException, FamiliaConstraintViolationException {

		switch (familia.getEstadoBean()) {
			case Estado.NUEVO:
				crear(familia, datosSesion);
				break;
	      
			case Estado.MODIFICADO:
				modificar(familia, datosSesion);
				break;
	      
			case Estado.BORRADO:
				eliminar(familia.getCodFam(), datosSesion);
		}
	}
	
	
	public static void crear(FamiliaBean familia, DatosSesionBean datosSesion) 
			throws FamiliaException, FamiliaConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nueva familia");
			
			conn.abrirConexion(Database.getConnection());
			FamiliasDao.insert(conn, datosSesion.getConfigEmpresa(), familia);
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear la familia: " + e.getMessage());
			throw new FamiliaConstraintViolationException("Error creando nueva familia: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error creando nueva familia: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new FamiliaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void modificar(FamiliaBean familia, DatosSesionBean datosSesion) throws FamiliaException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando Familia " + familia.getCodFam());
			conn.abrirConexion(Database.getConnection());
			FamiliasDao.update(conn, datosSesion.getConfigEmpresa(), familia);
		}
		catch (SQLException e) {
			String msg = "Error modificando familia: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new FamiliaException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void eliminar(String codFam, DatosSesionBean datosSesion) 
			throws FamiliaException, FamiliaConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando Familia " + codFam);
			conn.abrirConexion(Database.getConnection());
			FamiliasDao.delete(conn, datosSesion.getConfigEmpresa(),codFam);
		}
		catch(ForeingKeyConstraintViolationException e){
			log.info("eliminar() - No se ha podido eliminar la familia: "+ e.getMessage());
			throw new FamiliaConstraintViolationException("Error eliminando familia: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando familia: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new FamiliaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
