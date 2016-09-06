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

package com.comerzzia.persistencia.almacenes.traspasos;

import java.util.Date;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarTraspasosAlmacenesBean extends
		ParametrosBuscarBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5687682424973646909L;
	
	private String codSerie;
	private Long numTraspaso;
	private String codAlmacenOrigen;
	private String codAlmacenDestino;
	private String codAplicacion;
	private Date fechaDesde = null;
	private boolean buscarPorFechaDesde = false;
	private Date fechaHasta = null;
	private boolean buscarPorFechaHasta = false;
	private String codConAlmacen;
	
	public ParametrosBuscarTraspasosAlmacenesBean() {
		super.setOrden("FECHA DESC");
	}
	
	public String getCodSerie() {
		return codSerie;
	}
	public void setCodSerie(String codSerie) {
		this.codSerie = codSerie;
	}
	public Long getNumTraspaso() {
		return numTraspaso;
	}
	public void setNumTraspaso(Long numTraspaso) {
		this.numTraspaso = numTraspaso;
	}
	public String getCodAlmacenOrigen() {
		return codAlmacenOrigen;
	}
	public void setCodAlmacenOrigen(String codAlmacenOrigen) {
		this.codAlmacenOrigen = codAlmacenOrigen;
	}
	public String getCodAlmacenDestino() {
		return codAlmacenDestino;
	}
	public void setCodAlmacenDestino(String codAlmacenDestino) {
		this.codAlmacenDestino = codAlmacenDestino;
	}
	public String getCodAplicacion() {
		return codAplicacion;
	}
	public void setCodAplicacion(String codAplicacion) {
		this.codAplicacion = codAplicacion;
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
	public String getCodConAlmacen() {
		return codConAlmacen;
	}
	public void setCodConAlmacen(String codConAlmacen) {
		this.codConAlmacen = codConAlmacen;
	}

}
