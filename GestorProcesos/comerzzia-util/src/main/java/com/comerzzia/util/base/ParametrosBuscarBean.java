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

package com.comerzzia.util.base;

import java.io.Serializable;

public class ParametrosBuscarBean implements Serializable {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 2613843971878447723L;

	private int tamañoPagina = 10;
	private int numPagina = 0;
	private String orden = "";
	
	/**
	 * @return the tamañoPagina
	 */
	public int getTamañoPagina() {
		return tamañoPagina;
	}
	
	/**
	 * @param tamañoPagina the tamañoPagina to set
	 */
	public void setTamañoPagina(int tamañoPagina) {
		if (tamañoPagina > 0){
			this.tamañoPagina = tamañoPagina;
		}
	}
	
	/**
	 * @return the numPagina
	 */
	public int getNumPagina() {
		return numPagina;
	}
	
	/**
	 * @param numPagina the numPagina to set
	 */
	public void setNumPagina(int numPagina) {
		this.numPagina = numPagina;
	}
	
	/**
	 * @return the orden
	 */
	public String getOrden() {
		return orden;
	}
	
	/**
	 * @param orden the orden to set
	 */
	public void setOrden(String orden) {
		this.orden = (orden != null) ? orden : "";
	}
}
