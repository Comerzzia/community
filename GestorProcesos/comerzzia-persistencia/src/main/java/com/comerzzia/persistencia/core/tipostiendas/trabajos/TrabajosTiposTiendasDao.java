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

package com.comerzzia.persistencia.core.tipostiendas.trabajos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class TrabajosTiposTiendasDao extends MantenimientoDao {

	private static String TABLA = "CONFIG_TIENDAS_TIPOS_TRAB_TBL";

	private static Logger log = Logger.getMLogger(TrabajosTiposTiendasDao.class);

	public static List<TrabajoTipoTiendaBean> consultar(Connection conn, Long idTipoTienda) 
			throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<TrabajoTipoTiendaBean> trabajos = new ArrayList<TrabajoTipoTiendaBean>();
		String sql = null;

		sql = "SELECT ID_TIPO_TIENDA, TRABAJO, CLASE, INTERVALO "
				+ "FROM " + getNombreElementoConfiguracion(TABLA)
				+ "WHERE ID_TIPO_TIENDA = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idTipoTienda);
			log.debug("consultar() - " + pstmt);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				TrabajoTipoTiendaBean trabajo = new TrabajoTipoTiendaBean();
				trabajo.setIdTipoTienda(rs.getLong("ID_TIPO_TIENDA"));
				trabajo.setTrabajo(rs.getString("TRABAJO"));
				trabajo.setClase(rs.getString("CLASE"));
				trabajo.setIntervalo(rs.getString("INTERVALO"));
				
				trabajos.add(trabajo);
			}

			return trabajos;
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
