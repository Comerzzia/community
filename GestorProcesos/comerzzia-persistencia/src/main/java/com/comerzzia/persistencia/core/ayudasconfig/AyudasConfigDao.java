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

package com.comerzzia.persistencia.core.ayudasconfig;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;


public class AyudasConfigDao extends MantenimientoDao {
	
	private static String TABLA = "CONFIG_AYUDAS_TBL";
	
	private static Logger log = Logger.getMLogger(AyudasConfigDao.class);
	
	
	public static PaginaResultados consultar(Connection conn, ParametrosBuscarAyudasConfigBean param) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<AyudaConfigBean> resultados = new ArrayList<AyudaConfigBean>(param.getTamañoPagina());
    	PaginaResultados paginaResultados = new PaginaResultados(param, resultados);
    	
    	// Consultas
    	String sql = obtenerConsulta(param);
    	String sqlCount = obtenerConsultaCount(param);
        
    	try {
    		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    		
    		// Obtenemos número de resultados
        	log.debug("consultar() - " + sqlCount);
        	rs = stmt.executeQuery(sqlCount);
        	if (rs.next()){
        		paginaResultados.setTotalResultados(rs.getInt(1));
        	}
        	rs.close();
        	
        	// Si tenemos resultados, obtenemos la pagina requerida
            if (paginaResultados.getTotalResultados() > 0) {
            	log.debug("consultar() - " + sql);
                rs = stmt.executeQuery(sql);
                
                int contador = 0;
                if (rs.absolute(paginaResultados.getInicio())) {
                    do {
                		AyudaConfigBean ayuda = new AyudaConfigBean();
                		ayuda.setNombre(rs.getString("NOMBRE"));
                		ayuda.setXml(rs.getBlob("DEFINICION"));

                		resultados.add(ayuda);
                        contador++;
                    } while (rs.next() && contador < paginaResultados.getTamañoPagina());                   
                }        		
        	}
            
            return paginaResultados;
    	}
    	finally {
    		try {
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try {
    			stmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
	
	
	public static String obtenerConsulta(ParametrosBuscarAyudasConfigBean param) {
		String sql = null;
		
		sql = "SELECT NOMBRE, DEFINICION " +
		      "FROM " + getNombreElementoConfiguracion(TABLA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }
        
        // Clausula ORDER BY
        if (!param.getOrden().isEmpty()) {
        	sql += "ORDER BY " + param.getOrden();
        }
        
		return sql;
	}
	
	
	public static String obtenerConsultaCount(ParametrosBuscarAyudasConfigBean param) {
		String sql = null;
		
		sql = "SELECT COUNT(*) " +
		      "FROM " + getNombreElementoConfiguracion(TABLA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }
        
		return sql;
	}
	
	
	private static String getClausulaWhere(ParametrosBuscarAyudasConfigBean param) {
		String where = "";
		
		// NOMBRE
		if (!param.getNombre().isEmpty()) {
			where = "NOMBRE LIKE '" + param.getNombre() + "%' ";
		}

		return where;
	}
	
	
	public static AyudaConfigBean consultar(Connection conn, String nombre) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	AyudaConfigBean ayuda = null;
    	String sql = null;
    	
    	sql = "SELECT DEFINICION " +
    	      "FROM " + getNombreElementoConfiguracion(TABLA) +
		      "WHERE NOMBRE = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, nombre);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		ayuda = new AyudaConfigBean();
        		ayuda.setNombre(nombre);
        		ayuda.setXml(rs.getBlob("DEFINICION"));
        	}
        	
    		return ayuda;
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
	

	public static void insert(Connection conn, AyudaConfigBean ayuda) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElementoConfiguracion(TABLA) + 
		      "(NOMBRE, DEFINICION) VALUES (?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, ayuda.getNombre());
        	pstmt.setBytes(2, ayuda.getXmlAyuda().getBytes());
        	
        	log.debug("insert() - " + pstmt);
        	
        	pstmt.execute();
		}
		catch (SQLException e) {
			throw getDaoException(e);
		}
		finally {
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
	
	
	public static void update(Connection conn, AyudaConfigBean ayuda) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElementoConfiguracion(TABLA) +
		      "SET DEFINICION = ? " +
		      "WHERE NOMBRE = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setBytes(1, ayuda.getXmlAyuda().getBytes());
			pstmt.setString(2, ayuda.getNombre());
        	
        	log.debug("update() - " + pstmt);
        	
        	pstmt.execute();
		}
		catch (SQLException e) {
			throw getDaoException(e);
		}
		finally {
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
	
	
	public static void delete(Connection conn, AyudaConfigBean ayuda) throws SQLException {
		delete(conn, ayuda.getNombre());
	}
	
	
	public static void delete(Connection conn, String nombre) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElementoConfiguracion(TABLA) +
		      "WHERE NOMBRE = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, nombre);
        	
        	log.debug("delete() - " + pstmt);
        	
        	pstmt.execute();
		}
		catch (SQLException e) {
			throw getDaoException(e);
		}
		finally {
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
}
