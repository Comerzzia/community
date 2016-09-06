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

package com.comerzzia.web.ventas.tarifas.actualizaciones.iu;

import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.actualizaciones.ActualizacionTarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.actualizaciones.articulos.ParametrosBuscarArticulosActualizacionesBean;
import com.comerzzia.web.core.ui.FormularioBean;

public class FormularioActualizacionBean extends FormularioBean {

	private TarifaBean tarifa;
	
	// Definición de las pestañas del formulario
	private FormularioBean pestañaArticulos = new FormularioBean("Artículos Actualización");
	
	/**
	 * Constructor
	 */
	public FormularioActualizacionBean() {
		this.addPestaña(pestañaArticulos);
		tarifa = new TarifaBean();
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.web.core.ui.FormularioBean#inicializaRegistroActivo()
	 */
	protected void inicializaRegistroActivo() {
		super.inicializaRegistroActivo();
		// Inicializamos la pestaña de artículos estableciendo parámetros de búsqueda
		ActualizacionTarifaBean actualizacionTarifa = (ActualizacionTarifaBean)this.getRegistroActivo();
		ParametrosBuscarArticulosActualizacionesBean param = (ParametrosBuscarArticulosActualizacionesBean) pestañaArticulos.getParam();
		if (param == null){
			param = new ParametrosBuscarArticulosActualizacionesBean ();
			pestañaArticulos.setParam(param);
		}
		param.setCodTar(actualizacionTarifa.getCodTar());
		param.setIdActualizacion(actualizacionTarifa.getIdActualizacion());
	}


	public TarifaBean getTarifa() {
		return tarifa;
	}


	public void setTarifa(TarifaBean tarifa) {
		this.tarifa = tarifa;
	}
}
