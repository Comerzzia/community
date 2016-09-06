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

package com.comerzzia.persistencia.sincronizacion;

import java.util.List;

import com.comerzzia.util.base.MantenimientoBean;

public class ListaTrabajos extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3260660496173969748L;
	
	private String titulo = null;
	private List<TrabajoSincronizadorBean> listaTrabajos = null;
	
	
	protected void initNuevoBean() {
	}
	
	
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	
	public List<TrabajoSincronizadorBean> getListaTrabajos() {
		return listaTrabajos;
	}
	public void setListaTrabajos(List<TrabajoSincronizadorBean> listaTrabajos) {
		this.listaTrabajos = listaTrabajos;
	}
}
