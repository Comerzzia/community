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

package com.comerzzia.persistencia.general.clientes;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarClientesBean extends ParametrosBuscarBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5952169439533569779L;

	private String codCli = "";
	private String desCli = "";
	private String cif = "";
	private String activo = "";
	private String nombreComercial = "";
	
	/**
	 * Constructor
	 */
	public ParametrosBuscarClientesBean() {
		super.setOrden("CODCLI");
	}

	public String getCodCli() {
		return codCli;
	}

	public void setCodCli(String codCli) {
		this.codCli = (codCli != null) ? codCli.toUpperCase() : "";
	}

	public String getDesCli() {
		return desCli;
	}

	public void setDesCli(String desCli) {
		this.desCli = (desCli != null) ? desCli : "";
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

	public String getNombreComercial() {
		return nombreComercial;
	}

	public void setNombreComercial(String nombreComercial) {
		this.nombreComercial = (nombreComercial != null) ? nombreComercial : "";
	}
}
