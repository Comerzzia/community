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

package com.comerzzia.persistencia.tiendavirtual.articulos;

public class ArticuloTiendaVirtualBean {

	/**
	 * Definición de constante booleana verdadera como cadena
	 */
	private static final String TRUE = "S";

	/**
	 * Definición de constante booleana falsa como cadena
	 */
	private static final String FALSE = "N";

	private String codArticulo;
	private String desArticulo;
	private Double precioVenta;
	private Double precioVentaConImpuestos;
	private String observaciones;
	private byte[] foto;
	private boolean escaparate;
	private Double stock;
	private Double stockPendienteRecibir;
	private String desglose1 = "*";
	private String desglose2 = "*";
	private String codImpuesto;

	public String getCodArticulo() {
		return codArticulo;
	}

	public void setCodArticulo(String codArticulo) {
		this.codArticulo = codArticulo.toUpperCase();
	}

	public String getDesArticulo() {
		return desArticulo;
	}

	public void setDesArticulo(String desArticulo) {
		this.desArticulo = desArticulo;
	}

	public Double getPrecioVenta() {
		return precioVenta;
	}

	public void setPrecioVenta(Double precio) {
		this.precioVenta = precio;
	}

	public Double getPrecioVentaConImpuestos() {
		return precioVentaConImpuestos;
	}

	public void setPrecioVentaConImpuestos(Double precioVentaConImpuestos) {
		this.precioVentaConImpuestos = precioVentaConImpuestos;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public byte[] getFoto() {
		return foto;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}

	public boolean isEscaparate() {
		return escaparate;
	}

	public void setEscaparate(boolean escaparate) {
		this.escaparate = escaparate;
	}

	public String getEscaparate() {
		return (escaparate) ? TRUE : FALSE;
	}

	public void setEscaparate(String escaparate) {
		this.escaparate = escaparate.equals(TRUE);
	}

	public Double getStock() {
		return stock;
	}

	public void setStock(Double stock) {
		this.stock = stock;
	}

	public Double getStockPendienteRecibir() {
		return stockPendienteRecibir;
	}

	public void setStockPendienteRecibir(Double stockPendRecibir) {
		this.stockPendienteRecibir = stockPendRecibir;
	}

	public String getDesglose1() {
		return desglose1;
	}

	public String getDesglose2() {
		return desglose2;
	}

	public String getCodImpuesto() {
		return codImpuesto;
	}

	public void setCodImpuesto(String codImpuesto) {
		this.codImpuesto = codImpuesto;
	}
	
	public String getCodigoDesgloses(){
		return getCodArticulo() + getDesglose1() + getDesglose2();
	}
}
