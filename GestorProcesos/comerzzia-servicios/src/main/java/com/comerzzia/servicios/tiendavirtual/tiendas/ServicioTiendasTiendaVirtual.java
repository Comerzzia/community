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

package com.comerzzia.servicios.tiendavirtual.tiendas;

import java.sql.SQLException;

import com.comerzzia.persistencia.tiendavirtual.tiendas.TiendaVirtualBean;
import com.comerzzia.persistencia.tiendavirtual.tiendas.TiendasTiendaVirtualDao;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioTiendasTiendaVirtual {

	protected static Logger log = Logger.getMLogger(ServicioTiendasTiendaVirtual.class);

	public static TiendaVirtualBean consultar(String uidTpv, DatosSesionTiendaVirtualBean datosSesion)
			throws TiendaVirtualException, TiendaVirtualNotFoundException {
		Connection conn = new Connection();
		try {
			log.debug("consultar() - Consultando datos de la tienda: " + uidTpv);
			conn.abrirConexion(Database.getConnection());
			TiendaVirtualBean tienda = TiendasTiendaVirtualDao.consultar(conn, datosSesion.getConfigTiendaVirtual(), uidTpv);
			if (tienda == null) {
				String msg = "No se ha encontrado la tienda con identificador: " + uidTpv;
				log.info("consultar() - " + msg);
				throw new TiendaVirtualNotFoundException(msg);
			}
			return tienda;
		} 
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de una tienda: " + e.getMessage();
			throw new TiendaVirtualException(mensaje, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}
}
