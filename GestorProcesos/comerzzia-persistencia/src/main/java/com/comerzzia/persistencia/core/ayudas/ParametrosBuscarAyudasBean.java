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

package com.comerzzia.persistencia.core.ayudas;

import com.comerzzia.util.base.ParametrosBuscarBean;


public class ParametrosBuscarAyudasBean extends ParametrosBuscarBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7967688530242713354L;
	
	private String codigo = "";
	private String descripcion = "";
	private String campoFiltro = "";
	
	/**
	 * @return the codigo
	 */
	public String getCodigo() {
		return codigo;
	}
	
	/**
	 * @param codigo the codigo to set
	 */
	public void setCodigo(String codigo) {
		this.codigo = (codigo != null) ? codigo.toUpperCase() : "";
	}
	
	/**
	 * @return the descripcion
	 */
	public String getDescripcion() {
		return descripcion;
	}
	
	/**
	 * @param descripcion the descripcion to set
	 */
	public void setDescripcion(String descripcion) {
		this.descripcion = (descripcion != null) ? descripcion : "";
	}

	public String getCampoFiltro() {
		return campoFiltro;
	}

	public void setCampoFiltro(String campoFiltro) {
		this.campoFiltro = (campoFiltro != null) ? campoFiltro : "";
	}
}
