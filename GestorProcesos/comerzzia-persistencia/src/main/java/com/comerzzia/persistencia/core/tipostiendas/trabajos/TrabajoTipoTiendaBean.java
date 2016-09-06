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

package com.comerzzia.persistencia.core.tipostiendas.trabajos;

import com.comerzzia.util.base.MantenimientoBean;

public class TrabajoTipoTiendaBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1028879911940940612L;

	private Long idTipoTienda;
	private String trabajo;
	private String clase;
	private String intervalo;

	protected void initNuevoBean() {
	}

	public Long getIdTipoTienda() {
		return idTipoTienda;
	}

	public void setIdTipoTienda(Long idTipoTienda) {
		this.idTipoTienda = idTipoTienda;
	}

	public String getTrabajo() {
		return trabajo;
	}

	public void setTrabajo(String trabajo) {
		this.trabajo = trabajo;
	}

	public String getClase() {
		return clase;
	}

	public void setClase(String clase) {
		this.clase = clase;
	}

	public String getIntervalo() {
		return intervalo;
	}

	public void setIntervalo(String intervalo) {
		this.intervalo = intervalo;
	}
}
