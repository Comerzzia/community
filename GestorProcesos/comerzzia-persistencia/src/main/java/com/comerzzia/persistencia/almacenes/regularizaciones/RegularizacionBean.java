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

import com.comerzzia.persistencia.almacenes.stocks.IArticuloStock;
import com.comerzzia.util.base.MantenimientoBean;

public class RegularizacionBean extends MantenimientoBean implements
		IArticuloStock {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 3105166580667994586L;

	private Long idRegularizacion;
	private String codAlmacen;
	private String desAlmacen;
	private Date fecha;
	private String codAplicacion = "REGU";
	private String codConceptoAlmacen;
	private String desConceptoAlmacen;
	private String codArticulo;
	private String desArticulo;
	private String desglose1;
	private String desglose2;
	private Double cantidadMedida;
	private String unidadMedida;
	private Double cantidad;
	private Double precio;
	private Double importe;
	private Double stockActual;
	private Double stockUMAlt;
	private String observaciones;
	private Long idUsuario;

	protected void initNuevoBean() {
	}

	public Long getIdRegularizacion() {
		return idRegularizacion;
	}

	public void setIdRegularizacion(Long idRegularizacion) {
		this.idRegularizacion = idRegularizacion;
	}

	public String getCodAlmacen() {
		return codAlmacen;
	}

	public void setCodAlmacen(String codAlm) {
		this.codAlmacen = codAlm.toUpperCase();
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getCodAplicacion() {
		return codAplicacion;
	}

	public void setCodAplicacion(String codAplicacion) {
		this.codAplicacion = codAplicacion;
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

	public String getUnidadMedida() {
		return unidadMedida;
	}

	public void setUnidadMedida(String unidadMedida) {
		this.unidadMedida = unidadMedida;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public Double getCantidadMedida() {
		return cantidadMedida;
	}

	public void setCantidadMedida(Double cantidadMedida) {
		this.cantidadMedida = cantidadMedida;
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

	public Double getStockActual() {
		return stockActual;
	}

	public void setStockActual(Double stockActual) {
		this.stockActual = stockActual;
	}

	public Double getStockUMAlt() {
		return stockUMAlt;
	}

	public void setStockUMAlt(Double stockUMAlt) {
		this.stockUMAlt = stockUMAlt;
	}

	public Long getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Long idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getDesArticulo() {
		return desArticulo;
	}

	public void setDesArticulo(String desArt) {
		this.desArticulo = desArt;
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
}
