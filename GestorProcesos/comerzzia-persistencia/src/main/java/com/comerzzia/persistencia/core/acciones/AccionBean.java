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

package com.comerzzia.persistencia.core.acciones;


public class AccionBean {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 3582561024516153149L;
	
	private Long idAccion;
	private String accion;
	private String tipoAccion;
	private String ejecucion;
	private String parametros;
	private String descripcion;
	private String titulo;
	private String icono;
	
	
	/**
	 * @return the idAccion
	 */
	public Long getIdAccion() {
		return idAccion;
	}
	
	/**
	 * @param idAccion the idAccion to set
	 */
	public void setIdAccion(Long idAccion) {
		this.idAccion = idAccion;
	}
	
	/**
	 * @return the accion
	 */
	public String getAccion() {
		return accion;
	}

	/**
	 * @param accion the accion to set
	 */
	public void setAccion(String accion) {
		this.accion = accion;
	}

	/**
	 * @return the tipoAccion
	 */
	public String getTipoAccion() {
		return tipoAccion;
	}
	
	/**
	 * @param tipoAccion the tipoAccion to set
	 */
	public void setTipoAccion(String tipoAccion) {
		this.tipoAccion = tipoAccion;
	}
	
	/**
	 * @return the ejecucion
	 */
	public String getEjecucion() {
		return ejecucion;
	}
	
	/**
	 * @param ejecucion the ejecucion to set
	 */
	public void setEjecucion(String ejecucion) {
		this.ejecucion = ejecucion;
	}
	
	/**
	 * @return the parametros
	 */
	public String getParametros() {
		return parametros;
	}
	
	/**
	 * @param parametros the parametros to set
	 */
	public void setParametros(String parametros) {
		this.parametros = parametros;
	}
	
	/**
	 * @return the descripcion
	 */
	public String getDescripcion() {
		return descripcion;
	}
	
	/**
	 * @param descripcion the descripcion to set
	 */
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	/**
	 * @return the titulo
	 */
	public String getTitulo() {
		return titulo;
	}
	
	/**
	 * @param titulo the titulo to set
	 */
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	/**
	 * @return the icono
	 */
	public String getIcono() {
		return icono;
	}
	
	/**
	 * @param icono the icono to set
	 */
	public void setIcono(String icono) {
		this.icono = icono;
	}
	
	
	
	public String getUrl(){
	    String url = "";
	    if (tipoAccion != null && (tipoAccion.equals("URL") || tipoAccion.equals("INFORME"))) {
	    	if (ejecucion != null) {
	    		url = ejecucion;
	    		if (parametros != null && parametros.length() > 0) {
	    			url += "?" + parametros;
	    		}
	    	}
	    }
	    return url;
	}

}
