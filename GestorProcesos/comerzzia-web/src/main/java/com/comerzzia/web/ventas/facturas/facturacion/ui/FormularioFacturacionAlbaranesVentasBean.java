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

package com.comerzzia.web.ventas.facturas.facturacion.ui;

import com.comerzzia.web.core.ui.FormularioBean;

public class FormularioFacturacionAlbaranesVentasBean extends FormularioBean {
	
	// Definición de las pestañas del formulario
	private FormularioBean pestañaFactura = new FormularioBean("Factura");
	
	private Long primeraFactura = null;
	private Long ultimaFactura = null;
	
	/**
	 * Constructor
	 */
	public FormularioFacturacionAlbaranesVentasBean() {
		this.addPestaña(pestañaFactura);
	}
	
	protected void inicializaRegistroActivo() {
		super.inicializaRegistroActivo();	
	}

	public Long getPrimeraFactura() {
		return primeraFactura;
	}

	public void setPrimeraFactura(Long primeraFactura) {
		this.primeraFactura = primeraFactura;
	}

	public Long getUltimaFactura() {
		return ultimaFactura;
	}

	public void setUltimaFactura(Long ultimaFactura) {
		this.ultimaFactura = ultimaFactura;
	}
	
	
}
