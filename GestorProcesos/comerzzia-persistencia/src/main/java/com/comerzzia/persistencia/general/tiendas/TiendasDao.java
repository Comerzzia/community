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

package com.comerzzia.persistencia.general.tiendas;

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


public class TiendasDao extends MantenimientoDao {
	
	private static String TABLA = "D_TIENDAS_TBL";
	private static String VISTA = "D_TIENDAS";
	private static String VISTA_USUARIO = "D_TIENDAS_USUARIOS";
	
	private static Logger log = Logger.getMLogger(TiendasDao.class);
	

	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, 
			ParametrosBuscarTiendasBean param) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<TiendaBean> resultados = new ArrayList<TiendaBean>(param.getTamañoPagina());
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
                		TiendaBean tienda = new TiendaBean();
                		
                		tienda.setCodAlm(rs.getString("CODALM"));
                		tienda.setDesAlm(rs.getString("DESALM"));
                		tienda.setDomicilio(rs.getString("DOMICILIO"));
                		tienda.setPoblacion(rs.getString("POBLACION"));
                		tienda.setProvincia(rs.getString("PROVINCIA"));
                		tienda.setCp(rs.getString("CP"));
                		tienda.setTelefono1(rs.getString("TELEFONO1"));
                		tienda.setTelefono2(rs.getString("TELEFONO2"));
                		tienda.setFax(rs.getString("FAX"));
                		tienda.setPersonaContacto(rs.getString("PERSONA_CONTACTO"));
                		tienda.setCodEmp(rs.getString("CODEMP"));
                		tienda.setCodCliente(rs.getString("CODCLI"));
                		tienda.setDesCliente(rs.getString("DESCLI"));
                		tienda.setActivo(rs.getString("ACTIVO"));
                		resultados.add(tienda);
                		
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
    
	
	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarTiendasBean param) {
		String sql = null;
		
		sql = "SELECT CODALM, DESALM, DOMICILIO, POBLACION, PROVINCIA, CP, TELEFONO1, TELEFONO2, FAX, " +
					"PERSONA_CONTACTO, CODEMP, CODCLI, DESCLI, ACTIVO " +
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
	
	
	public static String obtenerConsultaCount(ConfigEmpresaBean config, ParametrosBuscarTiendasBean param) {
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

	
	private static String getClausulaWhere(ParametrosBuscarTiendasBean param) {
		String where = "";
		
		// CODALM
		if (!param.getCodAlm().isEmpty()) {
			where = "CODALM LIKE '" + param.getCodAlm() + "%' ";
		}
		
		// DESALM
		if (!param.getDesAlm().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "UPPER(DESALM) LIKE UPPER('" + param.getDesAlm() + "%') ";
		}
		
		// ACTIVO
		if (!param.getActivo().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "ACTIVO = '"+ param.getActivo() +"' ";
		}
		
		// TIPO_TIENDA
		if (param.getIdTipoTienda() != null && param.getIdTipoTienda() > 0) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "ID_TIPO_TIENDA = " + param.getIdTipoTienda() + " ";
		}
		
		return where;
	} 
	
	
    public static TiendaBean consultar(Connection conn, ConfigEmpresaBean config, String codAlm) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	TiendaBean tienda = null;
    	String sql = null;
    	
    	sql = "SELECT CODALM, DESALM, DOMICILIO, POBLACION, PROVINCIA, CP, TELEFONO1, TELEFONO2, FAX, " +
					"PERSONA_CONTACTO, CODEMP, CODCLI, DESCLI, ID_TIPO_TIENDA, ACTIVO, " + 
					"VERSION_ARTICULOS, VERSION_ARTICULOS_REV, FECHA_VERSION_ARTICULOS, " + 
					"FECHA_VERSION_ARTICULOS_REV, CONFIGURACION, CLASE_CONFIGURACION, " +
					"CLASE_SINCRONIZACION, DESTIPO_TIENDA, CODMEDPAG_POR_DEFECTO, DESMEDPAG, " +
					"CODCONALM_VENTAS, DESCONALM " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		      "WHERE CODALM = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, codAlm);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		tienda = new TiendaBean(); 
        		tienda.setCodAlm(rs.getString("CODALM"));
        		tienda.setDesAlm(rs.getString("DESALM"));
        		tienda.setDomicilio(rs.getString("DOMICILIO"));
        		tienda.setPoblacion(rs.getString("POBLACION"));
        		tienda.setProvincia(rs.getString("PROVINCIA"));
        		tienda.setCp(rs.getString("CP"));
        		tienda.setTelefono1(rs.getString("TELEFONO1"));
        		tienda.setTelefono2(rs.getString("TELEFONO2"));
        		tienda.setFax(rs.getString("FAX"));
        		tienda.setPersonaContacto(rs.getString("PERSONA_CONTACTO"));
        		tienda.setCodEmp(rs.getString("CODEMP"));
        		tienda.setCodCliente(rs.getString("CODCLI"));
        		tienda.setDesCliente(rs.getString("DESCLI"));
        		tienda.setIdTipoTienda(rs.getLong("ID_TIPO_TIENDA"));
        		tienda.setActivo(rs.getString("ACTIVO"));
        		tienda.setVersionArticulos(rs.getLong("VERSION_ARTICULOS"));
        		tienda.setVersionArticulosRevisada(rs.getLong("VERSION_ARTICULOS_REV"));
        		tienda.setFechaVersionArticulos(rs.getTimestamp("FECHA_VERSION_ARTICULOS"));
        		tienda.setFechaVersionArticulosRevisada(rs.getTimestamp("FECHA_VERSION_ARTICULOS_REV"));
        		tienda.setConfiguracion(rs.getBlob("CONFIGURACION"));
        		tienda.setClaseConfiguracion(rs.getString("CLASE_CONFIGURACION"));
        		tienda.setClaseSincronizacion(rs.getString("CLASE_SINCRONIZACION"));
        		tienda.setDesTipoTienda(rs.getString("DESTIPO_TIENDA"));
        		tienda.setCodMedioPago(rs.getString("CODMEDPAG_POR_DEFECTO"));
        		tienda.setDesMedioPago(rs.getString("DESMEDPAG"));
        		tienda.setCodConceptoAlmacen(rs.getString("CODCONALM_VENTAS"));
        		tienda.setDesConceptoAlmacen(rs.getString("DESCONALM"));
        	}
        	
    		return tienda;
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
    
    
    public static void insert(Connection conn, ConfigEmpresaBean config, TiendaBean tienda) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(CODALM, ID_TIPO_TIENDA, VERSION_ARTICULOS, VERSION_ARTICULOS_REV, " +
		      "ACTIVO, CONFIGURACION, CODMEDPAG_POR_DEFECTO, CODCONALM_VENTAS) " +
		      "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, tienda.getCodAlm());
        	pstmt.setLong(2, tienda.getIdTipoTienda());
        	pstmt.setLong(3, tienda.getVersionArticulos());
        	pstmt.setLong(4, tienda.getVersionArticulosRevisada());
        	pstmt.setString(5, tienda.getActivo());
        	pstmt.setBytes(6, tienda.getConfiguracion().getBytes());
        	pstmt.setString(7, tienda.getCodMedioPago());
        	pstmt.setString(8, tienda.getCodConceptoAlmacen());
        	
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
    
    
    public static void update(Connection conn, ConfigEmpresaBean config, TiendaBean tienda) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET ID_TIPO_TIENDA = ?, ACTIVO = ?, " 
			+ "VERSION_ARTICULOS = ?, VERSION_ARTICULOS_REV = ?, "
			+ "FECHA_VERSION_ARTICULOS = ?, FECHA_VERSION_ARTICULOS_REV = ?, "
			+ "CONFIGURACION = ?, CODMEDPAG_POR_DEFECTO = ?, CODCONALM_VENTAS = ? "
		    + "WHERE CODALM = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	
        	pstmt.setLong(1, tienda.getIdTipoTienda());
        	pstmt.setString(2, tienda.getActivo());
        	pstmt.setLong(3, tienda.getVersionArticulos());
        	pstmt.setLong(4, tienda.getVersionArticulosRevisada());
        	pstmt.setTimestamp(5, Fechas.toSqlTimestamp(tienda.getFechaVersionArticulos()));
        	pstmt.setTimestamp(6, Fechas.toSqlTimestamp(tienda.getFechaVersionArticulosRevisada()));
        	pstmt.setBytes(7, tienda.getConfiguracion().getBytes());
        	pstmt.setString(8, tienda.getCodMedioPago());
        	pstmt.setString(9, tienda.getCodConceptoAlmacen());
        	pstmt.setString(10, tienda.getCodAlm());
        	
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
        
    
    public static void delete(Connection conn, ConfigEmpresaBean config, TiendaBean tienda) throws SQLException {
		delete(conn, config, tienda.getCodAlm());
	}
    	
    	
    public static void delete(Connection conn, ConfigEmpresaBean config, String codAlm) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODALM = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, codAlm);
        	
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


	public static List<TiendaBean> consultarTiendasUsuario(Long idUsuario, Connection conn,
			ConfigEmpresaBean config) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	List<TiendaBean> tiendas = new ArrayList<TiendaBean>();
    	String sql = null;
    	
    	sql = "SELECT CODALM, DESALM, VERSION_ARTICULOS, VERSION_ARTICULOS_REV, FECHA_VERSION_ARTICULOS, FECHA_VERSION_ARTICULOS_REV " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA_USUARIO) +
		      "WHERE ID_USUARIO = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idUsuario);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	while (rs.next()){
        		TiendaBean tienda = new TiendaBean();
        		tienda = new TiendaBean(); 
        		tienda.setCodAlm(rs.getString("CODALM"));
        		tienda.setDesAlm(rs.getString("DESALM"));
        		tienda.setVersionArticulos(rs.getLong("VERSION_ARTICULOS"));
        		tienda.setVersionArticulosRevisada(rs.getLong("VERSION_ARTICULOS_REV"));
        		tienda.setFechaVersionArticulos(rs.getTimestamp("FECHA_VERSION_ARTICULOS"));
        		tienda.setFechaVersionArticulosRevisada(rs.getTimestamp("FECHA_VERSION_ARTICULOS_REV"));
        		
        		tiendas.add(tienda);
        	}
        	
    		return tiendas;
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
}
