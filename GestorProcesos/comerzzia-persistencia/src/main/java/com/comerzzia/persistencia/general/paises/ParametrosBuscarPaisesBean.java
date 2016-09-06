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

package com.comerzzia.persistencia.general.paises;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarPaisesBean extends ParametrosBuscarBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5952169439533569779L;

	private String codPais = "";
	private String desPais = "";
	private String activo = "";
	
	/**
	 * Constructor
	 */
	public ParametrosBuscarPaisesBean() {
		super.setOrden("CODPAIS");
	}

	/**
	 * 
	 * @return the codpais
	 */
	public String getCodPais() {
		return codPais;
	}

	/**
	 * 
	 * @param codpais the codpais to set
	 */
	public void setCodPais(String codPais) {
		this.codPais = (codPais != null) ? codPais.toUpperCase(): "";
	}

	/**
	 * 
	 * @return the despais
	 */
	public String getDesPais() {
		return desPais;
	}

	/**
	 * 
	 * @param despais the despais to set
	 */ 
	public void setDesPais(String desPais) {
		this.desPais = (desPais != null) ? desPais: "";
	}

	/**
	 * 
	 * @return the activo
	 */
	public String getActivo() {
		return activo;
	}

	/**
	 * 
	 * @param activo the activo to set
	 */
	public void setActivo(String activo) {
		this.activo = (activo != null) ? activo : "";
	}

}
