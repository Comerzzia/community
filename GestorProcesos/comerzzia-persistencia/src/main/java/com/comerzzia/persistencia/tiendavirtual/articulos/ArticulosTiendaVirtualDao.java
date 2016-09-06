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

package com.comerzzia.persistencia.tiendavirtual.articulos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.tiendavirtual.config.ConfigTiendaVirtualBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ArticulosTiendaVirtualDao extends MantenimientoDao {

	private static Logger log = Logger.getMLogger(ArticulosTiendaVirtualDao.class);

	public static PaginaResultados consultar(Connection conn, ConfigTiendaVirtualBean config, ParametrosBuscarArticulosTVBean param) 
			throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		// Inicializamos la página de resultados
		List<ArticuloTiendaVirtualBean> resultados = new ArrayList<ArticuloTiendaVirtualBean>(param.getTamañoPagina());
		PaginaResultados paginaResultados = new PaginaResultados(param,resultados);

		// Consultas
		String sql = obtenerConsulta(config, param);
		String sqlCount = obtenerConsultaCount(config, param);

		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

			// Obtenemos número de resultados
			log.debug("consultar() - " + sqlCount);
			rs = stmt.executeQuery(sqlCount);
			if (rs.next()) {
				paginaResultados.setTotalResultados(rs.getInt(1));
			}
			rs.close();

			// Si tenemos resultados, obtenemos la pagina requerida
			if (paginaResultados.getTotalResultados() > 0) {
				log.debug("consultar() - " + sql);
				rs = stmt.executeQuery(sql);

				int contador = 0;
				if (rs.absolute(paginaResultados.getInicio())) {
					do {
						ArticuloTiendaVirtualBean articulo = new ArticuloTiendaVirtualBean();
						articulo.setCodArticulo(rs.getString("CODART"));
						articulo.setDesArticulo(rs.getString("DESART"));
						articulo.setStock(rs.getDouble("STOCK"));
						articulo.setStockPendienteRecibir(rs.getDouble("STOCK_PENDIENTE_RECIBIR"));
						articulo.setCodImpuesto(rs.getString("CODIMP"));
						resultados.add(articulo);
						contador++;
					} 
					while (rs.next()&& contador < paginaResultados.getTamañoPagina());
				}
			}
			return paginaResultados;
		} 
		finally {
			try {
				rs.close();
			} 
			catch (Exception ignore) {}
			try {
				stmt.close();
			} 
			catch (Exception ignore) {}
		}
	}

	public static ArticuloTiendaVirtualBean consultar(Connection conn, ConfigTiendaVirtualBean config, String codArticulo) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArticuloTiendaVirtualBean articulo = null;

		try {
			String sql = "SELECT ARTICULOS.CODART, ARTICULOS.DESART, ARTICULOS.OBSERVACIONES, "
					+ "ALMACENES.STOCK, ALMACENES.STOCK_PENDIENTE_RECIBIR, ARTICULOS.CODIMP "
					+ "FROM T_ARTICULOS_TBL ARTICULOS "
					+ "LEFT JOIN D_ALMACENES_ARTICULOS_TBL ALMACENES ON (ALMACENES.CODART = ARTICULOS.CODART AND ALMACENES.CODALM = ? AND ALMACENES.DESGLOSE1 = '*' AND ALMACENES.DESGLOSE2 = '*') "
					+ "WHERE ARTICULOS.CODART = ? AND ARTICULOS.CODALM = ?";

			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, config.getCodAlmacenCentral());
			pstmt.setString(2, codArticulo);
			pstmt.setString(3, config.getCodAlmacen());

			log.debug("consultar() - " + pstmt);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articulo = new ArticuloTiendaVirtualBean();
				articulo.setCodArticulo(rs.getString("CODART"));
				articulo.setDesArticulo(rs.getString("DESART"));
				articulo.setObservaciones(rs.getString("OBSERVACIONES"));
				articulo.setStock(rs.getDouble("STOCK"));
				articulo.setStockPendienteRecibir(rs.getDouble("STOCK_PENDIENTE_RECIBIR"));
				articulo.setCodImpuesto(rs.getString("CODIMP"));
			}
			return articulo;
		} 
		finally {
			try {
				rs.close();
			} 
			catch (Exception ignore) {}
			try {
				pstmt.close();
			} 
			catch (Exception ignore) {}
		}
	}


	public static List<ArticuloTiendaVirtualBean> consultarEscaparate(Connection conn, ConfigTiendaVirtualBean config, String codCategorizacion)
			throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		ArticuloTiendaVirtualBean articulo = null;
		List<ArticuloTiendaVirtualBean> escaparate = new ArrayList<ArticuloTiendaVirtualBean>();

		try {

			String sql = "SELECT ARTICULOS.CODART, ARTICULOS.DESART, ARTICULOS.ESCAPARATE, ARTICULOS.FECHA_ALTA, "
					+ "ALMACENES.STOCK, ALMACENES.STOCK_PENDIENTE_RECIBIR, ARTICULOS.CODIMP "
					+ "FROM T_ARTICULOS_TBL ARTICULOS "
					+ "LEFT JOIN D_ALMACENES_ARTICULOS_TBL ALMACENES ON (ALMACENES.CODART = ARTICULOS.CODART AND ALMACENES.CODALM = '"
					+ config.getCodAlmacenCentral()
					+ "' AND ALMACENES.DESGLOSE1 = '*' AND ALMACENES.DESGLOSE2 = '*') "
					+ "WHERE ARTICULOS.CODALM = '"
					+ config.getCodAlmacen() + "' AND ARTICULOS.ESCAPARATE = 'S'";

			if (codCategorizacion != null && !codCategorizacion.isEmpty()) {
				sql += " AND ARTICULOS.CODCAT LIKE '" + codCategorizacion + "%'";
			}

			sql += " ORDER BY ARTICULOS.FECHA_ALTA DESC";

			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

			log.debug("consultarEscaparate() - " + sql);
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				articulo = new ArticuloTiendaVirtualBean();
				articulo.setCodArticulo(rs.getString("CODART"));
				articulo.setDesArticulo(rs.getString("DESART"));
				articulo.setEscaparate(rs.getString("ESCAPARATE"));
				articulo.setStock(rs.getDouble("STOCK"));
				articulo.setStockPendienteRecibir(rs.getDouble("STOCK_PENDIENTE_RECIBIR"));
				articulo.setCodImpuesto(rs.getString("CODIMP"));

				escaparate.add(articulo);
			}
			return escaparate;
		} 
		finally {
			try {
				rs.close();
			} 
			catch (Exception ignore) {}
			try {
				stmt.close();
			} 
			catch (Exception ignore) {}
		}
	}

	private static String obtenerConsultaCount(ConfigTiendaVirtualBean config, ParametrosBuscarArticulosTVBean param) {
		String sql = null;

		sql = "SELECT COUNT(*) "
				+ "FROM T_ARTICULOS_TBL ARTICULOS "
				+ "LEFT JOIN D_ALMACENES_ARTICULOS_TBL ALMACENES ON (ALMACENES.CODART = ARTICULOS.CODART AND ALMACENES.CODALM = '"
				+ config.getCodAlmacenCentral() + "' AND ALMACENES.DESGLOSE1 = '*' AND ALMACENES.DESGLOSE2 = '*') " +
			"WHERE ARTICULOS.CODALM = '" + config.getCodAlmacen() + "'";

		// Clausula WHERE
		sql += getClausulaWhere(param);

		return sql;
	}

	private static String obtenerConsulta(ConfigTiendaVirtualBean config, ParametrosBuscarArticulosTVBean param) {
		String sql = null;

		sql = "SELECT ARTICULOS.CODART, ARTICULOS.DESART, "
				+ "ALMACENES.STOCK, ALMACENES.STOCK_PENDIENTE_RECIBIR, ARTICULOS.CODIMP "
				+ "FROM T_ARTICULOS_TBL ARTICULOS "
				+ "LEFT JOIN D_ALMACENES_ARTICULOS_TBL ALMACENES ON (ALMACENES.CODART = ARTICULOS.CODART AND ALMACENES.CODALM = '"
				+ config.getCodAlmacenCentral() + "' AND ALMACENES.DESGLOSE1 = '*' AND ALMACENES.DESGLOSE2 = '*') " +
			"WHERE ARTICULOS.CODALM = '" + config.getCodAlmacen() + "'";

		// Clausula WHERE
		sql += getClausulaWhere(param);

		// Clausula ORDER BY
		if (!param.getOrden().isEmpty()) {
			sql += "ORDER BY " + param.getOrden();
		}
		return sql;
	}

	private static String getClausulaWhere(ParametrosBuscarArticulosTVBean param) {
		String where = " AND ARTICULOS.CODCAT IS NOT NULL AND ARTICULOS.ACTIVO = 'S' ";

		// CODCAT
		if (!param.getCodCategoria().isEmpty()) {
			where += "AND ARTICULOS.CODCAT LIKE '" + param.getCodCategoria() + "%' ";
		}

		// FILTRO
		if (!param.getFiltro().isEmpty()) {
			where += "AND UPPER(ARTICULOS.DESART) LIKE '%" + param.getFiltro().toUpperCase() + "%'";
		}

		return where;
	}
}
