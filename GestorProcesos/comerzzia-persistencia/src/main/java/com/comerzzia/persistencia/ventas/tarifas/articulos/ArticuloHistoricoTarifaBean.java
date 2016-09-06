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

import java.util.Date;

import com.comerzzia.util.base.MantenimientoBean;

public class ArticuloHistoricoTarifaBean extends MantenimientoBean{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 5603090877238249478L;
	
	private ArticuloTarifaBean articuloTarifa;
	
	private Date fechaModificacion;
	private Long idUsuario;
	private boolean borrado;

	
	public ArticuloHistoricoTarifaBean(ArticuloTarifaBean articulo){
		this.articuloTarifa = articulo;
	}

	protected void initNuevoBean() {
	}

	public String getCodArt() {
		return articuloTarifa.getCodArt();
	}

	public String getCodTar() {
		return articuloTarifa.getCodTar();
	}

	public String getDesArt() {
		return articuloTarifa.getDesArt();
	}

	public Double getPrecioCosto() {
		return articuloTarifa.getPrecioCosto();
	}

	public Double getPrecioVenta() {
		return articuloTarifa.getPrecioVenta();
	}

	public Long getVersion() {
		return articuloTarifa.getVersion();
	}
	public void setCodArt(String codArt) {
		articuloTarifa.setCodArt(codArt);
	}

	public void setCodTar(String codTar) {
		articuloTarifa.setCodTar(codTar);
	}

	public void setDesArt(String desArt) {
		articuloTarifa.setDesArt(desArt);
	}

	public void setFactorMarcaje(Double factorMarcaje) {
		articuloTarifa.setFactorMarcaje(factorMarcaje);
	}

	public void setPrecioCosto(Double precioCosto) {
		articuloTarifa.setPrecioCosto(precioCosto);
	}

	public void setPrecioVenta(Double precioVenta) {
		articuloTarifa.setPrecioVenta(precioVenta);
	}

	public void setVersion(Long version) {
		articuloTarifa.setVersion(version);
	}

	public Double getFactorMarcaje() {
		return articuloTarifa.getFactorMarcaje();
	}

	public Date getFechaModificacion() {
		return fechaModificacion;
	}

	public void setFechaModificacion(Date fechaModificacion) {
		this.fechaModificacion = fechaModificacion;
	}

	public Long getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(Long idUsuario) {
		this.idUsuario = idUsuario;
	}

	public boolean isBorrado() {
		return borrado;
	}

	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}

	public String getBorrado() {
		return (borrado) ? TRUE : FALSE;
	}

	public void setborrado(String borrado) {
		this.borrado = borrado.equals(TRUE);
	}

	public Double getPrecioTotal() {
		return articuloTarifa.getPrecioTotal();
	}

	public void setPrecioTotal(Double precioTotal) {
		articuloTarifa.setPrecioTotal(precioTotal);
	}

}
