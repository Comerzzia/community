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

package com.comerzzia.persistencia.general.bancos;


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

public class BancosDao extends MantenimientoDao{
	
	private static String TABLA = "D_BANCOS_TBL";
	
	private static Logger log = Logger.getMLogger(BancosDao.class);

	
	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, 
			ParametrosBuscarBancosBean param) throws SQLException {
				
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	
    	// Inicializamos la página de resultados
    	List<BancoBean> resultados = new ArrayList<BancoBean>(param.getTamañoPagina());
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
                    	BancoBean banco = new BancoBean();
                    	banco.setCodBan(rs.getString("CODBAN"));
                    	banco.setDesBan(rs.getString("DESBAN"));
                    	banco.setDomicilio(rs.getString("DOMICILIO"));
                    	banco.setPoblacion(rs.getString("POBLACION"));
                    	banco.setProvincia(rs.getString("PROVINCIA"));
                    	banco.setTelefono1(rs.getString("TELEFONO1"));
                    	banco.setTelefono2(rs.getString("TELEFONO2"));
                    	banco.setFax(rs.getString("FAX"));
                    	banco.setCcc(rs.getString("CCC"));
                    	banco.setCif(rs.getString("CIF"));
                    	banco.setCp(rs.getString("CP"));
                    	banco.setCodEmp(rs.getString("CODEMP"));
                    	banco.setObservaciones(rs.getString("OBSERVACIONES"));
                    	banco.setActivo(rs.getString("ACTIVO"));
                		resultados.add(banco);
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
	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarBancosBean param) {
		String sql = null;
		
		sql = "SELECT CODBAN, DESBAN, DOMICILIO, POBLACION, PROVINCIA, TELEFONO1, TELEFONO2, FAX, CCC, " +
			  "CIF, CP, CODEMP, OBSERVACIONES, ACTIVO "+
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
	public static String obtenerConsultaCount(ConfigEmpresaBean config, ParametrosBuscarBancosBean param) {
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
	private static String getClausulaWhere(ParametrosBuscarBancosBean param) {
		String where = "";
		
		// CODBAN
		if (!param.getCodBan().isEmpty()) {
			where = "CODBAN LIKE '" + param.getCodBan() + "%' ";
		}
		
		// DESBAN
		if (!param.getDesBan().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "UPPER(DESBAN) LIKE UPPER('" + param.getDesBan() + "%') ";
		}
		
		if (!param.getActivo().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "ACTIVO = '" + param.getActivo() + "' ";
		}
		
		return where;
	} 

	public static BancoBean consultar(Connection conn, ConfigEmpresaBean config, String codBan) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	BancoBean banco = null;
    	String sql = null;
    	
		sql = "SELECT CODBAN, DESBAN, DOMICILIO, POBLACION, PROVINCIA, TELEFONO1, TELEFONO2, FAX, CCC, " +
			"CIF, CP, CODEMP, OBSERVACIONES, ACTIVO "+
			"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
			"WHERE CODBAN= ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codBan);
			log.debug("consultar() - " + pstmt);
		
			rs = pstmt.executeQuery();

			if (rs.next()){
				banco = new BancoBean();
				banco.setCodBan(rs.getString("CODBAN"));
				banco.setDesBan(rs.getString("DESBAN"));
				banco.setDomicilio(rs.getString("DOMICILIO"));
				banco.setPoblacion(rs.getString("POBLACION"));
				banco.setProvincia(rs.getString("PROVINCIA"));
				banco.setTelefono1(rs.getString("TELEFONO1"));
				banco.setTelefono2(rs.getString("TELEFONO2"));
				banco.setFax(rs.getString("FAX"));
				banco.setCcc(rs.getString("CCC"));
				banco.setCif(rs.getString("CIF"));
				banco.setCp(rs.getString("CP"));
				banco.setCodEmp(rs.getString("CODEMP"));
				banco.setObservaciones(rs.getString("OBSERVACIONES"));
				banco.setActivo(rs.getString("ACTIVO"));
			 }
    	
			return banco;
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
	public static void insert(Connection conn, ConfigEmpresaBean config, BancoBean banco) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(CODBAN, DESBAN, DOMICILIO, POBLACION, PROVINCIA, TELEFONO1, TELEFONO2, FAX, CCC, " +
		      "CIF, CP, CODEMP, OBSERVACIONES, ACTIVO) " +
		      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, banco.getCodBan());
        	pstmt.setString(2, banco.getDesBan());
        	pstmt.setString(3, banco.getDomicilio());
        	pstmt.setString(4, banco.getPoblacion());
        	pstmt.setString(5, banco.getProvincia());
        	pstmt.setString(6, banco.getTelefono1());
        	pstmt.setString(7, banco.getTelefono2());
        	pstmt.setString(8, banco.getFax());
        	pstmt.setString(9, banco.getCcc());
        	pstmt.setString(10, banco.getCif());
        	pstmt.setString(11, banco.getCp());
        	pstmt.setString(12, banco.getCodEmp());
        	pstmt.setString(13, banco.getObservaciones());
        	pstmt.setString(14, banco.getActivo());

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
	public static void update(Connection conn, ConfigEmpresaBean config, BancoBean banco) throws SQLException {
			PreparedStatement pstmt = null;
			String sql = null;
			
			sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
			      "SET DESBAN = ?,DOMICILIO = ?, POBLACION = ?, PROVINCIA = ?, TELEFONO1 = ?, TELEFONO2= ?, " +
			      "FAX = ?, CCC = ?, CIF = ?, CP = ?, CODEMP = ?, "+
			      "OBSERVACIONES = ?, ACTIVO = ? " +
			      "WHERE CODBAN = ?";
			
			try {
				pstmt = new PreparedStatement(conn, sql);
				
	        	pstmt.setString(1, banco.getDesBan());
	        	pstmt.setString(2, banco.getDomicilio());
	        	pstmt.setString(3, banco.getPoblacion());
	        	pstmt.setString(4, banco.getProvincia());
	        	pstmt.setString(5, banco.getTelefono1());
	        	pstmt.setString(6, banco.getTelefono2());
	        	pstmt.setString(7, banco.getFax());
	        	pstmt.setString(8, banco.getCcc());
	        	pstmt.setString(9, banco.getCif());
	        	pstmt.setString(10, banco.getCp());
	        	pstmt.setString(11, banco.getCodEmp());
	        	pstmt.setString(12, banco.getObservaciones());
	        	pstmt.setString(13, banco.getActivo());
	        	pstmt.setString(14, banco.getCodBan());
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
	public static void delete(Connection conn, ConfigEmpresaBean config, BancoBean banco) throws SQLException {
			delete(conn, config, banco.getCodBan());
		}
	    	
	    	
    public static void delete(Connection conn, ConfigEmpresaBean config, String codBan) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODBAN = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, codBan);
        	
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
