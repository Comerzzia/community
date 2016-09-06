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

package com.comerzzia.persistencia.general.secciones;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarSeccionesBean extends ParametrosBuscarBean {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 9182804312270519821L;

	private String codSeccion = "";
	private String desSeccion = "";
	private String activo = "";

	public ParametrosBuscarSeccionesBean() {
		super.setOrden("CODSECCION");
	}

	public String getCodSeccion() {
		return codSeccion;
	}

	public void setCodSeccion(String codSeccion) {
		this.codSeccion = (codSeccion != null) ? codSeccion.toUpperCase() : "";
	}

	public String getDesSeccion() {
		return desSeccion;
	}

	public void setDesSeccion(String desSeccion) {
		this.desSeccion = (desSeccion != null) ? desSeccion : "";
	}

	public String getActivo() {
		return activo;
	}

	public void setActivo(String activo) {
		this.activo = (activo != null) ? activo : "";
	}
}
