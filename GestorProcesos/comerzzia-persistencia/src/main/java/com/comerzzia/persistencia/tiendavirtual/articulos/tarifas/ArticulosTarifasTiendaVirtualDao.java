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

package com.comerzzia.persistencia.tiendavirtual.articulos.tarifas;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.comerzzia.persistencia.tiendavirtual.config.ConfigTiendaVirtualBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class ArticulosTarifasTiendaVirtualDao extends MantenimientoDao {

	private static String TABLA = "T_TARIFAS_DET_TBL";

	private static Logger log = Logger
			.getMLogger(ArticulosTarifasTiendaVirtualDao.class);

	public static ArticuloTarifaTiendaVirtualBean consultar(Connection conn, ConfigTiendaVirtualBean config, String codTarifia, String codArticulo) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArticuloTarifaTiendaVirtualBean tarifa = null;
		String sql = null;

		sql = "SELECT CODALM, CODTAR, CODART, PRECIO_VENTA " + "FROM "
				+ getNombreElemento(config.getEsquemaTiendaVirtual(), TABLA)
				+ "WHERE CODALM = ? AND CODTAR = ? AND CODART = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, config.getCodAlmacen());
			pstmt.setString(2, codTarifia);
			pstmt.setString(3, codArticulo);
			log.debug("consultar() - " + pstmt);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				tarifa = new ArticuloTarifaTiendaVirtualBean();
				tarifa.setCodAlmacen(rs.getString("CODALM"));
				tarifa.setCodTarifa(rs.getString("CODTAR"));
				tarifa.setCodArticulo(rs.getString("CODART"));
				tarifa.setPrecioVenta(rs.getDouble("PRECIO_VENTA"));
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
}
