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

package com.comerzzia.persistencia.tesoreria.remesas.cobros;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.core.estados.EstadoBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class RemesasCobrosDao extends MantenimientoDao {

	private static String TABLA = "D_COBROS_REMESAS_CAB_TBL";
	private static String VISTA = "D_COBROS_REMESAS_CAB";
	
	private static Logger log = Logger.getMLogger(RemesasCobrosDao.class);
	
	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, ParametrosBuscarRemesasCobrosBean param) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<RemesaCobroBean> resultados = new ArrayList<RemesaCobroBean>(param.getTamañoPagina());
    	PaginaResultados paginaResultados = new PaginaResultados(param, resultados);
    	
    	// Consultas
    	String sql = obtenerConsulta(config, param);
    	String sqlCount = obtenerConsultaCount(config, param);
    	
        try {
        	pstmt = new PreparedStatement(conn, sqlCount);
    		insertarParametros(pstmt, param);
    		
			// Obtenemos número de resultados
			log.debug("consultar() - " + pstmt);
			rs = pstmt.executeQuery();

			if (rs.next()){
        		paginaResultados.setTotalResultados(rs.getInt(1));
        	}
			
    		try {
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
        	
        	// Si tenemos resultados, obtenemos la pagina requerida
            if (paginaResultados.getTotalResultados() > 0) {
        		pstmt = new PreparedStatement(conn, sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        		insertarParametros(pstmt, param);
            	log.debug("consultar() - " + pstmt);
                rs = pstmt.executeQuery();
                
                int contador = 0;
                if (rs.absolute(paginaResultados.getInicio())) {
                    do {
                    	RemesaCobroBean remesaCobro = new RemesaCobroBean();
                    	remesaCobro.setIdRemesa(rs.getLong("ID_REMESA"));
                    	remesaCobro.setFechaRemesa(rs.getDate("FECHA_REMESA"));
                    	remesaCobro.setCodBanco(rs.getString("CODBAN"));
                    	remesaCobro.setDesBanco(rs.getString("DESBAN"));
                    	remesaCobro.setEstado(rs.getInt("ESTADO"));
                    	remesaCobro.setDesEstado(rs.getString("DESESTADO"));
                    	remesaCobro.setEfectos(rs.getLong("EFECTOS"));
                    	remesaCobro.setClientes(rs.getLong("CLIENTES"));
                    	remesaCobro.setDevueltos(rs.getLong("DEVUELTOS"));
                    	remesaCobro.setImporte(rs.getDouble("IMPORTE"));
                    	
                		resultados.add(remesaCobro);
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
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	} 
	
	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarRemesasCobrosBean param) {
		String sql = null;
		
		sql = "SELECT ID_REMESA, FECHA_REMESA, CODBAN, DESBAN, ESTADO, DESESTADO, " +
				     "EFECTOS, CLIENTES, DEVUELTOS, IMPORTE " 
			  + "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
		
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
	
	public static String obtenerConsultaCount(ConfigEmpresaBean config, ParametrosBuscarRemesasCobrosBean param) {
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
	
	private static String getClausulaWhere(ParametrosBuscarRemesasCobrosBean param) {
		String where = "";
		
		// CODCLI
		if (!param.getCodBanco().isEmpty()) {
			where += "CODBAN = '" + param.getCodBanco() + "' ";
		}
		
		// FECHA_DESDE
		if (param.isBuscarPorFechaDesde() && param.getFechaDesde() != null) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "FECHA_REMESA >= ? ";
		}
		
		// FECHA_HASTA
		if (param.isBuscarPorFechaHasta() && param.getFechaHasta() != null) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "FECHA_REMESA <= ? ";
		}

		// ESTADO
		String condicion, condicionGeneral = "";
		for(int i = 0; i < param.getEstados().getListaEstados().size(); i++) {
            EstadoBean estado = param.getEstados().getListaEstados().get(i);
            if(estado.isChecked()) {
	            condicion = "ESTADO = '" + estado.getEstado() + "' ";
	            condicionGeneral += "(" + condicion + ") OR ";
            }
		}
		if(!condicionGeneral.isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += " (" + condicionGeneral.substring(0,condicionGeneral.length()-3) + ") ";
		}
		
		return where;
	} 
	
	private static void insertarParametros(PreparedStatement pstmt, ParametrosBuscarRemesasCobrosBean param) throws SQLException {
		Integer indice = 1;
		// FECHA_DESDE
		if (param.isBuscarPorFechaDesde() && param.getFechaDesde() != null) {
			pstmt.setDate(indice, Fechas.toSqlDate(param.getFechaDesde()));
			indice++;
		}
		
		// FECHA_HASTA
		if (param.isBuscarPorFechaHasta() && param.getFechaHasta() != null) {
			pstmt.setDate(indice, Fechas.toSqlDate(param.getFechaHasta()));
		}

	}

    public static RemesaCobroBean consultar(Connection conn, ConfigEmpresaBean config, Long idRemesa) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	RemesaCobroBean remesaCobro = null;
    	String sql = null;
    	
    	sql = "SELECT FECHA_REMESA, CODBAN, DESBAN, ESTADO, DESESTADO, " +
				     "EFECTOS, CLIENTES, DEVUELTOS, IMPORTE " + 
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		      "WHERE ID_REMESA = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idRemesa);
    		
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		remesaCobro = new RemesaCobroBean();
            	remesaCobro.setIdRemesa(idRemesa);
            	remesaCobro.setFechaRemesa(rs.getDate("FECHA_REMESA"));
            	remesaCobro.setCodBanco(rs.getString("CODBAN"));
            	remesaCobro.setDesBanco(rs.getString("DESBAN"));
            	remesaCobro.setEstado(rs.getInt("ESTADO"));
            	remesaCobro.setDesEstado(rs.getString("DESESTADO"));
            	remesaCobro.setEfectos(rs.getLong("EFECTOS"));
            	remesaCobro.setClientes(rs.getLong("CLIENTES"));
            	remesaCobro.setDevueltos(rs.getLong("DEVUELTOS"));
            	remesaCobro.setImporte(rs.getDouble("IMPORTE"));

        	}
        	
    		return remesaCobro;
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
    
    public static void insert(Connection conn, ConfigEmpresaBean config, RemesaCobroBean remesaCobro) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(ID_REMESA, CODBAN, FECHA_REMESA, ESTADO)" +
		      "VALUES (?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, remesaCobro.getIdRemesa());
			pstmt.setString(2,remesaCobro.getCodBanco());
			pstmt.setDate(3,Fechas.toSqlDate(remesaCobro.getFechaRemesa()));
			pstmt.setInt(4, remesaCobro.getEstado());
        	
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
    
    public static void delete(Connection conn, ConfigEmpresaBean config, Long idRemesa) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE ID_REMESA = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idRemesa);
        	
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
    
    public static void convertirEnRemesa(Connection conn, ConfigEmpresaBean config, RemesaCobroBean remesaCobro) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET ESTADO = ? " + 
		      "WHERE ID_REMESA = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setInt(1, remesaCobro.getEstado());
			pstmt.setLong(2, remesaCobro.getIdRemesa());

			log.debug("convertirEnRemesa() - " + pstmt);
        	
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
