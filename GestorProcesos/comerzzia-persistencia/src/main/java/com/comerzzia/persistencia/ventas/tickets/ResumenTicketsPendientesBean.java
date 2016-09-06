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

import java.util.Date;

import com.comerzzia.util.base.MantenimientoBean;

/**
 * Número de tickets pendientes de una alamacén en una fecha determinada
 *
 */
public class ResumenTicketsPendientesBean extends MantenimientoBean {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -7116114394054916049L;
	
	private String codAlmacen;
	private String desAlmacen;
	private Date fecha;
	private Long numTickets;
	
	
	/**
	 * @return the codAlmacen
	 */
	public String getCodAlmacen() {
		return codAlmacen;
	}
	
	/**
	 * @param codAlmacen the codAlmacen to set
	 */
	public void setCodAlmacen(String codAlmacen) {
		this.codAlmacen = codAlmacen;
	}
	
	/**
	 * @return the desAlmacen
	 */
	public String getDesAlmacen() {
		return desAlmacen;
	}
	
	/**
	 * @param desAlmacen the desAlmacen to set
	 */
	public void setDesAlmacen(String desAlmacen) {
		this.desAlmacen = desAlmacen;
	}
	
	/**
	 * @return the fecha
	 */
	public Date getFecha() {
		return fecha;
	}
	
	/**
	 * @param fecha the fecha to set
	 */
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
	/**
	 * @return the numTickets
	 */
	public Long getNumTickets() {
		return numTickets;
	}
	
	/**
	 * @param numTickets the numTickets to set
	 */
	public void setNumTickets(Long numTickets) {
		this.numTickets = numTickets;
	}

	@Override
	protected void initNuevoBean() {
	}
}
