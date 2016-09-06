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

package com.comerzzia.persistencia.general.articulos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;


public class ArticulosDao extends MantenimientoDao {
	
	private static String TABLA = "D_ARTICULOS_TBL";
	private static String VISTA = "D_ARTICULOS";
	
	private static Logger log = Logger.getMLogger(ArticulosDao.class);
	
	
	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, 
			ParametrosBuscarArticulosBean param) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<ArticuloBean> resultados = new ArrayList<ArticuloBean>(param.getTamañoPagina());
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
                		ArticuloBean articulo = new ArticuloBean();
                		articulo.setCodArticulo(rs.getString("CODART"));
                		articulo.setDesArticulo(rs.getString("DESART"));
                		articulo.setDesFamilia(rs.getString("DESFAM"));
                		articulo.setDesProveedor(rs.getString("DESPRO"));
                		articulo.setActivo(rs.getString("ACTIVO"));
                		resultados.add(articulo);
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
	
	
	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarArticulosBean param) {
		String sql = null;
		
		sql = "SELECT CODART, DESART, CODFAM, DESFAM, CODPRO, DESPRO, ACTIVO " +
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
	
	
	public static String obtenerConsultaCount(ConfigEmpresaBean config, ParametrosBuscarArticulosBean param) {
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
	
	
	private static String getClausulaWhere(ParametrosBuscarArticulosBean param) {
		String where = "";
		
		// CODARTICULO
		if (!param.getCodArticulo().isEmpty()) {
			where = "CODART LIKE '" + param.getCodArticulo() + "%' ";
		}
		
		// DESARTICULO
		if (!param.getDesArticulo().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "UPPER(DESART) LIKE UPPER('" + param.getDesArticulo() + "%') ";
		}
		
		// CODFAM
		if (!param.getCodFamilia().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "CODFAM = '" + param.getCodFamilia() + "' ";
		}
		
		// CODPRO
		if (!param.getCodProveedor().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "CODPRO = '" + param.getCodProveedor() + "' ";
		}
		
		// ACTIVO
		if (!param.getActivo().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "ACTIVO = '" + param.getActivo() + "' ";
		}

		return where;
	}
	
	
	public static ArticuloBean consultar(Connection conn, ConfigEmpresaBean config, String codArticulo) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	ArticuloBean articulo = null;
    	String sql = null;
    	
    	sql = "SELECT CODART, DESART, FORMATO, CODFAM, DESFAM, CODSECCION, DESSECCION, CODCAT, DESCAT, " +
    			"CODPRO, DESPRO, REFERENCIA_PROVEEDOR, DTO_PROVEEDOR, ACT_AUTOMATICA_COSTO, CODIMP, DESIMP, OBSERVACIONES," +
    			"ACTIVO, NUMEROS_SERIE, DESGLOSE1, DESGLOSE2, GENERICO, ESCAPARATE, " +
    			"UNIDAD_MEDIDA_ALTERNATIVA, COD_UM_ETIQUETA, DES_UM_ETIQUETA, CANTIDAD_UM_ETIQUETA," +
    			"CODFAB, DESFAB, COSTO_ACTUALIZADO " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		      "WHERE CODART = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, codArticulo);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		articulo = new ArticuloBean();
        		articulo.setCodArticulo(rs.getString("CODART"));
        		articulo.setDesArticulo(rs.getString("DESART"));
        		articulo.setFormato(rs.getString("FORMATO"));
        		articulo.setCodFamilia(rs.getString("CODFAM"));
        		articulo.setDesFamilia(rs.getString("DESFAM"));
        		articulo.setCodSeccion(rs.getString("CODSECCION"));
        		articulo.setDesSeccion(rs.getString("DESSECCION"));
        		articulo.setCodCategorizacion(rs.getString("CODCAT"));
        		articulo.setDesCategorizacion(rs.getString("DESCAT"));
        		articulo.setCodProveedor(rs.getString("CODPRO"));
        		articulo.setDesProveedor(rs.getString("DESPRO"));
        		articulo.setReferencia(rs.getString("REFERENCIA_PROVEEDOR"));
        		articulo.setDtoProveedor(rs.getDouble("DTO_PROVEEDOR"));
        		articulo.setActAutomaticaCosto(rs.getString("ACT_AUTOMATICA_COSTO"));
        		articulo.setCodImpuesto(rs.getString("CODIMP"));
        		articulo.setDesImpuesto(rs.getString("DESIMP"));
        		articulo.setObservaciones(rs.getString("OBSERVACIONES"));
        		articulo.setActivo(rs.getString("ACTIVO"));
        		articulo.setNumSeries(rs.getString("NUMEROS_SERIE"));
        		articulo.setDesglose1(rs.getString("DESGLOSE1"));
        		articulo.setDesglose2(rs.getString("DESGLOSE2"));
        		articulo.setGenerico(rs.getString("GENERICO"));
        		articulo.setEscaparate(rs.getString("ESCAPARATE"));
        		articulo.setUnidadMedAlt(rs.getString("UNIDAD_MEDIDA_ALTERNATIVA"));
        		articulo.setCodUnidadMedidaEtiq(rs.getString("COD_UM_ETIQUETA"));
        		articulo.setDesUnidadMedidaEtiq(rs.getString("DES_UM_ETIQUETA"));
        		articulo.setCantidadUnidadMedidaEtiq((rs.getString("CANTIDAD_UM_ETIQUETA") != null) ? rs.getDouble("CANTIDAD_UM_ETIQUETA") : null);
        		articulo.setCodFabricante(rs.getString("CODFAB"));
        		articulo.setDesFabricante(rs.getString("DESFAB"));
        		articulo.setFechaPrecioCosto(rs.getTimestamp("COSTO_ACTUALIZADO"));
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
	
	
	public static void insert(Connection conn, ConfigEmpresaBean config, ArticuloBean articulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(CODART, DESART, FORMATO, CODFAM, CODSECCION, CODCAT, CODPRO, ACT_AUTOMATICA_COSTO, REFERENCIA_PROVEEDOR, " +
    		  	"CODFAB, CODIMP, OBSERVACIONES, ACTIVO, NUMEROS_SERIE, DESGLOSE1, DESGLOSE2, GENERICO, ESCAPARATE, " +
    		  	"UNIDAD_MEDIDA_ALTERNATIVA, COD_UM_ETIQUETA, CANTIDAD_UM_ETIQUETA, FECHA_ALTA, FECHA_VERSION, COSTO_ACTUALIZADO, " +
    		  	"DTO_PROVEEDOR, VERSION) " +
		      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, articulo.getCodArticulo());
        	pstmt.setString(2, articulo.getDesArticulo());
        	pstmt.setString(3, articulo.getFormato());
        	pstmt.setString(4, articulo.getCodFamilia());
        	pstmt.setString(5, articulo.getCodSeccion());
        	pstmt.setString(6, articulo.getCodCategorizacion());
        	pstmt.setString(7, articulo.getCodProveedor());
        	pstmt.setString(8, articulo.getActAutomaticaCosto());
        	pstmt.setString(9, articulo.getReferencia());
        	pstmt.setString(10, articulo.getCodFabricante());
        	pstmt.setString(11, articulo.getCodImpuesto());
        	pstmt.setString(12, articulo.getObservaciones());
        	pstmt.setString(13, articulo.getActivo());
        	pstmt.setString(14, articulo.getNumSeries());
        	pstmt.setString(15, articulo.getDesglose1());
        	pstmt.setString(16, articulo.getDesglose2());
        	pstmt.setString(17, articulo.getGenerico());
        	pstmt.setString(18, articulo.getEscaparate());
        	pstmt.setString(19, articulo.getUnidadMedAlt());
        	pstmt.setString(20, articulo.getCodUnidadMedidaEtiq());
        	pstmt.setDouble(21, articulo.getCantidadUnidadMedidaEtiq());
        	pstmt.setTimestamp(22, Fechas.toSqlTimestamp(articulo.getFechaAlta()));
        	pstmt.setTimestamp(23, Fechas.toSqlTimestamp(articulo.getFechaVersion()));
        	pstmt.setTimestamp(24, Fechas.toSqlTimestamp(articulo.getFechaPrecioCosto()));
        	pstmt.setDouble(25, articulo.getDtoProveedor()); 
        	pstmt.setLong(26, articulo.getVersion());
        	
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
	
	
	public static void update(Connection conn, ConfigEmpresaBean config, ArticuloBean articulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET DESART = ?, " +
		      "FORMATO = ?, " +
		      "CODFAM = ?, " +
		      "CODSECCION = ?, " +
		      "CODCAT = ?, " +
		      "CODPRO = ?, " +
		      "ACT_AUTOMATICA_COSTO = ?, " +
		      "REFERENCIA_PROVEEDOR = ?, " +
		      "DTO_PROVEEDOR = ?, " +
		      "CODFAB = ?, " +
		      "CODIMP = ?, " +
		      "OBSERVACIONES = ?, " +
		      "ACTIVO = ?, " +
		      "NUMEROS_SERIE = ?, " +
		      "DESGLOSE1 = ?, " +
		      "DESGLOSE2 = ?, " +
		      "GENERICO = ?, " +
		      "ESCAPARATE = ?, " +
		      "UNIDAD_MEDIDA_ALTERNATIVA = ?, " +
		      "COD_UM_ETIQUETA = ?, " +
		      "CANTIDAD_UM_ETIQUETA = ? " +
		      "WHERE CODART = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, articulo.getDesArticulo());
        	pstmt.setString(2, articulo.getFormato());
        	pstmt.setString(3, articulo.getCodFamilia());
        	pstmt.setString(4, articulo.getCodSeccion());
        	pstmt.setString(5, articulo.getCodCategorizacion());
        	pstmt.setString(6, articulo.getCodProveedor());
        	pstmt.setString(7, articulo.getActAutomaticaCosto());
        	pstmt.setString(8, articulo.getReferencia());
        	pstmt.setDouble(9, articulo.getDtoProveedor());
        	pstmt.setString(10, articulo.getCodFabricante());
        	pstmt.setString(11, articulo.getCodImpuesto());
        	pstmt.setString(12, articulo.getObservaciones());
        	pstmt.setString(13, articulo.getActivo());
        	pstmt.setString(14, articulo.getNumSeries());
        	pstmt.setString(15, articulo.getDesglose1());
        	pstmt.setString(16, articulo.getDesglose2());
        	pstmt.setString(17, articulo.getGenerico());
        	pstmt.setString(18, articulo.getEscaparate());
        	pstmt.setString(19, articulo.getUnidadMedAlt());
        	pstmt.setString(20, articulo.getCodUnidadMedidaEtiq());
        	pstmt.setDouble(21, articulo.getCantidadUnidadMedidaEtiq());
        	pstmt.setString(22, articulo.getCodArticulo());
        	
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
	
	
	public static void delete(Connection conn, ConfigEmpresaBean config, ArticuloBean articulo) throws SQLException {
		delete(conn, config, articulo.getCodArticulo());
	}
	
	
	public static void delete(Connection conn, ConfigEmpresaBean config, String codArt) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODART = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, codArt);
        	
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


	public static void actualizarFechaPrecioCosto(Connection conn, ConfigEmpresaBean config, ArticuloBean articulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET COSTO_ACTUALIZADO = ?" +
		      "WHERE CODART = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setTimestamp(1, Fechas.toSqlTimestamp(articulo.getFechaPrecioCosto()));
        	pstmt.setString(2, articulo.getCodArticulo());
        	
        	log.debug("actualizarFechaTarifa() - " + pstmt);
        	
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


	public static void actualizarVersion(Connection conn,
			ConfigEmpresaBean config, ArticuloBean articulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET VERSION = ?, FECHA_VERSION = ?" +
		      "WHERE CODART = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, articulo.getVersion());
			pstmt.setTimestamp(2, Fechas.toSqlTimestamp(articulo.getFechaVersion()));
        	pstmt.setString(3, articulo.getCodArticulo());
        	
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
	
	
	public static VersionArticuloBean consultarVersionActual(Connection conn,
			ConfigEmpresaBean config) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		VersionArticuloBean version = null;
		
		sql = "SELECT MAX(VERSION) VERSION, MAX(FECHA_VERSION) FECHA " +
		      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA);
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			log.debug("consultarVersionActual() - " + pstmt);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()){
				version = new VersionArticuloBean();
				version.setVersion(rs.getLong("VERSION"));
				version.setFechaVersion(rs.getTimestamp("FECHA"));
			}
			
			return version;
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
	
	
	/**
	 * Obtiene la lista de artículos para sincronizar con una tienda, 
	 * con versión mayor que la version de la tienda y menor o igual a la version actual
	 * 
	 * @param conn
	 * @param config
	 * @param versionTienda
	 * @param versionActual
	 * @return
	 * @throws SQLException
	 */
	public static List<ArticuloBean> consultarArticulosSincronizacion(Connection conn,
			ConfigEmpresaBean config, long versionTienda, long versionActual) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	
    	List<ArticuloBean> articulos = new ArrayList<ArticuloBean>();
    	
    	sql = "SELECT CODART, DESART, FORMATO, CODIMP, OBSERVACIONES, " +
                "ACTIVO, NUMEROS_SERIE, DESGLOSE1, DESGLOSE2, GENERICO, " +
                "VERSION, CODCAT, ESCAPARATE, FECHA_ALTA " +
              "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
              "WHERE VERSION > ? " +
                "AND VERSION <= ?";
    	
    	try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, versionTienda);
			pstmt.setLong(2, versionActual);
			
			log.debug("consultarArticulosSincronizacion() - " + pstmt);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()){
				ArticuloBean articulo = new ArticuloBean();
        		articulo.setCodArticulo(rs.getString("CODART"));
        		articulo.setDesArticulo(rs.getString("DESART"));
        		articulo.setFormato(rs.getString("FORMATO"));
        		articulo.setCodImpuesto(rs.getString("CODIMP"));
        		articulo.setObservaciones(rs.getString("OBSERVACIONES"));
        		articulo.setActivo(rs.getString("ACTIVO"));
        		articulo.setNumSeries(rs.getString("NUMEROS_SERIE"));
        		articulo.setDesglose1(rs.getString("DESGLOSE1"));
        		articulo.setDesglose2(rs.getString("DESGLOSE2"));
        		articulo.setGenerico(rs.getString("GENERICO"));
        		articulo.setVersion(rs.getLong("VERSION"));
        		articulo.setCodCategorizacion(rs.getString("CODCAT"));
        		articulo.setEscaparate(rs.getString("ESCAPARATE"));
        		articulo.setFechaAlta(rs.getTimestamp("FECHA_ALTA"));
        		
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

	public static Long consultarTotalArticulos(Connection conn, ConfigEmpresaBean config) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	Long total = null;
    	
    	// Consultas
    	String sql = "SELECT COUNT(*) " +
	      						"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
        
    	try {
    		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    		log.debug("consultarTotalArticulos() - " + sql);
        	
    		rs = stmt.executeQuery(sql);
        	if (rs.next()){
        		total = rs.getLong(1);
        	}
        	
        	return total;
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

}
