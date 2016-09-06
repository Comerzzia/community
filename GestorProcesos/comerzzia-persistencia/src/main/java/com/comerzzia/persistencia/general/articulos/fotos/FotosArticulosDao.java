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

package com.comerzzia.persistencia.general.articulos.fotos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class FotosArticulosDao extends MantenimientoDao {

	protected static final String TABLA = "D_ARTICULOS_FOTO_TBL";

	/** Logger */
	protected static Logger log = Logger.getMLogger(FotosArticulosDao.class);

	public static List<FotoArticuloBean> consultar(Connection conn,
			ConfigEmpresaBean config, String codArticulo) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<FotoArticuloBean> listaFotos = new ArrayList<FotoArticuloBean>();
		String sql = null;

		sql = "SELECT CODART, TIPO_FOTO, FOTO " + "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE CODART = ? ORDER BY TIPO_FOTO DESC";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codArticulo);
			log.debug("consultar() - " + pstmt);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				FotoArticuloBean foto = new FotoArticuloBean();
				foto.setCodArticulo(codArticulo);
				foto.setTipoFoto(rs.getString("TIPO_FOTO"));
				foto.setFoto(rs.getBytes("FOTO"));

				listaFotos.add(foto);
			}

			return listaFotos;
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

	public static FotoArticuloBean consultar(Connection conn,
			ConfigEmpresaBean config, String codArticulo, String tipoFoto)
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;

		FotoArticuloBean foto = null;

		sql = "SELECT CODART, TIPO_FOTO, FOTO " + "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE CODART = ? AND TIPO_FOTO = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codArticulo);
			pstmt.setString(2, tipoFoto);

			log.debug("consultar() - " + pstmt);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				foto = new FotoArticuloBean();
				foto.setCodArticulo(codArticulo);
				foto.setTipoFoto(rs.getString("TIPO_FOTO"));
				foto.setFoto(rs.getBytes("FOTO"));
			}

			return foto;
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
			FotoArticuloBean foto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "(CODART, TIPO_FOTO, FOTO) " + "VALUES (?, ?, ?)";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, foto.getCodArticulo());
			pstmt.setString(2, foto.getTipoFoto());
			pstmt.setBytes(3, foto.getFoto());

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
			FotoArticuloBean foto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "SET FOTO = ? " + "WHERE CODART = ? AND TIPO_FOTO = ? ";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setBytes(1, foto.getFoto());
			pstmt.setString(2, foto.getCodArticulo());
			pstmt.setString(3, foto.getTipoFoto());

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
			FotoArticuloBean foto) throws SQLException {
		delete(conn, config, foto.getCodArticulo(), foto.getTipoFoto());
	}

	public static void delete(Connection conn, ConfigEmpresaBean config,
			String codArticulo, String tipoFoto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "DELETE FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE CODART = ? AND TIPO_FOTO = ? ";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codArticulo);
			pstmt.setString(2, tipoFoto);

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
			String codArticulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "DELETE FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE CODART = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codArticulo);

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
