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

package com.comerzzia.servicios.tiendavirtual.categorizaciones;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.general.categorizaciones.CategorizacionBean;
import com.comerzzia.persistencia.tiendavirtual.categorizaciones.CategorizacionesTiendaVirtualDao;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioCategorizacionesTiendaVirtual {

	/**
	 * Logger
	 */
	protected static Logger log = Logger
			.getMLogger(ServicioCategorizacionesTiendaVirtual.class);

	public static List<CategorizacionBean> consultarPrimarias(DatosSesionTiendaVirtualBean datosSesion)
			throws CategorizacionTiendaVirtualException {
		Connection conn = new Connection();
		try {
			log.debug("consultarPrimarias() - Consultando categorizaciones primarias del almacén. " );
			conn.abrirConexion(Database.getConnection());
			return CategorizacionesTiendaVirtualDao.consultarCategoriasPrimarias(conn, datosSesion.getConfigTiendaVirtual());
		} 
		catch (SQLException e) {
			log.error("consultarPrimarias() - " + e.getMessage());
			String mensaje = "Error al consultar categorizaciones primarias del almacén : " + e.getMessage();
			throw new CategorizacionTiendaVirtualException(mensaje, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}

	public static List<CategorizacionBean> consultarSecundarias(DatosSesionTiendaVirtualBean datosSesion, String codCategoria) 
			throws CategorizacionTiendaVirtualException {
		Connection conn = new Connection();
		try {
			log.debug("consultarSecundarias() - Consultando categorizaciones secundarias del almacén.");
			conn.abrirConexion(Database.getConnection());
			return CategorizacionesTiendaVirtualDao.consultarCategoriasSecundarias(conn, datosSesion.getConfigTiendaVirtual(), codCategoria);
		} 
		catch (SQLException e) {
			log.error("consultarSecundarias() - " + e.getMessage());
			String mensaje = "Error al consultar categorizaciones secundarias del almacén: " + e.getMessage();
			throw new CategorizacionTiendaVirtualException(mensaje, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}

}
