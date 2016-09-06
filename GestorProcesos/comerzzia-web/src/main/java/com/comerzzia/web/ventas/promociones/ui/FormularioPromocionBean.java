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

package com.comerzzia.web.ventas.promociones.ui;

import com.comerzzia.persistencia.ventas.promociones.PromocionBean;
import com.comerzzia.persistencia.ventas.promociones.articulos.ParametrosBuscarArticulosPromocionesBean;
import com.comerzzia.web.core.ui.FormularioBean;

public class FormularioPromocionBean extends FormularioBean {

	// Definición de los parametros de búsqueda del formulario
	private ParametrosBuscarArticulosPromocionesBean param = new ParametrosBuscarArticulosPromocionesBean();
	private FormularioBean pestañaArticulos = new FormularioBean();
	
	/**
	 * Constructor
	 */
	public FormularioPromocionBean() {
		pestañaArticulos.setParam(param);
		this.addPestaña(pestañaArticulos);
	}
	
	/* (non-Javadoc)
	 * @see com.comerzzia.web.core.ui.FormularioBean#inicializaRegistroActivo()
	 */
	protected void inicializaRegistroActivo() {
		super.inicializaRegistroActivo();
		
		pestañaArticulos.setRegistros(((PromocionBean)this.getRegistroActivo()).getArticulos());
	}
}
