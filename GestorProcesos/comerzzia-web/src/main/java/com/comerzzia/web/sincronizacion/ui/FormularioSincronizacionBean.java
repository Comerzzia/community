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

package com.comerzzia.web.sincronizacion.ui;

import com.comerzzia.servicios.sincronizacion.SincronizadorTiendas;
import com.comerzzia.web.core.ui.FormularioBean;


public class FormularioSincronizacionBean extends FormularioBean {

	// Definición de las pestañas del formulario
	private FormularioBean pestañaTrabajos = new FormularioBean("Trabajos");
	private FormularioBean pestañaTrabajosTiendas = new FormularioBean("Trabajos por Tiendas");
	
	private int segundosRefresco = 60;
	
	
	/**
	 * Constructor
	 */
	public FormularioSincronizacionBean() {
		this.addPestaña(pestañaTrabajos);
		this.addPestaña(pestañaTrabajosTiendas);
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.web.core.ui.FormularioBean#inicializaRegistroActivo()
	 */
	protected void inicializaRegistroActivo() {
		super.inicializaRegistroActivo();
	}
	
	
	/**
	 * Obtiene la instancia del Sincronizador de Tiendas
	 * @return
	 */
	public SincronizadorTiendas getSincronizadorTiendas() {
		return SincronizadorTiendas.getInstance();
	}


	/**
	 * @return the segundosRefresco
	 */
	public int getSegundosRefresco() {
		return segundosRefresco;
	}


	/**
	 * @param segundosRegresco the segundosRefresco to set
	 */
	public void setSegundosRefresco(int segundosRefresco) {
		this.segundosRefresco = segundosRefresco;
	}
}
