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

package com.comerzzia.persistencia.tiendavirtual.articulos.tarifas;

import com.comerzzia.util.base.MantenimientoBean;

public class ArticuloTarifaTiendaVirtualBean extends MantenimientoBean {

	/**
	 * Serial Version UID.
	 */
	private static final long serialVersionUID = 8448668941526605999L;

	private String codAlmacen;
	private String codTarifa;
	private String codArticulo;
	private Double precioVenta;

	protected void initNuevoBean() {
	}

	public String getCodAlmacen() {
		return codAlmacen;
	}

	public void setCodAlmacen(String codAlmacen) {
		this.codAlmacen = codAlmacen != null ? codAlmacen.toUpperCase() : null;
	}

	public String getCodTarifa() {
		return codTarifa;
	}

	public void setCodTarifa(String codTar) {
		this.codTarifa = codTar != null ? codTar.toUpperCase() : null;
	}

	public String getCodArticulo() {
		return codArticulo;
	}

	public void setCodArticulo(String codArticulo) {
		this.codArticulo = codArticulo != null ? codArticulo.toUpperCase()
				: null;
	}

	public Double getPrecioVenta() {
		return precioVenta;
	}

	public void setPrecioVenta(Double precioVenta) {
		this.precioVenta = precioVenta;
	}
}
