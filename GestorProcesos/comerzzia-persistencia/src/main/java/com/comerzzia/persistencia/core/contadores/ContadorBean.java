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

public class ContadorBean {

	private String idContador;
	private String codEmpresa;
	private String codSerie;
	private Short periodo;
	private Long valor;
	
	
	public ContadorBean(String idContador) {
		this.idContador = idContador;
		this.codEmpresa = "****";
		this.codSerie = "****";
		this.periodo = 0;
		this.valor = 0L;
	}
	
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
	 * @return the codEmpresa
	 */
	public String getCodEmpresa() {
		return codEmpresa;
	}
	
	/**
	 * @param codEmpresa the codEmpresa to set
	 */
	public void setCodEmpresa(String codEmpresa) {
		this.codEmpresa = codEmpresa;
	}
	
	/**
	 * @return the codSerie
	 */
	public String getCodSerie() {
		return codSerie;
	}
	
	/**
	 * @param codSerie the codSerie to set
	 */
	public void setCodSerie(String codSerie) {
		this.codSerie = codSerie;
	}
	
	/**
	 * @return the periodo
	 */
	public Short getPeriodo() {
		return periodo;
	}
	
	/**
	 * @param periodo the periodo to set
	 */
	public void setPeriodo(Short periodo) {
		this.periodo = periodo;
	}

	/**
	 * @return the valor
	 */
	public Long getValor() {
		return valor;
	}

	/**
	 * @param valor the valor to set
	 */
	public void setValor(Long valor) {
		this.valor = valor;
	}
}
