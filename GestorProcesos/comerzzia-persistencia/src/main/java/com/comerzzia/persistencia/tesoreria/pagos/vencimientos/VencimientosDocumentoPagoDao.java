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

package com.comerzzia.persistencia.tesoreria.pagos.vencimientos;

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

public class VencimientosDocumentoPagoDao extends MantenimientoDao {

private static String TABLA = "D_PAGOS_VEN_TBL";
	
	private static Logger log = Logger.getMLogger(VencimientosDocumentoPagoDao.class);
	
	public static List<VencimientoDocumentoPagoBean> consultar(Connection conn, ConfigEmpresaBean config, Long idPago) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	List<VencimientoDocumentoPagoBean> listaVencimientos = new ArrayList<VencimientoDocumentoPagoBean>();
    	String sql = null;
    	
    	sql = "SELECT ID_VENCIMIENTO, ID_PAGO, ID_VENCIMIENTO_ENLACE, CODSERIE, DOCUMENTO, FECHA_FACTURA, " +
    			"FECHA_VENCIMIENTO, IMPORTE, FECHA_ALTA " + 
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE ID_Pago = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idPago);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	while (rs.next()){
        		VencimientoDocumentoPagoBean vencimientoDocumentoPago = new VencimientoDocumentoPagoBean();
        		vencimientoDocumentoPago.setIdVencimiento(rs.getLong("ID_VENCIMIENTO"));
        		vencimientoDocumentoPago.setIdPago(rs.getLong("ID_PAGO"));
        		vencimientoDocumentoPago.setIdVencimientoEnlace(rs.getLong("ID_VENCIMIENTO_ENLACE"));
        		vencimientoDocumentoPago.setCodSerie(rs.getString("CODSERIE"));
        		vencimientoDocumentoPago.setDocumento(rs.getString("DOCUMENTO"));
        		vencimientoDocumentoPago.setFechaFactura(rs.getDate("FECHA_FACTURA"));
        		vencimientoDocumentoPago.setFechaVencimiento(rs.getDate("FECHA_VENCIMIENTO"));
        		vencimientoDocumentoPago.setImporte(rs.getDouble("IMPORTE"));
        		vencimientoDocumentoPago.setFechaAlta(rs.getDate("FECHA_ALTA"));
        		
        		listaVencimientos.add(vencimientoDocumentoPago);
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
	
	
	public static void insert(Connection conn, ConfigEmpresaBean config, VencimientoDocumentoPagoBean vencimiento) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(ID_VENCIMIENTO, ID_PAGO, ID_VENCIMIENTO_ENLACE, CODSERIE, DOCUMENTO, FECHA_FACTURA, FECHA_VENCIMIENTO, " +
		      "IMPORTE, FECHA_ALTA, FECHA_ACEPTACION)" +
		      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, vencimiento.getIdVencimiento());
			pstmt.setLong(2, vencimiento.getIdPago());
			pstmt.setLong(3, vencimiento.getIdVencimientoEnlace());
			pstmt.setString(4, vencimiento.getCodSerie());
			pstmt.setString(5, vencimiento.getDocumento());
			pstmt.setDate(6, Fechas.toSqlDate(vencimiento.getFechaFactura()));
			pstmt.setDate(7, Fechas.toSqlDate(vencimiento.getFechaVencimiento()));
			pstmt.setDouble(8, vencimiento.getImporte());
			pstmt.setDate(9, Fechas.toSqlDate(new Date()));
			pstmt.setDate(10, Fechas.toSqlDate(vencimiento.getFechaAceptacion()));
        	
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
	
	public static void update(Connection conn, ConfigEmpresaBean config, VencimientoDocumentoPagoBean vencimiento) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET ID_PAGO = ?, ID_VENCIMIENTO_ENLACE = ?,  CODSERIE = ?, DOCUMENTO = ?, FECHA_FACTURA = ?, " +
		      "FECHA_VENCIMIENTO = ?, IMPORTE = ?, FECHA_ALTA = ?, FECHA_ACEPTACION = ? " + 
		      "WHERE ID_VENCIMIENTO = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, vencimiento.getIdPago());
			pstmt.setLong(2, vencimiento.getIdVencimientoEnlace());
			pstmt.setString(3, vencimiento.getCodSerie());
			pstmt.setString(4, vencimiento.getDocumento());
			pstmt.setDate(5, Fechas.toSqlDate(vencimiento.getFechaFactura()));
			pstmt.setDate(6, Fechas.toSqlDate(vencimiento.getFechaVencimiento()));
			pstmt.setDouble(7, vencimiento.getImporte());
			pstmt.setDate(8, Fechas.toSqlDate(vencimiento.getFechaAlta()));
			pstmt.setDate(9, Fechas.toSqlDate(vencimiento.getFechaAceptacion()));
        	
			pstmt.setLong(10, vencimiento.getIdVencimiento());
			
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
