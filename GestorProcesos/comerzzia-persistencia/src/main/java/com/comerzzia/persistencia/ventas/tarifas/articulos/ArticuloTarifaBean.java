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

package com.comerzzia.persistencia.ventas.tarifas.articulos;

import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;
import com.comerzzia.util.numeros.Numero;

public class ArticuloTarifaBean extends MantenimientoBean {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -7845263200574057377L;

	protected String codTar;
	protected String desTarifa;
	protected String codArt;
	protected String desArt;
	protected String codImpuesto;
	
	protected Double precioCosto;
	protected Double factorMarcaje;
	protected Double precioVenta;
	protected Double precioTotal;
	protected Double porcentajeImpuesto;

	protected Long version;

	protected void initNuevoBean() {
	}
	
	public String getCodTar() {
		return codTar;
	}

	public void setCodTar(String codTar) {
		this.codTar = codTar != null ? codTar.toUpperCase() : null;
	}

	public String getCodArt() {
		return codArt;
	}

	public void setCodArt(String codArt) {
		this.codArt = codArt != null ? codArt.toUpperCase() : null;
	}

	public Double getPrecioCosto() {
		return precioCosto;
	}

	public void setPrecioCosto(Double precioCosto) {
		this.precioCosto = precioCosto;
	}

	public Double getFactorMarcaje() {
		return factorMarcaje;
	}

	public void setFactorMarcaje(Double factorMarcaje) {
		this.factorMarcaje = factorMarcaje;
	}

	public Double getPrecioVenta() {
		return precioVenta;
	}

	public void setPrecioVenta(Double precioVenta) {
		this.precioVenta = precioVenta;
	}

	
	public Double getPrecioTotal() {
		return precioTotal;
	}

	public void setPrecioTotal(Double precioTotal) {
		this.precioTotal = precioTotal;
	}

	public Long getVersion() {
		return version;
	}

	public void setVersion(Long version) {
		this.version = version;
	}

	public String getDesArt() {
		return desArt;
	}

	public void setDesArt(String desArt) {
		this.desArt = desArt;
	}
	

	public Double getPorcentajeImpuesto() {
		return porcentajeImpuesto;
	}

	public void setPorcentajeImpuesto(Double porcentajeImpuesto) {
		this.porcentajeImpuesto = porcentajeImpuesto;
	}
	
	public String getCodImpuesto() {
		return codImpuesto;
	}

	public void setCodImpuesto(String codImpuesto) {
		this.codImpuesto = codImpuesto;
	}

	public void borrar() {
		this.setEstadoBean(Estado.BORRADO);
	}

	public Double getPrecioMarcaje() {
		if (getFactorMarcaje()==null){
			return getPrecioVenta();
		}
		return null;
	}
	public Double getPrecioMarcajeImpuestos() {
		if (getFactorMarcaje()==null){
			return getPrecioTotal();
		}
		return null;
	}

	public Double getFactorAplicado() {
		if (getFactorMarcaje()!=null){
			// si tenemos factor marcaje, éste será el factor aplicado
			return getFactorMarcaje(); 
		}
		try{
			// si no tenemos factor marcaje, calculamos cuál sería el factor aplicado a partir
			// del precio de venta y de costo que tenemos
			if (getPrecioVenta() == 0D){
				return 0D;
			}
			return ( (getPrecioVenta() - getPrecioCosto())/getPrecioVenta())*100;
		}
		catch(Exception e){
			// si no tenemos precio venta y/o precio costo, devolvemos null
			return null;
		}
		
	}

	public String getDesTarifa() {
		return desTarifa;
	}

	public void setDesTarifa(String desTarifa) {
		this.desTarifa = desTarifa;
	}
	
	public boolean isTarifaGeneral(){
		return getCodTar().equals(TarifaBean.TARIFA_GENERAL);
	}
	
	public void recalculaPrecioCosto(){
		if (getFactorMarcaje() != null){
			setPrecioCosto(((100 - getFactorMarcaje()) / 100 )* getPrecioVenta());
			redondearPrecioCosto();
		}
	}
	
	public void recalculaFactorMarcaje(){
		if (getFactorMarcaje() != null){
			if (getPrecioVenta()==0){
				setFactorMarcaje(0.0);
			}
			else{
				setFactorMarcaje(((getPrecioVenta() - getPrecioCosto())/getPrecioVenta())*100);
				setFactorMarcaje(Numero.redondea(getFactorMarcaje(), 2));
			}
		}
	}
	
	public void recalculaPrecioVentaDesdeCosto(){
		if (getFactorMarcaje() != null){
			setPrecioVenta(getPrecioCosto() /((100 - getFactorMarcaje()) / 100 ));
			setPrecioVenta(Numero.redondea(getPrecioVenta(), 4));
		}
	}
	
	public void recalculaPrecioVentaDesdeTotal(){
		setPrecioVenta(100 * getPrecioTotal() / (getPorcentajeImpuesto() + 100));
		setPrecioVenta(Numero.redondea(getPrecioVenta(), 4));
	}
	
	public void recalculaPrecioTotal(){
		setPrecioTotal((getPrecioVenta() * getPorcentajeImpuesto() / 100 ) + getPrecioVenta());
		setPrecioTotal(Numero.redondea(getPrecioTotal(), 2));
	}
	
	public void redondearPrecioTotal(String nivel1, String nivel2, String nivel3){
		if (getPrecioTotal() > 0.01){
			String[] redondeo1 = nivel1.split("-");
			String[] redondeo2 = nivel2.split("-");
			String[] redondeo3 = nivel3.split("-");
			Double resultado = new Double(Numero.getParteEntera(getPrecioTotal()));
			int decimal = Numero.getParteDecimal(getPrecioTotal(), 2);
			if (redondeo1[0].length()==1){ // sólo tratamos último decimal
				resultado = resultado + Numero.getParteEntera(decimal / 10.0) / 10.0;
				decimal = decimal % 10;
			}
			if (decimal >= Integer.parseInt(redondeo1[0]) && decimal <= Integer.parseInt(redondeo1[1])){
				decimal = Integer.parseInt(redondeo1[2]);
			}
			else if (decimal >= Integer.parseInt(redondeo2[0]) && decimal <= Integer.parseInt(redondeo2[1])){
				decimal = Integer.parseInt(redondeo2[2]);
			}
			else if (decimal >= Integer.parseInt(redondeo3[0]) && decimal <= Integer.parseInt(redondeo3[1])){
				decimal = Integer.parseInt(redondeo3[2]);
			}
			resultado = resultado + decimal / 100.0;
			setPrecioTotal(resultado);
		}
	}
	
	
	public void redondearPrecioCosto(){
		setPrecioCosto(Numero.redondea(getPrecioCosto(), 2));
	}
	
}
