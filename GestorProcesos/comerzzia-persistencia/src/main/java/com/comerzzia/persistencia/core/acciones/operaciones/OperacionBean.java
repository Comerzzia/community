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

package com.comerzzia.persistencia.core.acciones.operaciones;

import java.io.Serializable;


public class OperacionBean implements Serializable, Comparable<OperacionBean> {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1261282407993179430L;
	
	private Long idAccion;
	private Byte idOperacion;
	private Byte orden;
	private String desOperacion;
	

	protected void initNuevoBean() {	
	}


	/**
	 * @return the idAccion
	 */
	public Long getIdAccion() {
		return idAccion;
	}


	/**
	 * @param idAccion the idAccion to set
	 */
	public void setIdAccion(Long idAccion) {
		this.idAccion = idAccion;
	}

	
	/**
	 * @return the idOperacion
	 */
	public Byte getIdOperacion() {
		return idOperacion;
	}


	/**
	 * @param idOperacion the idOperacion to set
	 */
	public void setIdOperacion(Byte idOperacion) {
		this.idOperacion = idOperacion;
	}


	/**
	 * @return the orden
	 */
	public Byte getOrden() {
		return orden;
	}


	/**
	 * @param orden the orden to set
	 */
	public void setOrden(Byte orden) {
		this.orden = orden;
	}


	/**
	 * @return the desOperacion
	 */
	public String getDesOperacion() {
		return desOperacion;
	}


	/**
	 * @param desOperacion the desOperacion to set
	 */
	public void setDesOperacion(String desOperacion) {
		this.desOperacion = desOperacion;
	}


	public int compareTo(OperacionBean o) {
		// miramos si son iguales, en caso contrario devolvemos mayor o igual en función del orden
		if (o.getIdOperacion().equals(getIdOperacion())){
			return 0;
		}
		return this.getOrden().compareTo(o.getOrden());
	}
}
