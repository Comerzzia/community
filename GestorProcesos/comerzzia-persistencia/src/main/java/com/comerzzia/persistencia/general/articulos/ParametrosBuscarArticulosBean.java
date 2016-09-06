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

package com.comerzzia.persistencia.general.articulos;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarArticulosBean extends ParametrosBuscarBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5761172894653714845L;
	
	private String codArticulo = "";
	private String desArticulo = "";
	private String codFamilia = "";
	private String desFamilia = "";
	private String codProveedor = "";
	private String desProveedor = "";	
	private String activo = "";
	
	public ParametrosBuscarArticulosBean() {
		super.setOrden("CODART");
	}
	public String getCodArticulo() {
		return codArticulo;
	}
	public void setCodArticulo(String codArticulo) {
		this.codArticulo = (codArticulo != null) ? codArticulo.toUpperCase() : "";
	}
	public String getDesArticulo() {
		return desArticulo;
	}
	public void setDesArticulo(String desArticulo) {
		this.desArticulo = (desArticulo != null)? desArticulo : "";
	}
	public String getCodFamilia() {
		return codFamilia;
	}
	public void setCodFamilia(String codFamilia) {
		this.codFamilia = (codFamilia != null) ? codFamilia.toUpperCase() : "";
	}
	public String getDesFamilia() {
		return desFamilia;
	}
	public void setDesFamilia(String desFamilia) {
		this.desFamilia = (desFamilia != null) ? desFamilia : "";
	}
	public String getCodProveedor() {
		return codProveedor;
	}
	public void setCodProveedor(String codProveedor) {
		this.codProveedor = (codProveedor != null) ? codProveedor.toUpperCase() : "";
	}
	public String getDesProveedor() {
		return desProveedor;
	}
	public void setDesProveedor(String desProveedor) {
		this.desProveedor = (desProveedor != null) ? desProveedor : "";
	}
	public String getActivo() {
		return activo;
	}
	public void setActivo(String activo) {
		this.activo = (activo != null)? activo : "";
	}

}
