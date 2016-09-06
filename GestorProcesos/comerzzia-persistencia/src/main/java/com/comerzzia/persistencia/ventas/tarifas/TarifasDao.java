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

package com.comerzzia.persistencia.ventas.tarifas;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class TarifasDao extends MantenimientoDao {

	private static String TABLA = "D_TARIFAS_CAB_TBL";
	private static String VISTA = "D_TARIFAS_CAB";

	private static Logger log = Logger.getMLogger(TarifasDao.class);

	public static PaginaResultados consultar(Connection conn,
			ConfigEmpresaBean config, ParametrosBuscarTarifasBean param)
			throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		// Inicializamos la página de resultados
		List<TarifaBean> resultados = new ArrayList<TarifaBean>(param
				.getTamañoPagina());
		PaginaResultados paginaResultados = new PaginaResultados(param,
				resultados);

		// Consultas
		String sql = obtenerConsulta(config, param);
		String sqlCount = obtenerConsultaCount(config, param);

		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);

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
						TarifaBean tarifa = new TarifaBean();
						tarifa.setCodTar(rs.getString("CODTAR"));
						tarifa.setDesTar(rs.getString("DESTAR"));
						tarifa.setVersion(rs.getLong("VERSION"));
						resultados.add(tarifa);
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
				stmt.close();
			} catch (Exception ignore) {
				;
			}
		}
	}

	public static String obtenerConsulta(ConfigEmpresaBean config,
			ParametrosBuscarTarifasBean param) {
		String sql = null;

		sql = "SELECT CODTAR, DESTAR, VERSION "
				+ "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA);

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
			ParametrosBuscarTarifasBean param) {
		String sql = null;

		sql = "SELECT COUNT(*) " + "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA);

		// Clausula WHERE
		String where = getClausulaWhere(param);
		if (where.length() > 0) {
			sql += "WHERE " + where;
		}

		return sql;
	}

	private static String getClausulaWhere(ParametrosBuscarTarifasBean param) {
		String where = "";

		// CODTAR
		if (!param.getCodTar().isEmpty()) {
			where = "CODTAR LIKE '" + param.getCodTar() + "%' ";
		}

		// DESTAR
		if (!param.getDesTar().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "UPPER(DESTAR) LIKE UPPER('" + param.getDesTar() + "%') ";
		}

		return where;
	}

	public static TarifaBean consultar(Connection conn,
			ConfigEmpresaBean config, String codTar) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TarifaBean tarifa = null;
		String sql = null;

		sql = "SELECT CODTAR, DESTAR, VERSION, ID_GRUPO_IMPUESTOS, ID_TRAT_IMPUESTOS, DESTRATIMP, FECHA_VERSION  "
				+ "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), VISTA)
				+ "WHERE CODTAR = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codTar);
			log.debug("consultar() - " + pstmt);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				tarifa = new TarifaBean();
				tarifa.setCodTar(rs.getString("CODTAR"));
				tarifa.setDesTar(rs.getString("DESTAR"));
				tarifa.setVersion(rs.getLong("VERSION"));
				tarifa.setIdGrupoImpuesto(rs.getLong("ID_GRUPO_IMPUESTOS"));
				tarifa.setIdTratImpuestos(rs.getLong("ID_TRAT_IMPUESTOS"));
				tarifa.setDesTratImpuestos(rs.getString("DESTRATIMP"));
				tarifa.setFechaVersion(rs.getTimestamp("FECHA_VERSION"));
			}

			return tarifa;
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

	public static List<TarifaBean> consultar(Connection conn, ConfigEmpresaBean config) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	String sql = null;
		List<TarifaBean> resultados = new ArrayList<TarifaBean>();
    	
    	sql = "SELECT CODTAR, DESTAR " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA);
    	
    	try {
    		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

    		log.debug("consultar() - " + sql);
        	
    		rs = stmt.executeQuery(sql);
        	while (rs.next()){
        		TarifaBean tarifa = new TarifaBean();
        		tarifa.setCodTar(rs.getString("CODTAR"));
        		tarifa.setDesTar(rs.getString("DESTAR"));
        		
        		resultados.add(tarifa);
        	}
        	
    		return resultados;
    	}
    	finally {
    		try{
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try{
    			stmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}

	public static void insert(Connection conn, ConfigEmpresaBean config,
			TarifaBean tarifa) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "(CODTAR, DESTAR, VERSION, FECHA_VERSION, ID_GRUPO_IMPUESTOS, ID_TRAT_IMPUESTOS) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, tarifa.getCodTar());
			pstmt.setString(2, tarifa.getDesTar());
			pstmt.setLong(3, tarifa.getVersion());
			pstmt.setTimestamp(4, Fechas.toSqlTimestamp(tarifa.getFechaVersion()));
			pstmt.setLong(5, tarifa.getIdGrupoImpuesto());
			pstmt.setLong(6, tarifa.getIdTratImpuestos());

			log.debug("insert() - " + pstmt);

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

	public static void update(Connection conn, ConfigEmpresaBean config,
			TarifaBean tarifa) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "UPDATE "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "SET DESTAR = ?, VERSION = ?, ID_GRUPO_IMPUESTOS = ? "
				+ "WHERE CODTAR = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, tarifa.getDesTar());
			pstmt.setLong(2, tarifa.getVersion());
			pstmt.setLong(3, tarifa.getIdGrupoImpuesto());
			pstmt.setString(4, tarifa.getCodTar());

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

	public static void delete(Connection conn, ConfigEmpresaBean config,
			TarifaBean tarifa) throws SQLException {
		delete(conn, config, tarifa.getCodTar());
	}

	public static void delete(Connection conn, ConfigEmpresaBean config,
			String codTar) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "DELETE FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE CODTAR = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codTar);

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
	
	public static void actualizarVersion(Connection conn, ConfigEmpresaBean config, TarifaBean tarifa) 
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET VERSION = ?, FECHA_VERSION = ?" +
		      "WHERE CODTAR = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, tarifa.getVersion());
			pstmt.setTimestamp(2, Fechas.toSqlTimestamp(tarifa.getFechaVersion()));
        	pstmt.setString(3, tarifa.getCodTar());
        	
        	log.debug("actualizarVersion() - " + pstmt);
        	
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
