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

package com.comerzzia.persistencia.ventas.tickets.historico;

import java.util.Date;

import com.comerzzia.persistencia.ventas.tickets.TicketBean;

public class HistoricoTicketBean extends TicketBean {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1202374998917436657L;
	
	private Date fechaProceso;

	
	public HistoricoTicketBean() {
	}
	
	public HistoricoTicketBean(TicketBean ticket) {
		this.setUidTicket(ticket.getUidTicket());
		this.setCodAlmacen(ticket.getCodAlmacen());
		this.setDesAlmacen(ticket.getDesAlmacen());
		this.setIdTicket(ticket.getIdTicket());
		this.setFecha(ticket.getFecha());
		this.setTicket(ticket.getTicket());
	}
	
	protected void initNuevoBean() {	
	}

	public Date getFechaProceso() {
		return fechaProceso;
	}

	public void setFechaProceso(Date fechaProceso) {
		this.fechaProceso = fechaProceso;
	}
}
