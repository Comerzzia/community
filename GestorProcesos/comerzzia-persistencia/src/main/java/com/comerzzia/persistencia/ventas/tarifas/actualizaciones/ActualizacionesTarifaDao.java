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

package com.comerzzia.persistencia.ventas.tarifas.actualizaciones;

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

public class ActualizacionesTarifaDao extends MantenimientoDao {
	
	private static String TABLA = "D_TARIFAS_ACT_CAB_TBL";
	private static String VISTA = "D_TARIFAS_ACT_CAB";
	
	private static Logger log = Logger.getMLogger(ActualizacionesTarifaDao.class);


	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, ParametrosBuscarActualizacionesTarifaBean param)
			throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		List<ActualizacionTarifaBean> resultados = new ArrayList<ActualizacionTarifaBean>();
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
				while (rs.next() &&  (contador < param.getTamañoPagina())) {
					ActualizacionTarifaBean actualizacion = new ActualizacionTarifaBean();
					actualizacion.setCodTar(rs.getString("CODTAR"));
					actualizacion.setIdActualizacion(rs.getLong("ID_ACTUALIZACION"));
					actualizacion.setDescripcion(rs.getString("DES_ACTUALIZACION"));
					actualizacion.setFechaPrevistaAplicacion(rs.getDate("FECHA_PREVISTA_APLICACION"));
					actualizacion.setIdGrupoImpuesto(rs.getLong("ID_GRUPO_IMPUESTOS"));
					actualizacion.setIdTratImpuestos(rs.getLong("ID_TRAT_IMPUESTOS"));
					resultados.add(actualizacion);
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
	
	public static ActualizacionTarifaBean consultar(Connection conn, ConfigEmpresaBean config,
			long idActualizacion) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ActualizacionTarifaBean actualizacion = null;
		String sql = null;

		sql = "SELECT CODTAR, DESTAR, VERSION, ID_ACTUALIZACION, DES_ACTUALIZACION, FECHA_PREVISTA_APLICACION," +
				" ID_GRUPO_IMPUESTOS, ID_TRAT_IMPUESTOS "
				+ "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), VISTA)
				+ "WHERE ID_ACTUALIZACION = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idActualizacion);
			
			log.debug("consultar() - " + pstmt);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				actualizacion = new ActualizacionTarifaBean();
				actualizacion.setCodTar(rs.getString("CODTAR"));
				actualizacion.setDesTar(rs.getString("DESTAR"));
				actualizacion.setVersion(rs.getLong("VERSION"));
				actualizacion.setIdActualizacion(rs.getLong("ID_ACTUALIZACION"));
				actualizacion.setDescripcion(rs.getString("DES_ACTUALIZACION"));
				actualizacion.setFechaPrevistaAplicacion(rs.getDate("FECHA_PREVISTA_APLICACION"));
				actualizacion.setIdGrupoImpuesto(rs.getLong("ID_GRUPO_IMPUESTOS"));
				actualizacion.setIdTratImpuestos(rs.getLong("ID_TRAT_IMPUESTOS"));
			}

			return actualizacion;
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
	
	private static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarActualizacionesTarifaBean param) {
		String sql = null;

		sql = "SELECT CODTAR, ID_ACTUALIZACION, DES_ACTUALIZACION, FECHA_PREVISTA_APLICACION, ID_GRUPO_IMPUESTOS, ID_TRAT_IMPUESTOS "
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
			ParametrosBuscarActualizacionesTarifaBean param) {
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

	private static String getClausulaWhere(ParametrosBuscarActualizacionesTarifaBean param) {
		String where = "";
		// CODTAR
		if (!param.getCodTarifa().isEmpty()) {
			where = "CODTAR='" + param.getCodTarifa() + "' ";
		}
		if (param.getIdActualizacion() != null){
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "ID_ACTUALIZACION ='" + param.getIdActualizacion() + "' ";
		}

		return where;
	}

	public static void insert(Connection conn, ConfigEmpresaBean config,
			ActualizacionTarifaBean actualizacion) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "(ID_ACTUALIZACION, CODTAR, DES_ACTUALIZACION, FECHA_PREVISTA_APLICACION) "
				+ "VALUES (?, ?, ?, ?)";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, actualizacion.getIdActualizacion());
			pstmt.setString(2, actualizacion.getCodTar());
			pstmt.setString(3, actualizacion.getDescripcion());
			pstmt.setDate(4, Fechas.toSqlDate(actualizacion.getFechaPrevistaAplicacion()));

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
			ActualizacionTarifaBean actualizacion) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "UPDATE "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "SET DES_ACTUALIZACION = ?, FECHA_PREVISTA_APLICACION = ? "
				+ "WHERE ID_ACTUALIZACION = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, actualizacion.getDescripcion());
			pstmt.setDate(2, Fechas.toSqlDate(actualizacion.getFechaPrevistaAplicacion()));
			pstmt.setLong(3, actualizacion.getIdActualizacion());

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
			ActualizacionTarifaBean actualizacion) throws SQLException {
		delete(conn, config, actualizacion.getIdActualizacion());
	}

	public static void delete(Connection conn, ConfigEmpresaBean config,
			Long idActualizacion) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "DELETE FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE ID_ACTUALIZACION = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idActualizacion);

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

}
