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

package com.comerzzia.web.compras.facturas.conformacion.ui;

import com.comerzzia.servicios.compras.facturas.FacturaCompra;
import com.comerzzia.web.core.ui.FormularioBean;

public class FormularioConformacionFacturasBean extends FormularioBean {
	
	// Definición de las pestañas del formulario
	private FormularioBean pestañaCabecera = new FormularioBean("Cabecera");
	private FormularioBean pestañaLineas = new FormularioBean("Lineas");
	private FormularioBean pestañaMediosPago = new FormularioBean("Medios de pago");
	
	/**
	 * Constructor
	 */
	public FormularioConformacionFacturasBean() {
		this.addPestaña(pestañaCabecera);
		this.addPestaña(pestañaLineas);
		this.addPestaña(pestañaMediosPago);
	}
	
	protected void inicializaRegistroActivo() {
		super.inicializaRegistroActivo();	
		
		pestañaLineas.setRegistros(((FacturaCompra)this.getRegistroActivo()).getDetallesFactura());
		pestañaMediosPago.setRegistros(((FacturaCompra)this.getRegistroActivo()).getMediosPago());
	}
}
