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

package com.comerzzia.servicios.ventas.tarifas.articulos;

import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.articulos.ServicioArticulos;


public class PreciosArticuloTarifaBean {

	private String codTar;
	private String codArt;
	private Double precioCosto;
	private Double factorMarcaje;
	private Double precioVenta;
	private Long version;
	
	private Double precioVentaConImpuestos = null;

	public String getCodTar() {
		return codTar;
	}
	public void setCodTar(String codTar) {
		this.codTar = codTar;
	}
	
	
	public String getCodArt() {
		return codArt;
	}
	public void setCodArt(String codArt) {
		this.codArt = codArt;
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
	
	
	public Long getVersion() {
		return version;
	}
	public void setVersion(Long version) {
		this.version = version;
	}
	
	
	public Double getPrecioVentaConImpuestos(DatosSesionBean datosSesion) {
		try {
			if(precioVentaConImpuestos == null) {
				return ServicioArticulos.obtenerPrecioArticuloConImpuestos(codArt, precioVenta, datosSesion);
			}
			else {
				return precioVentaConImpuestos;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			
			return -1D;
		}
	}
}
