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

package com.comerzzia.persistencia.general.familias;

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

public class FamiliasDao extends MantenimientoDao{
	
private static String TABLA = "D_FAMILIAS_TBL";
	
	private static Logger log = Logger.getMLogger(FamiliasDao.class);
	

	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, 
			ParametrosBuscarFamiliasBean param) throws SQLException {
				
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	
    	// Inicializamos la página de resultados
    	List<FamiliaBean> resultados = new ArrayList<FamiliaBean>(param.getTamañoPagina());
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
                		FamiliaBean familia = new FamiliaBean();
                		familia.setCodFam(rs.getString("CODFAM"));
                		familia.setDesFam(rs.getString("DESFAM"));
                		familia.setActivo(rs.getString("ACTIVO"));
                		resultados.add(familia);
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
    
	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarFamiliasBean param) {
		String sql = null;
		
		sql = "SELECT CODFAM, DESFAM, ACTIVO " +
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
	
	public static String obtenerConsultaCount(ConfigEmpresaBean config, ParametrosBuscarFamiliasBean param) {
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

	private static String getClausulaWhere(ParametrosBuscarFamiliasBean param) {
		String where = "";
		
		// CODFAM
		if (!param.getCodFam().isEmpty()) {
			where = "CODFAM LIKE '" + param.getCodFam() + "%' ";
		}
		
		// DESFAM
		if (!param.getDesFam().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "UPPER(DESFAM) LIKE UPPER('" + param.getDesFam() + "%') ";
		}
		
		if (!param.getActivo().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "ACTIVO = '" + param.getActivo()+ "' ";
		}
		
		return where;
	} 
	
    public static FamiliaBean consultar(Connection conn, ConfigEmpresaBean config, String codFam) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	FamiliaBean familia = null;
    	String sql = null;
    	
    	sql = "SELECT CODFAM, DESFAM, ACTIVO " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODFAM = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, codFam);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		familia = new FamiliaBean(); 
        		familia.setCodFam(rs.getString("CODFAM"));
        		familia.setDesFam(rs.getString("DESFAM"));
        		familia.setActivo(rs.getString("ACTIVO"));
        	}
        	
    		return familia;
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
    
    public static void insert(Connection conn, ConfigEmpresaBean config, FamiliaBean familia) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(CODFAM, DESFAM, ACTIVO) " +
		      "VALUES (?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, familia.getCodFam());
        	pstmt.setString(2, familia.getDesFam());
        	pstmt.setString(3, familia.getActivo());
        	
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
    
    public static void update(Connection conn, ConfigEmpresaBean config, FamiliaBean familia) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET DESFAM = ?, ACTIVO = ? " +
		      "WHERE CODFAM = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, familia.getDesFam());
        	pstmt.setString(2, familia.getActivo());
        	pstmt.setString(3, familia.getCodFam());
        	
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
        
    public static void delete(Connection conn, ConfigEmpresaBean config, FamiliaBean familia) throws SQLException {
		delete(conn, config, familia.getCodFam());
	}
    	
    	
    public static void delete(Connection conn, ConfigEmpresaBean config, String codFam) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODFAM = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, codFam);
        	
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

