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

package com.comerzzia.persistencia.general.familias;

import com.comerzzia.util.base.ParametrosBuscarBean;


public class ParametrosBuscarFamiliasBean extends ParametrosBuscarBean  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -5574387325095668859L;
	
	private String codFam = "";
	private String desFam = "";
	private String activo ="";
	
	
	public ParametrosBuscarFamiliasBean() {
		super.setOrden("CODFAM");
	}

	public String getCodFam() {
		return codFam;
	}

	public void setCodFam(String codFam) {
		this.codFam = (codFam != null) ? codFam.toUpperCase() : "";
	}

	public String getDesFam() {
		return desFam;
	}

	public void setDesFam(String desFam) {
		this.desFam = (desFam != null) ? desFam : "";
	}
	
	public String getActivo() {
		return activo;
	}

	public void setActivo(String activo) {
		this.activo = (activo != null) ? activo : "";
	}
}
