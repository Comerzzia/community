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

package com.comerzzia.persistencia.tesoreria.pagos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.tesoreria.pagos.totales.TotalesDocumentosPagosBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class DocumentosPagosDao extends MantenimientoDao {

	private static String TABLA = "D_PAGOS_DOC_TBL";
	private static String VISTA = "D_PAGOS";
	
	private static Logger log = Logger.getMLogger(DocumentosPagosDao.class);
	
	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, ParametrosBuscarDocumentosPagosBean param) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<DocumentoPagoBean> resultados = new ArrayList<DocumentoPagoBean>(param.getTamañoPagina());
    	PaginaResultados paginaResultados = new PaginaResultados(param, resultados);
    	
    	// Consultas
    	String sql = obtenerConsulta(config, param);
    	String sqlCount = obtenerConsultaCount(config, param);
    	
        try {
        	pstmt = new PreparedStatement(conn, sqlCount);
			insertarParametros(pstmt, param);
    		
    		// Obtenemos número de resultados
        	log.debug("consultar() - " + sqlCount);
        	rs = pstmt.executeQuery();
        	if (rs.next()){
        		paginaResultados.setTotalResultados(rs.getInt(1));
        	}
        	rs.close();
        	
        	// Si tenemos resultados, obtenemos la pagina requerida
            if (paginaResultados.getTotalResultados() > 0) {
            	pstmt = new PreparedStatement(conn, sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        		insertarParametros(pstmt, param);
        		
            	log.debug("consultar() - " + sql);
                rs = pstmt.executeQuery();
                
                int contador = 0;
                if (rs.absolute(paginaResultados.getInicio())) {
                    do {
                    	DocumentoPagoBean documentoPago = new DocumentoPagoBean();
                    	documentoPago.setIdPago(rs.getLong("ID_PAGO"));
                    	documentoPago.setFechaVencimiento(rs.getDate("FECHA_VENCIMIENTO"));
                    	documentoPago.setCodProveedor(rs.getString("CODPRO"));
                    	documentoPago.setDesProveedor(rs.getString("DESPRO"));
                    	documentoPago.setFechaFactura(rs.getDate("FECHA_FACTURA"));
                    	documentoPago.setImporte(rs.getDouble("IMPORTE"));
                    	documentoPago.setCodSerie(rs.getString("CODSERIE"));
                    	documentoPago.setDocumento(rs.getString("DOCUMENTO"));
                    	documentoPago.setFechaPago(rs.getDate("FECHA_PAGO"));
                    	documentoPago.setCodTipoEfecto(rs.getString("CODTIPOEFEC"));
                    	documentoPago.setDesTipoEfecto(rs.getString("DESTIPOEFEC"));
                    	documentoPago.setFechaEmision(rs.getDate("FECHA_PAGO"));
                    	documentoPago.setIdRemesa((rs.getString("ID_REMESA") != null) ? rs.getLong("ID_REMESA") : null);
                		documentoPago.setObservaciones(rs.getString("OBSERVACIONES"));
                		documentoPago.setFechaEmision(rs.getDate("FECHA_EMISION"));
                		
                		resultados.add(documentoPago);
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
        			pstmt.close();
        		}
        		catch(Exception ignore) {;}
        	}
	} 

	public static PaginaResultados consultarDocumentosSinRemesar(Connection conn, ConfigEmpresaBean config, ParametrosBuscarDocumentosPagosBean param) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<DocumentoPagoBean> resultados = new ArrayList<DocumentoPagoBean>(param.getTamañoPagina());
    	PaginaResultados paginaResultados = new PaginaResultados(param, resultados);
    	
    	// Consultas
    	String sql = obtenerConsultaDocumentosSinRemesar(config, param);
    	String sqlCount = obtenerConsultaDocumentosSinRemesarCount(config, param);
    	
        try {
    		pstmt = new PreparedStatement(conn, sqlCount);
    		insertarParametros(pstmt, param);

			// Obtenemos número de resultados
			log.debug("consultarDocumentosSinRemesar() - " + pstmt);
			rs = pstmt.executeQuery();

			if (rs.next()){
        		paginaResultados.setTotalResultados(rs.getInt(1));
        	}
        	rs.close();
        	
        	// Si tenemos resultados, obtenemos la pagina requerida
            if (paginaResultados.getTotalResultados() > 0) {
        		pstmt = new PreparedStatement(conn, sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        		insertarParametros(pstmt, param);
            	log.debug("consultarDocumentosSinRemesar() - " + pstmt);
                rs = pstmt.executeQuery();
                
                int contador = 0;
                if (rs.absolute(paginaResultados.getInicio())) {
                    do {
                    	DocumentoPagoBean documentoPago = new DocumentoPagoBean();
                    	documentoPago.setIdPago(rs.getLong("ID_PAGO"));
                    	documentoPago.setFechaVencimiento(rs.getDate("FECHA_VENCIMIENTO"));
                    	documentoPago.setCodProveedor(rs.getString("CODPRO"));
                    	documentoPago.setDesProveedor(rs.getString("DESPRO"));
                    	documentoPago.setImporte(rs.getDouble("IMPORTE"));
                    	documentoPago.setCodSerie(rs.getString("CODSERIE"));
                    	documentoPago.setDocumento(rs.getString("DOCUMENTO"));
                    	documentoPago.setFechaFactura(rs.getDate("FECHA_FACTURA"));
                    	documentoPago.setCodTipoEfecto(rs.getString("CODTIPOEFEC"));
                    	documentoPago.setDesTipoEfecto(rs.getString("DESTIPOEFEC"));
                    	documentoPago.setIdRemesa((rs.getString("ID_REMESA") != null) ? rs.getLong("ID_REMESA") : null);
                    	documentoPago.setObservaciones(rs.getString("OBSERVACIONES"));
                		
                		resultados.add(documentoPago);
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
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	} 

	public static TotalesDocumentosPagosBean consultarTotales (Connection conn, ConfigEmpresaBean config, ParametrosBuscarDocumentosPagosBean param) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	TotalesDocumentosPagosBean totales = new TotalesDocumentosPagosBean();
    	// Consultas
    	String sqlTotales = obtenerConsultaTotales(config, param);
    	
        try {
        	pstmt = new PreparedStatement(conn, sqlTotales, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    		insertarParametros(pstmt, param);
    		
        	log.debug("consultarTotales() - " + sqlTotales);
            rs = pstmt.executeQuery();
            
            if (rs.next()){
        		totales.setNumRegistros(rs.getInt("REGISTROS"));
                totales.setImporteTotal(rs.getDouble("IMPORTE"));
                totales.setNumProveedores(rs.getInt("PROVEEDORES"));
        	}
            
            return totales;
        }
            finally {
        		try {
        			rs.close();
        		}
        		catch(Exception ignore) {;}
        		try {
        			pstmt.close();
        		}
        		catch(Exception ignore) {;}
        	}
	}

	public static TotalesDocumentosPagosBean consultarTotalesDocumentosSinRemesar (Connection conn, ConfigEmpresaBean config, ParametrosBuscarDocumentosPagosBean param) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	TotalesDocumentosPagosBean totales = new TotalesDocumentosPagosBean();
    	// Consultas
    	String sqlTotales = obtenerConsultaTotalesDocumentosSinRemesar(config, param);
    	
        try {
    		pstmt = new PreparedStatement(conn, sqlTotales);
    		insertarParametros(pstmt, param);

			// Obtenemos número de resultados
			log.debug("consultarTotalesDocumentosSinRemesar() - " + pstmt);
			rs = pstmt.executeQuery();
            
            if (rs.next()){
        		totales.setNumRegistros(rs.getInt("REGISTROS"));
                totales.setImporteTotal(rs.getDouble("IMPORTE"));
                totales.setNumProveedores(rs.getInt("PROVEEDORES"));
        	}
            
            return totales;
        }
        finally {
    		try {
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}

	private static String obtenerConsultaTotales(ConfigEmpresaBean config, ParametrosBuscarDocumentosPagosBean param) {
		String sql = null;
		
		sql = "SELECT COUNT(*) REGISTROS, SUM(IMPORTE) IMPORTE, COUNT(DISTINCT CODPRO) PROVEEDORES " 
			  + "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }
        
		return sql;
	}

	private static String obtenerConsultaTotalesDocumentosSinRemesar(ConfigEmpresaBean config, ParametrosBuscarDocumentosPagosBean param) {
		String sql = null;
		
		sql = "SELECT COUNT(*) REGISTROS, SUM(IMPORTE) IMPORTE, COUNT(DISTINCT CODPRO) PROVEEDORES " 
			  + "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }

        sql += "AND CODTIPOEFEC = '" + param.getCodTipoEfecto() +"' ";

		return sql;
	}

	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarDocumentosPagosBean param) {
		String sql = null;
		
		sql = "SELECT ID_PAGO, FECHA_VENCIMIENTO, CODPRO, DESPRO, IMPORTE, CODSERIE, DOCUMENTO, FECHA_FACTURA, CODTIPOEFEC," 
			  + "DESTIPOEFEC, FECHA_PAGO, ID_REMESA, OBSERVACIONES, FECHA_EMISION " 
			  + "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
		
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

	public static String obtenerConsultaDocumentosSinRemesar(ConfigEmpresaBean config, ParametrosBuscarDocumentosPagosBean param) {
		String sql = null;
		
		sql = "SELECT ID_PAGO, FECHA_VENCIMIENTO, CODPRO, DESPRO, IMPORTE, CODSERIE, DOCUMENTO, " +
				"FECHA_FACTURA, CODTIPOEFEC, DESTIPOEFEC, ID_REMESA, OBSERVACIONES " 
			  + "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }

        sql += "AND CODTIPOEFEC = '" + param.getCodTipoEfecto() +"' ";
        
        // Clausula ORDER BY
        if (!param.getOrden().isEmpty()) {
        	sql += "ORDER BY " + param.getOrden();
        }
        
		return sql;
	}

	public static String obtenerConsultaCount(ConfigEmpresaBean config, ParametrosBuscarDocumentosPagosBean param) {
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

	public static String obtenerConsultaDocumentosSinRemesarCount(ConfigEmpresaBean config, ParametrosBuscarDocumentosPagosBean param) {
		String sql = null;
		
		sql = "SELECT COUNT(*) " +
		      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }

        sql += "AND CODTIPOEFEC = '" + param.getCodTipoEfecto() +"' ";
        
		return sql;
	}

	private static String getClausulaWhere(ParametrosBuscarDocumentosPagosBean param) {
		String where = "FECHA_BAJA IS NULL ";
		
		// CODPRO
		if (!param.getCodProveedor().isEmpty()) {
			where += "AND CODPRO LIKE '" + param.getCodProveedor() + "%' ";
		}
		
		// DESPRO
		if (!param.getDesProveedor().isEmpty()) {
			where += "AND UPPER(DESPRO) LIKE UPPER('" + param.getDesProveedor() + "%') ";
		}
		
		if (!param.isVerRemesados()) {
			where += "AND ID_REMESA IS NULL ";
		}else{
			where += "AND NOT ID_REMESA LIKE '' ";
		}
		
		// FECHA_DESDE
		if (param.getFechaVencimientoDesde() != null) {
			where += "AND FECHA_VENCIMIENTO >= ? ";
		}
		
		// FECHA_HASTA
		if (param.getFechaVencimientoHasta() != null) {
			where += "AND FECHA_VENCIMIENTO <= ? ";
		}
		
		// CODTIPOEFECT DESDE
		if (param.getCodTipoEfectoDesde() != null && !param.getCodTipoEfectoDesde().isEmpty()) {
			where += "AND CODTIPOEFEC >= '" + param.getCodTipoEfectoDesde() + "' ";
		}
		
		// CODTIPOEFECT HASTA
		if (param.getCodTipoEfectoHasta() != null && !param.getCodTipoEfectoHasta().isEmpty()) {
			where += "AND CODTIPOEFEC <= '" + param.getCodTipoEfectoHasta() + "' ";
		}
		
		// CODSERIE DESDE
		if (param.getCodSerieDesde() != null && !param.getCodSerieDesde().isEmpty()) {
			where += "AND CODSERIE >= '" + param.getCodSerieDesde() + "' ";
		}
		
		// CODSERIE HASTA
		if (param.getCodSerieHasta() != null && !param.getCodSerieHasta().isEmpty()) {
			where += "AND CODSERIE <= '" + param.getCodSerieHasta() + "' ";
		}
		
		return where;
	}
	
	private static void insertarParametros(PreparedStatement pstmt, ParametrosBuscarDocumentosPagosBean param) throws SQLException {
		Integer indice = 1;
		// FECHA_DESDE
		if (param.getFechaVencimientoDesde() != null) {
			pstmt.setDate(indice, Fechas.toSqlDate(param.getFechaVencimientoDesde()));
			indice++;
		}
		
		// FECHA_HASTA
		if (param.getFechaVencimientoHasta() != null) {
			pstmt.setDate(indice, Fechas.toSqlDate(param.getFechaVencimientoHasta()));			
		}
	}

	public static DocumentoPagoBean consultar(Connection conn, ConfigEmpresaBean config, Long idPago) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	DocumentoPagoBean documentoPago = null;
    	String sql = null;
    	
    	sql = "SELECT ID_PAGO,CODEMP, FECHA_VENCIMIENTO, CODPRO, DESPRO, IMPORTE, CODSERIE, DOCUMENTO, FECHA_FACTURA, CODTIPOEFEC," 
			  + "DESTIPOEFEC, ID_REMESA, CODBAN_PAGO, DESBAN_PAGO, FECHA_REMESA, OBSERVACIONES, FECHA_EMISION " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		      "WHERE ID_PAGO = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idPago);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		documentoPago = new DocumentoPagoBean();
        		documentoPago.setIdPago(rs.getLong("ID_PAGO"));
        		documentoPago.setCodEmpresa(rs.getString("CODEMP"));
        		documentoPago.setFechaVencimiento(rs.getDate("FECHA_VENCIMIENTO"));
        		documentoPago.setCodProveedor(rs.getString("CODPRO"));
        		documentoPago.setDesProveedor(rs.getString("DESPRO"));
        		documentoPago.setImporte(rs.getDouble("IMPORTE"));
        		documentoPago.setCodSerie(rs.getString("CODSERIE"));
        		documentoPago.setDocumento(rs.getString("DOCUMENTO"));
        		documentoPago.setFechaFactura(rs.getDate("FECHA_FACTURA"));
        		documentoPago.setCodTipoEfecto(rs.getString("CODTIPOEFEC"));
        		documentoPago.setDesTipoEfecto(rs.getString("DESTIPOEFEC"));
        		documentoPago.setIdRemesa((rs.getString("ID_REMESA") != null) ? rs.getLong("ID_REMESA") : null);
        		documentoPago.setCodBancoPago(rs.getString("CODBAN_PAGO"));
        		documentoPago.setDesBancoPago(rs.getString("DESBAN_PAGO"));
        		documentoPago.setFechaRemesa(rs.getDate("FECHA_REMESA"));
        		documentoPago.setObservaciones(rs.getString("OBSERVACIONES"));
        		documentoPago.setFechaEmision(rs.getDate("FECHA_EMISION"));
        	}
        	
    		return documentoPago;
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

	public static void insert(Connection conn, ConfigEmpresaBean config, DocumentoPagoBean documento) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(ID_PAGO, CODEMP, CODPRO, FECHA_VENCIMIENTO, CODTIPOEFEC, DOCUMENTO, IMPORTE, " +
		      "OBSERVACIONES, BORRADO, FECHA_EMISION, CODBAN_PAGO, FECHA_ALTA, CODSERIE)" +
		      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, documento.getIdPago());
			pstmt.setString(2,documento.getCodEmpresa());
			pstmt.setString(3,documento.getCodProveedor());
			pstmt.setDate(4, Fechas.toSqlDate(documento.getFechaVencimiento()));
			pstmt.setString(5, documento.getCodTipoEfecto());
			pstmt.setString(6, documento.getDocumento());
			pstmt.setDouble(7,documento.getImporte());
			pstmt.setString(8, documento.getObservaciones());
			pstmt.setString(9, documento.getBorrado());
			pstmt.setDate(10, Fechas.toSqlDate(documento.getFechaEmision()));
			pstmt.setString(11, documento.getCodBancoPago());
			pstmt.setDate(12, Fechas.toSqlDate(new Date()));
			pstmt.setString(13, documento.getCodSerie());
        	
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

	public static void update(Connection conn, ConfigEmpresaBean config, DocumentoPagoBean documento) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET CODPRO = ?, FECHA_VENCIMIENTO = ?, DOCUMENTO = ?, CODTIPOEFEC = ?, OBSERVACIONES = ?, " +
		      "CODSERIE = ?, FECHA_BAJA = ?, FECHA_EMISION = ?, CODBAN_PAGO = ?, FECHA_PAGO = ?, IMPORTE = ? " +
		      "WHERE ID_PAGO = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, documento.getCodProveedor());
			pstmt.setDate(2, Fechas.toSqlDate(documento.getFechaVencimiento()));
			pstmt.setString(3, documento.getDocumento());
			pstmt.setString(4, documento.getCodTipoEfecto());
			pstmt.setString(5, documento.getObservaciones());
			pstmt.setString(6, documento.getCodSerie());
			pstmt.setDate(7, Fechas.toSqlDate(documento.getFechaBaja()));
			pstmt.setDate(8, Fechas.toSqlDate(documento.getFechaEmision()));
			pstmt.setString(9, documento.getCodBancoPago());
			pstmt.setDate(10, Fechas.toSqlDate(documento.getFechaPago()));
			pstmt.setDouble(11, documento.getImporte());
        	
			pstmt.setLong(12, documento.getIdPago());
			
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
	
	public static void delete(Connection conn, ConfigEmpresaBean config, Long IdPago) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE ID_PAGO = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, IdPago);
        	
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

	public static List<DocumentoPagoBean> consultarDocumentosRemesa(Connection conn, ConfigEmpresaBean config, Long idRemesa)throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// Inicializamos la página de resultados
		List<DocumentoPagoBean> resultados = new ArrayList<DocumentoPagoBean>();

		String sql = "SELECT ID_PAGO, CODEMP, CODPRO, DESPRO, FECHA_ALTA, FECHA_VENCIMIENTO, FECHA_FACTURA, " + 
							"FECHA_BAJA, CODTIPOEFEC, DESTIPOEFEC, CODSERIE, DOCUMENTO, CODBAN_PAGO, " + 
							"DESBAN_PAGO, FECHA_PAGO, IMPORTE, OBSERVACIONES, ID_REMESA, CODBAN_REMESA, " + 
							"DESBAN_REMESA, FECHA_REMESA, BORRADO, FECHA_EMISION "  
			         + "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA)
			         + "WHERE ID_REMESA = ?";
		
		try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idRemesa);
    		
    		log.debug("consultarDocumentosRemesa() - " + pstmt);
            
    		rs = pstmt.executeQuery();

			while(rs.next()) {
            	DocumentoPagoBean documentoPago = new DocumentoPagoBean();
            	documentoPago.setIdPago(rs.getLong("ID_PAGO"));
            	documentoPago.setCodEmpresa(rs.getString("CODEMP"));
            	documentoPago.setCodProveedor(rs.getString("CODPRO"));
            	documentoPago.setDesProveedor(rs.getString("DESPRO"));
            	documentoPago.setFechaAlta(rs.getDate("FECHA_ALTA"));
            	documentoPago.setFechaVencimiento(rs.getDate("FECHA_VENCIMIENTO"));
            	documentoPago.setFechaFactura(rs.getDate("FECHA_FACTURA"));
            	documentoPago.setFechaBaja(rs.getDate("FECHA_BAJA"));
            	documentoPago.setCodTipoEfecto(rs.getString("CODTIPOEFEC"));
            	documentoPago.setDesTipoEfecto(rs.getString("DESTIPOEFEC"));
            	documentoPago.setCodSerie(rs.getString("CODSERIE"));
            	documentoPago.setDocumento(rs.getString("DOCUMENTO"));
            	documentoPago.setCodBancoPago(rs.getString("CODBAN_PAGO"));
            	documentoPago.setDesBancoPago(rs.getString("DESBAN_PAGO"));
            	documentoPago.setFechaPago(rs.getDate("FECHA_PAGO"));
            	documentoPago.setImporte(rs.getDouble("IMPORTE"));
            	documentoPago.setObservaciones(rs.getString("OBSERVACIONES"));
            	documentoPago.setIdRemesa((rs.getString("ID_REMESA") != null) ? rs.getLong("ID_REMESA") : null);
            	documentoPago.setCodBancoRemesa(rs.getString("CODBAN_REMESA"));
            	documentoPago.setDesBancoRemesa(rs.getString("DESBAN_REMESA"));
            	documentoPago.setFechaRemesa(rs.getDate("FECHA_REMESA"));
            	documentoPago.setBorrado(rs.getString("BORRADO"));
            	documentoPago.setFechaEmision(rs.getDate("FECHA_EMISION"));

        		resultados.add(documentoPago);
			}

			return resultados;

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

   public static void quitarDocumentoRemesa(Connection conn, ConfigEmpresaBean config, Long idPago) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		        "SET ID_REMESA = ?, FECHA_PAGO = ?, FECHA_BAJA = ?, " +
		            "CODBAN_PAGO = ? " +
		      "WHERE ID_PAGO = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, null);
			pstmt.setLong(2, null);
			pstmt.setLong(3, null);
			pstmt.setLong(4, null);
			pstmt.setLong(5, idPago);
			
			log.debug("quitarDocumentoRemesa() - " + pstmt);
       	
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

   public static TotalesDocumentosPagosBean consultarTotalesRemesa(Connection conn, ConfigEmpresaBean config, Long idRemesa) throws SQLException {
		PreparedStatement pstmt = null;
	   	ResultSet rs = null;
	   	TotalesDocumentosPagosBean totales = null;
	   	String sql = null;
	   	
		sql = "SELECT COUNT(*) REGISTROS, SUM(IMPORTE) IMPORTE, COUNT(DISTINCT CODPRO) PROVEEDORES " 
			  + "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) 
			  +"WHERE ID_REMESA = ?";
	   	
	   	try {
	   		pstmt = new PreparedStatement(conn, sql);
	   		pstmt.setLong(1, idRemesa);
	       	log.debug("consultarTotalesRemesa() - " + pstmt);
	       	
	           rs = pstmt.executeQuery();
	       	
	       	if (rs.next()){
	       		totales = new TotalesDocumentosPagosBean();
       		totales.setNumRegistros(rs.getInt("REGISTROS"));
               totales.setImporteTotal(rs.getDouble("IMPORTE"));
               totales.setNumProveedores(rs.getInt("PROVEEDORES"));
	       	}
	       	
	   		return totales;
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

   public static void asignarRemesa(Connection conn, ConfigEmpresaBean config, Long idPago, Long idRemesa) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET ID_REMESA = ? " +
		      "WHERE ID_PAGO = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idRemesa);
			pstmt.setLong(2, idPago);
			
	       	log.debug("asignarRemesa() - " + pstmt);
	       	
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
