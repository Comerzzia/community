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

package com.comerzzia.web.general.mediospago.ui;

import com.comerzzia.persistencia.general.mediospago.MedioPagoBean;
import com.comerzzia.web.core.ui.FormularioBean;

public class FormularioMedioPagoBean extends FormularioBean {

	// Definición de las pestañas del formulario
	private FormularioBean pestañaDatosGenerales = new FormularioBean("Datos Generales");
	private FormularioBean pestañaVencimientos = new FormularioBean("Vencimientos");
	
	
	/**
	 * Constructor
	 */
	public FormularioMedioPagoBean() {
		this.addPestaña(pestañaDatosGenerales);
		this.addPestaña(pestañaVencimientos);
	}
	
	/* (non-Javadoc)
	 * @see com.comerzzia.web.core.ui.FormularioBean#inicializaRegistroActivo()
	 */
	protected void inicializaRegistroActivo() {
		super.inicializaRegistroActivo();
		
		// Inicializamos la pestaña de vencimientos 
		// estableciendo las listas de resitros de cada una de ellas
		pestañaVencimientos.setRegistros(((MedioPagoBean)this.getRegistroActivo()).getVencimientos());
	}
}
