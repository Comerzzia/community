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

package com.comerzzia.persistencia.compras.facturas;

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
import com.comerzzia.util.paginacion.PaginaResultados;

public class FacturasComprasDao extends MantenimientoDao {
	
	private static String TABLA = "D_FACTURAS_SOP_CAB_TBL";
	private static String VISTA = "D_FACTURAS_SOP_CAB";
	
	private static Logger log = Logger.getMLogger(FacturasComprasDao.class);
	
	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, ParametrosBuscarFacturasComprasBean param)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// Inicializamos la página de resultados
		List<FacturaCompraBean> resultados = new ArrayList<FacturaCompraBean>(param.getTamañoPagina());
		PaginaResultados paginaResultados = new PaginaResultados(param,	resultados);

		// Consultas
		String sql = obtenerConsulta(config, param);
		String sqlCount = obtenerConsultaCount(config, param);

		try {
			pstmt = new PreparedStatement(conn, sqlCount);
    		insertarParametros(pstmt, param);

			// Obtenemos número de resultados
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
						FacturaCompraBean factura = new FacturaCompraBean();
						factura.setIdFacturaSop(rs.getLong("ID_FACTURA_SOP"));
						factura.setPeriodo(rs.getShort("PERIODO"));
						factura.setCodSerie(rs.getString("CODSERIE"));
						factura.setNumFactura(rs.getLong("NUMFAC"));
						factura.setFechaRecFactura(rs.getDate("FECHA"));
						factura.setReferencia(rs.getString("REFERENCIA"));
						factura.setFechaFacturaProveedor(rs.getDate("FECHA_FACT_PROVEEDOR"));					
						factura.setCodProveedor(rs.getString("CODPRO"));
						factura.setDesProveedor(rs.getString("DESPRO"));						
						factura.setBase(rs.getDouble("BASE"));
						factura.setImpuestos(rs.getDouble("IMPUESTOS"));
						factura.setTotal(rs.getDouble("TOTAL"));

						resultados.add(factura);
						contador++;
					} while (rs.next() && contador < paginaResultados.getTamañoPagina());
				}
			}

			return paginaResultados;
		} finally {
			try {
				rs.close();
			} catch (Exception ignore) {
				;
			}
			try {
				pstmt.close();
			} catch (Exception ignore) {
				;
			}
		}
	}

	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarFacturasComprasBean param) {
		String sql = null;

		sql = "SELECT ID_FACTURA_SOP, " +
				 "PERIODO, " +
				 "CODSERIE, " +
				 "NUMFAC, " +
				 "REFERENCIA, " +
				 "FECHA, " +
				 "FECHA_FACT_PROVEEDOR, " +		 			 
				 "CODPRO, " +
				 "DESPRO, " +
				 "BASE, " +
				 "IMPUESTOS, " +
				 "TOTAL " +
			  "FROM " +  getNombreElemento(config.getEsquemaEmpresa(), VISTA);

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

	public static String obtenerConsultaCount(ConfigEmpresaBean config,
			ParametrosBuscarFacturasComprasBean param) {
		String sql = null;

		sql = "SELECT COUNT(*) " + "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), VISTA);

		// Clausula WHERE
		String where = getClausulaWhere(param);
		if (where.length() > 0) {
			sql += "WHERE " + where;
		}

		return sql;
	}

	private static String getClausulaWhere(ParametrosBuscarFacturasComprasBean param) {
		String where = "";

		// PERIODO
		if (param.getPeriodo() != null) {
			where = "PERIODO = '" + param.getPeriodo() + "' ";
		}

		// CODSERIE
		if (!param.getCodSerie().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODSERIE LIKE '" + param.getCodSerie() + "%' ";
		}

		// NUMFAC
		if (param.getNumFactura() != null) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "NUMFAC = '" + param.getNumFactura() + "' ";
		}

		// CODPRO
		if (!param.getCodProveedor().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODPRO = '" + param.getCodProveedor() + "' ";
		}
		
		// REFERENCIA
		if (!param.getReferencia().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "UPPER(REFERENCIA) LIKE UPPER('" + param.getReferencia() + "%') ";
		}
		
		// FECHA_DESDE
		if (param.isBuscarPorFechaDesde() && param.getFechaDesde() != null) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "FECHA >= ? ";
		}
		
		// FECHA_HASTA
		if (param.isBuscarPorFechaHasta() && param.getFechaHasta() != null) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "FECHA <= ? ";
		}

		return where;
	}
	
	private static void insertarParametros(PreparedStatement pstmt, ParametrosBuscarFacturasComprasBean param) throws SQLException {
		Integer indice = 1;
		// FECHA_DESDE
		if (param.isBuscarPorFechaDesde() && param.getFechaDesde() != null) {
			pstmt.setDate(indice, Fechas.toSqlDate(param.getFechaDesde()));
			indice++;
		}
		
		// FECHA_HASTA
		if (param.isBuscarPorFechaHasta() && param.getFechaHasta() != null) {
			pstmt.setDate(indice, Fechas.toSqlDate(param.getFechaHasta()));			
		}
	}
	
	public static FacturaCompraBean consultar(Connection conn, ConfigEmpresaBean config, Long idFactura)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FacturaCompraBean factura = null;
		String sql = null;
		
		sql = "SELECT ID_FACTURA_SOP, " +
		 			 "CODEMP, " +
		 			 "PERIODO, " +
		 			 "CODSERIE, " +
		 			 "DESSERIE, " +
		 			 "NUMFAC, " +
		 			 "REFERENCIA, " +
		 			 "FECHA, " +
		 			 "FECHA_FACT_PROVEEDOR, " +		 			 
		 			 "CODPRO, " +
		 			 "DESPRO, " +
					 "DOMICILIO, " +
					 "POBLACION, " +
					 "PROVINCIA, " +
					 "CP, " +
		 			 "CIF, " +
		 			 "ID_GRUPO_IMPUESTOS, " +
		 			 "ID_TRAT_IMPUESTOS, " +
		 			 "ID_VENCIMIENTO_ENLACE, " +
		 			 "CONCEPTO, " +
		 			 "BASE, " +
		 			 "IMPUESTOS, " +
		 			 "TOTAL, " +
		 			 "OBSERVACIONES " +
		 	  "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		 	  "WHERE ID_FACTURA_SOP = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idFactura);
			
			log.debug("consultar() - " + pstmt);
		    rs = pstmt.executeQuery();
		    
		    if(rs.next()) {
		    	factura = new FacturaCompraBean();
				factura.setIdFacturaSop(rs.getLong("ID_FACTURA_SOP"));
				factura.setCodEmpresa(rs.getString("CODEMP"));
				factura.setPeriodo(rs.getShort("PERIODO"));
				factura.setCodSerie(rs.getString("CODSERIE"));
				factura.setDesSerie(rs.getString("DESSERIE"));
				factura.setNumFactura(rs.getLong("NUMFAC"));
				factura.setReferencia(rs.getString("REFERENCIA"));
				factura.setFechaRecFactura(rs.getDate("FECHA"));
				factura.setFechaFacturaProveedor(rs.getDate("FECHA_FACT_PROVEEDOR"));				
				factura.setCodProveedor(rs.getString("CODPRO"));
				factura.setDesProveedor(rs.getString("DESPRO"));
				factura.setDomicilio(rs.getString("DOMICILIO"));
				factura.setPoblacion(rs.getString("POBLACION"));
				factura.setProvincia(rs.getString("PROVINCIA"));
				factura.setCp(rs.getString("CP"));
				factura.setCif(rs.getString("CIF"));
				factura.setIdGrupoImpuestos(rs.getLong("ID_GRUPO_IMPUESTOS"));
				factura.setIdTratImpuestos(rs.getLong("ID_TRAT_IMPUESTOS"));
				factura.setIdVencimientoEnlace((rs.getString("ID_VENCIMIENTO_ENLACE") != null) ? rs.getLong("ID_VENCIMIENTO_ENLACE") : null);
				factura.setConcepto(rs.getString("CONCEPTO"));
				factura.setBase(rs.getDouble("BASE"));
				factura.setImpuestos(rs.getDouble("IMPUESTOS"));
				factura.setTotal(rs.getDouble("TOTAL"));
				factura.setObservaciones(rs.getString("OBSERVACIONES"));
		    }
		    
			return factura;
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

	public static void insert(Connection conn, ConfigEmpresaBean config,
			FacturaCompraBean factura) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "(ID_FACTURA_SOP, CODEMP, PERIODO, CODSERIE, NUMFAC, REFERENCIA, FECHA, FECHA_FACT_PROVEEDOR, " +
				" CODPRO, DESPRO, DOMICILIO, POBLACION, PROVINCIA, CP, CIF, ID_GRUPO_IMPUESTOS, " +
				" ID_TRAT_IMPUESTOS, ID_VENCIMIENTO_ENLACE, CONCEPTO, BASE, IMPUESTOS, TOTAL, OBSERVACIONES) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, factura.getIdFacturaSop());
			pstmt.setString(2, factura.getCodEmpresa());
			pstmt.setLong(3, factura.getPeriodo());
			pstmt.setString(4, factura.getCodSerie());
			pstmt.setLong(5, factura.getNumFactura());
			pstmt.setString(6, factura.getReferencia());
			pstmt.setDate(7, Fechas.toSqlDate(factura.getFechaRecFactura()));
			pstmt.setDate(8, Fechas.toSqlDate(factura.getFechaFacturaProveedor()));
			pstmt.setString(9, factura.getCodProveedor());
			pstmt.setString(10, factura.getDesProveedor());
			pstmt.setString(11, factura.getDomicilio());
			pstmt.setString(12, factura.getPoblacion());
			pstmt.setString(13, factura.getProvincia());
			pstmt.setString(14, factura.getCp());
			pstmt.setString(15, factura.getCif());
			pstmt.setLong(16, factura.getIdGrupoImpuestos());
			pstmt.setLong(17, factura.getIdTratImpuestos());
			pstmt.setLong(18, factura.getIdVencimientoEnlace());
			pstmt.setString(19, factura.getConcepto());
			pstmt.setDouble(20, factura.getBase());
			pstmt.setDouble(21, factura.getImpuestos());
			pstmt.setDouble(22, factura.getTotal());
			pstmt.setString(23, factura.getObservaciones());

			log.debug("insert() - " + pstmt);

			pstmt.execute();
		} catch (SQLException e) {
			throw getDaoException(e);
		} finally {
			try {
				pstmt.close();
			} catch (Exception ignore) {
				;
			}
		}
	}

	public static void modificarIdVencimientoEnlace(Connection conn, ConfigEmpresaBean config, FacturaCompraBean factura) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "UPDATE "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "SET ID_VENCIMIENTO_ENLACE = ? " + 
				"WHERE ID_FACTURA_SOP = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, factura.getIdVencimientoEnlace());
			pstmt.setLong(2, factura.getIdFacturaSop());

			log.debug("update() - " + pstmt);

			pstmt.execute();
		
		} 
		catch (SQLException e) {
			throw getDaoException(e);
		} 
		finally {
			try {
				pstmt.close();
			} catch (Exception ignore) {
				;
			}
		}
	}

	public static FacturaCompraBean consultar(Connection conn, ConfigEmpresaBean config, String codProveedor, String referencia)throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FacturaCompraBean factura = null;
		String sql = null;
		
		sql = "SELECT ID_FACTURA_SOP, " +
		 			 "CODEMP, " +
		 			 "PERIODO, " +
		 			 "CODSERIE, " +
		 			 "DESSERIE, " +
		 			 "NUMFAC, " +
		 			 "REFERENCIA, " +
		 			 "FECHA, " +
		 			 "FECHA_FACT_PROVEEDOR, " +		 			 
		 			 "CODPRO, " +
		 			 "DESPRO, " +
					 "DOMICILIO, " +
					 "POBLACION, " +
					 "PROVINCIA, " +
					 "CP, " +
		 			 "CIF, " +
		 			 "ID_GRUPO_IMPUESTOS, " +
		 			 "ID_TRAT_IMPUESTOS, " +
		 			 "ID_VENCIMIENTO_ENLACE, " +
		 			 "CONCEPTO, " +
		 			 "BASE, " +
		 			 "IMPUESTOS, " +
		 			 "TOTAL, " +
		 			 "OBSERVACIONES " +
		 	  "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		 	  "WHERE CODPRO = ? " +
		 	    "AND REFERENCIA = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codProveedor);
			pstmt.setString(2, referencia);
			
			log.debug("consultar() - " + pstmt);
		    rs = pstmt.executeQuery();
		    
		    if(rs.next()) {
		    	factura = new FacturaCompraBean();
				factura.setIdFacturaSop(rs.getLong("ID_FACTURA_SOP"));
				factura.setCodEmpresa(rs.getString("CODEMP"));
				factura.setPeriodo(rs.getShort("PERIODO"));
				factura.setCodSerie(rs.getString("CODSERIE"));
				factura.setDesSerie(rs.getString("DESSERIE"));
				factura.setNumFactura(rs.getLong("NUMFAC"));
				factura.setReferencia(rs.getString("REFERENCIA"));
				factura.setFechaRecFactura(rs.getDate("FECHA"));
				factura.setFechaFacturaProveedor(rs.getDate("FECHA_FACT_PROVEEDOR"));				
				factura.setCodProveedor(rs.getString("CODPRO"));
				factura.setDesProveedor(rs.getString("DESPRO"));
				factura.setDomicilio(rs.getString("DOMICILIO"));
				factura.setPoblacion(rs.getString("POBLACION"));
				factura.setProvincia(rs.getString("PROVINCIA"));
				factura.setCp(rs.getString("CP"));
				factura.setCif(rs.getString("CIF"));
				factura.setIdGrupoImpuestos(rs.getLong("ID_GRUPO_IMPUESTOS"));
				factura.setIdTratImpuestos(rs.getLong("ID_TRAT_IMPUESTOS"));
				factura.setIdVencimientoEnlace((rs.getString("ID_VENCIMIENTO_ENLACE") != null) ? rs.getLong("ID_VENCIMIENTO_ENLACE") : null);
				factura.setConcepto(rs.getString("CONCEPTO"));
				factura.setBase(rs.getDouble("BASE"));
				factura.setImpuestos(rs.getDouble("IMPUESTOS"));
				factura.setTotal(rs.getDouble("TOTAL"));
				factura.setObservaciones(rs.getString("OBSERVACIONES"));
		    }
		    
			return factura;
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

}
