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

package com.comerzzia.persistencia.sincronizacion.tarifas;

import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean;


public class ArticuloTarifaTiendaBean {

	private String codAlmacen = null;
	private ArticuloTarifaBean articulo = null;
	
	
	public ArticuloTarifaTiendaBean(ArticuloTarifaBean articulo, String codAlmacen) {
		this.articulo = articulo;
		this.codAlmacen = codAlmacen;
	}
	
	
	public String getCodAlmacen() {
		return this.codAlmacen;
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean#getCodArt()
	 */
	public String getCodArt() {
		return articulo.getCodArt();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean#getCodTar()
	 */
	public String getCodTar() {
		return articulo.getCodTar();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean#getFactorMarcaje()
	 */
	public Double getFactorMarcaje() {
		return articulo.getFactorMarcaje();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean#getPrecioCosto()
	 */
	public Double getPrecioCosto() {
		return articulo.getPrecioCosto();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean#getPrecioVenta()
	 */
	public Double getPrecioVenta() {
		return articulo.getPrecioVenta();
	}
	
	
	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean#getPrecioTotal()
	 */
	public Double getPrecioTotal() {
		return articulo.getPrecioTotal();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean#getVersion()
	 */
	public Long getVersion() {
		return articulo.getVersion();
	}
}
