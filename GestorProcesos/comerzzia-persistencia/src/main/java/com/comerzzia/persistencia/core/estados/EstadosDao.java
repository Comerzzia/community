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

package com.comerzzia.persistencia.core.estados;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class EstadosDao extends MantenimientoDao {

	private static String TABLA = "CONFIG_ESTADOS_TBL";
	
	private static Logger log = Logger.getMLogger(EstadosDao.class);
	
	public static Map<Integer, EstadoBean> consultar(Connection conn, String proceso) 
			throws SQLException {
		String sql = null;
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	Map<Integer, EstadoBean> mapaEstados = null;
    	
    	sql = "SELECT PROCESO, " +
    				 "ESTADO, " +
    				 "SUBESTADO, " +
    				 "DESESTADO, " +
    				 "ABREVIATURA, " +
    				 "ICONO, " +
    				 "AMBITO_APLICACION " +
    			"FROM " + getNombreElementoConfiguracion(TABLA) +
    		   "WHERE PROCESO = ? " +
    		"ORDER BY ESTADO, SUBESTADO";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, proceso);
    		
        	log.debug("consultar() - " + pstmt);
            rs = pstmt.executeQuery();
        	
            mapaEstados = new HashMap<Integer, EstadoBean>();
        	while (rs.next()) {
        		EstadoBean estado = new EstadoBean();
        		estado.setProceso(proceso);
        		estado.setEstado(rs.getInt("ESTADO"));
        		estado.setSubEstado(rs.getInt("SUBESTADO"));
        		estado.setDesEstado(rs.getString("DESESTADO"));
        		estado.setAbreviatura(rs.getString("ABREVIATURA"));
        		estado.setIcono(rs.getString("ICONO"));
        		estado.setAmbitoAplicacion(rs.getString("AMBITO_APLICACION"));
        		
        		mapaEstados.put(estado.getEstado(), estado);
        	}
        	
        	return mapaEstados;
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
	
	
	public static Map<String, EstadoBean> consultarSubestados(Connection conn, String proceso) 
			throws SQLException {
		String sql = null;
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	Map<String, EstadoBean> mapaEstados = null;
    	
    	sql = "SELECT PROCESO, " +
    				 "ESTADO, " +
    				 "SUBESTADO, " +
    				 "DESESTADO, " +
    				 "ABREVIATURA, " +
    				 "ICONO, " +
    				 "AMBITO_APLICACION " +
    			"FROM " + getNombreElementoConfiguracion(TABLA) +
    		   "WHERE PROCESO = ? " +
    		"ORDER BY ESTADO, SUBESTADO";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, proceso);
    		
        	log.debug("consultarSubestados() - " + pstmt);
            rs = pstmt.executeQuery();
        	
            mapaEstados = new HashMap<String, EstadoBean>();
        	while (rs.next()) {
        		EstadoBean estado = new EstadoBean();
        		estado.setProceso(proceso);
        		estado.setEstado(rs.getInt("ESTADO"));
        		estado.setSubEstado(rs.getInt("SUBESTADO"));
        		estado.setDesEstado(rs.getString("DESESTADO"));
        		estado.setAbreviatura(rs.getString("ABREVIATURA"));
        		estado.setIcono(rs.getString("ICONO"));
        		estado.setAmbitoAplicacion(rs.getString("AMBITO_APLICACION"));
        		
        		mapaEstados.put(estado.getEstado() + "|" + estado.getSubEstado(), estado);
        	}
        	
        	return mapaEstados;
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
