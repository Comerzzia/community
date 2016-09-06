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

package com.comerzzia.persistencia.tesoreria.cobros;

import java.util.Date;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarDocumentosCobrosBean extends ParametrosBuscarBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5461201092007324706L;
	
	// Parámetros para la búsqueda de documentos de cobros.
	private String codCliente = "";
	private String desCliente = "";
	private	boolean verRemesados = false;
	
	/* Parámetros para la búqueda de documentos para una remesa */
	private String codTipoEfectoDesde = "";
	private String desTipoEfectoDesde = "";
	private String codTipoEfectoHasta = "";
	private String desTipoEfectoHasta = "";
	private Date fechaDesde = null;
	private boolean buscarPorFechaDesde = false;
	private Date fechaHasta = null;
	private boolean buscarPorFechaHasta = false;
	
	private Date fechaVencimientoDesde = null;
	private Date fechaVencimientoHasta = null;
	
	
	public ParametrosBuscarDocumentosCobrosBean() {
		super.setOrden("FECHA_VENCIMIENTO");
	}
	
	public String getCodCliente() {
		return codCliente;
	}
	public void setCodCliente(String codCliente) {
		this.codCliente = (codCliente != null) ?  codCliente.toUpperCase() : "";
	}
	public String getDesCliente() {
		return desCliente;
	}
	public void setDesCliente(String desCliente) {
		this.desCliente = (desCliente != null) ?  desCliente : "";
	}
	public boolean isVerRemesados() {
		return verRemesados;
	}
	public void setVerRemesados(boolean b) {
		this.verRemesados = b;
	}

	public String getCodTipoEfectoDesde() {
		return codTipoEfectoDesde;
	}

	public void setCodTipoEfectoDesde(String codTipoEfectoDesde) {
		this.codTipoEfectoDesde = (codTipoEfectoDesde != null) ?  codTipoEfectoDesde : "";
	}

	public String getDesTipoEfectoDesde() {
		return desTipoEfectoDesde;
	}

	public void setDesTipoEfectoDesde(String desTipoEfectoDesde) {
		this.desTipoEfectoDesde = (desTipoEfectoDesde != null) ?  desTipoEfectoDesde : "";
	}

	public String getCodTipoEfectoHasta() {
		return codTipoEfectoHasta;
	}

	public void setCodTipoEfectoHasta(String codTipoEfectoHasta) {
		this.codTipoEfectoHasta = (codTipoEfectoHasta != null) ?  codTipoEfectoHasta : "";
	}

	public String getDesTipoEfectoHasta() {
		return desTipoEfectoHasta;
	}

	public void setDesTipoEfectoHasta(String desTipoEfectoHasta) {
		this.desTipoEfectoHasta = (desTipoEfectoHasta != null) ?  desTipoEfectoHasta : "";
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

	public Date getFechaVencimientoDesde() {
		return fechaVencimientoDesde;
	}

	public void setFechaVencimientoDesde(Date fechaVencimientoDesde) {
		this.fechaVencimientoDesde = fechaVencimientoDesde;
	}

	public Date getFechaVencimientoHasta() {
		return fechaVencimientoHasta;
	}

	public void setFechaVencimientoHasta(Date fechaVencimientoHasta) {
		this.fechaVencimientoHasta = fechaVencimientoHasta;
	}
}
