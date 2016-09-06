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

package com.comerzzia.persistencia.compras.albaranes;

import java.util.Date;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarAlbaranesComprasBean extends ParametrosBuscarBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8737554561240793815L;
	
	private String codSerie = null;
	private String desSerie = null;
	private String codSerieHasta = null;
	private String desSerieHasta = null;
	private Long numAlbaran = null;
	private String codProveedor = null;
	private String desProveedor = null;
	private String codConceptoAlmacen = null;
	private String desConceptoAlmacen = null;
	private Date fechaDesde = null;
	private boolean buscarPorFechaDesde = false;
	private Date fechaHasta = null;
	private boolean buscarPorFechaHasta = false;
	private boolean noFacturados = false;
	private Long periodo = null;
	
	public ParametrosBuscarAlbaranesComprasBean() {
		super.setOrden("FECHA DESC");
	}
	
	
	public String getCodSerie() {
		return codSerie;
	}
	public void setCodSerie(String codSerie) {
		this.codSerie = (codSerie !=null) ? codSerie.toUpperCase() : "";
	}
	
	
	public String getDesSerie() {
		return desSerie;
	}
	public void setDesSerie(String desSerie) {
		this.desSerie = (desSerie !=null) ? desSerie : "";
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


	public Long getNumAlbaran() {
		return numAlbaran;
	}
	public void setNumAlbaran(Long numAlbaran) {
		this.numAlbaran = numAlbaran;
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

	public boolean isNoFacturados() {
		return noFacturados;
	}
	public void setNoFacturados(boolean noFacturados) {
		this.noFacturados = noFacturados;
	}

	public Long getPeriodo() {
		return periodo;
	}

	public void setPeriodo(Long periodo) {
		this.periodo = periodo;
	}
}
