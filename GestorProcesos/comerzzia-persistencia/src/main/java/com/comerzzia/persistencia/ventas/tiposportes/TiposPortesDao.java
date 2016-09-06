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

package com.comerzzia.persistencia.ventas.tiposportes;

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

public class TiposPortesDao extends MantenimientoDao {

	private static String TABLA = "D_TIPOS_PORTES_TBL";
	private static String VISTA = "D_TIPOS_PORTES";
	
	private static Logger log = Logger.getMLogger(TiposPortesDao.class);
	
	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, 
			ParametrosBuscarTiposPortesBean param) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<TipoPorteBean> resultados = new ArrayList<TipoPorteBean>(param.getTamañoPagina());
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
                		TipoPorteBean tipoPorte = new TipoPorteBean();
                		tipoPorte.setIdTipoPorte(rs.getLong("ID_TIPO_PORTE"));
                		tipoPorte.setDesTipoPorte(rs.getString("DESTIPOPORTE"));
                		tipoPorte.setCodArtPorte(rs.getString("CODART_PORTE"));
                		tipoPorte.setDesArtPorte(rs.getString("DESART_PORTE"));
                		tipoPorte.setDesdeVolumenVenta((rs.getString("DESDE_VOLUMEN_VENTA") != null) ? rs.getLong("DESDE_VOLUMEN_VENTA") : null);
                		resultados.add(tipoPorte);
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
    
	
	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarTiposPortesBean param) {
		String sql = null;
		
		sql = "SELECT ID_TIPO_PORTE, DESTIPOPORTE, CODART_PORTE, DESART_PORTE, DESDE_VOLUMEN_VENTA " +
		      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
		
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
	
	
	public static String obtenerConsultaCount(ConfigEmpresaBean config, ParametrosBuscarTiposPortesBean param) {
		String sql = null;
		
		sql = "SELECT COUNT(*) " +
		      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }
        
		return sql;
	}

	
	private static String getClausulaWhere(ParametrosBuscarTiposPortesBean param) {
		String where = "";
		
		// DESTIPOPORTE
		if (!param.getDesTipoPorte().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "UPPER(DESTIPOPORTE) LIKE UPPER('" + param.getDesTipoPorte() + "%') ";
		}
		
		return where;
	} 
	
	
    public static TipoPorteBean consultar(Connection conn, ConfigEmpresaBean config, Long idTipoPorte) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	TipoPorteBean tipoPorte = null;
    	String sql = null;
    	
    	sql = "SELECT ID_TIPO_PORTE, DESTIPOPORTE, CODART_PORTE, DESART_PORTE, DESDE_VOLUMEN_VENTA, URL_TRACKING " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		      "WHERE ID_TIPO_PORTE = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idTipoPorte);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		tipoPorte = new TipoPorteBean(); 
        		tipoPorte.setIdTipoPorte(rs.getLong("ID_TIPO_PORTE"));
        		tipoPorte.setDesTipoPorte(rs.getString("DESTIPOPORTE"));
        		tipoPorte.setCodArtPorte(rs.getString("CODART_PORTE"));
        		tipoPorte.setDesArtPorte(rs.getString("DESART_PORTE"));
        		tipoPorte.setDesdeVolumenVenta((rs.getString("DESDE_VOLUMEN_VENTA") != null) ? rs.getLong("DESDE_VOLUMEN_VENTA") : null);
        		tipoPorte.setUrlTracking(rs.getString("URL_TRACKING"));
        	}
        	
    		return tipoPorte;
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
    
    public static TipoPorteBean consultar(Connection conn, ConfigEmpresaBean config, Double volumenVenta) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	TipoPorteBean tipoPorte = null;
    	String sql = null;
    	
    	sql = "SELECT ID_TIPO_PORTE, DESTIPOPORTE, CODART_PORTE, DESART_PORTE, DESDE_VOLUMEN_VENTA " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		      "WHERE DESDE_VOLUMEN_VENTA <= ? " +
		      "ORDER BY DESDE_VOLUMEN_VENTA DESC";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setDouble(1, volumenVenta);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){ // nos quedamos con el primer registro 
        		tipoPorte = new TipoPorteBean(); 
        		tipoPorte.setIdTipoPorte(rs.getLong("ID_TIPO_PORTE"));
        		tipoPorte.setDesTipoPorte(rs.getString("DESTIPOPORTE"));
        		tipoPorte.setCodArtPorte(rs.getString("CODART_PORTE"));
        		tipoPorte.setDesArtPorte(rs.getString("DESART_PORTE"));
        		tipoPorte.setDesdeVolumenVenta(rs.getLong("DESDE_VOLUMEN_VENTA"));
        	}
        	
    		return tipoPorte;
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
    
    public static void insert(Connection conn, ConfigEmpresaBean config, TipoPorteBean tipoPorte) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(ID_TIPO_PORTE, DESTIPOPORTE, CODART_PORTE, DESDE_VOLUMEN_VENTA, URL_TRACKING) " +
		      "VALUES (?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, tipoPorte.getIdTipoPorte());
        	pstmt.setString(2, tipoPorte.getDesTipoPorte());
        	pstmt.setString(3, tipoPorte.getCodArtPorte());
        	pstmt.setLong(4, tipoPorte.getDesdeVolumenVenta());
        	pstmt.setString(5, tipoPorte.getUrlTracking());
        	
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
    
    public static void update(Connection conn, ConfigEmpresaBean config, TipoPorteBean tipoPorte) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET DESTIPOPORTE = ?, CODART_PORTE = ?, DESDE_VOLUMEN_VENTA = ?, URL_TRACKING = ? " +
		      "WHERE ID_TIPO_PORTE = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			
        	pstmt.setString(1, tipoPorte.getDesTipoPorte());
        	pstmt.setString(2, tipoPorte.getCodArtPorte());
        	pstmt.setLong(3, tipoPorte.getDesdeVolumenVenta());
        	pstmt.setString(4, tipoPorte.getUrlTracking());
        	pstmt.setLong(5, tipoPorte.getIdTipoPorte());
        	
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
        
    
    public static void delete(Connection conn, ConfigEmpresaBean config, TipoPorteBean tipoPorte) throws SQLException {
		delete(conn, config, tipoPorte.getIdTipoPorte());
	}
    	
    	
    public static void delete(Connection conn, ConfigEmpresaBean config, Long idTipoPorte) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE ID_TIPO_PORTE = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idTipoPorte);
        	
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
