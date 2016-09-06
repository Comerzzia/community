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

package com.comerzzia.servicios.estadisticas;

import java.util.HashMap;

public class TransaccionesNegocio {

	private Long numeroTicketsEmpresa = null;
	private Long numeroAlbaranesVentaEmpresa = null;
	private Long numeroAlbaranesCompraEmpresa = null;
	private Long numeroPedidosTiendaVirtual = null;
	private HashMap<String, Long> numeroTransaccionesVentaFormaPago = null;
	private HashMap<String, Long> numeroTransaccionesCompraFormaPago = null;
	private Double numeroLineasTickets = null;
	
	public Long getNumeroTicketsEmpresa() {
		return numeroTicketsEmpresa;
	}
	public void setNumeroTicketsEmpresa(Long numeroTicketsEmpresa) {
		this.numeroTicketsEmpresa = numeroTicketsEmpresa;
	}
	public Long getNumeroAlbaranesVentaEmpresa() {
		return numeroAlbaranesVentaEmpresa;
	}
	public void setNumeroAlbaranesVentaEmpresa(Long numeroAlbaranesVentaEmpresa) {
		this.numeroAlbaranesVentaEmpresa = numeroAlbaranesVentaEmpresa;
	}
	public Long getNumeroAlbaranesCompraEmpresa() {
		return numeroAlbaranesCompraEmpresa;
	}
	public void setNumeroAlbaranesCompraEmpresa(Long numeroAlbaranesCompraEmpresa) {
		this.numeroAlbaranesCompraEmpresa = numeroAlbaranesCompraEmpresa;
	}
	public Long getNumeroPedidosTiendaVirtual() {
		return numeroPedidosTiendaVirtual;
	}
	public void setNumeroPedidosTiendaVirtual(Long numeroPedidosTiendaVirtual) {
		this.numeroPedidosTiendaVirtual = numeroPedidosTiendaVirtual;
	}
	public Double getNumeroLineasTickets() {
		return numeroLineasTickets;
	}
	public void setNumeroLineasTickets(Double numeroLineasTickets) {
		this.numeroLineasTickets = numeroLineasTickets;
	}
	public HashMap<String, Long> getNumeroTransaccionesVentaFormaPago() {
		return numeroTransaccionesVentaFormaPago;
	}
	public void setNumeroTransaccionesVentaFormaPago(
			HashMap<String, Long> numeroTransaccionesVentaFormaPago) {
		this.numeroTransaccionesVentaFormaPago = numeroTransaccionesVentaFormaPago;
	}
	public HashMap<String, Long> getNumeroTransaccionesCompraFormaPago() {
		return numeroTransaccionesCompraFormaPago;
	}
	public void setNumeroTransaccionesCompraFormaPago(
			HashMap<String, Long> numeroTransaccionesCompraFormaPago) {
		this.numeroTransaccionesCompraFormaPago = numeroTransaccionesCompraFormaPago;
	}
}
