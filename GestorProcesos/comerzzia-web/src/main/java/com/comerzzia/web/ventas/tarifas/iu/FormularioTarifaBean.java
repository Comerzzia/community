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

package com.comerzzia.web.ventas.tarifas.iu;

import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ParametrosBuscarArticulosTarifaBean;
import com.comerzzia.web.core.ui.FormularioBean;


public class FormularioTarifaBean extends FormularioBean {

	// Definición de las pestañas del formulario
	private FormularioBean pestañaArticulos = new FormularioBean("Artículos tarifa");
	
	/**
	 * Constructor
	 */
	public FormularioTarifaBean() {
		this.addPestaña(pestañaArticulos);
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.web.core.ui.FormularioBean#inicializaRegistroActivo()
	 */
	protected void inicializaRegistroActivo() {
		super.inicializaRegistroActivo();
		// Inicializamos la pestaña de artículos estableciendo parámetros de búsqueda
		TarifaBean tarifa = (TarifaBean)this.getRegistroActivo();
		ParametrosBuscarArticulosTarifaBean param = (ParametrosBuscarArticulosTarifaBean) pestañaArticulos.getParam();
		if (param == null){
			param = new ParametrosBuscarArticulosTarifaBean ();
			pestañaArticulos.setParam(param);
		}
		param.setCodTar(tarifa.getCodTar());
	}
}
