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

package com.comerzzia.persistencia.core.acciones;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;


public class AccionesDao extends MantenimientoDao {

	private static String TABLA = "CONFIG_ACCIONES_TBL";
	
	private static Logger log = Logger.getMLogger(AccionesDao.class);
	
	
	public static AccionBean consultar(Connection conn, String nombre) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	
    	AccionBean accion = null;
    	
    	sql = "SELECT ID_ACCION, ACCION, TIPO_ACCION, EJECUCION, PARAMETROS, " +
    	      "DESCRIPCION, TITULO, ICONO " +
    	      "FROM " + getNombreElementoConfiguracion(TABLA) +
    	      "WHERE ACCION = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, nombre);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
            
            while (rs.next()){
            	accion = new AccionBean();
            	accion.setIdAccion(rs.getLong("ID_ACCION"));
            	accion.setAccion(rs.getString("ACCION"));
            	accion.setTipoAccion(rs.getString("TIPO_ACCION"));
            	accion.setEjecucion(rs.getString("EJECUCION"));
            	accion.setParametros(rs.getString("PARAMETROS"));
            	accion.setDescripcion(rs.getString("DESCRIPCION"));
            	accion.setTitulo(rs.getString("TITULO"));
            	accion.setIcono(rs.getString("ICONO"));
            }
            
            return accion;
    	}
    	finally {
    		try{
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try{
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}

	public static AccionBean consultar(Connection conn, Long idAccion) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	
    	AccionBean accion = null;
    	
    	sql = "SELECT ID_ACCION, ACCION, TIPO_ACCION, EJECUCION, PARAMETROS, " +
    	      "DESCRIPCION, TITULO, ICONO " +
    	      "FROM " + getNombreElementoConfiguracion(TABLA) +
    	      "WHERE ID_ACCION = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idAccion);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
            
            while (rs.next()){
            	accion = new AccionBean();
            	accion.setIdAccion(rs.getLong("ID_ACCION"));
            	accion.setAccion(rs.getString("ACCION"));
            	accion.setTipoAccion(rs.getString("TIPO_ACCION"));
            	accion.setEjecucion(rs.getString("EJECUCION"));
            	accion.setParametros(rs.getString("PARAMETROS"));
            	accion.setDescripcion(rs.getString("DESCRIPCION"));
            	accion.setTitulo(rs.getString("TITULO"));
            	accion.setIcono(rs.getString("ICONO"));
            }
            
            return accion;
    	}
    	finally {
    		try{
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try{
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}

}
