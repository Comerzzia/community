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

package com.comerzzia.persistencia.ventas.tickets;

import java.io.ByteArrayInputStream;
import java.util.Date;

import org.w3c.dom.Document;

import com.comerzzia.util.base.MantenimientoBean;
import com.comerzzia.util.xml.XMLDocumentException;
import com.comerzzia.util.xml.XMLDocumentUtils;


public class TicketBean extends MantenimientoBean {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1202374998917436657L;
	
	private String uidTicket = null;
	private String codAlmacen;
	private String desAlmacen;
	private Long idTicket;
	private byte[] ticket;
	private Date fecha;
	
	
	protected void initNuevoBean() {
	}
	
	/**
	 * @return the uidTicket
	 */
	public String getUidTicket() {
		return uidTicket;
	}

	/**
	 * @param uidTicket the uidTicket to set
	 */
	public void setUidTicket(String uidTicket) {
		this.uidTicket = uidTicket;
	}

	public String getCodAlmacen() {
		return codAlmacen;
	}

	public void setCodAlmacen(String codAlmacen) {
		this.codAlmacen = codAlmacen;
	}

	public String getDesAlmacen() {
		return desAlmacen;
	}

	public void setDesAlmacen(String desAlmacen) {
		this.desAlmacen = desAlmacen;
	}

	public Long getIdTicket() {
		return idTicket;
	}

	public void setIdTicket(Long idTicket) {
		this.idTicket = idTicket;
	}
	
	public byte[] getTicket() {
		return ticket;
	}

	public void setTicket(byte[] ticket) {
		this.ticket = ticket;
	}
	
	public Document getXml() throws XMLDocumentException {
		try {
			return XMLDocumentUtils.createDocumentBuilder().parse(new ByteArrayInputStream(this.ticket));
		} 
		catch (Exception e) {
			throw new XMLDocumentException("Error al obtener el XML del Ticket: " + e.getMessage(), e);
		} 
	}
	
	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
}
