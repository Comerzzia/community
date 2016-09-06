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

package com.comerzzia.persistencia.ventas.promociones;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class PromocionesDao extends MantenimientoDao {

	private static String TABLA = "D_PROMOCIONES_CAB_TBL";
	private static String VISTA = "D_PROMOCIONES_CAB";
	
	private static Logger log = Logger.getMLogger(PromocionesDao.class);
	
	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, 
			ParametrosBuscarPromocionesBean param) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<PromocionBean> resultados = new ArrayList<PromocionBean>(param.getTamañoPagina());
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
			} catch (Exception ignore) {}
			
			try {
				pstmt.close();
			} catch (Exception ignore) {}
        	
        	// Si tenemos resultados, obtenemos la pagina requerida
            if (paginaResultados.getTotalResultados() > 0) {
            	pstmt = new PreparedStatement(conn, sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            	insertarParametros(pstmt, param);
            	
            	log.debug("consultar() - " + pstmt);
                rs = pstmt.executeQuery();
                
                int contador = 0;
                if (rs.absolute(paginaResultados.getInicio())) {
                    do {
                		PromocionBean promocion = new PromocionBean();
                		promocion.setIdPromocion(rs.getLong("ID_PROMOCION"));
                		promocion.setDescripcion(rs.getString("DESCRIPCION"));
                		promocion.setCodTar(rs.getString("CODTAR"));
                		promocion.setDesTar(rs.getString("DESTAR"));
                		promocion.setFechaFin(rs.getDate("FECHA_FIN"));
                		promocion.setVersionTarifa((rs.getString("VERSION_TARIFA") != null) ? rs.getLong("VERSION_TARIFA") : null);
                		resultados.add(promocion);
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
    
	
	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarPromocionesBean param) {
		String sql = null;
		
		sql = "SELECT ID_PROMOCION, DESCRIPCION, CODTAR, " +
		  	  "DESTAR, FECHA_FIN, VERSION_TARIFA " +
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
	
	
	public static String obtenerConsultaCount(ConfigEmpresaBean config, ParametrosBuscarPromocionesBean param) {
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

	
	private static String getClausulaWhere(ParametrosBuscarPromocionesBean param) {
		String where = "";
		
		// DESCRIPCION
		if (!param.getDescripcion().isEmpty()) {
			where += "UPPER(DESCRIPCION) LIKE UPPER('" + param.getDescripcion() + "%') ";
		}
		
		// CODTARIFA
		if (!param.getCodTarifa().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "CODTAR = '" + param.getCodTarifa() + "' ";
		}
		
		// DESTARIFA
		if (!param.getDesTarifa().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "UPPER(DESTAR) LIKE UPPER('" + param.getDesTarifa() + "%') ";
		}
		
		// ESTADO
		if (!param.getEstado().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			if(param.isSinActivar()){
				where += "VERSION_TARIFA IS NULL ";
			}
			else if(param.isActivo()){
				where += "VERSION_TARIFA IS NOT NULL AND FECHA_FIN >= ? ";				
			}
			else if(param.isFinalizado()){
				where += "VERSION_TARIFA IS NOT NULL AND FECHA_FIN < ? ";
			}
		}
		
		return where;
	} 
	
	
	private static void insertarParametros(PreparedStatement pstmt, ParametrosBuscarPromocionesBean param) throws SQLException {
		// ESTADO
		if (!param.getEstado().isEmpty()) {
			if(param.isActivo() || param.isFinalizado()) {
				pstmt.setDate(1, Fechas.toSqlDate(new Date()));
			}
		}
	}
	
	
    public static PromocionBean consultar(Connection conn, ConfigEmpresaBean config, Long idPromocion) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	PromocionBean promocion = null;
    	String sql = null;
    	
    	sql = "SELECT ID_PROMOCION, DESCRIPCION, CODTAR, DESTAR, " +
		  	  "FECHA_INICIO, FECHA_FIN, SOLO_FIDELIZACION, ID_TIPO_PROMOCION, VERSION_TARIFA " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		      "WHERE ID_PROMOCION = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idPromocion);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		promocion = new PromocionBean();
        		promocion.setIdPromocion(rs.getLong("ID_PROMOCION"));
        		promocion.setDescripcion(rs.getString("DESCRIPCION"));
        		promocion.setCodTar(rs.getString("CODTAR"));
        		promocion.setDesTar(rs.getString("DESTAR"));
        		promocion.setFechaInicio(rs.getDate("FECHA_INICIO"));
        		promocion.setFechaFin(rs.getDate("FECHA_FIN"));
        		promocion.setSoloFidelizacion(rs.getString("SOLO_FIDELIZACION"));
        		promocion.setVersionTarifa((rs.getLong("ID_TIPO_PROMOCION")));
        		promocion.setVersionTarifa((rs.getString("VERSION_TARIFA") != null) ? rs.getLong("VERSION_TARIFA") : null);
        	}
        	
    		return promocion;
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
    
    
    public static void insert(Connection conn, ConfigEmpresaBean config, PromocionBean promocion) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(ID_PROMOCION, DESCRIPCION, CODTAR, " +
		      "FECHA_INICIO, FECHA_FIN, SOLO_FIDELIZACION, ID_TIPO_PROMOCION) " +
		      "VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, promocion.getIdPromocion());
        	pstmt.setString(2, promocion.getDescripcion());
        	pstmt.setString(3, promocion.getCodTar());        	
        	pstmt.setDate(4, Fechas.toSqlDate(promocion.getFechaInicio()));        	
        	pstmt.setDate(5, Fechas.toSqlDate(promocion.getFechaFin()));       	
        	pstmt.setString(6, promocion.getSoloFidelizacion());
        	pstmt.setLong(7, promocion.getIdTipoPromocion());
        	
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
    
    public static void update(Connection conn, ConfigEmpresaBean config, PromocionBean promocion) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET DESCRIPCION = ?, CODTAR = ?, FECHA_INICIO = ?, " +
		      "FECHA_FIN = ?, SOLO_FIDELIZACION = ?, ID_TIPO_PROMOCION = ? " +
		      "WHERE ID_PROMOCION = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			
        	pstmt.setString(1, promocion.getDescripcion());
        	pstmt.setString(2, promocion.getCodTar());	
        	pstmt.setDate(3, Fechas.toSqlDate(promocion.getFechaInicio()));
        	pstmt.setDate(4, Fechas.toSqlDate(promocion.getFechaFin()));
        	pstmt.setString(5, promocion.getSoloFidelizacion());
        	pstmt.setLong(6, promocion.getIdTipoPromocion());
        	pstmt.setLong(7, promocion.getIdPromocion());
        	
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
        
    
    public static void delete(Connection conn, ConfigEmpresaBean config, PromocionBean promocion) throws SQLException {
		delete(conn, config, promocion.getIdPromocion());
	}
    	
    	
    public static void delete(Connection conn, ConfigEmpresaBean config, Long idPromocion) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE ID_PROMOCION = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idPromocion);
        	
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
    
    public static void actualizarVersion(Connection conn, ConfigEmpresaBean config, PromocionBean promocion) 
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET VERSION_TARIFA = ? " +
		      "WHERE ID_PROMOCION = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, promocion.getVersionTarifa());
			pstmt.setLong(2, promocion.getIdPromocion());
			
			log.debug("actualizarVersion() - " + pstmt);
			
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
    
    public static void actualizarFechaFin(Connection conn, ConfigEmpresaBean config, PromocionBean promocion) 
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET FECHA_FIN = ? " +
		      "WHERE ID_PROMOCION = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setDate(1, Fechas.toSqlDate(promocion.getFechaFin()));
			pstmt.setLong(2, promocion.getIdPromocion());
			
			log.debug("actualizarVersion() - " + pstmt);
			
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
    
    
    public static List<PromocionBean> consultarPromocionesSincronizacion(Connection conn,
			ConfigEmpresaBean config, String codTarifa, long versionTienda, long versionActual) throws SQLException {
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	
    	List<PromocionBean> promociones = new ArrayList<PromocionBean>();
    	
    	sql = "SELECT ID_PROMOCION, DESCRIPCION, CODTAR, FECHA_INICIO, FECHA_FIN, " +
	  	        "SOLO_FIDELIZACION, ID_TIPO_PROMOCION, VERSION_TARIFA " +
	          "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
	          "WHERE CODTAR = ? " +
		        "AND VERSION_TARIFA > ? " +
                "AND VERSION_TARIFA <= ?";
    	
    	try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codTarifa);
			pstmt.setLong(2, versionTienda);
			pstmt.setLong(3, versionActual);
			
			log.debug("consultarPromocionesSincronizacion() - " + pstmt);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()){
				PromocionBean promocion = new PromocionBean();
        		promocion.setIdPromocion(rs.getLong("ID_PROMOCION"));
        		promocion.setDescripcion(rs.getString("DESCRIPCION"));
        		promocion.setCodTar(rs.getString("CODTAR"));
        		promocion.setFechaInicio(rs.getDate("FECHA_INICIO"));
        		promocion.setFechaFin(rs.getDate("FECHA_FIN"));
        		promocion.setSoloFidelizacion(rs.getString("SOLO_FIDELIZACION"));
        		promocion.setVersionTarifa((rs.getLong("ID_TIPO_PROMOCION")));
        		promocion.setVersionTarifa((rs.getString("VERSION_TARIFA") != null) ? rs.getLong("VERSION_TARIFA") : null);
				
				promociones.add(promocion);
			}
			
			return promociones;
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
