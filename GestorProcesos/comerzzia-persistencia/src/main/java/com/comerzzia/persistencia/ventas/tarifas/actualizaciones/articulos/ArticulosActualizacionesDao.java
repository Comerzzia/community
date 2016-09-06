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

package com.comerzzia.persistencia.ventas.tarifas.actualizaciones.articulos;

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
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ArticulosActualizacionesDao extends MantenimientoDao {

	private static String TABLA = "D_TARIFAS_ACT_DET_TBL";
	private static String VISTA = "D_TARIFAS_ACT_DET";
	private static String VISTA_TARIFA = "D_TARIFAS_DET";

	private static Logger log = Logger.getMLogger(ArticulosActualizacionesDao.class);


	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, ParametrosBuscarArticulosActualizacionesBean param)
			throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		List<ArticuloActualizacionBean> resultados = new ArrayList<ArticuloActualizacionBean>();
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
				while (rs.next() &&  contador < param.getTamañoPagina()) {
					ArticuloActualizacionBean articulo = new ArticuloActualizacionBean();
					articulo.setCodTar(rs.getString("CODTAR"));
					articulo.setIdActualizacion(rs.getLong("ID_ACTUALIZACION"));
					articulo.setCodArt(rs.getString("CODART"));
					articulo.setDesArt(rs.getString("DESART"));
					articulo.setPrecioCosto(rs.getString("PRECIO_COSTO") != null ? rs.getDouble("PRECIO_COSTO") : null);
					articulo.setFactorMarcaje(rs.getString("FACTOR_MARCAJE") != null ? rs.getDouble("FACTOR_MARCAJE") : null);
					articulo.setPrecioVenta(rs.getString("PRECIO_VENTA") != null ? rs.getDouble("PRECIO_VENTA") : null);
					articulo.setPrecioTotal(rs.getString("PRECIO_TOTAL") != null ? rs.getDouble("PRECIO_TOTAL") : null);
					articulo.setCodImpuesto(rs.getString("CODIMP"));
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

	

	private static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarArticulosActualizacionesBean param) {
		String sql = null;

		sql = "SELECT CODTAR, ID_ACTUALIZACION, CODART, DESART, PRECIO_COSTO, FACTOR_MARCAJE, PRECIO_VENTA, PRECIO_TOTAL, CODIMP "
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
			ParametrosBuscarArticulosActualizacionesBean param) {
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

	private static String getClausulaWhere(ParametrosBuscarArticulosActualizacionesBean param) {
		String where = "";
		// CODTAR
		if (!param.getCodTar().isEmpty()) {
			where = "CODTAR='" + param.getCodTar() + "' ";
		}
		// ID_ACTUALIZACION
		if (param.getIdActualizacion() != null) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "ID_ACTUALIZACION = '" + param.getIdActualizacion() + "'";
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

	public static void insert(Connection conn, ConfigEmpresaBean config, ArticuloActualizacionBean articulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "(ID_ACTUALIZACION, CODTAR, CODART, PRECIO_COSTO, FACTOR_MARCAJE, PRECIO_VENTA, PRECIO_TOTAL) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, articulo.getIdActualizacion());
			pstmt.setString(2, articulo.getCodTar());
			pstmt.setString(3, articulo.getCodArt());
			pstmt.setDouble(4, articulo.getPrecioCosto());
			pstmt.setDouble(5, articulo.getFactorMarcaje());
			pstmt.setDouble(6, articulo.getPrecioVenta());
			pstmt.setDouble(7, articulo.getPrecioTotal());
			

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
	
	public static void update(Connection conn, ConfigEmpresaBean config, ArticuloActualizacionBean articulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "UPDATE "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "SET PRECIO_COSTO = ?, FACTOR_MARCAJE = ?, PRECIO_VENTA = ?, PRECIO_TOTAL = ? "
				+ "WHERE ID_ACTUALIZACION = ? AND CODART = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setDouble(1, articulo.getPrecioCosto());
			pstmt.setDouble(2, articulo.getFactorMarcaje());
			pstmt.setDouble(3, articulo.getPrecioVenta());
			pstmt.setDouble(4, articulo.getPrecioTotal());
			pstmt.setLong(5, articulo.getIdActualizacion());
			pstmt.setString(6, articulo.getCodArt());

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
			ArticuloActualizacionBean articulo) throws SQLException {
		delete(conn, config, articulo.getIdActualizacion(), articulo.getCodArt());
	}

	public static void delete(Connection conn, ConfigEmpresaBean config,
			Long idActualizacion, String codArt) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "DELETE FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE ID_ACTUALIZACION = ? AND CODART = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idActualizacion);
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
	
	public static void delete(Connection conn, ConfigEmpresaBean config, Long idActualizacion) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE ID_ACTUALIZACION = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idActualizacion);
        	
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
	
	public static int delete(Connection conn, ConfigEmpresaBean config, ParametrosBuscarArticulosActualizacionesBean param) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int numBorrados = 0;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA);
		
		// Clausula WHERE
		String where = getClausulaWhere(param);
		if (where.length() > 0) {
			sql += "WHERE " + where;
		}
		
		String sqlCount = obtenerConsultaCount(config, param);
		
		try {
			
			// Obtenemos número de resultados
        	log.debug("consultar() - " + sqlCount);
        	pstmt = new PreparedStatement(conn, sqlCount);
        	rs = pstmt.executeQuery(sqlCount);
        	if (rs.next()){
        		numBorrados = rs.getInt(1);
        	}
        	rs.close();
        	
        	if (numBorrados > 0){
        		pstmt = new PreparedStatement(conn, sql);
            	
            	log.debug("delete() - " + pstmt);
            	
            	pstmt.execute();
        	}
			
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
		return numBorrados;
	}
	
	public static List<ArticuloActualizacionCopiaBean> consultarArticulosCopiar(Connection conn, ConfigEmpresaBean config,
			ParametrosAsistenteTarifaBean asistente) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		List<ArticuloActualizacionCopiaBean> lstArticulos = new ArrayList<ArticuloActualizacionCopiaBean>();

		String sql = "SELECT ORIGEN.CODTAR CODTAR_ORIGEN, ORIGEN.CODART CODART_ORIGEN, ORIGEN.PRECIO_COSTO PRECIO_COSTO_ORIGEN, " +
				"ORIGEN.FACTOR_MARCAJE FACTOR_ORIGEN, ORIGEN.PRECIO_VENTA PRECIO_VENTA_ORIGEN, ORIGEN.PRECIO_TOTAL PRECIO_TOTAL_ORIGEN, " +
				"ORIGEN.CODIMP CODIMP_ORIGEN, ACTUAL.CODTAR CODTAR_ACTUAL, ACTUAL.CODART CODART_ACTUAL, ACTUAL.PRECIO_COSTO PRECIO_COSTO_ACTUAL, " +
				"ACTUAL.FACTOR_MARCAJE FACTOR_ACTUAL, ACTUAL.PRECIO_VENTA PRECIO_VENTA_ACTUAL, ACTUAL.PRECIO_TOTAL PRECIO_TOTAL_ACTUAL, " +
				"ACTUAL.CODIMP CODIMP_ACTUAL, ACTUAL.ID_ACTUALIZACION ID_ACTUALIZACION " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA_TARIFA) + " ORIGEN " +
				"LEFT JOIN " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) + " ACTUAL" + 
				" ON (ACTUAL.CODTAR = '"	+ asistente.getCodTarActual() + "' AND ACTUAL.CODART = ORIGEN.CODART) " + 
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
				ArticuloActualizacionCopiaBean articulo = new ArticuloActualizacionCopiaBean();
				articulo.setIdActualizacion(rs.getLong("ID_ACTUALIZACION"));
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

}
