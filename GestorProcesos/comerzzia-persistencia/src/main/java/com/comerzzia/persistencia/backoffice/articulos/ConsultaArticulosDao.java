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

package com.comerzzia.persistencia.backoffice.articulos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ConsultaArticulosDao extends MantenimientoDao {

	private static String VISTA = "D_CONSULTA_ARTICULOS";
	
	private static Logger log = Logger.getMLogger(ConsultaArticulosDao.class);	
	
	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, 
			ParametrosBuscarConsultaArticulosBean param) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<ConsultaArticulosBean> resultados = new ArrayList<ConsultaArticulosBean>(param.getTamañoPagina());
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
		                ConsultaArticulosBean articulo = new ConsultaArticulosBean();
		                articulo.setCodArticulo(rs.getString("CODART"));
		        		articulo.setDesArticulo(rs.getString("DESART"));
		        		articulo.setCodFamilia(rs.getString("CODFAM"));
		        		articulo.setDesFamilia(rs.getString("DESFAM"));
		        		articulo.setCodSeccion(rs.getString("CODSECCION"));
		        		articulo.setDesSeccion(rs.getString("DESSECCION"));
		        		articulo.setCodCategorizacion(rs.getString("CODCAT"));
		        		articulo.setDesCategorizacion(rs.getString("DESCAT"));
		        		articulo.setCodProveedor(rs.getString("CODPRO"));
		        		articulo.setDesProveedor(rs.getString("DESPRO"));
		        		articulo.setReferencia(rs.getString("REFERENCIA_PROVEEDOR"));
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
	
	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarConsultaArticulosBean param) {
		String sql = null;
		
		sql = "SELECT CODART, DESART, CODFAM, DESFAM, CODSECCION, DESSECCION, CODCAT, " +
		  	  "DESCAT, CODPRO, DESPRO, REFERENCIA_PROVEEDOR, ACTIVO " +
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
	
	public static String obtenerConsultaCount(ConfigEmpresaBean config, ParametrosBuscarConsultaArticulosBean param) {
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
	
	private static String getClausulaWhere(ParametrosBuscarConsultaArticulosBean param) {
		String where = "";
		
		// CODART
		if (!param.getCodArticulo().isEmpty()) {
			where = "CODART LIKE '" + param.getCodArticulo() + "%' ";
		}
		
		// DESART
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
}
