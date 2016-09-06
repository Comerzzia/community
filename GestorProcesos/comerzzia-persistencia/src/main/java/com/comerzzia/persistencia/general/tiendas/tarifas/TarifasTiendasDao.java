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

package com.comerzzia.persistencia.general.tiendas.tarifas;

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

public class TarifasTiendasDao extends MantenimientoDao {

	private static String TABLA = "D_TIENDAS_TARIFAS_TBL";
	private static String VISTA = "D_TIENDAS_TARIFAS";

	private static Logger log = Logger.getMLogger(TarifasTiendasDao.class);

	public static List<TarifaTiendaBean> consultar(Connection conn,
			ConfigEmpresaBean config, String codAlmacen) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		List<TarifaTiendaBean> lstTarifas = new ArrayList<TarifaTiendaBean>();

		sql = "SELECT CODALM, CODTAR, DESTAR, VERSION_TARIFA, FECHA_VERSION_TARIFA, VERSION_TARIFA_REV, FECHA_VERSION_TARIFA_REV "
				+ "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), VISTA)
				+ "WHERE CODALM = ? " + "ORDER BY CODTAR";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codAlmacen);

			log.debug("consultar() - " + pstmt);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TarifaTiendaBean tarifa = new TarifaTiendaBean();
				tarifa.setCodAlmacen(rs.getString("CODALM"));
				tarifa.setCodTarifa(rs.getString("CODTAR"));
				tarifa.setDesTarifa(rs.getString("DESTAR"));
				tarifa.setVersionTarifa(rs.getLong("VERSION_TARIFA"));
				tarifa.setFechaVersionTarifa(rs.getTimestamp("FECHA_VERSION_TARIFA"));
				tarifa.setVersionTarifaRevisada(rs.getLong("VERSION_TARIFA_REV"));
				tarifa.setFechaVersionTarifaRevisada(rs.getTimestamp("FECHA_VERSION_TARIFA_REV"));

				lstTarifas.add(tarifa);
			}

			return lstTarifas;
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
			TarifaTiendaBean tarifa) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "(CODALM, CODTAR, VERSION_TARIFA, FECHA_VERSION_TARIFA, VERSION_TARIFA_REV, FECHA_VERSION_TARIFA_REV) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, tarifa.getCodAlmacen());
			pstmt.setString(2, tarifa.getCodTarifa());
			pstmt.setLong(3, tarifa.getVersionTarifa());
			pstmt.setTimestamp(4, Fechas.toSqlTimestamp(tarifa.getFechaVersionTarifa()));
			pstmt.setLong(5, tarifa.getVersionTarifaRevisada());
			pstmt.setTimestamp(6, Fechas.toSqlTimestamp(tarifa.getFechaVersionTarifaRevisada()));

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

	public static void delete(Connection conn, ConfigEmpresaBean config,
			TarifaTiendaBean tarifa) throws SQLException {
		delete(conn, config, tarifa.getCodAlmacen(), tarifa.getCodTarifa());
	}

	public static void delete(Connection conn, ConfigEmpresaBean config,
			String codAlmacen, String codTarifa) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "DELETE FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE CODALM = ? AND CODTAR = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codAlmacen);
			pstmt.setString(2, codTarifa);

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

	public static void delete(Connection conn, ConfigEmpresaBean config,
			String codAlmacen) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "DELETE FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE CODALM = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codAlmacen);

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

	public static TarifaTiendaBean consultarTarifa(Connection conn,
			ConfigEmpresaBean config, String codAlmacen, String codTarifa) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;

		TarifaTiendaBean tarifa = null;
		
		sql = "SELECT CODALM, CODTAR, DESTAR, VERSION_TARIFA, FECHA_VERSION_TARIFA, VERSION_TARIFA_REV, FECHA_VERSION_TARIFA_REV "
				+ "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), VISTA)
				+ "WHERE CODALM = ?  AND CODTAR = ? " 
				+ "ORDER BY CODTAR";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codAlmacen);
			pstmt.setString(2, codTarifa);

			log.debug("consultarTarifa() - " + sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				tarifa = new TarifaTiendaBean();
				tarifa.setCodAlmacen(rs.getString("CODALM"));
				tarifa.setCodTarifa(rs.getString("CODTAR"));
				tarifa.setDesTarifa(rs.getString("DESTAR"));
				tarifa.setVersionTarifa(rs.getLong("VERSION_TARIFA"));
				tarifa.setFechaVersionTarifa(rs.getTimestamp("FECHA_VERSION_TARIFA"));
				tarifa.setVersionTarifaRevisada(rs.getLong("VERSION_TARIFA_REV"));
				tarifa.setFechaVersionTarifaRevisada(rs.getTimestamp("FECHA_VERSION_TARIFA_REV"));
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

	public static void update(Connection conn, ConfigEmpresaBean config,
			TarifaTiendaBean tarifa) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET VERSION_TARIFA = ?, VERSION_TARIFA_REV = ?, "
			+ "FECHA_VERSION_TARIFA = ?, FECHA_VERSION_TARIFA_REV = ? "
		    + "WHERE CODALM = ? AND CODTAR = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	
        	pstmt.setLong(1, tarifa.getVersionTarifa());
        	pstmt.setLong(2, tarifa.getVersionTarifaRevisada());
        	pstmt.setTimestamp(3, Fechas.toSqlTimestamp(tarifa.getFechaVersionTarifa()));
        	pstmt.setTimestamp(4, Fechas.toSqlTimestamp(tarifa.getFechaVersionTarifaRevisada()));
        	pstmt.setString(5, tarifa.getCodAlmacen());
        	pstmt.setString(6, tarifa.getCodTarifa());
        	
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
}
