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

package com.comerzzia.persistencia.core.tipostiendas;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class TiposTiendasDao extends MantenimientoDao {

	private static String TABLA = "CONFIG_TIENDAS_TIPOS_TBL";

	private static Logger log = Logger.getMLogger(TiposTiendasDao.class);

	public static TipoTiendaBean consultar(Connection conn,
			ConfigEmpresaBean config, Long idTipoTienda) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TipoTiendaBean tiendaTipo = null;
		String sql = null;

		sql = "SELECT ID_TIPO_TIENDA, DESTIPO_TIENDA, CLASE_CONFIGURACION, CLASE_SINCRONIZACION "
				+ "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE ID_TIPO_TIENDA = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idTipoTienda);
			log.debug("consultar() - " + pstmt);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				tiendaTipo = new TipoTiendaBean();
				tiendaTipo.setIdTipoTienda(rs.getLong("ID_TIPO_TIENDA"));
				tiendaTipo.setDesTipoTienda(rs.getString("DESTIPO_TIENDA"));
				tiendaTipo.setClaseConfiguracion(rs
						.getString("CLASE_CONFIGURACION"));
				tiendaTipo.setClaseSincronizacion(rs
						.getString("CLASE_SINCRONIZACION"));
			}

			return tiendaTipo;
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
}
