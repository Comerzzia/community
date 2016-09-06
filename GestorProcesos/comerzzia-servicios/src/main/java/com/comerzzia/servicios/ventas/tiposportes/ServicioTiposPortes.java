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

package com.comerzzia.servicios.ventas.tiposportes;

import java.sql.SQLException;

import com.comerzzia.persistencia.ventas.tiposportes.ParametrosBuscarTiposPortesBean;
import com.comerzzia.persistencia.ventas.tiposportes.TipoPorteBean;
import com.comerzzia.persistencia.ventas.tiposportes.TiposPortesDao;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioTiposPortes {

	protected static Logger log = Logger.getMLogger(ServicioTiposPortes.class);	
	
	public static PaginaResultados consultar(ParametrosBuscarTiposPortesBean param, DatosSesionBean datosSesion) throws TipoPorteException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando tipos de portes");
			conn.abrirConexion(Database.getConnection());
			return TiposPortesDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar tipos de portes: " +  e.getMessage();
			
            throw new TipoPorteException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static TipoPorteBean consultar(Long idTipoPorte, DatosSesionBean datosSesion) 
			throws TipoPorteException, TipoPorteNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos del tipo de porte: " + idTipoPorte);
			conn.abrirConexion(Database.getConnection());
			TipoPorteBean tipoPorte = TiposPortesDao.consultar(conn, datosSesion.getConfigEmpresa(), idTipoPorte);
			
			if (tipoPorte == null) {
				String msg = "No se ha encontrado el tipo de porte con identificador: " + idTipoPorte;
				log.info("consultar() - " + msg);
				throw new TipoPorteNotFoundException(msg);
			}
			
			return tipoPorte;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un tipo de porte: " +  e.getMessage();
			
		    throw new TipoPorteException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}	

	public static TipoPorteBean consultar(Double volumenVenta, DatosSesionBean datosSesion) 
			throws TipoPorteException, TipoPorteNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando tipo de porte para volumen de venta: " + volumenVenta);
			conn.abrirConexion(Database.getConnection());
			TipoPorteBean tipoPorte = TiposPortesDao.consultar(conn, datosSesion.getConfigEmpresa(), volumenVenta);
			
			if (tipoPorte == null) {
				String msg = "No se ha encontrado tipo de porte para volumen de venta: " + volumenVenta;
				log.debug("consultar() - " + msg);
				throw new TipoPorteNotFoundException(msg);
			}
			
			return tipoPorte;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar tipo de porte para un volumen de venta: " +  e.getMessage();

			throw new TipoPorteException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}	

	
	public static void salvar(TipoPorteBean tipoPorte, DatosSesionBean datosSesion) 
			throws TipoPorteException, TipoPorteConstraintViolationException {

		switch (tipoPorte.getEstadoBean()) {
			case Estado.NUEVO:
				crear(tipoPorte, datosSesion);
				break;
	      
			case Estado.MODIFICADO:
				modificar(tipoPorte, datosSesion);
				break;
	      
			case Estado.BORRADO:
				eliminar(tipoPorte.getIdTipoPorte(), datosSesion);
		}
	}
	
	
	public static void crear(TipoPorteBean tipoPorte, DatosSesionBean datosSesion) 
			throws TipoPorteException, TipoPorteConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nuevo tipo de porte");
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			// Obtenemos el idTipoPorte a partir del contador de tipos de portes
			Long idTipoPorte = ContadorTiposPortes.obtenerContador(conn);
			tipoPorte.setIdTipoPorte(idTipoPorte);
			
			TiposPortesDao.insert(conn, datosSesion.getConfigEmpresa(), tipoPorte);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (ContadorException e) {
			try {
                conn.rollback();
                log.debug("crear() - rollback");
            }
			catch (Exception ignore) {
                log.error("crear() - Error al hacer rollback");
            }
			
			String msg = "Error creando tipos de portes: " + e.getMessage();
    		log.error("crear() - " + msg);
    		
    		throw new TipoPorteException(msg, e);
		}
		catch (SQLException e) {
			try {
                conn.rollback();
                log.debug("crear() - rollback");
            }
			catch (Exception ignore) {
                log.error("crear() - Error al hacer rollback");
            }
			
			String msg = "Error creando nuevo tipo de porte: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new TipoPorteException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void modificar(TipoPorteBean tipoPorte, DatosSesionBean datosSesion) throws TipoPorteException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando tipo de porte " + tipoPorte.getIdTipoPorte());
			conn.abrirConexion(Database.getConnection());
			TiposPortesDao.update(conn, datosSesion.getConfigEmpresa(), tipoPorte);
		}
		catch (SQLException e) {
			String msg = "Error modificando tipo de porte: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new TipoPorteException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void eliminar(Long idTipoPorte, DatosSesionBean datosSesion) 
			throws TipoPorteException, TipoPorteConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando tipo de porte " + idTipoPorte);
			conn.abrirConexion(Database.getConnection());
			TiposPortesDao.delete(conn, datosSesion.getConfigEmpresa(), idTipoPorte);
		}
		catch(ForeingKeyConstraintViolationException e){
			log.info("eliminar() - No se ha podido eliminar el tipo de porte: "+ e.getMessage());
			throw new TipoPorteConstraintViolationException("Error eliminando tipo de porte: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando tipo de porte: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new TipoPorteException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
