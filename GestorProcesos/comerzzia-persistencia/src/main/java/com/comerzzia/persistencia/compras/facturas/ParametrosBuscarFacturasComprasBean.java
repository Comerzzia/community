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

package com.comerzzia.persistencia.compras.facturas;

import java.util.Date;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarFacturasComprasBean extends ParametrosBuscarBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4436631439150005131L;

	private Long periodo = null;
	private String codSerie = "";
	private Long numFactura = null;
	private String codProveedor = "";
	private String desProveedor = "";
	private String referencia = "";
	private Date fechaDesde = null;
	private Date fechaHasta = null;
	private boolean buscarPorFechaDesde = false;
	private boolean buscarPorFechaHasta = false;

	/**
	 * Constructor
	 */
	public ParametrosBuscarFacturasComprasBean() {
		super.setOrden("FECHA DESC");
	}

	public Long getPeriodo() {
		return periodo;
	}

	public void setPeriodo(Long periodo) {
		this.periodo = periodo;
	}

	public String getCodSerie() {
		return codSerie;
	}

	public void setCodSerie(String codSerie) {
		this.codSerie = (codSerie !=null) ? codSerie.toUpperCase() : "";
	}

	public Long getNumFactura() {
		return numFactura;
	}

	public void setNumFactura(Long numFactura) {
		this.numFactura = numFactura;
	}

	public String getCodProveedor() {
		return codProveedor;
	}

	public void setCodProveedor(String codProveedor) {
		this.codProveedor = (codProveedor !=null) ? codProveedor.toUpperCase() : "";
	}

	public String getDesProveedor() {
		return desProveedor;
	}

	public void setDesProveedor(String desProveedor) {
		this.desProveedor = (desProveedor !=null) ? desProveedor : "";
	}

	public String getReferencia() {
		return referencia;
	}

	public void setReferencia(String referencia) {
		this.referencia = (referencia !=null) ? referencia : "";
	}

	public Date getFechaDesde() {
		return fechaDesde;
	}

	public void setFechaDesde(Date fechaDesde) {
		this.fechaDesde = fechaDesde;
	}

	public Date getFechaHasta() {
		return fechaHasta;
	}

	public void setFechaHasta(Date fechaHasta) {
		this.fechaHasta = fechaHasta;
	}

	public boolean isBuscarPorFechaDesde() {
		return buscarPorFechaDesde;
	}

	public void setBuscarPorFechaDesde(boolean buscarPorFechaDesde) {
		this.buscarPorFechaDesde = buscarPorFechaDesde;
	}

	public boolean isBuscarPorFechaHasta() {
		return buscarPorFechaHasta;
	}

	public void setBuscarPorFechaHasta(boolean buscarPorFechaHasta) {
		this.buscarPorFechaHasta = buscarPorFechaHasta;
	}

}
