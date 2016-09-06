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

import java.util.Date;

public class VersionArticuloBean {

	private Long version;
	private Date fechaVersion;
	
	
	/**
	 * @return the version
	 */
	public Long getVersion() {
		return version;
	}
	
	/**
	 * @param version the version to set
	 */
	public void setVersion(Long version) {
		this.version = version;
	}
	
	/**
	 * @return the fechaVersion
	 */
	public Date getFechaVersion() {
		return fechaVersion;
	}
	
	/**
	 * @param fechaVersion the fechaVersion to set
	 */
	public void setFechaVersion(Date fechaVersion) {
		this.fechaVersion = fechaVersion;
	}
}
