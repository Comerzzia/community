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

package com.comerzzia.persistencia.general.categorizaciones;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class CategorizacionesDao extends MantenimientoDao {
	
	private static String TABLA = "D_CATEGORIZACION_TBL";
	private static String VISTA = "D_CATEGORIZACION";
	private static String TABLA_TIENDA = "T_CATEGORIZACION_TBL";
	
	private static Logger log = Logger.getMLogger(CategorizacionesDao.class);

	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, ParametrosBuscarCategorizacionesBean param) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<CategorizacionBean> resultados = new ArrayList<CategorizacionBean>(param.getTamañoPagina());
    	PaginaResultados paginaResultados = new PaginaResultados(param, resultados);
    	
    	// Consultas
    	String sql = obtenerConsulta(config, param);
    	String sqlCount = obtenerConsultaCount(config, param);
        
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
                		CategorizacionBean categorizacion = new CategorizacionBean();
                		categorizacion.setCodCat(rs.getString("CODCAT"));
                		categorizacion.setDesCat(rs.getString("DESCAT"));
                		categorizacion.setActivo(rs.getString("ACTIVO"));
                		resultados.add(categorizacion);
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
	
	
	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarCategorizacionesBean param) {
		String sql = null;
		
		sql = "SELECT CODCAT, DESCAT, ACTIVO " +
		      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA);
		
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
	
	
	public static String obtenerConsultaCount(ConfigEmpresaBean config, ParametrosBuscarCategorizacionesBean param) {
		String sql = null;
		
		sql = "SELECT COUNT(*) " +
		      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }
        
		return sql;
	}
	
	
	private static String getClausulaWhere(ParametrosBuscarCategorizacionesBean param) {
		String where = "";
		
		// CODCAT
		if (!param.getCodCat().isEmpty()) {
			where = "CODCAT LIKE '" + param.getCodCat() + "%' ";
		}
		
		// DESCAT
		if (!param.getDesCat().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "UPPER(DESCAT) LIKE UPPER('" + param.getDesCat() + "%') ";
		}
		
		//ACTIVO
		if (!param.getActivo().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "ACTIVO = '"+ param.getActivo() +"' ";
		}
		
		return where;
	}
	
	
	public static CategorizacionBean consultar(Connection conn, ConfigEmpresaBean config, String codCat) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	CategorizacionBean categorizacion = null;
    	String sql = null;
    	
    	sql = "SELECT CODCAT, DESCAT, ACTIVO " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODCAT = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, codCat);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		categorizacion = new CategorizacionBean();
        		categorizacion.setCodCat(rs.getString("CODCAT"));
        		categorizacion.setDesCat(rs.getString("DESCAT"));
        		categorizacion.setActivo(rs.getString("ACTIVO"));
        	}
        	
    		return categorizacion;
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
	
	
	public static void insert(Connection conn, ConfigEmpresaBean config, CategorizacionBean categorizacion) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(CODCAT, DESCAT, ACTIVO) " +
		      "VALUES (?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, categorizacion.getCodCat());
        	pstmt.setString(2, categorizacion.getDesCat());
        	pstmt.setString(3, categorizacion.getActivo());
        	
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
	
	
	public static void update(Connection conn, ConfigEmpresaBean config, CategorizacionBean categorizacion) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET DESCAT = ?, ACTIVO = ? " +
		      "WHERE CODCAT = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, categorizacion.getDesCat());
        	pstmt.setString(2, categorizacion.getActivo());
        	pstmt.setString(3, categorizacion.getCodCat());
        	
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
	
	
	public static void delete(Connection conn, ConfigEmpresaBean config, CategorizacionBean categorizacion) throws SQLException {
		delete(conn, config, categorizacion.getCodCat());
	}
	
	
	public static void delete(Connection conn, ConfigEmpresaBean config, String codCat) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODCAT = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, codCat);
        	
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

	
	public static List<CategorizacionBean> consultarCategoriasPrimarias(Connection conn, ConfigEmpresaBean config) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	List<CategorizacionBean> resultados = new ArrayList<CategorizacionBean>();
    	
		String sql = "SELECT CODCAT, DESCAT, ACTIVO " +
			  "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
			  "WHERE ACTIVO = 'S' " +
			  "AND LENGTH(CODCAT) = 2";
        
    	try {
    		stmt = conn.createStatement();

    		log.debug("consultarCategoriasPrimarias() - " + sql);
        	rs = stmt.executeQuery(sql);
                
            while(rs.next()) {
	    		CategorizacionBean categorizacion = new CategorizacionBean();
	    		categorizacion.setCodCat(rs.getString("CODCAT"));
	    		categorizacion.setDesCat(rs.getString("DESCAT"));
           		resultados.add(categorizacion);
        	}
            return resultados;
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

	
	public static List<CategorizacionBean> consultarCategoriasSecundarias(Connection conn, ConfigEmpresaBean config, String codCatPadre) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	List<CategorizacionBean> resultados = new ArrayList<CategorizacionBean>();
    	
		String sql = "SELECT CODCAT, DESCAT, ACTIVO " +
			  "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
			  "WHERE ACTIVO = 'S' " +
			  "AND LENGTH(CODCAT) > 2 " +
			  "AND CODCAT_PADRE = '" + codCatPadre + "'";
        
    	try {
    		stmt = conn.createStatement();

    		log.debug("consultarCategoriasSecundarias() - " + sql);
        	rs = stmt.executeQuery(sql);
                
            while(rs.next()) {
	    		CategorizacionBean categorizacion = new CategorizacionBean();
	    		categorizacion.setCodCat(rs.getString("CODCAT"));
	    		categorizacion.setDesCat(rs.getString("DESCAT"));
           		resultados.add(categorizacion);
        	}
            return resultados;
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

	
	public static List<CategorizacionBean> consultarCategorizacionesSincronizacion(Connection conn,
			ConfigEmpresaBean config, String codAlmacen) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	
    	List<CategorizacionBean> categorizaciones = new ArrayList<CategorizacionBean>();
    	
    	sql = "SELECT DCAT.CODCAT, DCAT.DESCAT, DCAT.ACTIVO " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + "DCAT " +
    	      "LEFT JOIN " + getNombreElemento(config.getEsquemaEmpresa(), TABLA_TIENDA) + "TCAT " +
    	      		"ON (TCAT.CODCAT = DCAT.CODCAT AND TCAT.CODALM = ?) " +
    	      "WHERE TCAT.CODCAT IS NULL " +
                "OR (TCAT.CODCAT IS NOT NULL AND " +
                      "(TCAT.DESCAT <> DCAT.DESCAT OR " +
                       "TCAT.ACTIVO <> DCAT.ACTIVO) " +
                   ")";
    	
    	try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codAlmacen);
			
			log.debug("consultarCategorizacionesSincronizacion() - " + pstmt);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()){
				CategorizacionBean categorizacion = new CategorizacionBean();
				categorizacion.setCodCat(rs.getString("CODCAT"));
				categorizacion.setDesCat(rs.getString("DESCAT"));
				categorizacion.setActivo(rs.getString("ACTIVO"));
				
				categorizaciones.add(categorizacion);
			}
			
			return categorizaciones;
		}
		finally {
			try {
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
}
