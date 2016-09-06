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

package com.comerzzia.persistencia.general.unidadesmedida.etiquetas;

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


public class UnidadesMedidaEtiquetasDao extends MantenimientoDao {
	
	private static String TABLA = "D_UNIDAD_MEDIDA_ETIQUETAS_TBL";
	
	private static Logger log = Logger.getMLogger(UnidadesMedidaEtiquetasDao.class);
	

	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, 
			ParametrosBuscarUnidadesMedidaEtiquetasBean param) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<UnidadesMedidaEtiquetasBean> resultados = new ArrayList<UnidadesMedidaEtiquetasBean>(param.getTamañoPagina());
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
                		UnidadesMedidaEtiquetasBean umEtiqueta = new UnidadesMedidaEtiquetasBean();
                		umEtiqueta.setCod_UM_Etiqueta(rs.getString("COD_UM_ETIQUETA"));
                		umEtiqueta.setDes_UM_Etiqueta(rs.getString("DES_UM_ETIQUETA"));
                		umEtiqueta.setDesEtiqueta(rs.getString("DESETIQUETA"));
                		umEtiqueta.setFactor(rs.getLong("FACTOR"));
                		resultados.add(umEtiqueta);
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
    
	
	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarUnidadesMedidaEtiquetasBean param) {
		String sql = null;
		
		sql = "SELECT COD_UM_ETIQUETA, DES_UM_ETIQUETA, DESETIQUETA, FACTOR " +
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
	
	
	public static String obtenerConsultaCount(ConfigEmpresaBean config, ParametrosBuscarUnidadesMedidaEtiquetasBean param) {
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

	
	private static String getClausulaWhere(ParametrosBuscarUnidadesMedidaEtiquetasBean param) {
		String where = "";
		
		// COD_UM_ETIQUETA
		if (!param.getCod_UM_Etiqueta().isEmpty()) {
			where = "COD_UM_ETIQUETA LIKE '" + param.getCod_UM_Etiqueta() + "%' ";
		}
		
		// DES_UM_ETIQUETA
		if (!param.getDes_UM_Etiqueta().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "UPPER(DES_UM_ETIQUETA) LIKE UPPER('" + param.getDes_UM_Etiqueta() + "%') ";
		}
		
		// DESETIQUETA
		if (!param.getDesEtiqueta().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "UPPER(DESETIQUETA) LIKE UPPER('" + param.getDesEtiqueta() + "%') ";
		}
		
		
		return where;
	} 
	
	
    public static UnidadesMedidaEtiquetasBean consultar(Connection conn, ConfigEmpresaBean config, String cod_UM_Etiqueta) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	UnidadesMedidaEtiquetasBean umEtiqueta = null;
    	String sql = null;
    	
    	sql = "SELECT COD_UM_ETIQUETA, DES_UM_ETIQUETA, DESETIQUETA, FACTOR " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE COD_UM_ETIQUETA = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, cod_UM_Etiqueta);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		umEtiqueta = new UnidadesMedidaEtiquetasBean(); 
        		umEtiqueta.setCod_UM_Etiqueta(rs.getString("COD_UM_ETIQUETA"));
        		umEtiqueta.setDes_UM_Etiqueta(rs.getString("DES_UM_ETIQUETA"));
        		umEtiqueta.setDesEtiqueta(rs.getString("DESETIQUETA"));
        		umEtiqueta.setFactor(rs.getLong("FACTOR"));
        		
        	}
        	
    		return umEtiqueta;
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
    
    public static List<UnidadesMedidaEtiquetasBean> consultarTodas(Connection conn, ConfigEmpresaBean config) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	List<UnidadesMedidaEtiquetasBean> listaEtiquetas = new ArrayList<UnidadesMedidaEtiquetasBean>();
    	String sql = null;
    	
    	sql = "SELECT COD_UM_ETIQUETA, DES_UM_ETIQUETA, DESETIQUETA, FACTOR " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA);
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	while (rs.next()){
        		UnidadesMedidaEtiquetasBean umEtiqueta = new UnidadesMedidaEtiquetasBean(); 
        		umEtiqueta.setCod_UM_Etiqueta(rs.getString("COD_UM_ETIQUETA"));
        		umEtiqueta.setDes_UM_Etiqueta(rs.getString("DES_UM_ETIQUETA"));
        		umEtiqueta.setDesEtiqueta(rs.getString("DESETIQUETA"));
        		umEtiqueta.setFactor(rs.getLong("FACTOR"));
        		
        		listaEtiquetas.add(umEtiqueta);
        	}
        	
    		return listaEtiquetas;
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
    
    
    public static void insert(Connection conn, ConfigEmpresaBean config, UnidadesMedidaEtiquetasBean umEtiqueta) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(COD_UM_ETIQUETA, DES_UM_ETIQUETA, DESETIQUETA, FACTOR) " +
		      "VALUES (?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, umEtiqueta.getCod_UM_Etiqueta());
        	pstmt.setString(2, umEtiqueta.getDes_UM_Etiqueta());
        	pstmt.setString(3, umEtiqueta.getDesEtiqueta());
        	pstmt.setLong(4, umEtiqueta.getFactor());
        	
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
    
    
    public static void update(Connection conn, ConfigEmpresaBean config, UnidadesMedidaEtiquetasBean umEtiqueta) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET DES_UM_ETIQUETA = ?, DESETIQUETA = ?, FACTOR = ? " +
		      "WHERE COD_UM_ETIQUETA = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, umEtiqueta.getDes_UM_Etiqueta());
        	pstmt.setString(2, umEtiqueta.getDesEtiqueta());
        	pstmt.setLong(3, umEtiqueta.getFactor());
			pstmt.setString(4, umEtiqueta.getCod_UM_Etiqueta());
        	
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
        
    
    public static void delete(Connection conn, ConfigEmpresaBean config, UnidadesMedidaEtiquetasBean umEtiqueta) throws SQLException {
		delete(conn, config, umEtiqueta.getCod_UM_Etiqueta());
	}
    	
    	
    public static void delete(Connection conn, ConfigEmpresaBean config, String codUmEtiqueta) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE COD_UM_ETIQUETA = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, codUmEtiqueta);
        	
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
