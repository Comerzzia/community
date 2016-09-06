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

package com.comerzzia.persistencia.general.sectores;

import com.comerzzia.util.base.ParametrosBuscarBean;


public class ParametrosBuscarSectoresBean extends ParametrosBuscarBean  {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 2360559900584565427L;

	
	private String codSec = "";
	private String desSec = "";
	private String activo ="";
	
	
	public ParametrosBuscarSectoresBean() {
		super.setOrden("CODSEC");
	}
	

	public String getCodSec() {
		return codSec;
	}



	public void setCodSec(String codSec) {
		this.codSec = codSec;
	}



	public String getDesSec() {
		return desSec;
	}



	public void setDesSec(String desSec) {
		this.desSec = desSec;
	}



	public String getActivo() {
		return activo;
	}

	public void setActivo(String activo) {
		this.activo = (activo != null) ? activo : "";
	}

	
}
