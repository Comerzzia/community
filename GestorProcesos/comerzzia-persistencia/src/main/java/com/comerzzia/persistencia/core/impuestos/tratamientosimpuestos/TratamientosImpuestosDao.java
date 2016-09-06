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

package com.comerzzia.persistencia.core.impuestos.tratamientosimpuestos;

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

public class TratamientosImpuestosDao extends MantenimientoDao {

	private static String TABLA = "CONFIG_IMP_TRATAMIENTO_TBL";
	
	private static Logger log = Logger.getMLogger(TratamientosImpuestosDao.class);
	
	public static PaginaResultados consultar(Connection conn, 
			ParametrosBuscarTratamientosImpuestosBean param) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<TratamientoImpuestoBean> resultados = new ArrayList<TratamientoImpuestoBean>(param.getTamañoPagina());
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
                		TratamientoImpuestoBean tratImpuesto= new TratamientoImpuestoBean();
                		tratImpuesto.setIdTratImpuestos(rs.getLong("ID_TRAT_IMPUESTOS"));
                		tratImpuesto.setCodTratImp(rs.getString("CODTRATIMP"));
                		tratImpuesto.setDesTratImp(rs.getString("DESTRATIMP"));               		
                		tratImpuesto.setAplicaRecargo(rs.getString("APLICA_RECARGO"));
                		resultados.add(tratImpuesto);
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
    
	
	public static String obtenerConsulta(ParametrosBuscarTratamientosImpuestosBean param) {
		String sql = null;
		
		sql = "SELECT ID_TRAT_IMPUESTOS, CODTRATIMP, DESTRATIMP, APLICA_RECARGO " +
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
	
	
	public static String obtenerConsultaCount(ParametrosBuscarTratamientosImpuestosBean param) {
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

	
	private static String getClausulaWhere(ParametrosBuscarTratamientosImpuestosBean param) {
		String where = "";
		
		// CODTRATIMP
		if (!param.getCodTratImp().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "UPPER(CODTRATIMP) LIKE UPPER('" + param.getCodTratImp() + "%') ";
		}
		
		// DESTRATIMP
		if (!param.getDesTratImp().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "UPPER(DESTRATIMP) LIKE UPPER('" + param.getDesTratImp() + "%') ";
		}
		
		return where;
	} 
	
	
    public static TratamientoImpuestoBean consultar(Connection conn, Long idTratImpuestos) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	TratamientoImpuestoBean tratImpuesto = null;
    	String sql = null;
    	
    	sql = "SELECT ID_TRAT_IMPUESTOS, CODTRATIMP, DESTRATIMP, APLICA_RECARGO " +
    	      "FROM " + getNombreElementoConfiguracion(TABLA) +
		      "WHERE ID_TRAT_IMPUESTOS = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idTratImpuestos);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		tratImpuesto = new TratamientoImpuestoBean(); 
        		tratImpuesto.setIdTratImpuestos(rs.getLong("ID_TRAT_IMPUESTOS"));
        		tratImpuesto.setCodTratImp(rs.getString("CODTRATIMP"));
        		tratImpuesto.setDesTratImp(rs.getString("DESTRATIMP"));               		
        		tratImpuesto.setAplicaRecargo(rs.getString("APLICA_RECARGO"));
        	}
        	
    		return tratImpuesto;
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
    
    public static List<TratamientoImpuestoBean> consultar(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	TratamientoImpuestoBean tratImpuesto = null;
    	List<TratamientoImpuestoBean> listaTratamientos = new ArrayList<TratamientoImpuestoBean>();
    	String sql = null;
    	
    	sql = "SELECT ID_TRAT_IMPUESTOS, CODTRATIMP, DESTRATIMP, APLICA_RECARGO " +
    	      "FROM " + getNombreElementoConfiguracion(TABLA);
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	while (rs.next()){
        		tratImpuesto = new TratamientoImpuestoBean(); 
        		tratImpuesto.setIdTratImpuestos(rs.getLong("ID_TRAT_IMPUESTOS"));
        		tratImpuesto.setCodTratImp(rs.getString("CODTRATIMP"));
        		tratImpuesto.setDesTratImp(rs.getString("DESTRATIMP"));               		
        		tratImpuesto.setAplicaRecargo(rs.getString("APLICA_RECARGO"));
        		listaTratamientos.add(tratImpuesto);
        	}
        	
    		return listaTratamientos;
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
    
    public static void insert(Connection conn, TratamientoImpuestoBean tratImpuesto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElementoConfiguracion(TABLA) + 
		      "(ID_TRAT_IMPUESTOS, CODTRATIMP, DESTRATIMP, APLICA_RECARGO) " +
		      "VALUES (?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, tratImpuesto.getIdTratImpuestos());
        	pstmt.setString(2, tratImpuesto.getCodTratImp());
        	pstmt.setString(3, tratImpuesto.getDesTratImp());
        	pstmt.setString(4, tratImpuesto.getAplicaRecargo());
        	
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
    
    public static void update(Connection conn, TratamientoImpuestoBean tratImpuesto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElementoConfiguracion(TABLA) +
		      "SET CODTRATIMP = ?, DESTRATIMP = ?, APLICA_RECARGO = ? " +
		      "WHERE ID_TRAT_IMPUESTOS = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			
        	pstmt.setString(1, tratImpuesto.getCodTratImp());
        	pstmt.setString(2, tratImpuesto.getDesTratImp());
        	pstmt.setString(3, tratImpuesto.getAplicaRecargo());
        	pstmt.setLong(4, tratImpuesto.getIdTratImpuestos());
        	
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
        
    
    public static void delete(Connection conn, TratamientoImpuestoBean tratImpuesto) throws SQLException {
		delete(conn, tratImpuesto.getIdTratImpuestos());
	}
    	
    	
    public static void delete(Connection conn, Long idTratImpuestos) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElementoConfiguracion(TABLA) +
		      "WHERE ID_TRAT_IMPUESTOS = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idTratImpuestos);
        	
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
