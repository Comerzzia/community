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

package com.comerzzia.persistencia.almacenes.regularizaciones;

import java.util.Date;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarRegularizacionesBean extends ParametrosBuscarBean {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -254412499135118710L;
	
	private Long idAplicacion = null;
	private String codAlmacen = "";
	private String desAlmacen = "";
	private Date fecha = null;
	private Date fechaDesde = null;
	private Date fechaHasta = null;
	private String codConceptoAlmacen = "";
	private String desConceptoAlmacen = "";
	private String codArticulo = "";
	private String desArticulo = "";
	private String desglose1 = "";
	private String desglose2 = "";
	private Double cantidadMedida = null;
	private String unidadMedida = "";
	private Double cantidad = null;
	private Double precio = null;
	private Double importe;
	private String observaciones = "";	

	public ParametrosBuscarRegularizacionesBean() {
		super.setOrden("ID_REGULARIZACION");
	}

	
	
	public Long getIdAplicacion() {
		return idAplicacion;
	}

	public void setIdAplicacion(Long idAplicacion) {
		this.idAplicacion = idAplicacion;
	}

	public String getCodAlmacen() {
		return codAlmacen;
	}

	public void setCodAlmacen(String codAlm) {
		this.codAlmacen = (codAlm != null) ? codAlm.toUpperCase() : "";
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getCodConceptoAlmacen() {
		return codConceptoAlmacen;
	}

	public void setCodConceptoAlmacen(String codConAlm) {
		this.codConceptoAlmacen = codConAlm;
	}

	public String getCodArticulo() {
		return codArticulo;
	}

	public void setCodArticulo(String codArt) {
		this.codArticulo = codArt;
	}

	public String getDesArticulo() {
		return desArticulo;
	}

	public void setDesArticulo(String desArt) {
		this.desArticulo = desArt;
	}

	public String getDesglose1() {
		return desglose1;
	}

	public void setDesglose1(String desglose1) {
		this.desglose1 = desglose1;
	}

	public String getDesglose2() {
		return desglose2;
	}

	public void setDesglose2(String desglose2) {
		this.desglose2 = desglose2;
	}

	public Double getCantidadMedida() {
		return cantidadMedida;
	}

	public void setCantidadMedida(Double cantidadMedida) {
		this.cantidadMedida = cantidadMedida;
	}

	public String getUnidadMedida() {
		return unidadMedida;
	}

	public void setUnidadMedida(String unidadMedida) {
		this.unidadMedida = unidadMedida;
	}

	public Double getCantidad() {
		return cantidad;
	}

	public void setCantidad(Double cantidad) {
		this.cantidad = cantidad;
	}

	public Double getPrecio() {
		return precio;
	}

	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public Double getImporte() {
		return importe;
	}

	public void setImporte(Double importe) {
		this.importe = importe;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public String getDesAlmacen() {
		return desAlmacen;
	}

	public void setDesAlmacen(String desAlm) {
		this.desAlmacen = desAlm;
	}

	public String getDesConceptoAlmacen() {
		return desConceptoAlmacen;
	}

	public void setDesConceptoAlmacen(String desConAlm) {
		this.desConceptoAlmacen = desConAlm;
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

}
