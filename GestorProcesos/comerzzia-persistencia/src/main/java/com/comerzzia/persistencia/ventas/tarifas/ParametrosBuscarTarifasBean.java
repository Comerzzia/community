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

package com.comerzzia.persistencia.ventas.tarifas;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarTarifasBean extends ParametrosBuscarBean {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -5756577936077508659L;

	private String codTar = "";
	private String desTar = "";

	public ParametrosBuscarTarifasBean() {
		super.setOrden("CODTAR");
	}

	public String getCodTar() {
		return codTar;
	}

	public void setCodTar(String codTar) {
		this.codTar = (codTar != null) ? codTar.toUpperCase() : "";
	}

	public String getDesTar() {
		return desTar;
	}

	public void setDesTar(String desTar) {
		this.desTar = (desTar != null) ? desTar : "";
	}

}
