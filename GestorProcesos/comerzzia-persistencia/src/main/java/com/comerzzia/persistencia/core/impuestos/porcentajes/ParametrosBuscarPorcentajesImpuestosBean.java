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

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarPorcentajesImpuestosBean extends ParametrosBuscarBean {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 4841869149777206065L;
	
	private Long idGrupoImpuestos = null;
	private String vigenciaDesde = null;
	private Long idTratamientoImpuestos = null;
	private String desTratamiento = "";
	
	public ParametrosBuscarPorcentajesImpuestosBean() {
		super.setOrden("DESIMP");
	}

	public Long getIdGrupoImpuestos() {
		return idGrupoImpuestos;
	}

	public void setIdGrupoImpuestos(Long idGrupoImpuestos) {
		this.idGrupoImpuestos = idGrupoImpuestos;
	}

	public Long getIdTratamientoImpuestos() {
		return idTratamientoImpuestos;
	}

	public void setIdTratamientoImpuestos(Long idTratamientoImpuestos) {
		this.idTratamientoImpuestos = idTratamientoImpuestos;
	}

	public String getDesTratamiento() {
		return desTratamiento;
	}

	public void setDesTratamiento(String desTratamiento) {
		this.desTratamiento = desTratamiento;
	}

	public String getVigenciaDesde() {
		return vigenciaDesde;
	}

	public void setVigenciaDesde(String vigenciaDesde) {
		this.vigenciaDesde = vigenciaDesde;
	}
	
}
