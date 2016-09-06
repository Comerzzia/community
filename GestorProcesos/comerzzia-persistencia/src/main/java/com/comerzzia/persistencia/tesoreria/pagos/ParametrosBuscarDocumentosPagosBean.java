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

package com.comerzzia.persistencia.tesoreria.pagos;

import java.util.Date;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarDocumentosPagosBean extends ParametrosBuscarBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5269707630085937845L;

	private String codProveedor = "";
	private String desProveedor = "";
	private Date fechaVencimientoDesde = null;
	private Date fechaVencimientoHasta = null;
	private String codTipoEfectoDesde = "";
	private String desTipoEfectoDesde = "";
	private String codTipoEfectoHasta = "";
	private String desTipoEfectoHasta = "";
	private String codSerieDesde = "";
	private String desSerieDesde = "";
	private String codSerieHasta = "";
	private String desSerieHasta = "";
	private boolean verRemesados = false;
	
	/* Parámetros para la búqueda de documentos para una remesa */
	private String codTipoEfecto = "";
	private Date fechaDesde = null;
	private boolean buscarPorFechaDesde = false;
	private Date fechaHasta = null;
	private boolean buscarPorFechaHasta = false;

	public ParametrosBuscarDocumentosPagosBean(){
		super.setOrden("FECHA_VENCIMIENTO");
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
	
	public String getCodTipoEfectoDesde() {
		return codTipoEfectoDesde;
	}

	public void setCodTipoEfectoDesde(String codTipoEfectoDesde) {
		this.codTipoEfectoDesde = (codTipoEfectoDesde !=null) ? codTipoEfectoDesde.toUpperCase() : "";
	}

	public String getDesTipoEfectoDesde() {
		return desTipoEfectoDesde;
	}

	public void setDesTipoEfectoDesde(String desTipoEfectoDesde) {
		this.desTipoEfectoDesde = (desTipoEfectoDesde !=null) ? desTipoEfectoDesde : "";
	}

	public String getCodTipoEfectoHasta() {
		return codTipoEfectoHasta;
	}

	public void setCodTipoEfectoHasta(String codTipoEfectoHasta) {
		this.codTipoEfectoHasta = (codTipoEfectoHasta !=null) ? codTipoEfectoHasta.toUpperCase() : "";
	}
	
	public String getDesTipoEfectoHasta() {
		return desTipoEfectoHasta;
	}

	public void setDesTipoEfectoHasta(String desTipoEfectoHasta) {
		this.desTipoEfectoHasta = (desTipoEfectoHasta !=null) ? desTipoEfectoHasta : "";
	}
	
	public String getCodSerieDesde() {
		return codSerieDesde;
	}

	public void setCodSerieDesde(String codSerieDesde) {
		this.codSerieDesde = (codSerieDesde !=null) ? codSerieDesde.toUpperCase() : "";
	}

	public String getDesSerieDesde() {
		return desSerieDesde;
	}

	public void setDesSerieDesde(String desSerieDesde) {
		this.desSerieDesde = (desSerieDesde !=null) ? desSerieDesde : "";
	}

	public String getCodSerieHasta() {
		return codSerieHasta;
	}

	public void setCodSerieHasta(String codSerieHasta) {
		this.codSerieHasta = (codSerieHasta !=null) ? codSerieHasta.toUpperCase() : "";
	}
	
	public String getDesSerieHasta() {
		return desSerieHasta;
	}

	public void setDesSerieHasta(String desSerieHasta) {
		this.desSerieHasta = (desSerieHasta !=null) ? desSerieHasta : "";
	}

	public boolean isVerRemesados() {
		return verRemesados;
	}

	public void setVerRemesados(boolean verRemesados) {
		this.verRemesados = verRemesados;
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

	public String getCodTipoEfecto() {
		return codTipoEfecto;
	}

	public void setCodTipoEfecto(String codTipoEfecto) {
		this.codTipoEfecto = codTipoEfecto;
	}


}
