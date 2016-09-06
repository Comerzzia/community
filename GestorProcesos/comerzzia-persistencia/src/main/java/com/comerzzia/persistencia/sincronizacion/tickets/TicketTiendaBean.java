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

package com.comerzzia.persistencia.sincronizacion.tickets;

import java.util.Date;

import com.comerzzia.persistencia.ventas.tickets.TicketBean;


public class TicketTiendaBean extends TicketBean {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -996200271821730653L;
	
	private boolean enviado = false;
	private Date fechaEnvio = null;
	
	
	/**
	 * Constructor
	 */
	public TicketTiendaBean() {
		super();
	}
	

	/**
	 * @return the enviado
	 */
	public boolean isEnviado() {
		return enviado;
	}


	/**
	 * @param enviado the enviado to set
	 */
	public void setEnviado(boolean enviado) {
		this.enviado = enviado;
	}
	
	
	public void setEnviado(String enviado) {
		this.enviado = (enviado == TRUE);
	}
	
	
	public String getEnviado() {
		return (enviado) ? TRUE : FALSE;
	}


	/**
	 * @return the fechaEnvio
	 */
	public Date getFechaEnvio() {
		return fechaEnvio;
	}


	/**
	 * @param fechaEnvio the fechaEnvio to set
	 */
	public void setFechaEnvio(Date fechaEnvio) {
		this.fechaEnvio = fechaEnvio;
	}
}
