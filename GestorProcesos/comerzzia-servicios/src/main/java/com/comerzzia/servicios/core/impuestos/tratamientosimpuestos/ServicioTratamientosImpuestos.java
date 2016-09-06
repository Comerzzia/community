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

package com.comerzzia.servicios.core.impuestos.tratamientosimpuestos;

import java.sql.SQLException;

import com.comerzzia.persistencia.core.impuestos.porcentajes.PorcentajesImpuestosDao;
import com.comerzzia.persistencia.core.impuestos.tratamientosimpuestos.ParametrosBuscarTratamientosImpuestosBean;
import com.comerzzia.persistencia.core.impuestos.tratamientosimpuestos.TratamientoImpuestoBean;
import com.comerzzia.persistencia.core.impuestos.tratamientosimpuestos.TratamientosImpuestosDao;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioTratamientosImpuestos {

protected static Logger log = Logger.getMLogger(ServicioTratamientosImpuestos.class);	
	
	public static PaginaResultados consultar(ParametrosBuscarTratamientosImpuestosBean param) throws TratamientoImpuestoException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando tratamientos de impuestos");
			conn.abrirConexion(Database.getConnection());
			return TratamientosImpuestosDao.consultar(conn, param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar tratamientos de impuestos: " +  e.getMessage();
			
            throw new TratamientoImpuestoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static TratamientoImpuestoBean consultar(Long idTratImpuesto) 
			throws TratamientoImpuestoException, TratamientoImpuestoNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos del tratamiento de impuestos: " + idTratImpuesto);
			conn.abrirConexion(Database.getConnection());
			TratamientoImpuestoBean tratImpuesto = TratamientosImpuestosDao.consultar(conn, idTratImpuesto);
			
			if (tratImpuesto == null) {
				String msg = "No se ha encontrado el tratamiento de impuestos con identificador: " + idTratImpuesto;
				log.info("consultar() - " + msg);
				throw new TratamientoImpuestoNotFoundException(msg);
			}
			
			return tratImpuesto;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un tratamiento de impuestos: " +  e.getMessage();
			
		    throw new TratamientoImpuestoException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}	
	
	
	public static void salvar(TratamientoImpuestoBean tratImpuesto) 
			throws TratamientoImpuestoException, TratamientoImpuestoConstraintViolationException {

		switch (tratImpuesto.getEstadoBean()) {
			case Estado.NUEVO:
				crear(tratImpuesto);
				break;
	      
			case Estado.MODIFICADO:
				modificar(tratImpuesto);
				break;
	      
			case Estado.BORRADO:
				eliminar(tratImpuesto.getIdTratImpuestos());
		}
	}
	
	
	public static void crear(TratamientoImpuestoBean tratImpuesto) 
			throws TratamientoImpuestoException, TratamientoImpuestoConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nuevo tratamiento de impuestos");
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			// Obtenemos el idtratImpuesto a partir del contador de tratamientos de impuestos
			Long idTratImpuesto = ContadorTratamientosImpuestos.obtenerContador(conn);
			tratImpuesto.setIdTratImpuestos(idTratImpuesto);
			
			TratamientosImpuestosDao.insert(conn, tratImpuesto);
			PorcentajesImpuestosDao.inicializarPorcentajesImpuestosParaTratamiento(conn, idTratImpuesto);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (ContadorException e) {
			conn.deshacerTransaccion();
			String msg = "Error creando tratamiento de impuestos: " + e.getMessage();
    		log.error("crear() - " + msg);
    		
    		throw new TratamientoImpuestoException(msg, e);
		}
		catch(KeyConstraintViolationException e){
			conn.deshacerTransaccion();
			log.info("crear() - No se ha podido crear el tratamiento de impuestos: " + e.getMessage());
			throw new TratamientoImpuestoConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			String msg = "Error creando nuevo tratamiento de impuestos: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new TratamientoImpuestoException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void modificar(TratamientoImpuestoBean tratImpuesto) throws TratamientoImpuestoException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando tratamiento de impuestos " + tratImpuesto.getIdTratImpuestos());
			conn.abrirConexion(Database.getConnection());
			TratamientosImpuestosDao.update(conn, tratImpuesto);
		}
		catch (SQLException e) {
			String msg = "Error modificando tratamiento de impuestos: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new TratamientoImpuestoException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void eliminar(Long idTratImpuesto) 
			throws TratamientoImpuestoException, TratamientoImpuestoConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando tratamiento de impuestos " + idTratImpuesto);
			conn.abrirConexion(Database.getConnection());
			PorcentajesImpuestosDao.borrarPorcentajesTratamiento(conn, idTratImpuesto);
			TratamientosImpuestosDao.delete(conn, idTratImpuesto);
		}
		catch(ForeingKeyConstraintViolationException e){
			log.info("eliminar() - No se ha podido eliminar el tratamiento de impuestos: "+ e.getMessage());
			throw new TratamientoImpuestoConstraintViolationException("Error eliminando tratamiento de impuestos: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando tratamiento de impuestos: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new TratamientoImpuestoException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
