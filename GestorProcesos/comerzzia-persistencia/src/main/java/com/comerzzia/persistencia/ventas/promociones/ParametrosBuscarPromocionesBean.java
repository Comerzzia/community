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

package com.comerzzia.persistencia.ventas.promociones;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarPromocionesBean extends ParametrosBuscarBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1709914282288776651L;
	
	private static final String SIN_ACTIVAR = "1";
	private static final String ACTIVO = "2";
	private static final String FINALIZADO = "3";

	private String descripcion = "";
	private String codTarifa = "";
	private String desTarifa = "";
	private String estado = "";
	
	public ParametrosBuscarPromocionesBean() {
		super.setOrden("DESCRIPCION");
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = (descripcion != null) ? descripcion : "";
	}

	public String getCodTarifa() {
		return codTarifa;
	}

	public void setCodTarifa(String codTarifa) {
		this.codTarifa = (codTarifa != null) ? codTarifa : "";
	}

	public String getDesTarifa() {
		return desTarifa;
	}

	public void setDesTarifa(String desTarifa) {
		this.desTarifa = (desTarifa != null) ? desTarifa : "";
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = (estado != null) ? estado : "";
	}
	
	public boolean isSinActivar(){
		return estado.equals(SIN_ACTIVAR);
	}
	
	public boolean isActivo(){
		return estado.equals(ACTIVO);
	}
	
	public boolean isFinalizado(){
		return estado.equals(FINALIZADO);
	}
	
}
