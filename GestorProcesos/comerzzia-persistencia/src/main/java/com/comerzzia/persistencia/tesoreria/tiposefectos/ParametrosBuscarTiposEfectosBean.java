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

package com.comerzzia.persistencia.tesoreria.tiposefectos;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarTiposEfectosBean extends ParametrosBuscarBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1200372268587370280L;

	private String codTipoEfecto = "";
	private String desTipoEfecto = "";
	private String activo = "";
	
	public ParametrosBuscarTiposEfectosBean() {
		super.setOrden("CODTIPOEFEC");
	}
	
	public String getCodTipoEfecto() {
		return codTipoEfecto;
	}
	public void setCodTipoEfecto(String codTipoEfecto) {
		this.codTipoEfecto = (codTipoEfecto !=null) ? codTipoEfecto.toUpperCase() : "";
	}
	public String getDesTipoEfecto() {
		return desTipoEfecto;
	}
	public void setDesTipoEfecto(String desTipoEfecto) {
		this.desTipoEfecto = (desTipoEfecto !=null) ? desTipoEfecto : "";
	}
	public String getActivo() {
		return activo;
	}
	public void setActivo(String activo) {
		this.activo = (activo != null) ? activo : "";
	}
	
}
