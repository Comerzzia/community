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

package com.comerzzia.persistencia.core.menu;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.acciones.AccionBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class MenuDao extends MantenimientoDao {

	private static String VISTA = "CONFIG_MENU";

	private static Logger log = Logger.getMLogger(MenuDao.class);

	/**
	 * Obtiene el menú de la aplicación indicada
	 * 
	 * @param conn
	 * @param sesion
	 * @param aplicacion
	 *            Nombre de la aplicación
	 * @return Menú de la aplicación
	 * @throws SQLException
	 */
	public static MenuBean consultar(Connection conn, String aplicacion)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MenuBean menu = new MenuBean();
		String sql = null;

		sql = "SELECT OPCION, ORDEN, ID_ACCION, TIPO_ACCION, EJECUCION, "
				+ "PARAMETROS, DESCRIPCION, TITULO, ICONO "
				+ "FROM "
				+ getNombreElementoConfiguracion(VISTA)
				+ "WHERE APLICACION = ? " + "ORDER BY ORDEN";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, aplicacion);
			log.debug("consultar() - " + pstmt);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				AccionBean accion = new AccionBean();
				accion.setIdAccion(rs.getLong("ID_ACCION"));
				accion.setTipoAccion(rs.getString("TIPO_ACCION"));
				accion.setEjecucion(rs.getString("EJECUCION"));
				accion.setParametros(rs.getString("PARAMETROS"));
				accion.setDescripcion(rs.getString("DESCRIPCION"));
				accion.setTitulo(rs.getString("TITULO"));
				accion.setIcono(rs.getString("ICONO"));

				MenuItemBean menuItem = new MenuItemBean();
				menuItem.setOpcion(rs.getString("OPCION"));
				menuItem.setOrden(rs.getInt("ORDEN"));
				menuItem.setAccion(accion);

				menu.add(menuItem);
			}

			return menu;
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

	/**
	 * Obtiene una lista de aplicaciones.
	 * 
	 * @param conn
	 * @return Lista de aplicaciones
	 * @throws SQLException
	 */
	public static List<String> consultarAplicaciones(Connection conn)
			throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = null;
		List<String> lista = new ArrayList<String>();

		sql = "SELECT DISTINCT APLICACION "
				+ "FROM "
				+ getNombreElementoConfiguracion(VISTA)
				+ "WHERE TIPO_ACCION = 'URL' " + "ORDER BY APLICACION";

		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			log.debug("consultar() - " + sql);
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				lista.add(rs.getString("APLICACION"));
			}

			return lista;
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
}
