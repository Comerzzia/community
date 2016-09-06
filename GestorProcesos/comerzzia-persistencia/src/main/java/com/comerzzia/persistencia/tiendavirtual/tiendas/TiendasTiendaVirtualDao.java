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

package com.comerzzia.persistencia.tiendavirtual.tiendas;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.comerzzia.persistencia.tiendavirtual.config.ConfigTiendaVirtualBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class TiendasTiendaVirtualDao extends MantenimientoDao {

	private static String VISTA = "T_TIENDAS_CAJAS";

	private static Logger log = Logger.getMLogger(TiendasTiendaVirtualDao.class);

	public static TiendaVirtualBean consultar(Connection conn,
			ConfigTiendaVirtualBean config, String uidTpv) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TiendaVirtualBean tienda = null;
		String sql = null;

		sql = "SELECT CODALM, UID_TPV, CONFIGURACION, CLIENTE_POR_DEFECTO "
				+ "FROM "
				+ getNombreElemento(config.getEsquemaTiendaVirtual(), VISTA)
				+ "WHERE UID_TPV = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, uidTpv);
			log.debug("consultar() - " + pstmt);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				tienda = new TiendaVirtualBean();
				tienda.setCodAlmacen(rs.getString("CODALM"));
				tienda.setUidTpv(rs.getString("UID_TPV"));
				tienda.setConfiguracion(rs.getBytes("CONFIGURACION"));
				tienda.setClientePorDefecto(rs.getString("CLIENTE_POR_DEFECTO"));
			}
			return tienda;
		} 
		finally {
			try {
				rs.close();
			} 
			catch (Exception ignore) {}
			try {
				pstmt.close();
			} 
			catch (Exception ignore) {}
		}
	}
}
