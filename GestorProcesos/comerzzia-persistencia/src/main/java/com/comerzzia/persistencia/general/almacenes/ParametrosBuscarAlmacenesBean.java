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

package com.comerzzia.persistencia.general.almacenes;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarAlmacenesBean extends ParametrosBuscarBean {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -6216783936975199732L;

	private String codAlm = "";
	private String desAlm = "";
	private String codCliente = "";
	private String activo = "";

	public ParametrosBuscarAlmacenesBean() {
		super.setOrden("CODALM");
	}

	public String getCodAlm() {
		return codAlm;
	}

	public void setCodAlm(String codAlm) {
		this.codAlm = (codAlm != null) ? codAlm.toUpperCase() : "";
	}

	public String getDesAlm() {
		return desAlm;
	}

	public void setDesAlm(String desAlm) {
		this.desAlm = (desAlm != null) ? desAlm : "";
	}

	public String getCodCliente() {
		return codCliente;
	}

	public void setCodCliente(String codCliente) {
		this.codCliente = codCliente;
	}

	public String getActivo() {
		return activo;
	}

	public void setActivo(String activo) {
		this.activo = (activo != null) ? activo : "";
	}
}
