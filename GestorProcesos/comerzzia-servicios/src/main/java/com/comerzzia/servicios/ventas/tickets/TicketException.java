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

package com.comerzzia.servicios.ventas.tickets;

import com.comerzzia.util.base.Exception;

public class TicketException extends Exception {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -6284695080640115110L;

	public TicketException() {
		super();
	}

	public TicketException(String msg) {
		super(msg);
	}

	public TicketException(String msg, Throwable e) {
		super(msg, e);
	}

	public TicketException(String msg, String msgKey, Throwable e) {
		super(msg, msgKey, e);
	}

	public TicketException(String msg, String msgKey) {
		super(msg, msgKey);
	}
}
