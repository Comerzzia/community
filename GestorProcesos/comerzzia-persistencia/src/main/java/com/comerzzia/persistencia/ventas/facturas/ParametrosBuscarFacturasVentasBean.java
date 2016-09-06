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

package com.comerzzia.persistencia.ventas.facturas;

import java.util.Date;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarFacturasVentasBean extends ParametrosBuscarBean {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -1591139329721107348L;
	
	private Long periodo = null;
	private String codSerie = "";
	private Long numFac = null;
	private String codCli = "";
	private String desCli = "";
	private String referencia = "";
	private Date fechaDesde = null;
	private Date fechaHasta = null;
	private boolean buscarPorFechaDesde = false;
	private boolean buscarPorFechaHasta = false;

	/**
	 * Constructor
	 */
	public ParametrosBuscarFacturasVentasBean() {
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

	public Long getNumFac() {
		return numFac;
	}

	public void setNumFac(Long numFac) {
		this.numFac = numFac;
	}

	public String getCodCli() {
		return codCli;
	}

	public void setCodCli(String codCli) {
		this.codCli = (codCli !=null) ? codCli.toUpperCase() : "";
	}

	public String getDesCli() {
		return desCli;
	}

	public void setDesCli(String desCli) {
		this.desCli = (desCli !=null) ? desCli : "";
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
