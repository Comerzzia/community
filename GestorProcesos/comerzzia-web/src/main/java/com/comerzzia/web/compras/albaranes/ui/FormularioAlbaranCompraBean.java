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

package com.comerzzia.web.compras.albaranes.ui;

import com.comerzzia.servicios.compras.albaranes.AlbaranCompra;
import com.comerzzia.web.core.ui.FormularioBean;


public class FormularioAlbaranCompraBean extends FormularioBean {

	// Definición de las pestañas del formulario
	private FormularioBean pestañaCabecera = new FormularioBean("Albarán");
	private FormularioBean pestañaDetalle = new FormularioBean("Artículos");
	private FormularioBean pestañaPagos = new FormularioBean("Pagos");
	private FormularioBean pestañaResumen = new FormularioBean("Resumen");
	
	// Atributo para saber la configuración de la variables ARTICULOS.DESGLOSE1_TITULO y ARTICULOS.DESGLOSE1_TITULO
	private String tituloDesglose1 = null;
	private String tituloDesglose2 = null;
	
	/**
	 * Constructor
	 */
	public FormularioAlbaranCompraBean() {
		this.addPestaña(pestañaCabecera);
		this.addPestaña(pestañaDetalle);
		this.addPestaña(pestañaPagos);
		this.addPestaña(pestañaResumen);
	}
	
	protected void inicializaRegistroActivo() {
		super.inicializaRegistroActivo();
		
		pestañaDetalle.setRegistros((this.getRegistroActivo()).getArticulos());
		pestañaPagos.setRegistros((this.getRegistroActivo()).getPagos());
	}
	
	public AlbaranCompra getRegistroActivo() {
		return (AlbaranCompra) super.getRegistroActivo();
	}
	
	public String getTituloDesglose1() {
		return tituloDesglose1;
	}
	public void setTituloDesglose1(String tituloDesglose1) {
		this.tituloDesglose1 = tituloDesglose1;
	}
	
	public String getTituloDesglose2() {
		return tituloDesglose2;
	}
	public void setTituloDesglose2(String tituloDesglose2) {
		this.tituloDesglose2 = tituloDesglose2;
	}
}
