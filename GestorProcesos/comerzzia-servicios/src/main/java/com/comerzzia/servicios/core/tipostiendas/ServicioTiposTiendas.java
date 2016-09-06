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

package com.comerzzia.servicios.core.tipostiendas;

import java.sql.SQLException;

import com.comerzzia.persistencia.core.tipostiendas.TipoTiendaBean;
import com.comerzzia.persistencia.core.tipostiendas.TiposTiendasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioTiposTiendas {

	protected static Logger log = Logger.getMLogger(ServicioTiposTiendas.class);

	public static TipoTiendaBean consultar(Long idTipoTienda,
			DatosSesionBean datosSesion) throws TipoTiendaException,
			TipoTiendaNotFoundException {

		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos del tipo de tienda: "
					+ idTipoTienda);

			conn.abrirConexion(Database.getConnection());

			TipoTiendaBean tiendaTipo = TiposTiendasDao.consultar(conn,
					datosSesion.getConfigEmpresa(), idTipoTienda);

			if (tiendaTipo == null) {
				String msg = "No se ha encontrado el tipo de tienda con identificador: "
						+ idTipoTienda;
				log.info("consultar() - " + msg);
				throw new TipoTiendaNotFoundException(msg);
			}

			return tiendaTipo;
		} catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un tipo de tienda: "
					+ e.getMessage();

			throw new TipoTiendaException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}
}
