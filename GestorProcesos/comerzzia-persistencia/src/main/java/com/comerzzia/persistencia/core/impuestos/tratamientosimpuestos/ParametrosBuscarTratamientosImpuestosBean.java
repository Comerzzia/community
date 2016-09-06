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

package com.comerzzia.persistencia.core.impuestos.tratamientosimpuestos;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarTratamientosImpuestosBean extends ParametrosBuscarBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6291220405069191982L;

	private String codTratImp = "";
	private String desTratImp = "";
	
	public ParametrosBuscarTratamientosImpuestosBean() {
		super.setOrden("CODTRATIMP");
	}

	public String getCodTratImp() {
		return codTratImp;
	}

	public void setCodTratImp(String codTratImp) {
		this.codTratImp = (codTratImp !=null) ? codTratImp.toUpperCase() : "";
	}

	public String getDesTratImp() {
		return desTratImp;
	}

	public void setDesTratImp(String desTratImp) {
		this.desTratImp = (desTratImp !=null) ? desTratImp : "";;
	}
}
