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

package com.comerzzia.persistencia.ventas.promociones.articulos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.ventas.promociones.PromocionBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;

public class ArticulosPromocionesDao extends MantenimientoDao {

	private static String TABLA = "D_PROMOCIONES_DET_TBL";
	private static String VISTA = "D_PROMOCIONES_DET";
	
	private static Logger log = Logger.getMLogger(ArticulosPromocionesDao.class);
	
	public static List<ArticuloPromocionBean> consultar(Connection conn, ConfigEmpresaBean config, 
			ParametrosBuscarArticulosPromocionesBean param) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	List<ArticuloPromocionBean> lstArticulos = new ArrayList<ArticuloPromocionBean>();
    	
    	// Consulta
    	String sql = obtenerConsulta(config, param);
    	
        try {
        	stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
		    log.debug("consultar() - " + sql);
		    rs = stmt.executeQuery(sql);
    		
		    while (rs.next()) {
		    	ArticuloPromocionBean articulo = new ArticuloPromocionBean();
		    	articulo.setIdPromocion(param.getIdPromocion());
		    	articulo.setCodArt(rs.getString("CODART"));
		    	articulo.setDesArt(rs.getString("DESART"));
		    	articulo.setPrecioTarifa(rs.getDouble("PRECIO_TARIFA"));
		    	articulo.setPrecioTarifaConImpuestos(rs.getDouble("PRECIO_TARIFA_TOTAL"));
		    	articulo.setPrecioVenta((rs.getString("PRECIO_VENTA") != null) ? rs.getDouble("PRECIO_VENTA") : null);
		    	articulo.setPrecioTotal((rs.getString("PRECIO_TOTAL") != null) ? rs.getDouble("PRECIO_TOTAL") : null);
		    	articulo.setPuntos(rs.getLong("PUNTOS"));
		    	articulo.setTextoPromocion(rs.getString("TEXTO_PROMOCION"));
		    	articulo.setFechaInicio(rs.getDate("FECHA_INICIO"));
		    	articulo.setFechaFin(rs.getDate("FECHA_FIN"));
		    	articulo.setVersionTarifa((rs.getString("VERSION_TARIFA") != null) ? rs.getLong("VERSION_TARIFA") : null);
		    	articulo.setDatosPromocion(rs.getBlob("DATOS_PROMOCION"));
		    	
		        lstArticulos.add(articulo);
		    }
		    
		    return lstArticulos;
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
    
	
	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarArticulosPromocionesBean param) {
		String sql = null;
		
		sql = "SELECT ID_PROMOCION, CODART, DESART, PRECIO_TARIFA, PRECIO_TARIFA_TOTAL, PRECIO_VENTA, PRECIO_TOTAL, " +
			  "PUNTOS, TEXTO_PROMOCION, FECHA_INICIO, FECHA_FIN, VERSION_TARIFA, DATOS_PROMOCION " +
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
	
	private static String getClausulaWhere(ParametrosBuscarArticulosPromocionesBean param) {
		String where = "";
		
		// ID PROMOCION
		where += "ID_PROMOCION = " + param.getIdPromocion() + " ";
		
		// DESCRIPCION ARTICULO
		if (param.getDescripcion() != null && !param.getDescripcion().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "UPPER(DESART) LIKE UPPER('" + param.getDescripcion() + "%') ";
		}
		
		// CODART
		if (param.getCodArt() != null && !param.getCodArt().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "CODART = '" + param.getCodArt() + "' ";
		}
		
		// CODFAM
		if (param.getCodFam() != null && !param.getCodFam().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "CODFAM = '" + param.getCodFam() + "' ";
		}
		
		// CODPRO
		if (param.getCodPro() != null && !param.getCodPro().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "CODPRO = '" + param.getCodPro() + "' ";
		}
		
		return where;
	} 
	
	
    public static ArticuloPromocionBean consultar(Connection conn, ConfigEmpresaBean config, String codArt) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	ArticuloPromocionBean articulo = null;
    	String sql = null;
    	
    	sql = "SELECT ID_PROMOCION, CODART, DESART, PRECIO_TARIFA, PRECIO_TARIFA_TOTAL, PRECIO_VENTA, PRECIO_TOTAL, " +
		  	  "PUNTOS, TEXTO_PROMOCION, FECHA_INICIO, FECHA_FIN, VERSION_TARIFA, DATOS_PROMOCION " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		      "WHERE CODART = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, codArt);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		articulo = new ArticuloPromocionBean();
        		articulo.setIdPromocion(rs.getLong("ID_PROMOCION"));
        		articulo.setCodArt(rs.getString("CODART"));
		    	articulo.setDesArt(rs.getString("DESART"));
		    	articulo.setPrecioTarifa(rs.getDouble("PRECIO_TARIFA"));
		    	articulo.setPrecioTarifaConImpuestos(rs.getDouble("PRECIO_TARIFA_TOTAL"));
		    	articulo.setPrecioVenta((rs.getString("PRECIO_VENTA") != null) ? rs.getDouble("PRECIO_VENTA") : null);
		    	articulo.setPrecioTotal((rs.getString("PRECIO_TOTAL") != null) ? rs.getDouble("PRECIO_TOTAL") : null);
		    	articulo.setPuntos(rs.getLong("PUNTOS"));
		    	articulo.setTextoPromocion(rs.getString("TEXTO_PROMOCION"));
		    	articulo.setFechaInicio(rs.getDate("FECHA_INICIO"));
		    	articulo.setFechaFin(rs.getDate("FECHA_FIN"));
		    	articulo.setVersionTarifa((rs.getString("VERSION_TARIFA") != null) ? rs.getLong("VERSION_TARIFA") : null);
		    	articulo.setDatosPromocion(rs.getBlob("DATOS_PROMOCION"));
        	}
        	
