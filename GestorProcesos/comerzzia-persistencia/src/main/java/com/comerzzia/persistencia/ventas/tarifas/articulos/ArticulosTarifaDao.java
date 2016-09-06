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

package com.comerzzia.persistencia.ventas.tarifas.articulos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.ventas.tarifas.ParametrosAsistenteTarifaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ArticulosTarifaDao extends MantenimientoDao {

	private static String TABLA = "D_TARIFAS_DET_TBL";
	private static String HISTORICO = "D_TARIFAS_DET_HIST_TBL";
	private static String VISTA = "D_TARIFAS_DET";

	private static Logger log = Logger.getMLogger(ArticulosTarifaDao.class);


	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, ParametrosBuscarArticulosTarifaBean param)
			throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		List<ArticuloTarifaBean> resultados = new ArrayList<ArticuloTarifaBean>();
    	PaginaResultados paginaResultados = new PaginaResultados(param, resultados);

		String sql = obtenerConsulta(config, param);
		String sqlCount = obtenerConsultaCount(config, param);

		try {
			stmt = conn.createStatement();
    		
    		// Obtenemos número de resultados
        	log.debug("consultar() - " + sqlCount);
        	rs = stmt.executeQuery(sqlCount);
        	if (rs.next()){
        		paginaResultados.setTotalResultados(rs.getInt(1));
        	}
        	rs.close();

        	// Si tenemos resultados, obtenemos la pagina requerida
            if (paginaResultados.getTotalResultados() > 0) {
				log.debug("consultar() - " + sql);
				rs = stmt.executeQuery(sql);
				int contador = 0;
				while (rs.next() &&  (param.isSinPaginar() || contador < param.getTamañoPagina())) {
					ArticuloTarifaBean articulo = new ArticuloTarifaBean();
					articulo.setCodTar(rs.getString("CODTAR"));
					articulo.setDesTarifa(rs.getString("DESTAR"));
					articulo.setCodArt(rs.getString("CODART"));
					articulo.setDesArt(rs.getString("DESART"));
					articulo.setCodImpuesto(rs.getString("CODIMP"));
					articulo.setPrecioCosto(rs.getString("PRECIO_COSTO") != null ? rs.getDouble("PRECIO_COSTO") : null);
					articulo.setFactorMarcaje(rs.getString("FACTOR_MARCAJE") != null ? rs.getDouble("FACTOR_MARCAJE") : null);
					articulo.setPrecioVenta(rs.getString("PRECIO_VENTA") != null ? rs.getDouble("PRECIO_VENTA") : null);
					articulo.setPrecioTotal(rs.getString("PRECIO_TOTAL") != null ? rs.getDouble("PRECIO_TOTAL") : null);
					articulo.setVersion((rs.getString("VERSION") != null) ? rs.getLong("VERSION") : null);
					resultados.add(articulo);
					contador++;
				}
            }
			return paginaResultados;
		} 
		finally {
			try {
				rs.close();
			} catch (Exception ignore) {;}
			try {
				stmt.close();
			} catch (Exception ignore) {;}
		}
	}

	public static ArticuloTarifaBean consultar(Connection conn, ConfigEmpresaBean config, String codTar, String codArt)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArticuloTarifaBean articulo = null;
		String sql = null;

		sql = "SELECT CODTAR, CODART, PRECIO_COSTO, FACTOR_MARCAJE, PRECIO_VENTA, PRECIO_TOTAL, CODIMP, VERSION "
				+ "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), VISTA)
				+ "WHERE CODTAR = ? AND CODART = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codTar);
			pstmt.setString(2, codArt);
			log.debug("consultar() - " + pstmt);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				articulo = new ArticuloTarifaBean();
				articulo.setCodTar(rs.getString("CODTAR"));
				articulo.setCodArt(rs.getString("CODART"));
				articulo.setCodImpuesto(rs.getString("CODIMP"));
				articulo.setPrecioCosto(rs.getString("PRECIO_COSTO") != null ? rs.getDouble("PRECIO_COSTO") : null);
				articulo.setFactorMarcaje(rs.getString("FACTOR_MARCAJE") != null ? rs.getDouble("FACTOR_MARCAJE") : null);
				articulo.setPrecioVenta(rs.getString("PRECIO_VENTA") != null ? rs.getDouble("PRECIO_VENTA") : null);
				articulo.setPrecioTotal(rs.getString("PRECIO_TOTAL") != null ? rs.getDouble("PRECIO_TOTAL") : null);
				articulo.setVersion((rs.getString("VERSION") != null) ? rs.getLong("VERSION") : null);
			}

			return articulo;
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
	
	public static List<ArticuloTarifaCopiaBean> consultarArticulosCopiar(Connection conn, ConfigEmpresaBean config,
			ParametrosAsistenteTarifaBean asistente) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		List<ArticuloTarifaCopiaBean> lstArticulos = new ArrayList<ArticuloTarifaCopiaBean>();

		String sql = "SELECT ORIGEN.CODTAR CODTAR_ORIGEN, ORIGEN.CODART CODART_ORIGEN, ORIGEN.PRECIO_COSTO PRECIO_COSTO_ORIGEN, " +
				"ORIGEN.FACTOR_MARCAJE FACTOR_ORIGEN, ORIGEN.PRECIO_VENTA PRECIO_VENTA_ORIGEN, ORIGEN.PRECIO_TOTAL PRECIO_TOTAL_ORIGEN, " +
				"ORIGEN.CODIMP CODIMP_ORIGEN, ACTUAL.CODTAR CODTAR_ACTUAL, ACTUAL.CODART CODART_ACTUAL, ACTUAL.PRECIO_COSTO PRECIO_COSTO_ACTUAL, " +
				"ACTUAL.FACTOR_MARCAJE FACTOR_ACTUAL, ACTUAL.PRECIO_VENTA PRECIO_VENTA_ACTUAL, ACTUAL.PRECIO_TOTAL PRECIO_TOTAL_ACTUAL, " +
				"ACTUAL.VERSION VERSION_ACTUAL, ACTUAL.CODIMP CODIMP_ACTUAL " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) + " ORIGEN " +
				"LEFT JOIN " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) + " ACTUAL" + 
				" ON (ACTUAL.CODTAR = '" + asistente.getCodTarActual() + "' AND ACTUAL.CODART = ORIGEN.CODART) " + 
				"WHERE ORIGEN.CODTAR = '" + asistente.getCodTarOrigen() + "'";

		if (!asistente.getCodArtDesde().isEmpty()) {
			sql += " AND ORIGEN.CODART >= '" + asistente.getCodArtDesde() + "'";
		}

		if (!asistente.getCodArtHasta().isEmpty()) {
			sql += " AND ORIGEN.CODART <= '" + asistente.getCodArtHasta() + "'";
		}

		if (!asistente.getCodFamDesde().isEmpty()) {
			sql += " AND ORIGEN.CODFAM >= '" + asistente.getCodFamDesde() + "'";
		}

		if (!asistente.getCodFamHasta().isEmpty()) {
			sql += " AND ORIGEN.CODFAM <= '" + asistente.getCodFamHasta() + "'";
		}

		if (!asistente.getCodProDesde().isEmpty()) {
			sql += " AND ORIGEN.CODPRO >= '" + asistente.getCodProDesde() + "'";
		}

		if (!asistente.getCodProHasta().isEmpty()) {
			sql += " AND ORIGEN.CODPRO <= '" + asistente.getCodProHasta() + "'";
		}

		try {
			stmt = conn.createStatement();
			log.debug("consultarArticulosCopiar() - " + sql);
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				ArticuloTarifaCopiaBean articulo = new ArticuloTarifaCopiaBean();
				articulo.setCodTarOrigen(rs.getString("CODTAR_ORIGEN"));
				articulo.setCodArtOrigen(rs.getString("CODART_ORIGEN"));
				articulo.setPrecioCostoOrigen(rs.getString("PRECIO_COSTO_ORIGEN") != null ? rs.getDouble("PRECIO_COSTO_ORIGEN") : null);
				articulo.setFactorMarcajeOrigen(rs.getString("FACTOR_ORIGEN") != null ? rs.getDouble("FACTOR_ORIGEN") : null);
				articulo.setPrecioVentaOrigen(rs.getString("PRECIO_VENTA_ORIGEN") != null ? rs.getDouble("PRECIO_VENTA_ORIGEN") : null);
				articulo.setCodTar(rs.getString("CODTAR_ACTUAL"));
				articulo.setCodArt(rs.getString("CODART_ACTUAL"));
				articulo.setPrecioCosto(rs.getString("PRECIO_COSTO_ACTUAL") != null ? rs.getDouble("PRECIO_COSTO_ACTUAL") : null);
				articulo.setFactorMarcaje(rs.getString("FACTOR_ACTUAL") != null ? rs.getDouble("FACTOR_ACTUAL") : null);
				articulo.setPrecioVenta(rs.getString("PRECIO_VENTA_ACTUAL") != null ? rs.getDouble("PRECIO_VENTA_ACTUAL") : null);
				articulo.setVersion((rs.getString("VERSION_ACTUAL") != null) ? rs.getLong("VERSION_ACTUAL") : null);
				articulo.setCodImpuesto(rs.getString("CODIMP_ACTUAL"));
				articulo.setCodImpuestoOrigen(rs.getString("CODIMP_ORIGEN"));
				lstArticulos.add(articulo);
			}
			return lstArticulos;
		} 
		finally {
			try {
				rs.close();
			} catch (Exception ignore) {;}
			try {
				stmt.close();
			} catch (Exception ignore) {;}
		}
	}

	private static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarArticulosTarifaBean param) {
		String sql = null;

		sql = "SELECT CODTAR, DESTAR, CODART, DESART, PRECIO_COSTO, FACTOR_MARCAJE, PRECIO_VENTA, PRECIO_TOTAL, VERSION, CODIMP "
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

	private static String obtenerConsultaCount(ConfigEmpresaBean config,
			ParametrosBuscarArticulosTarifaBean param) {
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

	private static String getClausulaWhere(ParametrosBuscarArticulosTarifaBean param) {
		String where = "";
		// CODTAR
		if (!param.getCodTar().isEmpty()) {
			where = "CODTAR='" + param.getCodTar() + "' ";
		}
		// DESART
		if (!param.getDesArtText().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "UPPER(DESART) LIKE UPPER('" + param.getDesArtText()
					+ "%') ";
		}
		// CODART
		if (!param.getCodArt().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODART='" + param.getCodArt() + "' ";
		}
		// CODFAM
		if (!param.getCodFam().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODFAM='" + param.getCodFam() + "' ";
		}
		// CODPRO
		if (!param.getCodPro().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODPRO='" + param.getCodPro() + "' ";
		}
		// CODART DESDE 
		if (!param.getCodArtDesde().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODART >= '" + param.getCodArtDesde() + "' ";
		}
		// CODART HASTA
		if (!param.getCodArtHasta().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODART <= '" + param.getCodArtHasta() + "' ";
		}
		// CODFAM DESDE
		if (!param.getCodFamDesde().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODFAM >= '" + param.getCodFamDesde() + "' ";
		}
		// CODFAM HASTA
		if (!param.getCodFamHasta().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODFAM <= '" + param.getCodFamHasta() + "' ";
		}
		// CODPRO DESDE
		if (!param.getCodProDesde().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODPRO >= '" + param.getCodProDesde() + "' ";
		}
		// CODPRO HASTA
		if (!param.getCodProHasta().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODPRO <= '" + param.getCodProHasta() + "' ";
		}

		return where;
	}

	public static void insert(Connection conn, ConfigEmpresaBean config,
			ArticuloTarifaBean articulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "(CODTAR, CODART, PRECIO_COSTO, FACTOR_MARCAJE, PRECIO_VENTA, PRECIO_TOTAL, VERSION) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, articulo.getCodTar());
			pstmt.setString(2, articulo.getCodArt());
			pstmt.setDouble(3, articulo.getPrecioCosto());
			pstmt.setDouble(4, articulo.getFactorMarcaje());
			pstmt.setDouble(5, articulo.getPrecioVenta());
			pstmt.setDouble(6, articulo.getPrecioTotal());
			pstmt.setLong(7, articulo.getVersion());

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

	public static void insertHistorico(Connection conn, ConfigEmpresaBean config, ArticuloHistoricoTarifaBean articulo)
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO " 
				+ getNombreElemento(config.getEsquemaEmpresa(), HISTORICO)
				+ "(CODTAR, CODART, FECHA, PRECIO_COSTO, FACTOR_MARCAJE, PRECIO_VENTA, PRECIO_TOTAL, VERSION, ID_USUARIO, BORRADO) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, articulo.getCodTar());
			pstmt.setString(2, articulo.getCodArt());
			pstmt.setTimestamp(3, Fechas.toSqlTimestamp(articulo.getFechaModificacion()));
			pstmt.setDouble(4, articulo.getPrecioCosto());
			pstmt.setDouble(5, articulo.getFactorMarcaje());
			pstmt.setDouble(6, articulo.getPrecioVenta());
			pstmt.setDouble(7, articulo.getPrecioTotal());
			pstmt.setLong(8, articulo.getVersion());
			pstmt.setLong(9, articulo.getIdUsuario());
			pstmt.setString(10, articulo.getBorrado());

			log.debug("insertHistorico() - " + pstmt);

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
	
	
	public static void deleteHistorico(Connection conn, ConfigEmpresaBean config, String codArt)
	throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "DELETE FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), HISTORICO)
				+ "WHERE CODART = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codArt);

			log.debug("deleteHistorico() - " + pstmt);

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
	
	
	
	public static List<String> consultarArticulosTarifaBorradosSincronizacion (Connection conn, 
			ConfigEmpresaBean config, String codTarifa, long versionTienda, long versionActual) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	
    	List<String> articulos = new ArrayList<String>();
    	
    	sql = "SELECT DISTINCT(CODART) " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), HISTORICO) +
    	      "WHERE CODTAR = ? " +
    	        "AND VERSION > ? " +
    	        "AND VERSION <= ? " +
    	        "AND BORRADO = 'S'";
    	
    	try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codTarifa);
			pstmt.setLong(2, versionTienda);
			pstmt.setLong(3, versionActual);
			
			log.debug("consultarArticulosTarifaBorradosSincronizacion() - " + pstmt);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()){
				String codArticulo = rs.getString("CODART");
				
				articulos.add(codArticulo);
			}
			
			return articulos;
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
	
	
	public static List<ArticuloTarifaBean> consultarArticulosTarifaSincronizacion(Connection conn,
			ConfigEmpresaBean config, String codTarifa, long versionTienda, long versionActual) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	
    	List<ArticuloTarifaBean> articulos = new ArrayList<ArticuloTarifaBean>();
    	
    	sql = "SELECT CODTAR, CODART, PRECIO_COSTO, FACTOR_MARCAJE, PRECIO_VENTA, PRECIO_TOTAL, VERSION " +
		      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODTAR = ? " +
		        "AND VERSION > ? " +
                "AND VERSION <= ?";
    	
    	try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codTarifa);
			pstmt.setLong(2, versionTienda);
			pstmt.setLong(3, versionActual);
			
			log.debug("consultarArticulosTarifaSincronizacion() - " + pstmt);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()){
				ArticuloTarifaBean articulo = new ArticuloTarifaBean();
				articulo.setCodTar(rs.getString("CODTAR"));
				articulo.setCodArt(rs.getString("CODART"));
				articulo.setPrecioCosto(rs.getString("PRECIO_COSTO") != null ? rs.getDouble("PRECIO_COSTO") : null);
				articulo.setFactorMarcaje(rs.getString("FACTOR_MARCAJE") != null ? rs.getDouble("FACTOR_MARCAJE") : null);
				articulo.setPrecioVenta(rs.getString("PRECIO_VENTA") != null ? rs.getDouble("PRECIO_VENTA") : null);
				articulo.setPrecioTotal(rs.getString("PRECIO_TOTAL") != null ? rs.getDouble("PRECIO_TOTAL") : null);
				articulo.setVersion((rs.getString("VERSION") != null) ? rs.getLong("VERSION") : null);
				
				articulos.add(articulo);
			}
			
			return articulos;
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

	
	public static void update(Connection conn, ConfigEmpresaBean config,
			ArticuloTarifaBean articulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "UPDATE "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "SET PRECIO_COSTO = ?, FACTOR_MARCAJE = ?, PRECIO_VENTA = ?, PRECIO_TOTAL = ?, VERSION = ? "
				+ "WHERE CODTAR = ? AND CODART = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setDouble(1, articulo.getPrecioCosto());
			pstmt.setDouble(2, articulo.getFactorMarcaje());
			pstmt.setDouble(3, articulo.getPrecioVenta());
			pstmt.setDouble(4, articulo.getPrecioTotal());
			pstmt.setLong(5, articulo.getVersion());
			pstmt.setString(6, articulo.getCodTar());
			pstmt.setString(7, articulo.getCodArt());

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
			ArticuloTarifaBean articulo) throws SQLException {
		delete(conn, config, articulo.getCodTar(), articulo.getCodArt());
	}

	public static void delete(Connection conn, ConfigEmpresaBean config,
			String codTar, String codArt) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "DELETE FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE CODTAR = ? AND CODART = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codTar);
			pstmt.setString(2, codArt);

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
	
	public static void delete(Connection conn, ConfigEmpresaBean config, String codTar) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODTAR = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, codTar);
        	
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
}
