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

package com.comerzzia.persistencia.core.impuestos.porcentajes;

import java.util.Date;

import com.comerzzia.util.base.MantenimientoBean;

public class PorcentajeImpuestoBean extends MantenimientoBean {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7031060211016807481L;
	
	private Long idGrupoImpuestos = null;
	private Long idTratImpuestos = null;
	private String codImp = null;
	private String desImpuesto = null;
	private Double porcentaje = null;
	private Double porcentajeRecargo = null;
	private boolean aplicaRecargo = false;
	private Date vigenciaDesde = null;
	private String desTratamientoImpuesto = null;
	
	@Override
	protected void initNuevoBean() {
	}
	
	
	public Long getIdGrupoImpuestos() {
		return idGrupoImpuestos;
	}
	public void setIdGrupoImpuestos(Long idGrupoImpuestos) {
		this.idGrupoImpuestos = idGrupoImpuestos;
	}


	public Long getIdTratImpuestos() {
		return idTratImpuestos;
	}
	public void setIdTratImpuestos(Long idTratImpuestos) {
		this.idTratImpuestos = idTratImpuestos;
	}
	
	
	public String getCodImp() {
		return codImp;
	}
	public void setCodImp(String codImp) {
		this.codImp = codImp;
	}
	
	
	public String getDesImpuesto() {
		return desImpuesto;
	}


	public void setDesImpuesto(String desImpuesto) {
		this.desImpuesto = desImpuesto;
	}


	public Double getPorcentaje() {
		return porcentaje;
	}
	public void setPorcentaje(Double porcentaje) {
		this.porcentaje = porcentaje;
	}
	
	
	public Double getPorcentajeRecargo() {
		return porcentajeRecargo;
	}
	public void setPorcentajeRecargo(Double porcentajeRecargo) {
		this.porcentajeRecargo = porcentajeRecargo;
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

	public Date getVigenciaDesde() {
		return vigenciaDesde;
	}

	public void setVigenciaDesde(Date vigenciaDesde) {
		this.vigenciaDesde = vigenciaDesde;
	}

	public String getDesTratamientoImpuesto() {
		return desTratamientoImpuesto;
	}

	public void setDesTratamientoImpuesto(String desTratamientoImpuesto) {
		this.desTratamientoImpuesto = desTratamientoImpuesto;
	}
}
