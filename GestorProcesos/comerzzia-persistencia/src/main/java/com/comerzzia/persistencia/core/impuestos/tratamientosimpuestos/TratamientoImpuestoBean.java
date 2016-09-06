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

package com.comerzzia.persistencia.core.impuestos.tratamientosimpuestos;

import com.comerzzia.util.base.MantenimientoBean;

public class TratamientoImpuestoBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4040456472713201838L;

	private Long idTratImpuestos;
	private String codTratImp;
	private String desTratImp;
	private boolean aplicaRecargo;
	
	protected void initNuevoBean() {	
	}

	public Long getIdTratImpuestos() {
		return idTratImpuestos;
	}

	public void setIdTratImpuestos(Long idTratImpuestos) {
		this.idTratImpuestos = idTratImpuestos;
	}

	public String getCodTratImp() {
		return codTratImp;
	}

	public void setCodTratImp(String codTratImp) {
		this.codTratImp = codTratImp.toUpperCase();
	}

	public String getDesTratImp() {
		return desTratImp;
	}

	public void setDesTratImp(String desTratImp) {
		this.desTratImp = desTratImp;
	}

	public boolean isAplicaRecargo() {
		return aplicaRecargo;
	}

	public void setAplicaRecargo(boolean aplicaRecargo) {
		this.aplicaRecargo = aplicaRecargo;
	}
	
	public String getAplicaRecargo() {
		return (aplicaRecargo) ? TRUE : FALSE;
	}
	
	public void setAplicaRecargo(String aplicaRecargo) {
		this.aplicaRecargo = aplicaRecargo.equals(TRUE);
	}
	
	public String getDesAplicaRecargo(){
		return (isAplicaRecargo() ? "Sí" : "No");
	}
	
}
