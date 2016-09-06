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

package com.comerzzia.servicios.core.impuestos.porcentajes;

import java.util.Map;

import com.comerzzia.persistencia.core.impuestos.porcentajes.PorcentajeImpuestoBean;

public class PorcentajesImpuestosBean {

	Long idGrupoImpuestos;
	Long idTratatamientoImpuestos;
	Map<String, PorcentajeImpuestoBean> porcentajesImpuestos;
	
	
	public PorcentajesImpuestosBean() {
	}
	
	
	public PorcentajesImpuestosBean(Long idGrupoImpuestos, Long idTratatamientoImpuestos) {
		this.idGrupoImpuestos = idGrupoImpuestos;
		this.idTratatamientoImpuestos = idTratatamientoImpuestos;
	}
	
	/**
	 * @return the idGrupoImpuestos
	 */
	public Long getIdGrupoImpuestos() {
		return idGrupoImpuestos;
	}
	
	
	/**
	 * @param idGrupoImpuestos the idGrupoImpuestos to set
	 */
	public void setIdGrupoImpuestos(Long idGrupoImpuestos) {
		this.idGrupoImpuestos = idGrupoImpuestos;
	}
	
	
	/**
	 * @return the idTratatamientoImpuestos
	 */
	public Long getIdTratatamientoImpuestos() {
		return idTratatamientoImpuestos;
	}
	
	
	/**
	 * @param idTratatamientoImpuestos the idTratatamientoImpuestos to set
	 */
	public void setIdTratatamientoImpuestos(Long idTratatamientoImpuestos) {
		this.idTratatamientoImpuestos = idTratatamientoImpuestos;
	}
	
	
	/**
	 * @return the porcentajes
	 */
	public Map<String, PorcentajeImpuestoBean> getPorcentajesImpuestos() {
		return porcentajesImpuestos;
	}
	
	
	/**
	 * @param porcentajes the porcentajes to set
	 */
	public void setPorcentajesImpuestos(Map<String, PorcentajeImpuestoBean> porcentajesImpuestos) {
		this.porcentajesImpuestos = porcentajesImpuestos;
	}
	
	
	/**
	 * Obtiene el porcentaje de impuesto para un código de impuesto
	 * @param codImpuesto
	 * @return
	 */
	public PorcentajeImpuestoBean getPorcentaje(String codImpuesto) {
		if (porcentajesImpuestos != null) {
			return porcentajesImpuestos.get(codImpuesto);
		}
		
		return null;
	}
}
