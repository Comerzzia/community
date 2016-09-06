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

package com.comerzzia.persistencia.core.ayudas;

import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.config.AppInfo;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.util.xml.XMLDocumentException;


public class AyudasDao extends MantenimientoDao {
	
	private static String TABLA = "CONFIG_AYUDAS_TBL";
	
	private static final String TIPO_ORIGEN_CONFIGURACION = "configuracion";
	
	private static Logger log = Logger.getMLogger(AyudasDao.class);

	
	public static AyudaBean consultarAyuda(Connection conn, String nombre) throws SQLException, XMLDocumentException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	
    	AyudaBean ayuda = null;
    	
    	sql = "SELECT NOMBRE, DEFINICION " +
    	      "FROM " + getNombreElementoConfiguracion(TABLA) +
    	      "WHERE NOMBRE = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, nombre);
        	log.debug("consultarAyuda() - " + pstmt);
        	
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()){
        		ayuda = new AyudaBean();
        		ayuda.setNombre(rs.getString("NOMBRE"));
        		Blob definicion = rs.getBlob("DEFINICION");
        		ayuda.setXml(definicion.getBinaryStream());
        	}
        
        	return ayuda;
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

	
	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, AyudaBean ayuda, ParametrosBuscarAyudasBean param) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<ElementoAyudaBean> resultados = new ArrayList<ElementoAyudaBean>(param.getTamañoPagina());
    	PaginaResultados paginaResultados = new PaginaResultados(param, resultados);
    	
    	// Consultas
    	String sql = getConsulta(ayuda, config, param);
    	String sqlCount = getConsultaCount(ayuda, config, param);
        
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
            			ElementoAyudaBean elemento = new ElementoAyudaBean();
            			elemento.setCodigo(rs.getString(ayuda.getCampoCodigo()));
            			elemento.setDescripcion(rs.getString(ayuda.getCampoDescripcion()));

            			resultados.add(elemento);
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

	
	public static ElementoAyudaBean consultar(Connection conn, ConfigEmpresaBean config, 
			AyudaBean ayuda, String codigo) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	ElementoAyudaBean elemento = null;
    	
    	String sql = getConsultaElemento(ayuda, config, codigo);
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		elemento = new ElementoAyudaBean(); 
        		elemento.setCodigo(rs.getString(ayuda.getCampoCodigo()));
        		elemento.setDescripcion(rs.getString(ayuda.getCampoDescripcion()));
        	}
        	
    		return elemento;
    	}
    	finally {
    		try {
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try{ 
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
	
	
	private static String getConsultaCount(AyudaBean ayuda, ConfigEmpresaBean configEmpresa, ParametrosBuscarAyudasBean param) {
		String sql = null;
		
		sql = "SELECT COUNT(*) " +
		      "FROM " + getFromSql(ayuda, configEmpresa);
		
		// Clausula WHERE
        String where = getWhere(ayuda, param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }
        
		return sql;
	}

	
	private static String getConsulta(AyudaBean ayuda, ConfigEmpresaBean configEmpresa, ParametrosBuscarAyudasBean param) {
		String sql = null;
		
		// SELECT
		sql = getClausulaSelect(ayuda, configEmpresa);
		
		String where = getWhere(ayuda, param);
		
		if (where.length() > 0) {
            sql += "WHERE " + where;
        }
		
        // Clausula ORDER BY
        if (!param.getOrden().isEmpty()) {
        	sql += " ORDER BY " + param.getOrden();
        }
		
		return sql;
	}
	
	
	private static String getWhere(AyudaBean ayuda, ParametrosBuscarAyudasBean param){
		// WHERE
		String where = "";
		if (!param.getCodigo().isEmpty()) {
			where = "UPPER(" + ayuda.getCampoCodigo() + ") LIKE '" + param.getCodigo() + "%' ";
		}
		if (!param.getDescripcion().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "UPPER(" + ayuda.getCampoDescripcion() + ") LIKE UPPER('" + param.getDescripcion() + "%') ";
		}
		if (!ayuda.getCampoFiltro().isEmpty()){
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += ayuda.getCampoFiltro() + " = '" + param.getCampoFiltro() + "' ";
		}
		if (!ayuda.getFiltro().isEmpty()){
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += ayuda.getFiltro();
		}
		
		return where;
	}
	
	
	private static String getConsultaElemento(AyudaBean ayuda, ConfigEmpresaBean configEmpresa, String codigo) {
		String sql = null;
		
		sql = getClausulaSelect(ayuda, configEmpresa);
		
		sql += "WHERE " + ayuda.getCampoCodigo() +  " = '" + codigo + "' ";
		
		if(!ayuda.getFiltro().isEmpty())
			sql += "AND " + ayuda.getFiltro();
		
		return sql;
	}
	
	
	private static String getClausulaSelect(AyudaBean ayuda, ConfigEmpresaBean configEmpresa) {
		String sql = null;
		
		sql = "SELECT " + ayuda.getCampoCodigo() + ", " + ayuda.getCampoDescripcion() + " " +
		      "FROM ";
		
		sql += getFromSql(ayuda, configEmpresa);

		return sql;
	}
	
	
	private static String getFromSql(AyudaBean ayuda, ConfigEmpresaBean configEmpresa) {
		String from = "";
		if (ayuda.getTipoOrigen().equals(TIPO_ORIGEN_CONFIGURACION)) {
			from += AppInfo.getDbInfo().getEsquemaConfiguracion();
		}
		else {
			from += configEmpresa.getEsquemaEmpresa();
		}
		
		from += "." + ayuda.getOrigen() + " ";
		
		return from;
	}
}
