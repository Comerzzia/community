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

package com.comerzzia.persistencia.almacenes.regularizaciones;

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

public class RegularizacionesDao extends MantenimientoDao {

	private static String TABLA = "D_ALMACENES_REGULARIZA_TBL";
	private static String VISTA = "D_ALMACENES_REGULARIZA";

	private static Logger log = Logger.getMLogger(RegularizacionesDao.class);

	public static PaginaResultados consultar(Connection conn,
			ConfigEmpresaBean config, ParametrosBuscarRegularizacionesBean param)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// Inicializamos la página de resultados
		List<RegularizacionBean> resultados = new ArrayList<RegularizacionBean>(param
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
			rs.close();

			// Si tenemos resultados, obtenemos la pagina requerida
			if (paginaResultados.getTotalResultados() > 0) {
				pstmt = new PreparedStatement(conn, sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				insertarParametros(pstmt, param);
				log.debug("consultar() - " + pstmt);
				rs = pstmt.executeQuery();

				int contador = 0;
				if (rs.absolute(paginaResultados.getInicio())) {
					do {						
						RegularizacionBean regularizacion = new RegularizacionBean();
						regularizacion.setIdRegularizacion(rs.getLong("ID_REGULARIZACION"));
						regularizacion.setCodAlmacen(rs.getString("CODALM"));
						regularizacion.setDesAlmacen(rs.getString("DESALM"));
						regularizacion.setFecha(rs.getDate("FECHA"));
						regularizacion.setCodAplicacion(rs.getString("CODAPLICACION"));
						regularizacion.setCodConceptoAlmacen(rs.getString("CODCONALM"));
						regularizacion.setDesConceptoAlmacen(rs.getString("DESCONALM"));
						regularizacion.setCodArticulo(rs.getString("CODART"));
						regularizacion.setDesArticulo(rs.getString("DESART"));
						regularizacion.setDesglose1(rs.getString("DESGLOSE1"));
						regularizacion.setDesglose2(rs.getString("DESGLOSE2"));						
						regularizacion.setCantidadMedida(rs.getDouble("CANTIDAD_MEDIDA"));
						regularizacion.setUnidadMedida(rs.getString("UNIDAD_MEDIDA"));
						regularizacion.setCantidad(rs.getDouble("CANTIDAD"));
						regularizacion.setPrecio(rs.getDouble("PRECIO"));
						regularizacion.setImporte(rs.getDouble("IMPORTE"));
						regularizacion.setObservaciones(rs.getString("OBSERVACIONES"));
						regularizacion.setIdUsuario((rs.getString("ID_USUARIO") != null) ? rs.getLong("ID_USUARIO") : null);
						resultados.add(regularizacion);
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
			ParametrosBuscarRegularizacionesBean param) {
		String sql = null;

		sql = "SELECT ID_REGULARIZACION, CODALM, DESALM, FECHA, CODAPLICACION, CODCONALM, DESCONALM, " +
				"CODART, DESART, DESGLOSE1, DESGLOSE2, CANTIDAD_MEDIDA, UNIDAD_MEDIDA, CANTIDAD, PRECIO, " +
				"IMPORTE, OBSERVACIONES, ID_USUARIO "
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
			ParametrosBuscarRegularizacionesBean param) {
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

	private static String getClausulaWhere(ParametrosBuscarRegularizacionesBean param) {
		String where = "";

		// CODALM
		if (!param.getCodAlmacen().isEmpty()) {
			where = "CODALM = '" + param.getCodAlmacen() + "' ";
		}

		// FECHA
		if (param.getFecha()!=null) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "FECHA = ? " ;
		}
		
		//CODART
		if (!param.getCodArticulo().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODART = '" + param.getCodArticulo() + "' ";
		}
		
		//CODCONALM
		if (!param.getCodConceptoAlmacen().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODCONALM = '" + param.getCodConceptoAlmacen() + "' ";
		}
		
		

		return where;
	}
	
	private static void insertarParametros(PreparedStatement pstmt, ParametrosBuscarRegularizacionesBean param) throws SQLException {
		Integer indice = 1;
		// FECHA
		if (param.getFecha() != null) {
			pstmt.setDate(indice, Fechas.toSqlDate(param.getFecha()));
			indice++;
		}
	}

	public static RegularizacionBean consultar(Connection conn,
			ConfigEmpresaBean config, Long idRegularizacion) throws SQLException {
			//ConfigEmpresaBean config, String codAlm, Date fecha, String codArt, Long linea) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RegularizacionBean regularizacion = null;
		String sql = null;

		sql = "SELECT ID_REGULARIZACION, CODALM, DESALM, FECHA, CODAPLICACION, CODCONALM, DESCONALM, CODART, DESART, DESGLOSE1, DESGLOSE2, CANTIDAD_MEDIDA, UNIDAD_MEDIDA, CANTIDAD, PRECIO, IMPORTE, OBSERVACIONES, ID_USUARIO "
				+ "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), VISTA)
				+ "WHERE ID_REGULARIZACION = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idRegularizacion);
			
			log.debug("consultar() - " + pstmt);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				regularizacion = new RegularizacionBean();
				regularizacion.setIdRegularizacion(rs.getLong("ID_REGULARIZACION"));
				regularizacion.setCodAlmacen(rs.getString("CODALM"));
				regularizacion.setDesAlmacen(rs.getString("DESALM"));
				regularizacion.setFecha(rs.getDate("FECHA"));
				regularizacion.setCodAplicacion(rs.getString("CODAPLICACION"));
				regularizacion.setCodConceptoAlmacen(rs.getString("CODCONALM"));
				regularizacion.setDesConceptoAlmacen(rs.getString("DESCONALM"));
				regularizacion.setCodArticulo(rs.getString("CODART"));
				regularizacion.setDesArticulo(rs.getString("DESART"));
				regularizacion.setDesglose1(rs.getString("DESGLOSE1"));
				regularizacion.setDesglose2(rs.getString("DESGLOSE2"));
				regularizacion.setCantidadMedida(rs.getDouble("CANTIDAD_MEDIDA"));
				regularizacion.setUnidadMedida(rs.getString("UNIDAD_MEDIDA"));
				regularizacion.setCantidad(rs.getDouble("CANTIDAD"));
				regularizacion.setPrecio(rs.getDouble("PRECIO"));
				regularizacion.setImporte(rs.getDouble("IMPORTE"));
				regularizacion.setObservaciones(rs.getString("OBSERVACIONES"));
				regularizacion.setIdUsuario((rs.getString("ID_USUARIO") != null) ? rs.getLong("ID_USUARIO") : null);
			}

			return regularizacion;
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
			RegularizacionBean regularizacion) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "(ID_REGULARIZACION, CODALM, FECHA, CODAPLICACION, CODCONALM, CODART, DESGLOSE1, DESGLOSE2, CANTIDAD_MEDIDA, UNIDAD_MEDIDA, CANTIDAD, PRECIO, IMPORTE, OBSERVACIONES, ID_USUARIO, ANTERIOR_STOCK, ANTERIOR_STOCK_UM_ALTERNATIVA) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, regularizacion.getIdRegularizacion());
			pstmt.setString(2, regularizacion.getCodAlmacen());
			pstmt.setDate(3, Fechas.toSqlDate(regularizacion.getFecha()));
			pstmt.setString(4, regularizacion.getCodAplicacion());
			pstmt.setString(5, regularizacion.getCodConceptoAlmacen());
			pstmt.setString(6, regularizacion.getCodArticulo());
			pstmt.setString(7, regularizacion.getDesglose1());
			pstmt.setString(8, regularizacion.getDesglose2());
			pstmt.setDouble(9, regularizacion.getCantidadMedida());
			pstmt.setString(10, regularizacion.getUnidadMedida());
			pstmt.setDouble(11, regularizacion.getCantidad());
			pstmt.setDouble(12, regularizacion.getPrecio());
			pstmt.setDouble(13, regularizacion.getImporte());
			pstmt.setString(14, regularizacion.getObservaciones());
			pstmt.setLong(15, regularizacion.getIdUsuario());
			pstmt.setDouble(16, regularizacion.getStockActual());
			pstmt.setDouble(17, regularizacion.getStockUMAlt());

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
}
