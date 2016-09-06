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

package com.comerzzia.servicios.tiendavirtual.mediospago;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.general.mediospago.MedioPagoBean;
import com.comerzzia.persistencia.tiendavirtual.mediospago.MediosPagoDao;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioMediosPago {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioMediosPago.class);

	public static List<MedioPagoBean> consultar(DatosSesionTiendaVirtualBean datosSesion)
			throws MedioPagoException {
		Connection conn = new Connection();
		try {
			log.debug("consultar() - Consultando medios de pago de la tienda virtual. " );
			conn.abrirConexion(Database.getConnection());
			return MediosPagoDao.consultar(conn, datosSesion.getConfigTiendaVirtual());
		} 
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar medios de pago de la tienda virtual : " + e.getMessage();
			throw new MedioPagoException(mensaje, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}

}
