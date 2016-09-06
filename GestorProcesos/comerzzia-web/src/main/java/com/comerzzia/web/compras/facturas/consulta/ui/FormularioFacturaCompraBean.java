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

package com.comerzzia.web.compras.facturas.consulta.ui;

import com.comerzzia.servicios.compras.facturas.FacturaCompra;
import com.comerzzia.web.core.ui.FormularioBean;

public class FormularioFacturaCompraBean extends FormularioBean {

	// Definición de las pestañas del formulario
	private FormularioBean pestañaCabecera = new FormularioBean("Cabecera");
	private FormularioBean pestañaLineas = new FormularioBean("Líneas");
	private FormularioBean pestañaMediosPago = new FormularioBean("Medios de pago");
	
	// Atributo para saber la configuración de la variables ARTICULOS.DESGLOSE1_TITULO y ARTICULOS.DESGLOSE1_TITULO
	private String tituloDesglose1 = null;
	private String tituloDesglose2 = null;
	
	/**
	 * Constructor
	 */
	public FormularioFacturaCompraBean() {
		this.addPestaña(pestañaCabecera);
		this.addPestaña(pestañaLineas);
		this.addPestaña(pestañaMediosPago);
	}
	
	protected void inicializaRegistroActivo() {
		super.inicializaRegistroActivo();	
		
		pestañaLineas.setRegistros(((FacturaCompra)this.getRegistroActivo()).getDetallesFactura());
		pestañaMediosPago.setRegistros(((FacturaCompra)this.getRegistroActivo()).getMediosPago());
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
