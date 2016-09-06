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

package com.comerzzia.persistencia.general.proveedores;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarProveedoresBean extends ParametrosBuscarBean {

	/**
	 * serialVersionUID.
	 */
	private static final long serialVersionUID = 6596953557067673327L;

	private String codPro = "";
	private String desPro = "";
	private String cif = "";
	private String activo = "";

	/**
	 * Constructor
	 */
	public ParametrosBuscarProveedoresBean() {
		super.setOrden("CODPRO");
	}

	public String getCodPro() {
		return codPro;
	}

	public void setCodPro(String codPro) {
		this.codPro = (codPro != null) ? codPro.toUpperCase() : "";
	}

	public String getDesPro() {
		return desPro;
	}

	public void setDesPro(String desPro) {
		this.desPro = (desPro != null) ? desPro : "";
	}

	public String getCif() {
		return cif;
	}

	public void setCif(String cif) {
		this.cif = (cif != null) ? cif : "";
	}

	public String getActivo() {
		return activo;
	}

	public void setActivo(String activo) {
		this.activo = (activo != null) ? activo : "";
	}
}
