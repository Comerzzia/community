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

package com.comerzzia.persistencia.compras.facturas.vencimientos;

import java.sql.SQLException;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;

public class VencimientosFacturasComprasDao extends MantenimientoDao {

	private static String TABLA_PAGOS = "D_PAGOS_VEN_TBL";
	private static String TABLA_DOCUMENTOS = "D_PAGOS_DOC_TBL";

	private static Logger log = Logger.getMLogger(VencimientosFacturasComprasDao.class);

	public static void insertarPago(Connection conn, ConfigEmpresaBean config, VencimientoFacturaCompraBean vencimiento) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA_PAGOS) + 
				"(" +
				"ID_VENCIMIENTO, " +
				"ID_PAGO, " +
				"ID_VENCIMIENTO_ENLACE, " +
				"CODSERIE, " +
				"DOCUMENTO, " +
				"FECHA_FACTURA, " +
				"FECHA_VENCIMIENTO, " +
				"IMPORTE, " +
				"FECHA_ALTA, " +
				"FECHA_ACEPTACION " +
				") " +
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
			pstmt.setDate(9, Fechas.toSqlDate(vencimiento.getFechaAlta()));
			pstmt.setDate(10, Fechas.toSqlDate(vencimiento.getFechaAceptacion()));
			
        	log.debug("insertarPago() - " + pstmt);
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

	public static void insertarDocumento(Connection conn, ConfigEmpresaBean config, VencimientoFacturaCompraBean vencimiento) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA_DOCUMENTOS) + 
				"(" +
				"ID_PAGO, " +
				"CODEMP, " +
				"CODPRO, " +
				"FECHA_ALTA, " +
				"FECHA_VENCIMIENTO, " +
				"FECHA_BAJA, " +
				"FECHA_PAGO, " +
				"BORRADO, " +
				"CODTIPOEFEC, " +
				"CODSERIE, " +
				"DOCUMENTO, " +
				"IMPORTE, " +
				"CODBAN_PAGO, " +
				"DOCUMENTO_PAGO, " +
				"ID_REMESA, " +
				"FECHA_EMISION, " +
				"OBSERVACIONES " +
				") " +
			  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, vencimiento.getIdPago());
			pstmt.setString(2, vencimiento.getCodEmpresa());
			pstmt.setString(3, vencimiento.getCodProveedor());			
			pstmt.setDate(4, Fechas.toSqlDate(vencimiento.getFechaAlta()));
			pstmt.setDate(5, Fechas.toSqlDate(vencimiento.getFechaVencimiento()));
			pstmt.setDate(6, Fechas.toSqlDate(vencimiento.getFechaBaja()));
			pstmt.setDate(7, Fechas.toSqlDate(vencimiento.getFechaPago()));
			pstmt.setString(8, vencimiento.getBorrado());			
			pstmt.setString(9, vencimiento.getCodTipoEfecto());
			pstmt.setString(10, vencimiento.getCodSerie());
			pstmt.setString(11, vencimiento.getDocumento());
			pstmt.setDouble(12, vencimiento.getImporte());			
			pstmt.setString(13, vencimiento.getCodBancoPago());
			pstmt.setString(14, vencimiento.getDocumentoPago());
			pstmt.setLong(15, vencimiento.getIdRemesa());
			pstmt.setDate(16, Fechas.toSqlDate(vencimiento.getFechaEmision()));			
			pstmt.setString(17, vencimiento.getObservaciones());
			
        	log.debug("insertarDocumento() - " + pstmt);
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
