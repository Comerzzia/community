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

package com.comerzzia.servicios.tesoreria.tiposefectos;

import java.sql.SQLException;

import com.comerzzia.persistencia.tesoreria.tiposefectos.ParametrosBuscarTiposEfectosBean;
import com.comerzzia.persistencia.tesoreria.tiposefectos.TipoEfectoBean;
import com.comerzzia.persistencia.tesoreria.tiposefectos.TiposEfectosDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioTiposEfectos {

protected static Logger log = Logger.getMLogger(ServicioTiposEfectos.class);
	
	
	public static PaginaResultados consultar(ParametrosBuscarTiposEfectosBean param, DatosSesionBean datosSesion) throws TipoEfectoException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando tipos efectos");
			conn.abrirConexion(Database.getConnection());
			return TiposEfectosDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar tipos efectos: " +  e.getMessage();
			
            throw new TipoEfectoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static TipoEfectoBean consultar(String codTipoefecto, DatosSesionBean datosSesion) 
			throws TipoEfectoException, TipoEfectoNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos del tipo efecto: " + codTipoefecto);
			conn.abrirConexion(Database.getConnection());
			TipoEfectoBean tipoEfecto = TiposEfectosDao.consultar(conn, datosSesion.getConfigEmpresa(), codTipoefecto);
			
			if (tipoEfecto == null) {
				String msg = "No se ha encontrado el tipo efecto con identificador: " + codTipoefecto;
				log.info("consultar() - " + msg);
				throw new TipoEfectoNotFoundException(msg);
			}
			
			return tipoEfecto;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un tipo efecto: " +  e.getMessage();
			
		    throw new TipoEfectoException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}	
	
	
	public static void salvar(TipoEfectoBean tipoEfecto, DatosSesionBean datosSesion) 
			throws TipoEfectoException, TipoEfectoConstraintViolationException {

		switch (tipoEfecto.getEstadoBean()) {
			case Estado.NUEVO:
				crear(tipoEfecto, datosSesion);
				break;
	      
			case Estado.MODIFICADO:
				modificar(tipoEfecto, datosSesion);
				break;
	      
			case Estado.BORRADO:
				eliminar(tipoEfecto.getCodTipoEfecto(), datosSesion);
		}
	}
	
	
	public static void crear(TipoEfectoBean tipoEfecto, DatosSesionBean datosSesion) 
			throws TipoEfectoException, TipoEfectoConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nuevo Tipo Efecto");
			
			conn.abrirConexion(Database.getConnection());
			TiposEfectosDao.insert(conn, datosSesion.getConfigEmpresa(), tipoEfecto);
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear el tipo efecto: " + e.getMessage());
			throw new TipoEfectoConstraintViolationException("Error creando nuevo tipo efecto: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error creando nuevo tipo efecto: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new TipoEfectoException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void modificar(TipoEfectoBean tipoEfecto, DatosSesionBean datosSesion) throws TipoEfectoException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando Tipo Efecto " + tipoEfecto.getCodTipoEfecto());
			conn.abrirConexion(Database.getConnection());
			TiposEfectosDao.update(conn, datosSesion.getConfigEmpresa(), tipoEfecto);
		}
		catch (SQLException e) {
			String msg = "Error modificando tipo efecto: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new TipoEfectoException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void eliminar(String codTipoEfecto, DatosSesionBean datosSesion) 
			throws TipoEfectoException, TipoEfectoConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando Tipo Efecto " + codTipoEfecto);
			conn.abrirConexion(Database.getConnection());
			TiposEfectosDao.delete(conn, datosSesion.getConfigEmpresa(),codTipoEfecto);
		}
		catch(ForeingKeyConstraintViolationException e){
			log.info("eliminar() - No se ha podido eliminar el tipo efecto: "+ e.getMessage());
			throw new TipoEfectoConstraintViolationException("Error eliminando tipo efecto: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando tipo efecto: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new TipoEfectoException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
