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

package com.comerzzia.persistencia.core.impuestos.tiposimpuestos;

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

public class TiposImpuestosDao extends MantenimientoDao {

	private static String TABLA = "CONFIG_IMP_TIPOS_TBL";
	
	private static Logger log = Logger.getMLogger(TiposImpuestosDao.class);
	
	public static PaginaResultados consultar(Connection conn, 
			ParametrosBuscarTiposImpuestosBean param) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<TipoImpuestoBean> resultados = new ArrayList<TipoImpuestoBean>(param.getTamañoPagina());
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
                		TipoImpuestoBean tipoImpuesto = new TipoImpuestoBean();
                		tipoImpuesto.setCodTipoImpuesto(rs.getString("CODIMP"));
                		tipoImpuesto.setDesTipoImpuesto(rs.getString("DESIMP"));
                		resultados.add(tipoImpuesto);
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
    
	
	public static String obtenerConsulta(ParametrosBuscarTiposImpuestosBean param) {
		String sql = null;
		
		sql = "SELECT CODIMP, DESIMP " +
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
	
	
	public static String obtenerConsultaCount(ParametrosBuscarTiposImpuestosBean param) {
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

	
	private static String getClausulaWhere(ParametrosBuscarTiposImpuestosBean param) {
		String where = "";
		
		// CODIMP
		if (!param.getCodTipoImpuesto().isEmpty()) {
			where = "CODIMP LIKE '" + param.getCodTipoImpuesto() + "%' ";
		}
		
		// DESIMP
		if (!param.getDesTipoImpuesto().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "UPPER(DESIMP) LIKE UPPER('" + param.getDesTipoImpuesto() + "%') ";
		}
		
		return where;
	}
	
	
	public static List<TipoImpuestoBean> consultar(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	
    	List<TipoImpuestoBean> listaTiposImpuestos = new ArrayList<TipoImpuestoBean>();
    	
    	sql = "SELECT CODIMP, DESIMP " +
	          "FROM " + getNombreElementoConfiguracion(TABLA);
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	while (rs.next()){
        		TipoImpuestoBean tipoImpuesto = new TipoImpuestoBean();
        		tipoImpuesto.setCodTipoImpuesto(rs.getString("CODIMP"));
        		tipoImpuesto.setDesTipoImpuesto(rs.getString("DESIMP"));
        		
        		listaTiposImpuestos.add(tipoImpuesto);
        	}
        	
        	return listaTiposImpuestos;
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
	
	
    public static TipoImpuestoBean consultar(Connection conn, String codTipoImpuesto) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	TipoImpuestoBean tipoImpuesto = null;
    	String sql = null;
    	
    	sql = "SELECT CODIMP, DESIMP " +
    	      "FROM " + getNombreElementoConfiguracion(TABLA) +
		      "WHERE CODIMP = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, codTipoImpuesto);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		tipoImpuesto = new TipoImpuestoBean(); 
        		tipoImpuesto.setCodTipoImpuesto(rs.getString("CODIMP"));
        		tipoImpuesto.setDesTipoImpuesto(rs.getString("DESIMP"));
        	}
        	
    		return tipoImpuesto;
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
    
    
    public static void insert(Connection conn, TipoImpuestoBean tipoImpuesto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElementoConfiguracion(TABLA) + 
		      "(CODIMP, DESIMP) " +
		      "VALUES (?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, tipoImpuesto.getCodTipoImpuesto());
        	pstmt.setString(2, tipoImpuesto.getDesTipoImpuesto());
        	
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
    
    
    public static void update(Connection conn, TipoImpuestoBean tipoImpuesto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElementoConfiguracion(TABLA) +
		      "SET DESIMP = ?" +
		      "WHERE CODIMP = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);		
        	pstmt.setString(1, tipoImpuesto.getDesTipoImpuesto());
        	pstmt.setString(2, tipoImpuesto.getCodTipoImpuesto());
        	
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
        
    
    public static void delete(Connection conn, TipoImpuestoBean tipoImpuesto) throws SQLException {
		delete(conn, tipoImpuesto.getCodTipoImpuesto());
	}
    	
    	
    public static void delete(Connection conn, String codTipoImpuesto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElementoConfiguracion(TABLA) +
		      "WHERE CODIMP = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, codTipoImpuesto);
        	
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
