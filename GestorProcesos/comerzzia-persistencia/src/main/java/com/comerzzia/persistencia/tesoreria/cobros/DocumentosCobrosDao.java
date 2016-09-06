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

package com.comerzzia.persistencia.tesoreria.cobros;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.tesoreria.cobros.totales.TotalesDocumentosCobrosBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class DocumentosCobrosDao extends MantenimientoDao {

	private static String TABLA = "D_COBROS_DOC_TBL";
	private static String VISTA = "D_COBROS";
	
	private static Logger log = Logger.getMLogger(DocumentosCobrosDao.class);
	
	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, ParametrosBuscarDocumentosCobrosBean param) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<DocumentoCobroBean> resultados = new ArrayList<DocumentoCobroBean>(param.getTamañoPagina());
    	PaginaResultados paginaResultados = new PaginaResultados(param, resultados);
    	
    	// Consultas
    	String sql = obtenerConsulta(config, param);
    	String sqlCount = obtenerConsultaCount(config, param);
    	
        try {
        	pstmt = new PreparedStatement(conn, sqlCount);
    		insertarParametros(pstmt, param);
    		
    		log.debug("consultar() - " + pstmt);
        	rs = pstmt.executeQuery();
			if (rs.next()) {
				paginaResultados.setTotalResultados(rs.getInt(1));
			}
			
			try {
				rs.close();
			} catch (Exception ignore) {}
			
			try {
				pstmt.close();
			} catch (Exception ignore) {}
        	
        	// Si tenemos resultados, obtenemos la pagina requerida
            if (paginaResultados.getTotalResultados() > 0) {
            	pstmt = new PreparedStatement(conn, sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        		insertarParametros(pstmt, param);
            	log.debug("consultar() - " + pstmt);
                rs = pstmt.executeQuery();
                
                int contador = 0;
                if (rs.absolute(paginaResultados.getInicio())) {
                    do {
                    	DocumentoCobroBean documentoCobro = new DocumentoCobroBean();
                    	documentoCobro.setIdCobro(rs.getLong("ID_COBRO"));
                    	documentoCobro.setFechaVencimiento(rs.getDate("FECHA_VENCIMIENTO"));
                    	documentoCobro.setCodCliente(rs.getString("CODCLI"));
                    	documentoCobro.setDesCliente(rs.getString("DESCLI"));
                    	documentoCobro.setImporte(rs.getDouble("IMPORTE"));
                    	documentoCobro.setCodSerie(rs.getString("CODSERIE"));
                    	documentoCobro.setDocumento(rs.getString("DOCUMENTO"));
                    	documentoCobro.setFechaFactura(rs.getDate("FECHA_FACTURA"));
                    	documentoCobro.setCodTipoEfecto(rs.getString("CODTIPOEFEC"));
                    	documentoCobro.setDesTipoEfecto(rs.getString("DESTIPOEFEC"));
                    	documentoCobro.setFechaEntradaDocumento(rs.getDate("FECHA_ENTRADA_DOCUMENTO"));
                    	documentoCobro.setIdRemesa((rs.getString("ID_REMESA") != null) ? rs.getLong("ID_REMESA") : null);
                		documentoCobro.setObservaciones(rs.getString("OBSERVACIONES"));
                		
                		resultados.add(documentoCobro);
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
    
	public static PaginaResultados consultarDocumentosSinRemesar(Connection conn, ConfigEmpresaBean config, ParametrosBuscarDocumentosCobrosBean param) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<DocumentoCobroBean> resultados = new ArrayList<DocumentoCobroBean>(param.getTamañoPagina());
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
                    	DocumentoCobroBean documentoCobro = new DocumentoCobroBean();
                    	documentoCobro.setIdCobro(rs.getLong("ID_COBRO"));
                    	documentoCobro.setFechaVencimiento(rs.getDate("FECHA_VENCIMIENTO"));
                    	documentoCobro.setCodCliente(rs.getString("CODCLI"));
                    	documentoCobro.setDesCliente(rs.getString("DESCLI"));
                    	documentoCobro.setImporte(rs.getDouble("IMPORTE"));
                    	documentoCobro.setCodSerie(rs.getString("CODSERIE"));
                    	documentoCobro.setDocumento(rs.getString("DOCUMENTO"));
                    	documentoCobro.setFechaFactura(rs.getDate("FECHA_FACTURA"));
                    	documentoCobro.setCodTipoEfecto(rs.getString("CODTIPOEFEC"));
                    	documentoCobro.setDesTipoEfecto(rs.getString("DESTIPOEFEC"));
                    	documentoCobro.setFechaEntradaDocumento(rs.getDate("FECHA_ENTRADA_DOCUMENTO"));
                    	documentoCobro.setIdRemesa((rs.getString("ID_REMESA") != null) ? rs.getLong("ID_REMESA") : null);
                		documentoCobro.setObservaciones(rs.getString("OBSERVACIONES"));
                		
                		resultados.add(documentoCobro);
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
	
	public static TotalesDocumentosCobrosBean consultarTotales (Connection conn, ConfigEmpresaBean config, ParametrosBuscarDocumentosCobrosBean param) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	TotalesDocumentosCobrosBean totales = new TotalesDocumentosCobrosBean();
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
                totales.setNumClientes(rs.getInt("CLIENTES"));
                totales.setRiesgoConcedido(rs.getDouble("RIESGO_CONCEDIDO"));
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

	public static TotalesDocumentosCobrosBean consultarTotalesDocumentosSinRemesar (Connection conn, ConfigEmpresaBean config, ParametrosBuscarDocumentosCobrosBean param) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	TotalesDocumentosCobrosBean totales = new TotalesDocumentosCobrosBean();
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
                totales.setNumClientes(rs.getInt("CLIENTES"));
                totales.setRiesgoConcedido(rs.getDouble("RIESGO_CONCEDIDO"));
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

	private static String obtenerConsultaTotales(ConfigEmpresaBean config, ParametrosBuscarDocumentosCobrosBean param) {
		String sql = null;
		
		sql = "SELECT COUNT(*) REGISTROS, SUM(IMPORTE) IMPORTE, COUNT(DISTINCT CODCLI) CLIENTES, SUM(RIESGO_CONCEDIDO) RIESGO_CONCEDIDO " 
			  + "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }
        
		return sql;
	}

	private static String obtenerConsultaTotalesDocumentosSinRemesar(ConfigEmpresaBean config, ParametrosBuscarDocumentosCobrosBean param) {
		String sql = null;
		
		sql = "SELECT COUNT(*) REGISTROS, SUM(IMPORTE) IMPORTE, COUNT(DISTINCT CODCLI) CLIENTES, SUM(RIESGO_CONCEDIDO) RIESGO_CONCEDIDO " 
			  + "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }

        sql += "AND REMESABLE = 'S' " +
        	   "AND FECHA_ENTRADA_DOCUMENTO IS NOT NULL ";

		return sql;
	}

	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarDocumentosCobrosBean param) {
		String sql = null;
		
		sql = "SELECT ID_COBRO, FECHA_VENCIMIENTO, CODCLI, DESCLI, IMPORTE, CODSERIE, DOCUMENTO, FECHA_FACTURA, CODTIPOEFEC," 
			  + "DESTIPOEFEC, FECHA_ENTRADA_DOCUMENTO, ID_REMESA, OBSERVACIONES " 
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
	
	public static String obtenerConsultaDocumentosSinRemesar(ConfigEmpresaBean config, ParametrosBuscarDocumentosCobrosBean param) {
		String sql = null;
		
		sql = "SELECT ID_COBRO, FECHA_VENCIMIENTO, CODCLI, DESCLI, IMPORTE, CODSERIE, DOCUMENTO, FECHA_FACTURA, CODTIPOEFEC," 
			  + "DESTIPOEFEC, FECHA_ENTRADA_DOCUMENTO, ID_REMESA, OBSERVACIONES " 
			  + "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }

        sql += "AND REMESABLE = 'S' " +
        	   "AND FECHA_ENTRADA_DOCUMENTO IS NOT NULL ";
        
        // Clausula ORDER BY
        if (!param.getOrden().isEmpty()) {
        	sql += "ORDER BY " + param.getOrden();
        }
        
		return sql;
	}

	public static String obtenerConsultaCount(ConfigEmpresaBean config, ParametrosBuscarDocumentosCobrosBean param) {
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
	
	public static String obtenerConsultaDocumentosSinRemesarCount(ConfigEmpresaBean config, ParametrosBuscarDocumentosCobrosBean param) {
		String sql = null;
		
		sql = "SELECT COUNT(*) " +
		      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }

        sql += "AND REMESABLE = 'S' " +
        	   "AND FECHA_ENTRADA_DOCUMENTO IS NOT NULL ";
        
		return sql;
	}

	private static String getClausulaWhere(ParametrosBuscarDocumentosCobrosBean param) {
		String where = "FECHA_BAJA IS NULL ";
		
		// CODCLI
		if (!param.getCodCliente().isEmpty()) {
			where += "AND CODCLI LIKE '" + param.getCodCliente() + "%' ";
		}
		
		// DESCLI
		if (!param.getDesCliente().isEmpty()) {
			where += "AND UPPER(DESCLI) LIKE UPPER('" + param.getDesCliente() + "%') ";
		}
		
		// CODTIPOEFEC DESDE
		if (!param.getCodTipoEfectoDesde().isEmpty()) {
			where += "AND CODTIPOEFEC >= '" + param.getCodTipoEfectoDesde() + "' ";
		}

		// CODTIPOEFEC HASTA
		if (!param.getCodTipoEfectoHasta().isEmpty()) {
			where += "AND CODTIPOEFEC <= '" + param.getCodTipoEfectoHasta() + "' ";
		}

		// FECHA_DESDE
		if (param.getFechaVencimientoDesde() != null) {
			where += "AND FECHA_VENCIMIENTO >= ? ";
		}
		
		// FECHA_HASTA
		if (param.getFechaVencimientoHasta() != null) {
			where += "AND FECHA_VENCIMIENTO <= ? ";
		}

		if (!param.isVerRemesados()) {
			where += "AND ID_REMESA IS NULL ";
		}
		else{
			where += "AND ID_REMESA != 0 ";
		}
		
		return where;
	} 

	private static void insertarParametros(PreparedStatement pstmt, ParametrosBuscarDocumentosCobrosBean param) throws SQLException {
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

    public static DocumentoCobroBean consultar(Connection conn, ConfigEmpresaBean config, Long idCobro) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	DocumentoCobroBean documentoCobro = null;
    	String sql = null;
    	
    	sql = "SELECT ID_COBRO, FECHA_VENCIMIENTO, CODEMP, CODCLI, DESCLI, "
    		  +	"IMPORTE, CODSERIE, DOCUMENTO, FECHA_FACTURA, CODTIPOEFEC, " 
			  + "DESTIPOEFEC, FECHA_ENTRADA_DOCUMENTO, REMESABLE, ID_REMESA, "
			  + "CODBAN_COBRO, DESBAN_COBRO, FECHA_REMESA, OBSERVACIONES, "
			  +	"FECHA_COBRO, FECHA_BAJA " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		      "WHERE ID_COBRO = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idCobro);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		documentoCobro = new DocumentoCobroBean();
        		documentoCobro.setIdCobro(rs.getLong("ID_COBRO"));
        		documentoCobro.setFechaVencimiento(rs.getDate("FECHA_VENCIMIENTO"));
        		documentoCobro.setCodEmpresa(rs.getString("CODEMP"));
        		documentoCobro.setCodCliente(rs.getString("CODCLI"));
        		documentoCobro.setDesCliente(rs.getString("DESCLI"));
        		documentoCobro.setImporte(rs.getDouble("IMPORTE"));
        		documentoCobro.setCodSerie(rs.getString("CODSERIE"));
        		documentoCobro.setDocumento(rs.getString("DOCUMENTO"));
        		documentoCobro.setFechaFactura(rs.getDate("FECHA_FACTURA"));
        		documentoCobro.setCodTipoEfecto(rs.getString("CODTIPOEFEC"));
        		documentoCobro.setDesTipoEfecto(rs.getString("DESTIPOEFEC"));
        		documentoCobro.setFechaEntradaDocumento(rs.getDate("FECHA_ENTRADA_DOCUMENTO"));
        		documentoCobro.setRemesable(rs.getString("REMESABLE"));
        		documentoCobro.setIdRemesa((rs.getString("ID_REMESA") != null) ? rs.getLong("ID_REMESA") : null);
        		documentoCobro.setCodBancoCobro(rs.getString("CODBAN_COBRO"));
        		documentoCobro.setDesBancoCobro(rs.getString("DESBAN_COBRO"));
        		documentoCobro.setFechaRemesa(rs.getDate("FECHA_REMESA"));
        		documentoCobro.setObservaciones(rs.getString("OBSERVACIONES"));
        		documentoCobro.setFechaCobro(rs.getDate("FECHA_COBRO"));
        		documentoCobro.setFechaBaja(rs.getDate("FECHA_BAJA"));
        	}
        	
    		return documentoCobro;
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
    
    public static void insert(Connection conn, ConfigEmpresaBean config, DocumentoCobroBean documento) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(ID_COBRO, CODEMP, CODCLI, FECHA_ALTA, FECHA_VENCIMIENTO, CODTIPOEFEC, CODSERIE, DOCUMENTO, IMPORTE, " +
		      "OBSERVACIONES, BORRADO, REMESABLE, FECHA_ENTRADA_DOCUMENTO, CODBAN_COBRO, CODBAN_DEVOLUCION)" +
		      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, documento.getIdCobro());
			pstmt.setString(2,documento.getCodEmpresa());
			pstmt.setString(3,documento.getCodCliente());
			pstmt.setDate(4, Fechas.toSqlDate(new Date()));
			pstmt.setDate(5, Fechas.toSqlDate(documento.getFechaVencimiento()));
			pstmt.setString(6, documento.getCodTipoEfecto());
			pstmt.setString(7, documento.getCodSerie());
			pstmt.setString(8, documento.getDocumento());
			pstmt.setDouble(9, documento.getImporte());
			pstmt.setString(10, documento.getObservaciones());
			pstmt.setString(11, documento.getBorrado());
			pstmt.setString(12, documento.getRemesable());
			pstmt.setDate(13, Fechas.toSqlDate(documento.getFechaEntradaDocumento()));
			pstmt.setString(14, documento.getCodBancoCobro());
			pstmt.setString(15, documento.getCodBancoDevolucion());
        	
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
    
    public static void update(Connection conn, ConfigEmpresaBean config, DocumentoCobroBean documentoCobro) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET CODCLI = ?, FECHA_VENCIMIENTO = ?, CODSERIE = ?, DOCUMENTO = ?, " +
		      "CODTIPOEFEC = ?, OBSERVACIONES = ?, FECHA_BAJA = ?, " +
		      "FECHA_ENTRADA_DOCUMENTO = ?, CODBAN_COBRO = ?, " +
		      "FECHA_COBRO = ?, IMPORTE = ?,  REMESABLE = ?, ID_COBRO_DEVOLUCION = ? " + 
		      "WHERE ID_COBRO = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, documentoCobro.getCodCliente());
			pstmt.setDate(2, Fechas.toSqlDate(documentoCobro.getFechaVencimiento()));
			pstmt.setString(3, documentoCobro.getCodSerie());
			pstmt.setString(4, documentoCobro.getDocumento());
			pstmt.setString(5, documentoCobro.getCodTipoEfecto());
			pstmt.setString(6, documentoCobro.getObservaciones());
			pstmt.setDate(7, Fechas.toSqlDate(documentoCobro.getFechaBaja()));
			pstmt.setDate(8, Fechas.toSqlDate(documentoCobro.getFechaEntradaDocumento()));
			pstmt.setString(9, documentoCobro.getCodBancoCobro());
			pstmt.setDate(10, Fechas.toSqlDate(documentoCobro.getFechaCobro()));
			pstmt.setDouble(11, documentoCobro.getImporte());
			pstmt.setString(12, documentoCobro.getRemesable());
			pstmt.setLong(13, documentoCobro.getIdCobroDevolucion());
        	
			pstmt.setLong(14, documentoCobro.getIdCobro());
			
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
    
    public static void delete(Connection conn, ConfigEmpresaBean config, Long idCobro) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE ID_COBRO = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idCobro);
        	
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

	public static List<DocumentoCobroBean> consultarDocumentosRemesa(Connection conn, ConfigEmpresaBean config, Long idRemesa)throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// Inicializamos la página de resultados
		List<DocumentoCobroBean> resultados = new ArrayList<DocumentoCobroBean>();

		String sql = "SELECT ID_COBRO, FECHA_VENCIMIENTO, CODCLI, DESCLI, IMPORTE, CODSERIE, DOCUMENTO, FECHA_FACTURA, CODTIPOEFEC," 
			              + "DESTIPOEFEC, FECHA_ENTRADA_DOCUMENTO, ID_REMESA, OBSERVACIONES, ID_COBRO_DEVOLUCION, FECHA_BAJA,"
			              +	"REMESABLE " 
			         + "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA)
			         + "WHERE ID_REMESA = ?";
		
		try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idRemesa);
    		
    		log.debug("consultarDocumentosRemesa() - " + pstmt);
            
    		rs = pstmt.executeQuery();

			while(rs.next()) {
            	DocumentoCobroBean documentoCobro = new DocumentoCobroBean();
            	documentoCobro.setIdCobro(rs.getLong("ID_COBRO"));
            	documentoCobro.setFechaVencimiento(rs.getDate("FECHA_VENCIMIENTO"));
            	documentoCobro.setCodCliente(rs.getString("CODCLI"));
            	documentoCobro.setDesCliente(rs.getString("DESCLI"));
            	documentoCobro.setImporte(rs.getDouble("IMPORTE"));
            	documentoCobro.setCodSerie(rs.getString("CODSERIE"));
            	documentoCobro.setDocumento(rs.getString("DOCUMENTO"));
            	documentoCobro.setFechaFactura(rs.getDate("FECHA_FACTURA"));
            	documentoCobro.setCodTipoEfecto(rs.getString("CODTIPOEFEC"));
            	documentoCobro.setDesTipoEfecto(rs.getString("DESTIPOEFEC"));
            	documentoCobro.setFechaEntradaDocumento(rs.getDate("FECHA_ENTRADA_DOCUMENTO"));
            	documentoCobro.setIdRemesa((rs.getString("ID_REMESA") != null) ? rs.getLong("ID_REMESA") : null);
        		documentoCobro.setObservaciones(rs.getString("OBSERVACIONES"));
            	documentoCobro.setIdCobroDevolucion((rs.getString("ID_COBRO_DEVOLUCION") != null) ? rs.getLong("ID_COBRO_DEVOLUCION") : null);
            	documentoCobro.setFechaBaja(rs.getDate("FECHA_BAJA"));
            	documentoCobro.setRemesable(rs.getString("REMESABLE"));
        		
        		resultados.add(documentoCobro);
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

   public static void asignarRemesa(Connection conn, ConfigEmpresaBean config, Long idCobro, Long idRemesa) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET ID_REMESA = ? " +
		      "WHERE ID_COBRO = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idRemesa);
			pstmt.setLong(2, idCobro);
			
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

   public static void quitarDocumentoRemesa(Connection conn, ConfigEmpresaBean config, Long idCobro) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET ID_REMESA = ?, FECHA_COBRO = ?, FECHA_BAJA = ?, " +
		          "CODBAN_COBRO = ?, CODBAN_DEVOLUCION = ? " +
		      "WHERE ID_COBRO = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, null);
			pstmt.setLong(2, null);
			pstmt.setLong(3, null);
			pstmt.setLong(4, null);
			pstmt.setLong(5, null);
			pstmt.setLong(6, idCobro);
			
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
   
   public static TotalesDocumentosCobrosBean consultarTotalesRemesa(Connection conn, ConfigEmpresaBean config, Long idRemesa) throws SQLException {
		PreparedStatement pstmt = null;
	   	ResultSet rs = null;
	   	TotalesDocumentosCobrosBean totales = null;
	   	String sql = null;
	   	
		sql = "SELECT COUNT(*) REGISTROS, SUM(IMPORTE) IMPORTE, COUNT(DISTINCT CODCLI) CLIENTES, SUM(RIESGO_CONCEDIDO) RIESGO_CONCEDIDO " 
			  + "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) 
			  +"WHERE ID_REMESA = ?";
	   	
	   	try {
	   		pstmt = new PreparedStatement(conn, sql);
	   		pstmt.setLong(1, idRemesa);
	       	log.debug("consultarTotalesRemesa() - " + pstmt);
	       	
	           rs = pstmt.executeQuery();
	       	
	       	if (rs.next()){
	       		totales = new TotalesDocumentosCobrosBean();
        		totales.setNumRegistros(rs.getInt("REGISTROS"));
                totales.setImporteTotal(rs.getDouble("IMPORTE"));
                totales.setNumClientes(rs.getInt("CLIENTES"));
                totales.setRiesgoConcedido(rs.getDouble("RIESGO_CONCEDIDO"));
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

}
