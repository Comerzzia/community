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

package com.comerzzia.persistencia.core.tipostiendas;

import com.comerzzia.util.base.MantenimientoBean;

public class TipoTiendaBean extends MantenimientoBean {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -2433066077344461122L;

	private Long idTipoTienda;
	private String desTipoTienda;
	private String claseConfiguracion;
	private String claseSincronizacion;

	protected void initNuevoBean() {
	}

	public Long getIdTipoTienda() {
		return idTipoTienda;
	}

	public void setIdTipoTienda(Long idTipoTienda) {
		this.idTipoTienda = idTipoTienda;
	}

	public String getDesTipoTienda() {
		return desTipoTienda;
	}

	public void setDesTipoTienda(String desTipoTienda) {
		this.desTipoTienda = desTipoTienda;
	}

	public String getClaseConfiguracion() {
		return claseConfiguracion;
	}

	public void setClaseConfiguracion(String claseConfiguracion) {
		this.claseConfiguracion = claseConfiguracion;
	}

	public String getClaseSincronizacion() {
		return claseSincronizacion;
	}

	public void setClaseSincronizacion(String claseSincronizacion) {
		this.claseSincronizacion = claseSincronizacion;
	}
}
