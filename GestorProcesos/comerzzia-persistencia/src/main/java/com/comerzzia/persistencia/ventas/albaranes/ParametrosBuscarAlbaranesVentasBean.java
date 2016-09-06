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

package com.comerzzia.persistencia.ventas.albaranes;

import java.util.Date;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarAlbaranesVentasBean extends ParametrosBuscarBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8737554561240793815L;
	
	private String codSerie = null;
	private String desSerie = null;
	private Long numAlbaran = null;
	private String codCliente = null;
	private String desCliente = null;
	private String codAlmacen = null;
	private String desAlmacen = null;
	private String codConceptoAlmacen = null;
	private String desConceptoAlmacen = null;
	private Date fechaDesde = null;
	private boolean buscarPorFechaDesde = false;
	private Date fechaHasta = null;
	private boolean buscarPorFechaHasta = false;
	private Long periodo = null;
	
	/* Conformación de facturas*/
	private String codClienteDesde = null;
	private String desClienteDesde = null;
	private String codClienteHasta = null;
	private String desClienteHasta = null;
	private String codSerieDesde = null;
	private String desSerieDesde = null;
	private String codSerieHasta = null;
	private String desSerieHasta = null;
	private boolean noFacturados = false;

	
	public ParametrosBuscarAlbaranesVentasBean() {
		super.setOrden("FECHA DESC");
	}
	
	
	public String getCodSerie() {
		return codSerie;
	}
	public void setCodSerie(String codSerie) {
		this.codSerie = codSerie;
	}
	
	
	public String getDesSerie() {
		return desSerie;
	}
	public void setDesSerie(String desSerie) {
		this.desSerie = desSerie;
	}
	
	
	public Long getNumAlbaran() {
		return numAlbaran;
	}
	public void setNumAlbaran(Long numAlbaran) {
		this.numAlbaran = numAlbaran;
	}
	
	
	public String getCodCliente() {
		return codCliente;
	}
	
	public void setCodCliente(String codCliente) {
		this.codCliente = codCliente;
	}


	public String getDesCliente() {
		return desCliente;
	}
	public void setDesCliente(String desCliente) {
		this.desCliente = desCliente;
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


	public String getCodConceptoAlmacen() {
		return codConceptoAlmacen;
	}


	public void setCodConceptoAlmacen(String codConceptoAlmacen) {
		this.codConceptoAlmacen = codConceptoAlmacen;
	}


	public String getDesConceptoAlmacen() {
		return desConceptoAlmacen;
	}


	public void setDesConceptoAlmacen(String desConceptoAlmacen) {
		this.desConceptoAlmacen = desConceptoAlmacen;
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


	public Long getPeriodo() {
		return periodo;
	}

	public void setPeriodo(Long periodo) {
		this.periodo = periodo;
	}


	public String getCodClienteDesde() {
		return codClienteDesde;
	}


	public void setCodClienteDesde(String codClienteDesde) {
		this.codClienteDesde = (codClienteDesde != null) ? codClienteDesde : "";
	}


	public String getDesClienteDesde() {
		return desClienteDesde;
	}


	public void setDesClienteDesde(String desClienteDesde) {
		this.desClienteDesde = (desClienteDesde != null) ? desClienteDesde : "";
	}


	public String getCodClienteHasta() {
		return codClienteHasta;
	}


	public void setCodClienteHasta(String codClienteHasta) {
		this.codClienteHasta = (codClienteHasta != null) ? codClienteHasta : "";
	}


	public String getDesClienteHasta() {
		return desClienteHasta;
	}


	public void setDesClienteHasta(String desClienteHasta) {
		this.desClienteHasta = (desClienteHasta != null) ? desClienteHasta : "";
	}


	public String getCodSerieDesde() {
		return codSerieDesde;
	}


	public void setCodSerieDesde(String codSerieDesde) {
		this.codSerieDesde = (codSerieDesde != null) ? codSerieDesde : "";
	}


	public String getDesSerieDesde() {
		return desSerieDesde;
	}


	public void setDesSerieDesde(String desSerieDesde) {
		this.desSerieDesde = (desSerieDesde != null) ? desSerieDesde : "";
	}


	public String getCodSerieHasta() {
		return codSerieHasta;
	}


	public void setCodSerieHasta(String codSerieHasta) {
		this.codSerieHasta = (codSerieHasta != null) ? codSerieHasta : "";
	}


	public String getDesSerieHasta() {
		return desSerieHasta;
	}


	public void setDesSerieHasta(String desSerieHasta) {
		this.desSerieHasta = (desSerieHasta != null) ? desSerieHasta : "";
	}


	public boolean isNoFacturados() {
		return noFacturados;
	}


	public void setNoFacturados(boolean noFacturados) {
		this.noFacturados = noFacturados;
	}
}
