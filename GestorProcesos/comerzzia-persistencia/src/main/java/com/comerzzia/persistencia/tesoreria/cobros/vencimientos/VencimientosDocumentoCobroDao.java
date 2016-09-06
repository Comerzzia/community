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

package com.comerzzia.persistencia.tesoreria.cobros.vencimientos;

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

public class VencimientosDocumentoCobroDao extends MantenimientoDao {

	private static String TABLA = "D_COBROS_VEN_TBL";
	
	private static Logger log = Logger.getMLogger(VencimientosDocumentoCobroDao.class);
	
	public static List<VencimientoDocumentoCobroBean> consultar(Connection conn, ConfigEmpresaBean config, Long idCobro) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	List<VencimientoDocumentoCobroBean> listaVencimientos = new ArrayList<VencimientoDocumentoCobroBean>();
    	String sql = null;
    	
    	sql = "SELECT ID_VENCIMIENTO, ID_COBRO, ID_VENCIMIENTO_ENLACE, CODSERIE, DOCUMENTO, FECHA_FACTURA, " +
    			"FECHA_VENCIMIENTO, IMPORTE, FECHA_ALTA " + 
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE ID_COBRO = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idCobro);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	while (rs.next()){
        		VencimientoDocumentoCobroBean vencimientoDocumentoCobro = new VencimientoDocumentoCobroBean();
        		vencimientoDocumentoCobro.setIdVencimiento(rs.getLong("ID_VENCIMIENTO"));
        		vencimientoDocumentoCobro.setIdCobro(rs.getLong("ID_COBRO"));
        		vencimientoDocumentoCobro.setIdVencimientoEnlace((rs.getString("ID_VENCIMIENTO_ENLACE") != null) ? rs.getLong("ID_VENCIMIENTO_ENLACE") : null);
        		vencimientoDocumentoCobro.setCodSerie(rs.getString("CODSERIE"));
        		vencimientoDocumentoCobro.setDocumento(rs.getString("DOCUMENTO"));
        		vencimientoDocumentoCobro.setFechaFactura(rs.getDate("FECHA_FACTURA"));
        		vencimientoDocumentoCobro.setFechaVencimiento(rs.getDate("FECHA_VENCIMIENTO"));
        		vencimientoDocumentoCobro.setImporte(rs.getDouble("IMPORTE"));
        		vencimientoDocumentoCobro.setFechaAlta(rs.getDate("FECHA_ALTA"));
        		
        		listaVencimientos.add(vencimientoDocumentoCobro);
        	}
        	
    		return listaVencimientos;
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
	
	public static void insert(Connection conn, ConfigEmpresaBean config, VencimientoDocumentoCobroBean vencimiento) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(ID_VENCIMIENTO, ID_COBRO, ID_VENCIMIENTO_ENLACE, CODSERIE, DOCUMENTO, FECHA_FACTURA, FECHA_VENCIMIENTO, " +
		      "IMPORTE, FECHA_ALTA)" +
		      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, vencimiento.getIdVencimiento());
			pstmt.setLong(2, vencimiento.getIdCobro());
			pstmt.setLong(3, vencimiento.getIdVencimientoEnlace());
			pstmt.setString(4, vencimiento.getCodSerie());
			pstmt.setString(5, vencimiento.getDocumento());
			pstmt.setDate(6, Fechas.toSqlDate(vencimiento.getFechaFactura()));
			pstmt.setDate(7, Fechas.toSqlDate(vencimiento.getFechaVencimiento()));
			pstmt.setDouble(8, vencimiento.getImporte());
			pstmt.setDate(9, Fechas.toSqlDate(new Date()));
        	
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
	
	public static void update(Connection conn, ConfigEmpresaBean config, VencimientoDocumentoCobroBean vencimiento) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET ID_COBRO = ?, ID_VENCIMIENTO_ENLACE = ?,  CODSERIE = ?, DOCUMENTO = ?, FECHA_FACTURA = ?, " +
		      "FECHA_VENCIMIENTO = ?, IMPORTE = ?, FECHA_ALTA = ? " + 
		      "WHERE ID_VENCIMIENTO = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, vencimiento.getIdCobro());
			pstmt.setLong(2, vencimiento.getIdVencimientoEnlace());
			pstmt.setString(3, vencimiento.getCodSerie());
			pstmt.setString(4, vencimiento.getDocumento());
			pstmt.setDate(5, Fechas.toSqlDate(vencimiento.getFechaFactura()));
			pstmt.setDate(6, Fechas.toSqlDate(vencimiento.getFechaVencimiento()));
			pstmt.setDouble(7, vencimiento.getImporte());
			pstmt.setDate(8, Fechas.toSqlDate(vencimiento.getFechaAlta()));
        	
			pstmt.setLong(9, vencimiento.getIdVencimiento());
			
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
}
