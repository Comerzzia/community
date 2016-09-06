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

package com.comerzzia.persistencia.tesoreria.remesas.cobros;

import java.util.Date;

import com.comerzzia.persistencia.core.estados.Estados;
import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarRemesasCobrosBean extends ParametrosBuscarBean {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -6922903628200087820L;

	private String codBanco = "";
	private String desBanco = "";
	private Date fechaDesde = null;
	private boolean buscarPorFechaDesde = false;
	private Date fechaHasta = null;
	private boolean buscarPorFechaHasta = false;

	private Estados estados = null;

	
	public ParametrosBuscarRemesasCobrosBean() {
		super.setOrden("ID_REMESA DESC");
	}
	
	public String getCodBanco() {
		return codBanco;
	}

	public void setCodBanco(String codBanco) {
		this.codBanco = (codBanco != null) ?  codBanco.toUpperCase() : "";
	}

	public String getDesBanco() {
		return desBanco;
	}

	public void setDesBanco(String desBanco) {
		this.desBanco = (desBanco != null) ?  desBanco.toUpperCase() : "";
	}

	public Date getFechaDesde() {
		return fechaDesde;
	}

	public void setFechaDesde(Date fechaDesde) {
		this.fechaDesde = fechaDesde;
	}

	public boolean isBuscarPorFechaDesde() {
		return buscarPorFechaDesde;
	}

	public void setBuscarPorFechaDesde(boolean buscarPorFechaDesde) {
		this.buscarPorFechaDesde = buscarPorFechaDesde;
	}

	public Date getFechaHasta() {
		return fechaHasta;
	}

	public void setFechaHasta(Date fechaHasta) {
		this.fechaHasta = fechaHasta;
	}

	public boolean isBuscarPorFechaHasta() {
		return buscarPorFechaHasta;
	}

	public void setBuscarPorFechaHasta(boolean buscarPorFechaHasta) {
		this.buscarPorFechaHasta = buscarPorFechaHasta;
	}

	public Estados getEstados() {
		return estados;
	}

	public void setEstados(Estados estados) {
		this.estados = estados;
	}
}
