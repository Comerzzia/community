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

package com.comerzzia.persistencia.general.conceptoalmacenes;

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


public class ConceptoAlmacenesDao extends MantenimientoDao {
	
	private static String TABLA = "D_ALMACENES_CONCEPTOS_TBL";
	private static String VISTA = "D_ALMACENES_CONCEPTOS";
	
	private static Logger log = Logger.getMLogger(ConceptoAlmacenesDao.class);
	

	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, 
			ParametrosBuscarConceptoAlmacenBean param) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<ConceptoAlmacenBean> resultados = new ArrayList<ConceptoAlmacenBean>(param.getTamañoPagina());
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
                    	ConceptoAlmacenBean cAlmacen = new ConceptoAlmacenBean();
                    	cAlmacen.setCodAplicacion(rs.getString("CODAPLICACION"));
                    	cAlmacen.setCodConAlm(rs.getString("CODCONALM"));
                    	cAlmacen.setDesConAlm(rs.getString("DESCONALM"));
                    	cAlmacen.setSigno(rs.getString("SIGNO"));
                    	cAlmacen.setCodAlm_origen(rs.getString("CODALM_ORIGEN"));
                    	cAlmacen.setCodAlm_destino(rs.getString("CODALM_DESTINO"));
                    	cAlmacen.setSolicitudAceptacionAutomatico(rs.getString("SOLICITUD_ACEPTACION_AUTO"));
                    	cAlmacen.setSolicitudRecepcionAutomatico(rs.getString("SOLICITUD_RECEPCION_AUTO"));
                    	cAlmacen.setSolicitudGenerarFaltas(rs.getString("SOLICITUD_GENERAR_FALTAS"));
                    	cAlmacen.setVisibleTiendas(rs.getString("VISIBLE_TIENDAS"));
                    	cAlmacen.setActivo(rs.getString("ACTIVO"));
                		resultados.add(cAlmacen);
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
    
	
	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarConceptoAlmacenBean param) {
		String sql = null;
		
		sql = "SELECT CODAPLICACION, CODCONALM, DESCONALM, SIGNO, CODALM_ORIGEN, CODALM_DESTINO, SOLICITUD_ACEPTACION_AUTO, " +
				"SOLICITUD_RECEPCION_AUTO, SOLICITUD_GENERAR_FALTAS, VISIBLE_TIENDAS, ACTIVO " +
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
	
	
	public static String obtenerConsultaCount(ConfigEmpresaBean config, ParametrosBuscarConceptoAlmacenBean param) {
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

	
	private static String getClausulaWhere(ParametrosBuscarConceptoAlmacenBean param) {
		String where = "";
		
		// CODAPLICACION
		if (!param.getCodAplicacion().isEmpty()) {
			where = "UPPER(CODAPLICACION) LIKE UPPER('" + param.getCodAplicacion() + "%') ";
		}
		
		// CODCONALM
		if (!param.getCodConAlm().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "CODCONALM LIKE '" + param.getCodConAlm() + "%' ";
		}
		
		// DESCONALM
		if (!param.getDesConAlm().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "UPPER(DESCONALM) LIKE UPPER('" + param.getDesConAlm() + "%') ";
		}
		
		if (!param.getActivo().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "ACTIVO = '"+ param.getActivo() +"' ";
		}
		
		return where;
	} 
	
	
    public static ConceptoAlmacenBean consultar(Connection conn, ConfigEmpresaBean config, String codAplicacion, String codConAlm) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	ConceptoAlmacenBean cAlmacen = null;
    	String sql = null;
    	
    	sql = "SELECT CODAPLICACION, " +
    				 "CODCONALM, " +
    				 "DESCONALM, " +
    				 "SIGNO, " +
    				 "CODALM_ORIGEN, " +
    				 "DESALM_ORIGEN, " +
    				 "CODALM_DESTINO, " +
    				 "DESALM_DESTINO, " +
    				 "SOLICITUD_ACEPTACION_AUTO, " +
    				 "SOLICITUD_RECEPCION_AUTO, " +
    				 "SOLICITUD_GENERAR_FALTAS, " +
    				 "VISIBLE_TIENDAS, " +
    				 "ACTIVO " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		      "WHERE CODAPLICACION = ? AND CODCONALM = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, codAplicacion);
    		pstmt.setString(2, codConAlm);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		cAlmacen = new ConceptoAlmacenBean(); 
        		cAlmacen.setCodAplicacion(rs.getString("CODAPLICACION"));
        		cAlmacen.setCodConAlm(rs.getString("CODCONALM"));
        		cAlmacen.setDesConAlm(rs.getString("DESCONALM"));
        		cAlmacen.setSigno(rs.getString("SIGNO"));
        		cAlmacen.setCodAlm_origen(rs.getString("CODALM_ORIGEN"));
        		cAlmacen.setDesAlm_origen(rs.getString("DESALM_ORIGEN"));
        		cAlmacen.setCodAlm_destino(rs.getString("CODALM_DESTINO"));
        		cAlmacen.setDesAlm_destino(rs.getString("DESALM_DESTINO"));
        		cAlmacen.setSolicitudAceptacionAutomatico(rs.getString("SOLICITUD_ACEPTACION_AUTO"));
            	cAlmacen.setSolicitudRecepcionAutomatico(rs.getString("SOLICITUD_RECEPCION_AUTO"));
            	cAlmacen.setSolicitudGenerarFaltas(rs.getString("SOLICITUD_GENERAR_FALTAS"));
            	cAlmacen.setVisibleTiendas(rs.getString("VISIBLE_TIENDAS"));
        		cAlmacen.setActivo(rs.getString("ACTIVO"));
        	}
        	
    		return cAlmacen;
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


    public static ConceptoAlmacenBean consultarParaTienda(Connection conn, ConfigEmpresaBean config, String codAplicacion, String codConAlm, boolean visibleTiendas) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	ConceptoAlmacenBean cAlmacen = null;
    	String sql = null;

    	String visible = "N";

    	if (visibleTiendas) {
    		visible = "S";
    	}

    	sql = "SELECT CODAPLICACION, CODCONALM, DESCONALM, SIGNO, CODALM_ORIGEN, CODALM_DESTINO, SOLICITUD_ACEPTACION_AUTO, " +
    			"SOLICITUD_RECEPCION_AUTO, SOLICITUD_GENERAR_FALTAS, VISIBLE_TIENDAS, ACTIVO " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODAPLICACION = ? AND CODCONALM = ? AND VISIBLE_TIENDAS = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, codAplicacion);
    		pstmt.setString(2, codConAlm);
    		pstmt.setString(3, visible);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		cAlmacen = new ConceptoAlmacenBean(); 
        		cAlmacen.setCodAplicacion(rs.getString("CODAPLICACION"));
        		cAlmacen.setCodConAlm(rs.getString("CODCONALM"));
        		cAlmacen.setDesConAlm(rs.getString("DESCONALM"));
        		cAlmacen.setSigno(rs.getString("SIGNO"));
        		cAlmacen.setCodAlm_origen(rs.getString("CODALM_ORIGEN"));
        		cAlmacen.setCodAlm_destino(rs.getString("CODALM_DESTINO"));
        		cAlmacen.setSolicitudAceptacionAutomatico(rs.getString("SOLICITUD_ACEPTACION_AUTO"));
            	cAlmacen.setSolicitudRecepcionAutomatico(rs.getString("SOLICITUD_RECEPCION_AUTO"));
            	cAlmacen.setSolicitudGenerarFaltas(rs.getString("SOLICITUD_GENERAR_FALTAS"));
            	cAlmacen.setVisibleTiendas(rs.getString("VISIBLE_TIENDAS"));
        		cAlmacen.setActivo(rs.getString("ACTIVO"));
        	}
        	
    		return cAlmacen;
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


    public static void insert(Connection conn, ConfigEmpresaBean config, ConceptoAlmacenBean cAlmacen) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(CODAPLICACION, CODCONALM, DESCONALM, SIGNO, CODALM_ORIGEN, CODALM_DESTINO, SOLICITUD_ACEPTACION_AUTO, " +
		      "SOLICITUD_RECEPCION_AUTO, SOLICITUD_GENERAR_FALTAS, VISIBLE_TIENDAS, ACTIVO) " +
		      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, cAlmacen.getCodAplicacion());
        	pstmt.setString(2, cAlmacen.getCodConAlm());
        	pstmt.setString(3, cAlmacen.getDesConAlm());
        	pstmt.setString(4, cAlmacen.getSigno());
        	pstmt.setString(5, cAlmacen.getCodAlm_origen());
        	pstmt.setString(6, cAlmacen.getCodAlm_destino());
        	pstmt.setString(7, cAlmacen.getSolicitudAceptacionAutomatico());
        	pstmt.setString(8, cAlmacen.getSolicitudRecepcionAutomatico());
        	pstmt.setString(9, cAlmacen.getSolicitudGenerarFaltas());
        	pstmt.setString(10, cAlmacen.getVisibleTiendas());
        	pstmt.setString(11, cAlmacen.getActivo());
        	
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
    
    
    public static void update(Connection conn, ConfigEmpresaBean config, ConceptoAlmacenBean cAlmacen) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET DESCONALM = ?, SIGNO = ?, CODALM_ORIGEN = ?, CODALM_DESTINO = ?, SOLICITUD_ACEPTACION_AUTO = ?, " +
		      "SOLICITUD_RECEPCION_AUTO = ?, SOLICITUD_GENERAR_FALTAS = ?, VISIBLE_TIENDAS = ?, ACTIVO = ? " +
		      "WHERE CODAPLICACION = ? AND CODCONALM = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, cAlmacen.getDesConAlm());
        	pstmt.setString(2, cAlmacen.getSigno());
        	pstmt.setString(3, cAlmacen.getCodAlm_origen());
        	pstmt.setString(4, cAlmacen.getCodAlm_destino());
        	pstmt.setString(5, cAlmacen.getSolicitudAceptacionAutomatico());
        	pstmt.setString(6, cAlmacen.getSolicitudRecepcionAutomatico());
        	pstmt.setString(7, cAlmacen.getSolicitudGenerarFaltas());
        	pstmt.setString(8, cAlmacen.getVisibleTiendas());
        	pstmt.setString(9, cAlmacen.getActivo());
        	pstmt.setString(10, cAlmacen.getCodAplicacion());
        	pstmt.setString(11, cAlmacen.getCodConAlm());
        	
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
        
    
    public static void delete(Connection conn, ConfigEmpresaBean config, ConceptoAlmacenBean cAlmacen) throws SQLException {
		delete(conn, config, cAlmacen.getCodAplicacion(), cAlmacen.getCodConAlm());
	}
    	
    	
    public static void delete(Connection conn, ConfigEmpresaBean config, String codAplicacion, String codConAlm ) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODAPLICACION = ? AND CODCONALM = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, codAplicacion);
        	pstmt.setString(2, codConAlm);
        	
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
