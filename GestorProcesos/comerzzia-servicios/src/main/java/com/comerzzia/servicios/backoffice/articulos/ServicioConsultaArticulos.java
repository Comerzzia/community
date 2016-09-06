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

package com.comerzzia.servicios.backoffice.articulos;

import java.sql.SQLException;

import com.comerzzia.persistencia.backoffice.articulos.ConsultaArticulosDao;
import com.comerzzia.persistencia.backoffice.articulos.ParametrosBuscarConsultaArticulosBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioConsultaArticulos {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioConsultaArticulos.class);
	
	
	public static PaginaResultados consultar(ParametrosBuscarConsultaArticulosBean param, DatosSesionBean datosSesion) throws ConsultaArticulosException{
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando artículos");
			conn.abrirConexion(Database.getConnection());
			return ConsultaArticulosDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			String mensaje = "Error al consultar artículos: " +  e.getMessage();
			log.error("consultar() - " + mensaje);			
			
            throw new ConsultaArticulosException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
