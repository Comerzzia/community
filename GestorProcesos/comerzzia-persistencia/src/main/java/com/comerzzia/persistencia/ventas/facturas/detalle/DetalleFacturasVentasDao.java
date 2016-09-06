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

package com.comerzzia.persistencia.ventas.facturas.detalle;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;

public class DetalleFacturasVentasDao extends MantenimientoDao {

	protected static final String TABLA = "D_FACTURAS_REP_DET_TBL";
	protected static final String VISTA = "D_FACTURAS_REP_DET";
	
	/** Logger */
	protected static Logger log = Logger.getMLogger(DetalleFacturasVentasDao.class);
	
	public static List<DetalleFacturaVentaBean> consultar(Connection conn, ConfigEmpresaBean config, Long idFacturaSop) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	List<DetalleFacturaVentaBean> listaDetalles = new ArrayList<DetalleFacturaVentaBean>();
    	String sql = null;
    	
    	sql = "SELECT ID_FACTURA_REP, " +
				 "LINEA, " +
				 "REFERENCIA, " +
				 "FECHA_REFERENCIA, " +
				 "CODART, " +
				 "DESGLOSE1, " +
				 "DESGLOSE2, " +
				 "CONCEPTO, " +
				 "CONCEPTO_AMPLIADO, " +
				 "UNIDAD_MEDIDA, " +
				 "DESUNIDAD_MEDIDA, " +
				 "CANTIDAD_MEDIDA, " +
				 "CANTIDAD, " +
				 "PRECIO, " +
				 "IMPORTE, " +
				 "CODIMP, " +
				 "DESIMP " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		      "WHERE ID_FACTURA_REP = ? " +
		      "ORDER BY LINEA";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idFacturaSop);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	while (rs.next()){
        		DetalleFacturaVentaBean detalle = new DetalleFacturaVentaBean();
        		detalle.setIdFacturaRep(rs.getLong("ID_FACTURA_REP"));
        		detalle.setLinea(rs.getInt("LINEA"));
        		detalle.setReferencia(rs.getString("REFERENCIA"));
        		detalle.setFecha(rs.getDate("FECHA_REFERENCIA"));
        		detalle.setCodArticulo(rs.getString("CODART"));
        		detalle.setDesglose1(rs.getString("DESGLOSE1"));
        		detalle.setDesglose2(rs.getString("DESGLOSE2"));
        		detalle.setConcepto(rs.getString("CONCEPTO"));
        		detalle.setConceptoAmpliado(rs.getString("CONCEPTO_AMPLIADO"));
        		detalle.setUnidadMedida(rs.getString("UNIDAD_MEDIDA"));
        		detalle.setDesUnidadMedida(rs.getString("DESUNIDAD_MEDIDA"));
        		detalle.setCantidad(rs.getDouble("CANTIDAD"));
        		detalle.setCantidadMedida(rs.getDouble("CANTIDAD_MEDIDA"));
        		detalle.setPrecio(rs.getDouble("PRECIO"));
        		detalle.setCodImpuesto(rs.getString("CODIMP"));
        		detalle.setDesImpuesto(rs.getString("DESIMP"));
        		listaDetalles.add(detalle);
        	}
        	
    		return listaDetalles;
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

	
	public static DetalleFacturaVentaBean consultar(Connection conn, ConfigEmpresaBean config, Long idFacturaSop, Long linea) 
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
    	ResultSet rs = null;
    	
    	DetalleFacturaVentaBean detalle = null;
    	
    	sql = "SELECT ID_FACTURA_REP, " +
    				 "LINEA, " +
    				 "REFERENCIA, " +
    				 "FECHA_REFERENCIA, " +
    				 "CODART, " +
    				 "DESGLOSE1, " +
    				 "DESGLOSE2, " +
    				 "CONCEPTO, " +
    				 "CONCEPTO_AMPLIADO, " +
    				 "UNIDAD_MEDIDA, " +
    				 "DESUNIDAD_MEDIDA, " +
    				 "CANTIDAD_MEDIDA, " +
    				 "CANTIDAD, " +
    				 "PRECIO, " +
    				 "IMPORTE, " +
    				 "CODIMP, " +
    				 "DESIMP " +
    			"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
    		    "WHERE ID_FACTURA_REP = ? " +
    			"AND LINEA = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idFacturaSop);
    		pstmt.setLong(2, linea);
    		
        	log.debug("consultar() - " + pstmt);
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		detalle = new DetalleFacturaVentaBean();
        		detalle.setIdFacturaRep(rs.getLong("ID_FACTURA_REP"));
        		detalle.setLinea(rs.getInt("LINEA"));
        		detalle.setReferencia(rs.getString("REFERENCIA"));
        		detalle.setFecha(rs.getDate("FECHA_REFERENCIA"));
        		detalle.setCodArticulo(rs.getString("CODART"));
        		detalle.setDesglose1(rs.getString("DESGLOSE1"));
        		detalle.setDesglose2(rs.getString("DESGLOSE2"));
        		detalle.setConcepto(rs.getString("CONCEPTO"));
        		detalle.setConceptoAmpliado(rs.getString("CONCEPTO_AMPLIADO"));
        		detalle.setUnidadMedida(rs.getString("UNIDAD_MEDIDA"));
        		detalle.setDesUnidadMedida(rs.getString("DESUNIDAD_MEDIDA"));
        		detalle.setCantidad(rs.getDouble("CANTIDAD"));
        		detalle.setCantidadMedida(rs.getDouble("CANTIDAD_MEDIDA"));
        		detalle.setPrecio(rs.getDouble("PRECIO"));
        		detalle.setCodImpuesto(rs.getString("CODIMP"));
        		detalle.setDesImpuesto(rs.getString("DESIMP"));
        	}
        	
    		return detalle;
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
	
	public static void insert(Connection conn, ConfigEmpresaBean config, DetalleFacturaVentaBean detalleFactura) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
				"(" +
				"ID_FACTURA_REP, " +
				"LINEA, " +
				"REFERENCIA, " +
				"FECHA_REFERENCIA, " +
				"CODART, " +
				"DESGLOSE1, " +
				"DESGLOSE2, " +
				"CONCEPTO, " +
				"CONCEPTO_AMPLIADO, " +
				"UNIDAD_MEDIDA, " +
				"CANTIDAD_MEDIDA, " +
				"CANTIDAD, " +
				"PRECIO, " +
				"IMPORTE, " +
				"CODIMP " +
				") " +
			  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, detalleFactura.getIdFacturaRep());
			pstmt.setInt(2, detalleFactura.getLinea());
			pstmt.setString(3, detalleFactura.getReferencia());			
			pstmt.setDate(4, Fechas.toSqlDate(detalleFactura.getFecha()));		
			pstmt.setString(5, detalleFactura.getCodArticulo());
			pstmt.setString(6, detalleFactura.getDesglose1());
			pstmt.setString(7, detalleFactura.getDesglose2());
			pstmt.setString(8, detalleFactura.getConcepto());
			pstmt.setString(9, detalleFactura.getConceptoAmpliado());
			pstmt.setString(10, detalleFactura.getUnidadMedida());
			pstmt.setDouble(11, detalleFactura.getCantidadMedida());
			pstmt.setDouble(12, detalleFactura.getCantidad());
			pstmt.setDouble(13, detalleFactura.getPrecio());
			pstmt.setDouble(14, detalleFactura.getImporte());
			pstmt.setString(15, detalleFactura.getCodImpuesto());
			
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

}
