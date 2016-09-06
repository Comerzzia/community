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

package com.comerzzia.servicios.core.tipostiendas.trabajos;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.core.tipostiendas.trabajos.TrabajoTipoTiendaBean;
import com.comerzzia.persistencia.core.tipostiendas.trabajos.TrabajosTiposTiendasDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.log.Logger;

public class ServicioTrabajosTiposTiendas {

	protected static Logger log = Logger.getMLogger(ServicioTrabajosTiposTiendas.class);

	public static List<TrabajoTipoTiendaBean> consultar(Long idTipoTienda, Connection conn) 
			throws TrabajoTipoTiendaException {

		try {
			log.debug("consultar() - Consultando trabajos del tipo de tienda: " + idTipoTienda);

			return TrabajosTiposTiendasDao.consultar(conn, idTipoTienda);
		} 
		catch(SQLException e){
			String msg = "Error consultando trabajos: " + e.getMessage();
    		log.error("consultar() - " + msg);
    		
    		throw new TrabajoTipoTiendaException(msg, e);
		}
	}
}
