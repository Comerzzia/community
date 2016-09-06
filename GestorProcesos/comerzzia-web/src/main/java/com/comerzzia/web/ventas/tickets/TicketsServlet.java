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

package com.comerzzia.web.ventas.tickets;

import com.comerzzia.web.base.ControladorServlet;
import com.comerzzia.web.ventas.tickets.acciones.EditarTicketErroneoAccion;
import com.comerzzia.web.ventas.tickets.acciones.EjecutarAccion;
import com.comerzzia.web.ventas.tickets.acciones.EliminarTicketErroneoAccion;
import com.comerzzia.web.ventas.tickets.acciones.GuardarTicketErroneoAccion;
import com.comerzzia.web.ventas.tickets.acciones.LeerFormularioAccion;
import com.comerzzia.web.ventas.tickets.acciones.ProcesarTicketErroneoAccion;
import com.comerzzia.web.ventas.tickets.acciones.ProcesarTodosTicketsErroneosAccion;
import com.comerzzia.web.ventas.tickets.acciones.VerFormularioAccion;
import com.comerzzia.web.ventas.tickets.acciones.VerTicketErroneoAccion;


public class TicketsServlet extends ControladorServlet {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -5779102974753402078L;

	/* (non-Javadoc)
	 * @see com.comerzzia.web.base.ControladorServlet#loadAcciones()
	 */
	protected void loadAcciones() {
		añadirAccionDefault(new EjecutarAccion());
		añadirAccion(new VerFormularioAccion());
		añadirAccion(new LeerFormularioAccion());
		añadirAccion(new ProcesarTodosTicketsErroneosAccion());
		añadirAccion(new ProcesarTicketErroneoAccion());
		añadirAccion(new EliminarTicketErroneoAccion());
		añadirAccion(new EditarTicketErroneoAccion());
		añadirAccion(new VerTicketErroneoAccion());
		añadirAccion(new GuardarTicketErroneoAccion());
	}
}
