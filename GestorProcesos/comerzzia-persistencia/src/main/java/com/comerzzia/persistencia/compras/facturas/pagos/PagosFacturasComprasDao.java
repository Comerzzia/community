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

package com.comerzzia.persistencia.compras.facturas.pagos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class PagosFacturasComprasDao extends MantenimientoDao {

	protected static final String TABLA = "D_FACTURAS_SOP_PAG_TBL";
	protected static final String VISTA = "D_FACTURAS_SOP_PAG";
	
	/** Logger */
	protected static Logger log = Logger.getMLogger(PagosFacturasComprasDao.class);
	
	public static List<PagoFacturaCompraBean> consultar(Connection conn, ConfigEmpresaBean config, Long idFacturaSop) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	List<PagoFacturaCompraBean> listaMediosPago = new ArrayList<PagoFacturaCompraBean>();
    	String sql = null;
    	
    	sql = "SELECT ID_FACTURA_SOP, LINEA, ID_MEDPAG_VEN, DESMEDPAG_VEN, IMPORTE " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		      "WHERE ID_FACTURA_SOP = ? " +
		      "ORDER BY LINEA";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idFacturaSop);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	while (rs.next()){
        		PagoFacturaCompraBean medioPago = new PagoFacturaCompraBean();
        		medioPago.setIdFacturaSop(rs.getLong("ID_FACTURA_SOP"));
        		medioPago.setLinea(rs.getInt("LINEA"));
        		medioPago.setIdMedioPagoVencimiento(rs.getLong("ID_MEDPAG_VEN"));
        		medioPago.setDesMedioPagoVencimiento(rs.getString("DESMEDPAG_VEN"));
        		medioPago.setImporte(rs.getDouble("IMPORTE"));
        		
        		listaMediosPago.add(medioPago);
        	}
        	
    		return listaMediosPago;
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

	
	public static PagoFacturaCompraBean consultar(Connection conn, ConfigEmpresaBean config, Long idFacturaSop, Long linea) 
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
    	ResultSet rs = null;
    	
    	PagoFacturaCompraBean medioPago = null;
    	
    	sql = "SELECT ID_FACTURA_SOP, LINEA, ID_MEDPAG_VEN, DESMEDPAG_VEN, IMPORTE " +
    		  "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
    		  "WHERE ID_FACTURA_SOP = ? " +
    		  "AND LINEA = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idFacturaSop);
    		pstmt.setLong(2, linea);
    		
        	log.debug("consultar() - " + pstmt);
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		medioPago = new PagoFacturaCompraBean();
        		medioPago.setIdFacturaSop(rs.getLong("ID_FACTURA_SOP"));
        		medioPago.setLinea(rs.getInt("LINEA"));
        		medioPago.setIdMedioPagoVencimiento(rs.getLong("ID_MEDPAG_VEN"));
        		medioPago.setDesMedioPagoVencimiento(rs.getString("DESMEDPAG_VEN"));
        		medioPago.setImporte(rs.getDouble("IMPORTE"));
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
	
	public static void insert(Connection conn, ConfigEmpresaBean config, PagoFacturaCompraBean medioPago) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
				"(" +
				"ID_FACTURA_SOP, " +
				"LINEA, " +
				"ID_MEDPAG_VEN, " +
				"IMPORTE, " +
				"NUMERO_OPERACION " +
				") " +
			  "VALUES (?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, medioPago.getIdFacturaSop());
			pstmt.setInt(2, medioPago.getLinea());
			pstmt.setLong(3, medioPago.getIdMedioPagoVencimiento());		
			pstmt.setDouble(4, medioPago.getImporte());
			pstmt.setString(5, medioPago.getNumeroOperacion());
			
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
