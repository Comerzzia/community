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

package com.comerzzia.servicios.core.impuestos.tiposimpuestos;

import java.sql.SQLException;

import com.comerzzia.persistencia.core.impuestos.porcentajes.PorcentajesImpuestosDao;
import com.comerzzia.persistencia.core.impuestos.tiposimpuestos.ParametrosBuscarTiposImpuestosBean;
import com.comerzzia.persistencia.core.impuestos.tiposimpuestos.TipoImpuestoBean;
import com.comerzzia.persistencia.core.impuestos.tiposimpuestos.TiposImpuestosDao;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioTiposImpuestos {

	protected static Logger log = Logger.getMLogger(ServicioTiposImpuestos.class);
	
	public static PaginaResultados consultar(ParametrosBuscarTiposImpuestosBean param) throws TipoImpuestoException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando tipos impuestos");
			conn.abrirConexion(Database.getConnection());
			return TiposImpuestosDao.consultar(conn, param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar tipos impuestos: " +  e.getMessage();
			
            throw new TipoImpuestoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static TipoImpuestoBean consultar(String codTipoImpuesto) 
			throws TipoImpuestoException, TipoImpuestoNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos del tipo impuesto: " + codTipoImpuesto);
			conn.abrirConexion(Database.getConnection());
			TipoImpuestoBean tipoImpuesto = TiposImpuestosDao.consultar(conn, codTipoImpuesto);
			
			if (tipoImpuesto == null) {
				String msg = "No se ha encontrado el tipo impuesto con identificador: " + codTipoImpuesto;
				log.info("consultar() - " + msg);
				throw new TipoImpuestoNotFoundException(msg);
			}
			
			return tipoImpuesto;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un tipo impuesto: " +  e.getMessage();
			
		    throw new TipoImpuestoException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}	
	
	
	public static void salvar(TipoImpuestoBean tipoImpuesto) 
			throws TipoImpuestoException, TipoImpuestoConstraintViolationException {

		switch (tipoImpuesto.getEstadoBean()) {
			case Estado.NUEVO:
				crear(tipoImpuesto);
				break;
	      
			case Estado.MODIFICADO:
				modificar(tipoImpuesto);
				break;
	      
			case Estado.BORRADO:
				eliminar(tipoImpuesto.getCodTipoImpuesto());
		}
	}
	
	
	public static void crear(TipoImpuestoBean tipoImpuesto) 
			throws TipoImpuestoException, TipoImpuestoConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nuevo tipo impuesto");
			
			conn.abrirConexion(Database.getConnection());
			TiposImpuestosDao.insert(conn, tipoImpuesto);
			PorcentajesImpuestosDao.inicializarPorcentajesImpuestosParaTipo(conn, tipoImpuesto.getCodTipoImpuesto());
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear el tipo impuesto: " + e.getMessage());
			throw new TipoImpuestoConstraintViolationException("Error creando nuevo tipo impuesto: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error creando nuevo tipo impuesto: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new TipoImpuestoException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void modificar(TipoImpuestoBean tipoImpuesto) throws TipoImpuestoException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando tipo impuesto " + tipoImpuesto.getCodTipoImpuesto());
			conn.abrirConexion(Database.getConnection());
			TiposImpuestosDao.update(conn, tipoImpuesto);
		}
		catch (SQLException e) {
			String msg = "Error modificando tipo impuesto: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new TipoImpuestoException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void eliminar(String codTipoImpuesto) 
			throws TipoImpuestoException, TipoImpuestoConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando tipo impuesto " + codTipoImpuesto);
			conn.abrirConexion(Database.getConnection());
			PorcentajesImpuestosDao.borrarPorcentajesTipo(conn, codTipoImpuesto);
			TiposImpuestosDao.delete(conn, codTipoImpuesto);
		}
		catch(ForeingKeyConstraintViolationException e){
			log.info("eliminar() - No se ha podido eliminar el tipo impuesto: "+ e.getMessage());
			throw new TipoImpuestoConstraintViolationException("Error eliminando tipo impuesto: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando tipo impuesto: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new TipoImpuestoException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
