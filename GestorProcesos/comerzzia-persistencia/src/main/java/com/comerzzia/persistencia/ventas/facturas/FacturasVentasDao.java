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

package com.comerzzia.persistencia.ventas.facturas;

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

public class FacturasVentasDao extends MantenimientoDao {

	private static String TABLA = "D_FACTURAS_REP_CAB_TBL";
	private static String VISTA = "D_FACTURAS_REP_CAB";

	private static Logger log = Logger.getMLogger(FacturasVentasDao.class);

	public static PaginaResultados consultar(Connection conn,
			ConfigEmpresaBean config, ParametrosBuscarFacturasVentasBean param)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// Inicializamos la página de resultados
		List<FacturaVentaBean> resultados = new ArrayList<FacturaVentaBean>(param
				.getTamañoPagina());
		PaginaResultados paginaResultados = new PaginaResultados(param,
				resultados);

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
    		}
    		catch(Exception ignore) {;}
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}

			// Si tenemos resultados, obtenemos la pagina requerida
			if (paginaResultados.getTotalResultados() > 0) {
				pstmt = new PreparedStatement(conn, sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        		insertarParametros(pstmt, param);
            	log.debug("consultar() - " + pstmt);
                rs = pstmt.executeQuery();

				int contador = 0;
				if (rs.absolute(paginaResultados.getInicio())) {
					do {
						FacturaVentaBean factura = new FacturaVentaBean();
						factura.setIdFacturaRep(rs.getLong("ID_FACTURA_REP"));
						factura.setCodEmpresa(rs.getString("CODEMP"));
						factura.setPeriodo(rs.getShort("PERIODO"));
						factura.setCodSerie(rs.getString("CODSERIE"));
						factura.setNumFactura(rs.getLong("NUMFAC"));
						factura.setReferencia(rs.getString("REFERENCIA"));
						factura.setFecha(rs.getDate("FECHA"));						
						factura.setCodCliente(rs.getString("CODCLI"));
						factura.setDesCliente(rs.getString("DESCLI"));						
						factura.setBase(rs.getDouble("BASE"));
						factura.setImpuestos(rs.getDouble("IMPUESTOS"));
						factura.setTotal(rs.getDouble("TOTAL"));
						
						resultados.add(factura);
						contador++;
					} while (rs.next()
							&& contador < paginaResultados.getTamañoPagina());
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

	public static String obtenerConsulta(ConfigEmpresaBean config,
			ParametrosBuscarFacturasVentasBean param) {
		String sql = null;

		sql = "SELECT ID_FACTURA_REP, CODEMP, PERIODO, CODSERIE, NUMFAC, " +
				"REFERENCIA, FECHA, CODCLI, DESCLI, DOMICILIO, POBLACION, " +
				"PROVINCIA, CP, CIF, ID_GRUPO_IMPUESTOS, ID_TRAT_IMPUESTOS, ID_VENCIMIENTO_ENLACE, " +
				"CONCEPTO, BASE, IMPUESTOS, TOTAL, OBSERVACIONES "
				+ "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), VISTA);

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
			ParametrosBuscarFacturasVentasBean param) {
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

	private static String getClausulaWhere(ParametrosBuscarFacturasVentasBean param) {
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
		if (param.getNumFac() != null) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "NUMFAC = '" + param.getNumFac() + "' ";
		}

		// CODCLI
		if (!param.getCodCli().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODCLI = '" + param.getCodCli() + "' ";
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
	
	private static void insertarParametros(PreparedStatement pstmt, ParametrosBuscarFacturasVentasBean param) throws SQLException {
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

	public static FacturaVentaBean consultar(Connection conn,
			ConfigEmpresaBean config, Long idFacturaRep) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FacturaVentaBean factura = null;
		String sql = null;

		sql = "SELECT ID_FACTURA_REP, CODEMP, PERIODO, CODSERIE, DESSERIE, NUMFAC, " +
				"REFERENCIA, FECHA, CODCLI, DESCLI, DOMICILIO, POBLACION, " +
				"PROVINCIA, CP, CIF, ID_GRUPO_IMPUESTOS, ID_TRAT_IMPUESTOS, ID_VENCIMIENTO_ENLACE, " +
				"CONCEPTO, BASE, IMPUESTOS, TOTAL, OBSERVACIONES "
				+ "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), VISTA)
				+ "WHERE ID_FACTURA_REP = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idFacturaRep);
			log.debug("consultar() - " + pstmt);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				factura = new FacturaVentaBean();
				factura.setIdFacturaRep(rs.getLong("ID_FACTURA_REP"));
				factura.setCodEmpresa(rs.getString("CODEMP"));
				factura.setPeriodo(rs.getShort("PERIODO"));
				factura.setCodSerie(rs.getString("CODSERIE"));
				factura.setDesSerie(rs.getString("DESSERIE"));
				factura.setNumFactura(rs.getLong("NUMFAC"));
				factura.setReferencia(rs.getString("REFERENCIA"));
				factura.setFecha(rs.getDate("FECHA"));
				
				factura.setCodCliente(rs.getString("CODCLI"));
				factura.setDesCliente(rs.getString("DESCLI"));						
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

	public static void insert(Connection conn, ConfigEmpresaBean config,
			FacturaVentaBean factura) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "(CODEMP, PERIODO, CODSERIE, NUMFAC, REFERENCIA, FECHA, CODCLI, DESCLI, DOMICILIO, POBLACION, " +
				"PROVINCIA, CP, CIF, ID_GRUPO_IMPUESTOS, ID_TRAT_IMPUESTOS, ID_VENCIMIENTO_ENLACE, " +
				"CONCEPTO, BASE, IMPUESTOS, TOTAL, OBSERVACIONES, ID_FACTURA_REP) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, factura.getCodEmpresa());
			pstmt.setLong(2, factura.getPeriodo());
			pstmt.setString(3, factura.getCodSerie());
			pstmt.setLong(4, factura.getNumFactura());
			pstmt.setString(5, factura.getReferencia());
			pstmt.setDate(6, Fechas.toSqlDate(factura.getFecha()));
			pstmt.setString(7, factura.getCodCliente());
			pstmt.setString(8, factura.getDesCliente());
			pstmt.setString(9, factura.getDomicilio());
			pstmt.setString(10, factura.getPoblacion());
			pstmt.setString(11, factura.getProvincia());
			pstmt.setString(12, factura.getCp());
			pstmt.setString(13, factura.getCif());
			pstmt.setLong(14, factura.getIdGrupoImpuestos());
			pstmt.setLong(15, factura.getIdTratImpuestos());
			pstmt.setLong(16, factura.getIdVencimientoEnlace());
			pstmt.setString(17, factura.getConcepto());
			pstmt.setDouble(18, factura.getBase());
			pstmt.setDouble(19, factura.getImpuestos());
			pstmt.setDouble(20, factura.getTotal());
			pstmt.setString(21, factura.getObservaciones());
			pstmt.setLong(22, factura.getIdFacturaRep());

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

	public static void update(Connection conn, ConfigEmpresaBean config,
			FacturaVentaBean factura) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "UPDATE "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "SET CODEMP = ?, PERIODO = ?, CODSERIE = ?, NUMFAC = ?, REFERENCIA = ?, FECHA = ?, CODCLI = ?, DESCLI = ?, DOMICILIO = ?, POBLACION = ?, " +
				"PROVINCIA = ?, CP = ?, CIF = ?, CODMEDPAG = ?, CODMEDPAG_VEN = ?, ID_GRUPO_IMPUESTOS = ?, " +
				"ID_TRAT_IMPUESTOS = ?, ID_VENCIMIENTO_ENLACE = ?, CONCEPTO = ?, BASE = ?, IMPUESTOS = ?, TOTAL = ?, OBSERVACIONES = ? " + 
				"WHERE ID_FACTURA_REP = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, factura.getCodEmpresa());
			pstmt.setLong(2, factura.getPeriodo());
			pstmt.setString(3, factura.getCodSerie());
			pstmt.setLong(4, factura.getNumFactura());
			pstmt.setString(5, factura.getReferencia());
			pstmt.setDate(6, Fechas.toSqlDate(factura.getFecha()));
			pstmt.setString(7, factura.getCodCliente());
			pstmt.setString(8, factura.getDesCliente());
			pstmt.setString(9, factura.getDomicilio());
			pstmt.setString(10, factura.getPoblacion());
			pstmt.setString(11, factura.getProvincia());
			pstmt.setString(12, factura.getCp());
			pstmt.setString(13, factura.getCif());
			pstmt.setLong(16, factura.getIdGrupoImpuestos());
			pstmt.setLong(17, factura.getIdTratImpuestos());
			pstmt.setLong(18, factura.getIdVencimientoEnlace());
			pstmt.setString(19, factura.getConcepto());
			pstmt.setDouble(20, factura.getBase());
			pstmt.setDouble(21, factura.getImpuestos());
			pstmt.setDouble(22, factura.getTotal());
			pstmt.setString(23, factura.getObservaciones());
			
			pstmt.setLong(24, factura.getIdFacturaRep());

			log.debug("update() - " + pstmt);

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

	public static void delete(Connection conn, ConfigEmpresaBean config,
			FacturaVentaBean proveedor) throws SQLException {
		delete(conn, config, proveedor.getIdFacturaRep());
	}

	public static void delete(Connection conn, ConfigEmpresaBean config,
			Long idFacturaRep) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "DELETE FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE ID_FACTURA_REP = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idFacturaRep);

			log.debug("delete() - " + pstmt);

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

	public static void modificarIdVencimientoEnlace(Connection conn, ConfigEmpresaBean config, FacturaVentaBean factura) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "UPDATE "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "SET ID_VENCIMIENTO_ENLACE = ? " + 
				"WHERE ID_FACTURA_REP = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, factura.getIdVencimientoEnlace());
			pstmt.setLong(2, factura.getIdFacturaRep());

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

}
