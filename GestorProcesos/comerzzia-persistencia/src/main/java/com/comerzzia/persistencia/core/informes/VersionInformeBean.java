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

package com.comerzzia.persistencia.core.informes;

import com.comerzzia.util.base.MantenimientoBean;

public class VersionInformeBean extends MantenimientoBean{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 8713935771884275400L;
	
	private Long idInforme;
	private Long idVersion;
	private String version;
	private String titulo;
	private String descripcion;
	private String formatoSalida;
	
	protected void initNuevoBean() {
	}
	
	
	public Long getIdInforme() {
		return idInforme;
	}
	public void setIdInforme(Long idInforme) {
		this.idInforme = idInforme;
	}
	public Long getIdVersion() {
		return idVersion;
	}
	public void setIdVersion(Long idVersion) {
		this.idVersion = idVersion;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getFormatoSalida() {
		return formatoSalida;
	}
	public void setFormatoSalida(String formatoSalida) {
		this.formatoSalida = formatoSalida;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

}
