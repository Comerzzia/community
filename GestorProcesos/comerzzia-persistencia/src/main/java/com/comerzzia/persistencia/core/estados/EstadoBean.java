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

package com.comerzzia.persistencia.core.estados;

public class EstadoBean implements Comparable<EstadoBean> {

	private String proceso = null;    // PK
	private Integer estado = null;    // PK
	private Integer subEstado = null; // PK
	private String desEstado = null;
	private String abreviatura = null;
	private String icono = null;
	private String ambitoAplicacion = null;
	
	// Atributo útil para controlar si se buscará por el estado en cuestión
	private boolean checked = false;
	
	public String getProceso() {
		return proceso;
	}
	public void setProceso(String proceso) {
		this.proceso = proceso;
	}
	
	
	public Integer getEstado() {
		return estado;
	}
	public void setEstado(Integer estado) {
		this.estado = estado;
	}
	
	
	public Integer getSubEstado() {
		return subEstado;
	}
	public void setSubEstado(Integer subEstado) {
		this.subEstado = subEstado;
	}
	
	
	public String getDesEstado() {
		return desEstado;
	}
	public void setDesEstado(String desEstado) {
		this.desEstado = desEstado;
	}
	
	
	public String getAbreviatura() {
		return abreviatura;
	}
	public void setAbreviatura(String abreviatura) {
		this.abreviatura = abreviatura;
	}
	
	
	public String getIcono() {
		return icono;
	}
	public void setIcono(String icono) {
		this.icono = icono;
	}
	
	
	public String getAmbitoAplicacion() {
		return ambitoAplicacion;
	}
	public void setAmbitoAplicacion(String ambitoAplicacion) {
		this.ambitoAplicacion = ambitoAplicacion;
	}
	
	
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
	
	public int compareTo(EstadoBean estado) {
		return this.estado - estado.estado;
	}
	
	
	public boolean equals(Object estado) {
		return this.estado == ((EstadoBean)estado).getEstado();
	}
}
