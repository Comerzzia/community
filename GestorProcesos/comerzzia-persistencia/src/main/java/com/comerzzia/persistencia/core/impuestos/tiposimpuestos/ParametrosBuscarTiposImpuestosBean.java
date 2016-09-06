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

package com.comerzzia.persistencia.core.impuestos.tiposimpuestos;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarTiposImpuestosBean extends ParametrosBuscarBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3658873797716364026L;

	private String codTipoImpuesto = "";
	private String desTipoImpuesto = "";
	
	public ParametrosBuscarTiposImpuestosBean() {
		super.setOrden("CODIMP");
	}

	public String getCodTipoImpuesto() {
		return codTipoImpuesto;
	}

	public void setCodTipoImpuesto(String codTipoImpuesto) {
		this.codTipoImpuesto = (codTipoImpuesto !=null) ? codTipoImpuesto.toUpperCase() : "";
	}

	public String getDesTipoImpuesto() {
		return desTipoImpuesto;
	}

	public void setDesTipoImpuesto(String desTipoImpuesto) {
		this.desTipoImpuesto = (desTipoImpuesto !=null) ? desTipoImpuesto : "";
	}
	
}
