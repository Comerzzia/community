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

package com.comerzzia.servicios.ventas.tickets.historico;

import java.sql.SQLException;

import com.comerzzia.persistencia.ventas.tickets.historico.HistoricoTicketsDao;
import com.comerzzia.persistencia.ventas.tickets.historico.ParametrosBuscarHistoricoTicketsBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.util.xml.XMLDocumentException;

public class ServicioHistoricoTickets {

	protected static Logger log = Logger.getMLogger(ServicioHistoricoTickets.class);

	public static PaginaResultados consultar(ParametrosBuscarHistoricoTicketsBean param, DatosSesionBean datosSesion) throws HistoricoTicketException{
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando histórico de tickets");

			conn.abrirConexion(Database.getConnection());
			return HistoricoTicketsDao.consultarResumen(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar histórico de tickets: " +  e.getMessage();
			
            throw new HistoricoTicketException(mensaje, e);
            
		} 
		catch (XMLDocumentException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar histórico de tickets: " +  e.getMessage();
			
			throw new HistoricoTicketException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

}
