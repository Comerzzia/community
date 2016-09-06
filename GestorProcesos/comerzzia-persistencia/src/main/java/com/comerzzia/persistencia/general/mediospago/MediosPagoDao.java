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

package com.comerzzia.persistencia.general.mediospago;

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

public class MediosPagoDao extends MantenimientoDao {

	private static String TABLA = "D_MEDIOS_PAGO_TBL";
	private static String VISTA = "D_MEDIOS_PAGO";
	
	private static Logger log = Logger.getMLogger(MediosPagoDao.class);
	
	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, 
			ParametrosBuscarMediosPagoBean param) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<MedioPagoBean> resultados = new ArrayList<MedioPagoBean>(param.getTamañoPagina());
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
                		MedioPagoBean medioPago = new MedioPagoBean();
                		medioPago.setCodMedioPago(rs.getString("CODMEDPAG"));
                		medioPago.setDesMedioPago(rs.getString("DESMEDPAG"));
                		medioPago.setContado(rs.getString("CONTADO"));
                		medioPago.setEfectivo(rs.getString("EFECTIVO"));
                		medioPago.setTarjetaCredito(rs.getString("TARJETA_CREDITO"));
                		medioPago.setCodTipoEfecto(rs.getString("CODTIPOEFEC"));
                		medioPago.setDesTipoEfecto(rs.getString("DESTIPOEFEC"));
                		medioPago.setVisibleVenta(rs.getString("VISIBLE_VENTA"));
                		medioPago.setVisibleTiendaVirtual(rs.getString("VISIBLE_TIENDA_VIRTUAL"));
                		medioPago.setVisibleCompra(rs.getString("VISIBLE_COMPRA"));
                		medioPago.setActivo(rs.getString("ACTIVO"));
                		resultados.add(medioPago);
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
    
	
	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarMediosPagoBean param) {
		String sql = null;
		
		sql = "SELECT CODMEDPAG, DESMEDPAG, CONTADO, EFECTIVO, TARJETA_CREDITO, CODTIPOEFEC, " +
			  "DESTIPOEFEC, VISIBLE_VENTA, VISIBLE_TIENDA_VIRTUAL, VISIBLE_COMPRA, ACTIVO " +
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
	
	
	public static String obtenerConsultaCount(ConfigEmpresaBean config, ParametrosBuscarMediosPagoBean param) {
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

	
	private static String getClausulaWhere(ParametrosBuscarMediosPagoBean param) {
		String where = "";
		
		// CODMEDPAG
		if (!param.getCodMedioPago().isEmpty()) {
			where = "CODMEDPAG LIKE '" + param.getCodMedioPago() + "%' ";
		}
		
		// DESMEDPAG
		if (!param.getDesMedioPago().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "UPPER(DESMEDPAG) LIKE UPPER('" + param.getDesMedioPago() + "%') ";
		}
		
		if (!param.getActivo().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "ACTIVO = '"+ param.getActivo() +"' ";
		}
		
		return where;
	} 
	
	
    public static MedioPagoBean consultar(Connection conn, ConfigEmpresaBean config, String codMedioPago) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	MedioPagoBean medioPago = null;
    	String sql = null;
    	
    	sql = "SELECT CODMEDPAG, DESMEDPAG, CONTADO, EFECTIVO, TARJETA_CREDITO, CODTIPOEFEC, " +
		  	  "DESTIPOEFEC, VISIBLE_VENTA, VISIBLE_TIENDA_VIRTUAL, VISIBLE_COMPRA, ACTIVO " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		      "WHERE CODMEDPAG = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, codMedioPago);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		medioPago = new MedioPagoBean(); 
        		medioPago.setCodMedioPago(rs.getString("CODMEDPAG"));
        		medioPago.setDesMedioPago(rs.getString("DESMEDPAG"));
        		medioPago.setContado(rs.getString("CONTADO"));
        		medioPago.setEfectivo(rs.getString("EFECTIVO"));
        		medioPago.setTarjetaCredito(rs.getString("TARJETA_CREDITO"));
        		medioPago.setCodTipoEfecto(rs.getString("CODTIPOEFEC"));
        		medioPago.setDesTipoEfecto(rs.getString("DESTIPOEFEC"));
        		medioPago.setVisibleVenta(rs.getString("VISIBLE_VENTA"));
        		medioPago.setVisibleTiendaVirtual(rs.getString("VISIBLE_TIENDA_VIRTUAL"));
        		medioPago.setVisibleCompra(rs.getString("VISIBLE_COMPRA"));
        		medioPago.setActivo(rs.getString("ACTIVO"));
        	}
        	
    		return medioPago;
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
    
    
    public static MedioPagoBean consultarEfectivoContado(Connection conn, 
    		ConfigEmpresaBean config) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	MedioPagoBean medioPago = null;
    	String sql = null;
    	
    	sql = "SELECT CODMEDPAG, DESMEDPAG, CONTADO, EFECTIVO, TARJETA_CREDITO, CODTIPOEFEC, " +
		  	  "DESTIPOEFEC, VISIBLE_VENTA, VISIBLE_TIENDA_VIRTUAL, VISIBLE_COMPRA, ACTIVO " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		      "WHERE CONTADO = 'S' " +
		      "AND EFECTIVO = 'S' " +
		      "ORDER BY CODMEDPAG";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		medioPago = new MedioPagoBean(); 
        		medioPago.setCodMedioPago(rs.getString("CODMEDPAG"));
        		medioPago.setDesMedioPago(rs.getString("DESMEDPAG"));
        		medioPago.setContado(rs.getString("CONTADO"));
        		medioPago.setEfectivo(rs.getString("EFECTIVO"));
        		medioPago.setTarjetaCredito(rs.getString("TARJETA_CREDITO"));
        		medioPago.setCodTipoEfecto(rs.getString("CODTIPOEFEC"));
        		medioPago.setDesTipoEfecto(rs.getString("DESTIPOEFEC"));
        		medioPago.setVisibleVenta(rs.getString("VISIBLE_VENTA"));
        		medioPago.setVisibleTiendaVirtual(rs.getString("VISIBLE_TIENDA_VIRTUAL"));
        		medioPago.setVisibleCompra(rs.getString("VISIBLE_COMPRA"));
        		medioPago.setActivo(rs.getString("ACTIVO"));
        	}
        	
    		return medioPago;
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
    
    
    public static void insert(Connection conn, ConfigEmpresaBean config, MedioPagoBean medioPago) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(CODMEDPAG, DESMEDPAG, CONTADO, EFECTIVO, TARJETA_CREDITO, CODTIPOEFEC, " +
		      "VISIBLE_VENTA, VISIBLE_TIENDA_VIRTUAL, VISIBLE_COMPRA, ACTIVO) " +
		      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, medioPago.getCodMedioPago());
        	pstmt.setString(2, medioPago.getDesMedioPago());
        	pstmt.setString(3, medioPago.getContado());
        	pstmt.setString(4, medioPago.getEfectivo());
        	pstmt.setString(5, medioPago.getTarjetaCredito());
        	pstmt.setString(6, medioPago.getCodTipoEfecto());
        	pstmt.setString(7, medioPago.getVisibleVenta());
        	pstmt.setString(8, medioPago.getVisibleTiendaVirtual());
        	pstmt.setString(9, medioPago.getVisibleCompra());
        	pstmt.setString(10, medioPago.getActivo());
        	
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
    
    
    public static void update(Connection conn, ConfigEmpresaBean config, MedioPagoBean medioPago) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET DESMEDPAG = ?, CONTADO = ?, EFECTIVO = ?, TARJETA_CREDITO = ?, CODTIPOEFEC = ?, " +
		      "VISIBLE_VENTA = ?, VISIBLE_TIENDA_VIRTUAL = ?, VISIBLE_COMPRA = ?, ACTIVO = ? " +
		      "WHERE CODMEDPAG = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);		
        	pstmt.setString(1, medioPago.getDesMedioPago());
        	pstmt.setString(2, medioPago.getContado());
        	pstmt.setString(3, medioPago.getEfectivo());
        	pstmt.setString(4, medioPago.getTarjetaCredito());
        	pstmt.setString(5, medioPago.getCodTipoEfecto());
        	pstmt.setString(6, medioPago.getVisibleVenta());
        	pstmt.setString(7, medioPago.getVisibleTiendaVirtual());
        	pstmt.setString(8, medioPago.getVisibleCompra());
        	pstmt.setString(9, medioPago.getActivo());
        	pstmt.setString(10, medioPago.getCodMedioPago());
        	
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
        
    
    public static void delete(Connection conn, ConfigEmpresaBean config, MedioPagoBean medioPago) throws SQLException {
		delete(conn, config, medioPago.getCodMedioPago());
	}
    	
    	
    public static void delete(Connection conn, ConfigEmpresaBean config, String codMedioPago) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODMEDPAG = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, codMedioPago);
        	
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
