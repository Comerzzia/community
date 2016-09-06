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

package com.comerzzia.persistencia.tiendavirtual.categorizaciones;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.general.categorizaciones.CategorizacionBean;
import com.comerzzia.persistencia.tiendavirtual.config.ConfigTiendaVirtualBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.log.Logger;

public class CategorizacionesTiendaVirtualDao extends MantenimientoDao {

	private static String VISTA = "T_CATEGORIZACION";

	private static Logger log = Logger
			.getMLogger(CategorizacionesTiendaVirtualDao.class);

	public static List<CategorizacionBean> consultarCategoriasPrimarias(Connection conn, ConfigTiendaVirtualBean config)
			throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		List<CategorizacionBean> resultados = new ArrayList<CategorizacionBean>();

		String sql = "SELECT CODCAT, DESCAT, ACTIVO " + "FROM "
				+ getNombreElemento(config.getEsquemaTiendaVirtual(), VISTA)
				+ "WHERE ACTIVO = 'S' " + "AND CODALM = '" + config.getCodAlmacen()
				+ "' AND LENGTH(CODCAT) = 2";

		try {
			stmt = conn.createStatement();

			log.debug("consultarCategoriasPrimarias() - " + sql);
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				CategorizacionBean categorizacion = new CategorizacionBean();
				categorizacion.setCodCat(rs.getString("CODCAT"));
				categorizacion.setDesCat(rs.getString("DESCAT"));
				resultados.add(categorizacion);
			}
			return resultados;
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

	public static List<CategorizacionBean> consultarCategoriasSecundarias(Connection conn, ConfigTiendaVirtualBean config, String codCatPadre) 
			throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		List<CategorizacionBean> resultados = new ArrayList<CategorizacionBean>();

		String sql = "SELECT CODCAT, DESCAT, ACTIVO " + "FROM "
				+ getNombreElemento(config.getEsquemaTiendaVirtual(), VISTA)
				+ "WHERE ACTIVO = 'S' " + "AND LENGTH(CODCAT) > 2 "
				+ "AND CODCAT_PADRE = '" + codCatPadre + "' AND CODALM = '"
				+ config.getCodAlmacen() + "'";

		try {
			stmt = conn.createStatement();

			log.debug("consultarCategoriasSecundarias() - " + sql);
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				CategorizacionBean categorizacion = new CategorizacionBean();
				categorizacion.setCodCat(rs.getString("CODCAT"));
				categorizacion.setDesCat(rs.getString("DESCAT"));
				resultados.add(categorizacion);
			}
			return resultados;
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
