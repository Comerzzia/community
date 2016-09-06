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

package com.comerzzia.persistencia.ventas.tarifas.actualizaciones.articulos;

public class ArticuloActualizacionCopiaBean extends ArticuloActualizacionBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8794645666237011130L;
	
	
	private String codTarOrigen;
	private String codArtOrigen;
	private Double precioCostoOrigen;
	private Double factorMarcajeOrigen;
	private Double precioVentaOrigen;
	private String codImpuestoOrigen;
	
	public String getCodTarOrigen() {
		return codTarOrigen;
	}
	public void setCodTarOrigen(String codTarOrigen) {
		this.codTarOrigen = codTarOrigen;
	}
	public String getCodArtOrigen() {
		return codArtOrigen;
	}
	public void setCodArtOrigen(String codArtOrigen) {
		this.codArtOrigen = codArtOrigen;
	}
	public Double getPrecioCostoOrigen() {
		return precioCostoOrigen;
	}
	public void setPrecioCostoOrigen(Double precioCostoOrigen) {
		this.precioCostoOrigen = precioCostoOrigen;
	}
	public Double getFactorMarcajeOrigen() {
		return factorMarcajeOrigen;
	}
	public void setFactorMarcajeOrigen(Double factorMarcajeOrigen) {
		this.factorMarcajeOrigen = factorMarcajeOrigen;
	}
	public Double getPrecioVentaOrigen() {
		return precioVentaOrigen;
	}
	public void setPrecioVentaOrigen(Double precioVentaOrigen) {
		this.precioVentaOrigen = precioVentaOrigen;
	}
	public String getCodImpuestoOrigen() {
		return codImpuestoOrigen;
	}
	public void setCodImpuestoOrigen(String codImpuestoOrigen) {
		this.codImpuestoOrigen = codImpuestoOrigen;
	}
	
	public void copiarOrigen() {
		setCodArt(getCodArtOrigen());
		setPrecioCosto(getPrecioCostoOrigen());
		setFactorMarcaje(getFactorMarcajeOrigen());
		setPrecioVenta(getPrecioVentaOrigen());
		setCodImpuesto(getCodImpuestoOrigen());
	}
	
	public boolean isDistintos(){
		if ((getCodArt() != null && getCodArtOrigen() == null)
				|| (getCodArt() == null && getCodArtOrigen() != null)){
			return true;
		}
		if ((getPrecioCosto() != null && getPrecioCostoOrigen() == null)
				|| (getPrecioCosto() == null && getPrecioCostoOrigen() != null)){
			return true;
		}
		if ((getFactorMarcaje() != null && getFactorMarcajeOrigen() == null)
				|| (getFactorMarcaje() == null && getFactorMarcajeOrigen() != null)){
			return true;
		}
		if ((getPrecioVenta() != null && getPrecioVentaOrigen() == null)
				|| (getPrecioVenta() == null && getPrecioVentaOrigen() != null)){
			return true;
		}
		if (getFactorMarcaje()==null || getPrecioCosto()==null || getPrecioVenta()==null){
			return false;
		}
		return !(getCodArt().equals(getCodArtOrigen()) 
				&& getPrecioCosto().equals(getPrecioCostoOrigen())
				&& getFactorMarcaje().equals(getFactorMarcaje())
				&& getPrecioVenta().equals(getPrecioVenta()));
		
	}

}
