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

package com.comerzzia.persistencia.ventas.facturas.vencimientos;

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

public class VencimientosFacturasVentasDao extends MantenimientoDao {

	private static String TABLA_COBROS = "D_COBROS_VEN_TBL";
	private static String TABLA_DOCUMENTOS = "D_COBROS_DOC_TBL";
	private static String VISTA = "D_FACTURAS_REP_COB";

	private static Logger log = Logger.getMLogger(VencimientosFacturasVentasDao.class);

	public static List<VencimientoFacturaVentaBean> consultar(Connection conn, ConfigEmpresaBean config, Long idVencimientoEnlace)throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		List<VencimientoFacturaVentaBean> vencimientos = null;
		
		sql = "SELECT ID_VENCIMIENTO_ENLACE, ID_VENCIMIENTO, ID_COBRO, FECHA_BAJA, IMPORTE, ESTADO, "+
				"FECHA_ALTA, FECHA_VENCIMIENTO, FECHA_VENCIMIENTO_DOCUMENTO, FECHA_BAJA_DOCUMENTO, "+
				"FECHA_BAJA_RIESGO_BANCO, CODTIPOEFEC, DESTIPOEFEC, CODSERIE, DOCUMENTO, "+
				"CODBAN_COBRO, FECHA_COBRO, IMPORTE_DOCUMENTO, OBSERVACIONES, BORRADO, ID_CODREMESA, "+
				"CODBAN_REMESA, FECHA_REMESA "+
			"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
			   "WHERE ID_VENCIMIENTO_ENLACE = ? " +
			"ORDER BY FECHA_VENCIMIENTO";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idVencimientoEnlace);
			
			log.debug("consultar() - " + pstmt);
			rs = pstmt.executeQuery();
			
			vencimientos = new ArrayList<VencimientoFacturaVentaBean>();
			while (rs.next()) {
				VencimientoFacturaVentaBean vencimiento = new VencimientoFacturaVentaBean();
				vencimiento.setIdVencimientoEnlace((rs.getString("ID_VENCIMIENTO_ENLACE") != null) ? rs.getLong("ID_VENCIMIENTO_ENLACE") : null);
				vencimiento.setIdVencimiento(rs.getLong("ID_VENCIMIENTO"));
				vencimiento.setIdCobro(rs.getLong("ID_COBRO"));
				vencimiento.setFechaBaja(rs.getDate("FECHA_BAJA"));
				vencimiento.setImporte(rs.getDouble("IMPORTE"));
				vencimiento.setEstado(rs.getLong("ESTADO"));
				vencimiento.setFechaAlta(rs.getDate("FECHA_ALTA"));
				vencimiento.setFechaVencimiento(rs.getDate("FECHA_VENCIMIENTO"));
				vencimiento.setFechaVencimientoDocumento(rs.getDate("FECHA_VENCIMIENTO_DOCUMENTO"));
				vencimiento.setFechaBajaDocumento(rs.getDate("FECHA_BAJA_DOCUMENTO"));
				vencimiento.setFechaBajaRiesgoBanco(rs.getDate("FECHA_BAJA_RIESGO_BANCO"));
				vencimiento.setCodTipoEfecto(rs.getString("CODTIPOEFEC"));
				vencimiento.setDesTipoEfecto(rs.getString("DESTIPOEFEC"));
				vencimiento.setCodSerie(rs.getString("CODSERIE"));
				vencimiento.setDocumento(rs.getString("DOCUMENTO"));
				vencimiento.setCodBancoCobro(rs.getString("CODBAN_COBRO"));
				vencimiento.setFechaCobro(rs.getDate("FECHA_COBRO"));
				vencimiento.setImporteDocumento(rs.getDouble("IMPORTE_DOCUMENTO"));
				vencimiento.setObservaciones(rs.getString("OBSERVACIONES"));
				vencimiento.setBorrado(rs.getString("BORRADO"));
				vencimiento.setIdCodRemesa(rs.getLong("ID_CODREMESA"));
				vencimiento.setCodbanRemesa(rs.getString("CODBAN_REMESA"));
				vencimiento.setFechaRemesa(rs.getDate("FECHA_REMESA"));
				
				vencimientos.add(vencimiento);
			}
			
			return vencimientos;
		}
		finally {
			try {
				rs.close();
			} catch (Exception ignore) {}
			
			try {
				pstmt.close();
			} catch (Exception ignore) {}
		}
	}
	
	public static List<VencimientoFacturaVentaBean> consultarVencimientoActivo(Connection conn, ConfigEmpresaBean config, Long idVencimientoEnlace)throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		List<VencimientoFacturaVentaBean> vencimientos = null;
		
		sql = "SELECT ID_VENCIMIENTO_ENLACE, ID_VENCIMIENTO, ID_COBRO, FECHA_BAJA, IMPORTE, ESTADO, "+
				"FECHA_ALTA, FECHA_VENCIMIENTO, FECHA_VENCIMIENTO_DOCUMENTO, FECHA_BAJA_DOCUMENTO, "+
				"FECHA_BAJA_RIESGO_BANCO, CODTIPOEFEC, DESTIPOEFEC, CODSERIE, DOCUMENTO, "+
				"CODBAN_COBRO, FECHA_COBRO, IMPORTE_DOCUMENTO, OBSERVACIONES, BORRADO, ID_CODREMESA, "+
				"CODBAN_REMESA, FECHA_REMESA "+
			"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
			   "WHERE ID_VENCIMIENTO_ENLACE = ? AND FECHA_BAJA IS NULL AND BORRADO = 'N'" +
			"ORDER BY FECHA_VENCIMIENTO";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idVencimientoEnlace);
			
			log.debug("consultar() - " + pstmt);
			rs = pstmt.executeQuery();
			
			vencimientos = new ArrayList<VencimientoFacturaVentaBean>();
			while (rs.next()) {
				VencimientoFacturaVentaBean vencimiento = new VencimientoFacturaVentaBean();
				vencimiento.setIdVencimientoEnlace((rs.getString("ID_VENCIMIENTO_ENLACE") != null) ? rs.getLong("ID_VENCIMIENTO_ENLACE") : null);
				vencimiento.setIdVencimiento(rs.getLong("ID_VENCIMIENTO"));
				vencimiento.setIdCobro(rs.getLong("ID_COBRO"));
				vencimiento.setFechaBaja(rs.getDate("FECHA_BAJA"));
				vencimiento.setImporte(rs.getDouble("IMPORTE"));
				vencimiento.setEstado(rs.getLong("ESTADO"));
				vencimiento.setFechaAlta(rs.getDate("FECHA_ALTA"));
				vencimiento.setFechaVencimiento(rs.getDate("FECHA_VENCIMIENTO"));
				vencimiento.setFechaVencimientoDocumento(rs.getDate("FECHA_VENCIMIENTO_DOCUMENTO"));
				vencimiento.setFechaBajaDocumento(rs.getDate("FECHA_BAJA_DOCUMENTO"));
				vencimiento.setFechaBajaRiesgoBanco(rs.getDate("FECHA_BAJA_RIESGO_BANCO"));
				vencimiento.setCodTipoEfecto(rs.getString("CODTIPOEFEC"));
				vencimiento.setDesTipoEfecto(rs.getString("DESTIPOEFEC"));
				vencimiento.setCodSerie(rs.getString("CODSERIE"));
				vencimiento.setDocumento(rs.getString("DOCUMENTO"));
				vencimiento.setCodBancoCobro(rs.getString("CODBAN_COBRO"));
				vencimiento.setFechaCobro(rs.getDate("FECHA_COBRO"));
				vencimiento.setImporteDocumento(rs.getDouble("IMPORTE_DOCUMENTO"));
				vencimiento.setObservaciones(rs.getString("OBSERVACIONES"));
				vencimiento.setBorrado(rs.getString("BORRADO"));
				vencimiento.setIdCodRemesa(rs.getLong("ID_CODREMESA"));
				vencimiento.setCodbanRemesa(rs.getString("CODBAN_REMESA"));
				vencimiento.setFechaRemesa(rs.getDate("FECHA_REMESA"));
				
				vencimientos.add(vencimiento);
			}
			
			return vencimientos;
		}
		finally {
			try {
				rs.close();
			} catch (Exception ignore) {}
			
			try {
				pstmt.close();
			} catch (Exception ignore) {}
		}
	}

	public static void insertarCobro(Connection conn, ConfigEmpresaBean config, VencimientoFacturaVentaBean vencimiento) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA_COBROS) + 
				"(" +
				"ID_VENCIMIENTO, " +
				"ID_COBRO, " +
				"ID_VENCIMIENTO_ENLACE, " +
				"CODSERIE, " +
				"DOCUMENTO, " +
				"FECHA_FACTURA, " +
				"FECHA_VENCIMIENTO, " +
				"IMPORTE, " +
				"FECHA_ALTA " +
				") " +
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
			pstmt.setDate(9, Fechas.toSqlDate(vencimiento.getFechaAlta()));
			
        	log.debug("insertarCobro() - " + pstmt);
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

	public static void insertarDocumento(Connection conn, ConfigEmpresaBean config, VencimientoFacturaVentaBean vencimiento) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA_DOCUMENTOS) + 
				"(" +
				"ID_COBRO, " +
				"CODEMP, " +
				"CODCLI, " +
				"FECHA_ALTA, " +
				"FECHA_VENCIMIENTO, " +
				"FECHA_BAJA, " +
				"FECHA_COBRO, " +
				"BORRADO, " +
				"CODTIPOEFEC, " +
				"CODSERIE, " +
				"DOCUMENTO, " +
				"IMPORTE, " +
				"OBSERVACIONES, " +
				"CODBAN_COBRO, " +
				"CODBAN_DEVOLUCION, " +
				"GASTOS_DEVOLUCION, " +
				"REMESABLE, " +
				"FECHA_ENTRADA_DOCUMENTO, " +
				"ID_REMESA " +
				") " +
			  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, vencimiento.getIdCobro());
			pstmt.setString(2, vencimiento.getCodEmpresa());
			pstmt.setString(3, vencimiento.getCodCliente());			
			pstmt.setDate(4, Fechas.toSqlDate(vencimiento.getFechaAlta()));
			pstmt.setDate(5, Fechas.toSqlDate(vencimiento.getFechaVencimiento()));
			pstmt.setDate(6, Fechas.toSqlDate(vencimiento.getFechaBaja()));
			pstmt.setDate(7, Fechas.toSqlDate(vencimiento.getFechaCobro()));
			pstmt.setString(8, vencimiento.getBorrado());			
			pstmt.setString(9, vencimiento.getCodTipoEfecto());
			pstmt.setString(10, vencimiento.getCodSerie());
			pstmt.setString(11, vencimiento.getDocumento());
			pstmt.setDouble(12, vencimiento.getImporte());			
			pstmt.setString(13, vencimiento.getObservaciones());
			pstmt.setString(14, vencimiento.getCodBancoCobro());
			pstmt.setString(15, vencimiento.getCodBancoDevolucion());
			pstmt.setDouble(16, vencimiento.getGastosDevolucion());
			pstmt.setString(17, vencimiento.getRemesable());			
			pstmt.setDate(18, Fechas.toSqlDate(vencimiento.getFechaEntradaDocumento()));
			pstmt.setLong(19, vencimiento.getIdCodRemesa());
			
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
