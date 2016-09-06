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

package com.comerzzia.persistencia.tesoreria.remesas.pagos;

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

public class RemesasPagosDao extends MantenimientoDao{
	private static String TABLA = "D_PAGOS_REMESAS_CAB_TBL";
	private static String VISTA = "D_PAGOS_REMESAS_CAB";
	
	private static Logger log = Logger.getMLogger(RemesasPagosDao.class);
	
	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, ParametrosBuscarRemesasPagosBean param) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<RemesaPagoBean> resultados = new ArrayList<RemesaPagoBean>(param.getTamañoPagina());
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
                    	RemesaPagoBean remesaPago = new RemesaPagoBean();
                    	remesaPago.setIdRemesa(rs.getLong("ID_REMESA"));
                    	remesaPago.setFechaRemesa(rs.getDate("FECHA_REMESA"));
                    	remesaPago.setCodBanco(rs.getString("CODBAN"));
                    	remesaPago.setDesBanco(rs.getString("DESBAN"));
                    	remesaPago.setCodTipoEfecto(rs.getString("CODTIPOEFEC"));
                    	remesaPago.setDesTipoEfecto(rs.getString("DESTIPOEFEC"));
                    	remesaPago.setEstado(rs.getInt("ESTADO"));
                    	remesaPago.setDesEstado(rs.getString("DESESTADO"));
                    	remesaPago.setEfectos(rs.getLong("EFECTOS"));
                    	remesaPago.setProveedores(rs.getLong("PROVEEDORES"));
                    	remesaPago.setImporte(rs.getDouble("IMPORTE"));
                    	
                		resultados.add(remesaPago);
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
	
	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarRemesasPagosBean param) {
		String sql = null;
		
		sql = "SELECT ID_REMESA, FECHA_REMESA, CODBAN, DESBAN, CODTIPOEFEC, DESTIPOEFEC, " +
				     "ESTADO, DESESTADO, EFECTOS, PROVEEDORES, IMPORTE " 
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
	
	public static String obtenerConsultaCount(ConfigEmpresaBean config, ParametrosBuscarRemesasPagosBean param) {
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
	
	private static String getClausulaWhere(ParametrosBuscarRemesasPagosBean param) {
		String where = "";
		
		// CODBAN
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
	
	private static void insertarParametros(PreparedStatement pstmt, ParametrosBuscarRemesasPagosBean param) throws SQLException {
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

    public static RemesaPagoBean consultar(Connection conn, ConfigEmpresaBean config, Long idRemesa) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	RemesaPagoBean remesaPago = null;
    	String sql = null;
    	
    	sql = "SELECT FECHA_REMESA, CODBAN, DESBAN, CODTIPOEFEC, DESTIPOEFEC, " +
				     "ESTADO, DESESTADO, EFECTOS, PROVEEDORES, IMPORTE " + 
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		      "WHERE ID_REMESA = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idRemesa);
    		
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		remesaPago = new RemesaPagoBean();
        		remesaPago.setIdRemesa(idRemesa);
        		remesaPago.setFechaRemesa(rs.getDate("FECHA_REMESA"));
        		remesaPago.setCodBanco(rs.getString("CODBAN"));
        		remesaPago.setDesBanco(rs.getString("DESBAN"));
            	remesaPago.setCodTipoEfecto(rs.getString("CODTIPOEFEC"));
            	remesaPago.setDesTipoEfecto(rs.getString("DESTIPOEFEC"));
            	remesaPago.setEstado(rs.getInt("ESTADO"));
            	remesaPago.setDesEstado(rs.getString("DESESTADO"));
        		remesaPago.setEfectos(rs.getLong("EFECTOS"));
        		remesaPago.setProveedores(rs.getLong("PROVEEDORES"));
        		remesaPago.setImporte(rs.getDouble("IMPORTE"));

        	}
        	
    		return remesaPago;
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
    
    public static void insert(Connection conn, ConfigEmpresaBean config, RemesaPagoBean remesaPago) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(ID_REMESA, CODBAN, CODTIPOEFEC, ESTADO, FECHA_REMESA, FECHA_GENERACION)" +
		      "VALUES (?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, remesaPago.getIdRemesa());
			pstmt.setString(2,remesaPago.getCodBanco());
			pstmt.setString(3,remesaPago.getCodTipoEfecto());
			pstmt.setInt(4,remesaPago.getEstado());
			pstmt.setDate(5, Fechas.toSqlDate(remesaPago.getFechaRemesa()));
			pstmt.setDate(6, Fechas.toSqlDate(remesaPago.getFechaGeneracion()));
        	
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
    
    public static void convertirEnRemesa(Connection conn, ConfigEmpresaBean config, RemesaPagoBean remesaPago) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET ESTADO = ? " + 
		      "WHERE ID_REMESA = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setInt(1, remesaPago.getEstado());
			pstmt.setLong(2, remesaPago.getIdRemesa());

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