    		return articulo;
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
    
    
    public static void insert(Connection conn, ConfigEmpresaBean config, ArticuloPromocionBean articulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(ID_PROMOCION, CODART, PRECIO_TARIFA, PRECIO_TARIFA_TOTAL, PRECIO_VENTA, PRECIO_TOTAL, " +
		      "PUNTOS, TEXTO_PROMOCION, FECHA_INICIO, FECHA_FIN, VERSION_TARIFA, DATOS_PROMOCION) " +
		      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, articulo.getIdPromocion());
        	pstmt.setString(2, articulo.getCodArt());
        	pstmt.setDouble(3, articulo.getPrecioTarifa());
        	pstmt.setDouble(4, articulo.getPrecioTarifaConImpuestos());
        	pstmt.setDouble(5, articulo.getPrecioVenta());
        	pstmt.setDouble(6, articulo.getPrecioTotal());
        	pstmt.setLong(7, articulo.getPuntos());
        	pstmt.setString(8, articulo.getTextoPromocion());
        	pstmt.setDate(9, Fechas.toSqlDate(articulo.getFechaInicio()));
        	pstmt.setDate(10, Fechas.toSqlDate(articulo.getFechaFin()));
        	pstmt.setLong(11, articulo.getVersionTarifa());
        	pstmt.setBytes(12, articulo.getDatosPromocion().getBytes());
        	
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
    
    public static void update(Connection conn, ConfigEmpresaBean config, ArticuloPromocionBean articulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET PRECIO_TARIFA = ?, PRECIO_TARIFA_TOTAL = ?, PRECIO_VENTA = ?, PRECIO_TOTAL = ?, PUNTOS = ?, TEXTO_PROMOCION = ?, " +
		      "FECHA_INICIO = ?, FECHA_FIN = ?, VERSION_TARIFA = ?, DATOS_PROMOCION = ? " +
		      "WHERE ID_PROMOCION = ? " +
		      "AND CODART = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			
			pstmt.setDouble(1, articulo.getPrecioTarifa());
			pstmt.setDouble(2, articulo.getPrecioTarifaConImpuestos());
        	pstmt.setDouble(3, articulo.getPrecioVenta());
        	pstmt.setDouble(4, articulo.getPrecioTotal());
        	pstmt.setLong(5, articulo.getPuntos());
        	pstmt.setString(6, articulo.getTextoPromocion());
        	pstmt.setDate(7, Fechas.toSqlDate(articulo.getFechaInicio()));
        	pstmt.setDate(8, Fechas.toSqlDate(articulo.getFechaFin()));
        	pstmt.setLong(9, articulo.getVersionTarifa());
        	pstmt.setBytes(10, articulo.getDatosPromocion().getBytes());
        	pstmt.setLong(11, articulo.getIdPromocion());
        	pstmt.setString(12, articulo.getCodArt());
        	
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
        
    
    public static void delete(Connection conn, ConfigEmpresaBean config, ArticuloPromocionBean articulo) throws SQLException {
		delete(conn, config, articulo.getIdPromocion(), articulo.getCodArt());
	}
    	
    	
    public static void delete(Connection conn, ConfigEmpresaBean config, Long idPromocion, String codArt) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE ID_PROMOCION = ? " +
			  "AND CODART = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idPromocion);
        	pstmt.setString(2, codArt);
        	
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
		      "SET VERSION_TARIFA = ?, FECHA_FIN = ? " +
		      "WHERE ID_PROMOCION = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, promocion.getVersionTarifa());
			pstmt.setDate(2, Fechas.toSqlDate(promocion.getFechaFin()));
			pstmt.setLong(3, promocion.getIdPromocion());
			
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
    
    public static void actualizarFechaInicio(Connection conn, ConfigEmpresaBean config, PromocionBean promocion) 
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET FECHA_INICIO = ? " +
		      "WHERE ID_PROMOCION = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setDate(1, Fechas.toSqlDate(promocion.getFechaInicio()));
			pstmt.setLong(2, promocion.getIdPromocion());
			
			log.debug("actualizarFechaInicio() - " + pstmt);
			
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
    
    public static List<ArticuloPromocionBean> consultarPromocionesArticulo(Connection conn, ConfigEmpresaBean config, 
			String codArticulo) throws SQLException {
    	
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	List<ArticuloPromocionBean> lstArticulos = new ArrayList<ArticuloPromocionBean>();
    	
    	// Consulta
    	String sql = "SELECT ID_PROMOCION, CODTAR, DESTAR, CODART, DESART, PRECIO_TARIFA, PRECIO_TARIFA_TOTAL, PRECIO_VENTA, PRECIO_TOTAL, " +
		  "PUNTOS, TEXTO_PROMOCION, FECHA_INICIO, FECHA_FIN, VERSION_TARIFA, DATOS_PROMOCION " +
	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
	      "WHERE CODART = ?" +
	      "AND FECHA_FIN >= ? ";
    	
        try {
        	pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, codArticulo);
    		pstmt.setDate(2, Fechas.toSqlDate(new Date()));
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
    		
		    while (rs.next()) {
		    	ArticuloPromocionBean articulo = new ArticuloPromocionBean();
		    	articulo.setCodTarifa(rs.getString("CODTAR"));
		    	articulo.setDesTarifa(rs.getString("DESTAR"));
		    	articulo.setIdPromocion(rs.getLong("ID_PROMOCION"));
		    	articulo.setPrecioVenta((rs.getString("PRECIO_VENTA") != null) ? rs.getDouble("PRECIO_VENTA") : null);
		    	articulo.setPrecioTotal((rs.getString("PRECIO_TOTAL") != null) ? rs.getDouble("PRECIO_TOTAL") : null);
		    	articulo.setTextoPromocion(rs.getString("TEXTO_PROMOCION"));
		    	articulo.setFechaInicio(rs.getDate("FECHA_INICIO"));
		    	articulo.setFechaFin(rs.getDate("FECHA_FIN"));
		    	
		        lstArticulos.add(articulo);
		    }
		    
		    return lstArticulos;
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
    
    
    public static List<ArticuloPromocionBean> consultarArticulosPromocionSincronizacion(Connection conn,
			ConfigEmpresaBean config, Long idPromocion, long versionTienda, long versionActual) throws SQLException {
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	
    	List<ArticuloPromocionBean> articulos = new ArrayList<ArticuloPromocionBean>();
    	
    	sql = "SELECT ID_PROMOCION, CODART, PRECIO_TARIFA, PRECIO_TARIFA_TOTAL, PRECIO_VENTA, PRECIO_TOTAL, " +
	  	        "PUNTOS, TEXTO_PROMOCION, FECHA_INICIO, FECHA_FIN, VERSION_TARIFA, DATOS_PROMOCION " +
	          "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
	          "WHERE ID_PROMOCION = ? " +
		        "AND VERSION_TARIFA > ? " +
                "AND VERSION_TARIFA <= ?";
    	
    	try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idPromocion);
			pstmt.setLong(2, versionTienda);
			pstmt.setLong(3, versionActual);
			
			log.debug("consultarArticulosPromocionSincronizacion() - " + pstmt);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()){
				ArticuloPromocionBean articulo = new ArticuloPromocionBean();
				articulo.setIdPromocion(rs.getLong("ID_PROMOCION"));
        		articulo.setCodArt(rs.getString("CODART"));
		    	articulo.setPrecioTarifa(rs.getDouble("PRECIO_TARIFA"));
		    	articulo.setPrecioTarifaConImpuestos(rs.getDouble("PRECIO_TARIFA_TOTAL"));
		    	articulo.setPrecioVenta((rs.getString("PRECIO_VENTA") != null) ? rs.getDouble("PRECIO_VENTA") : null);
		    	articulo.setPrecioTotal((rs.getString("PRECIO_TOTAL") != null) ? rs.getDouble("PRECIO_TOTAL") : null);
		    	articulo.setPuntos(rs.getLong("PUNTOS"));
		    	articulo.setTextoPromocion(rs.getString("TEXTO_PROMOCION"));
		    	articulo.setFechaInicio(rs.getDate("FECHA_INICIO"));
		    	articulo.setFechaFin(rs.getDate("FECHA_FIN"));
		    	articulo.setVersionTarifa((rs.getString("VERSION_TARIFA") != null) ? rs.getLong("VERSION_TARIFA") : null);
		    	articulo.setDatosPromocion(rs.getBlob("DATOS_PROMOCION"));
				
				articulos.add(articulo);
			}
			
			return articulos;
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
