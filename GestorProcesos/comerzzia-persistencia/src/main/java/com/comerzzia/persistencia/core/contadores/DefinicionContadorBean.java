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

package com.comerzzia.persistencia.core.contadores;

public class DefinicionContadorBean {

	private String idContador;
	private boolean usaEmpresa;
	private boolean usaSerie;
	private boolean usaPeriodo;
	private String descripcion;
	
	
	/**
	 * @return the idContador
	 */
	public String getIdContador() {
		return idContador;
	}
	
	/**
	 * @param idContador the idContador to set
	 */
	public void setIdContador(String idContador) {
		this.idContador = idContador;
	}
	
	/**
	 * @return the usaEmpresa
	 */
	public boolean isUsaEmpresa() {
		return usaEmpresa;
	}
	
	/**
	 * @param usaEmpresa the usaEmpresa to set
	 */
	public void setUsaEmpresa(boolean usaEmpresa) {
		this.usaEmpresa = usaEmpresa;
	}
	
	
	public void setUsaEmpresa(String usaEmpresa) {
		this.usaEmpresa = usaEmpresa.equals("S");
	}
	
	/**
	 * @return the usaSerie
	 */
	public boolean isUsaSerie() {
		return usaSerie;
	}
	
	/**
	 * @param usaSerie the usaSerie to set
	 */
	public void setUsaSerie(boolean usaSerie) {
		this.usaSerie = usaSerie;
	}
	
	public void setUsaSerie(String usaSerie) {
		this.usaSerie = usaSerie.equals("S");
	}
	
	/**
	 * @return the usaPeriodo
	 */
	public boolean isUsaPeriodo() {
		return usaPeriodo;
	}
	
	/**
	 * @param usaPeriodo the usaPeriodo to set
	 */
	public void setUsaPeriodo(boolean usaPeriodo) {
		this.usaPeriodo = usaPeriodo;
	}
	
	public void setUsaPeriodo(String usaPeriodo) {
		this.usaPeriodo = usaPeriodo.equals("S");
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
}
