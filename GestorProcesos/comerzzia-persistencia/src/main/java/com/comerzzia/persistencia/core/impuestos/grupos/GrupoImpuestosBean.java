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

package com.comerzzia.persistencia.core.impuestos.grupos;

import java.util.Date;

import com.comerzzia.util.base.MantenimientoBean;

public class GrupoImpuestosBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8515010813312307505L;
	
	private Long idGrupoImpuestos = null;
	private Date vigenciaDesde = null;
	
	
	@Override
	protected void initNuevoBean() {
	}
	
	
	public Long getIdGrupoImpuestos() {
		return idGrupoImpuestos;
	}
	public void setIdGrupoImpuestos(Long idGrupoImpuestos) {
		this.idGrupoImpuestos = idGrupoImpuestos;
	}
	
	
	public Date getVigenciaDesde() {
		return vigenciaDesde;
	}
	public void setVigenciaDesde(Date vigenciaDesde) {
		this.vigenciaDesde = vigenciaDesde;
	}
}
