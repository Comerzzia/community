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

package com.comerzzia.web.core.ui.tags;

import javax.servlet.jsp.JspException;

import com.comerzzia.web.base.TeclasRapidasKeys;

public class AccionNuevoRegistroTag extends AccionTag {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5449526347293299401L;
	
	private String icono = "comun/images/iconos/alta.gif";
	private String titulo = "Añadir";
	private String onclick = "";
	private String descripcion = "Alta de un nuevo registro";
	private String teclaRapida = TeclasRapidasKeys.ACCION_NUEVO_REGISTRO_HK;

	@Override
	public int doStartTag() throws JspException {
		super.icono = this.icono;
		super.titulo = this.titulo;
		super.onclick = this.onclick;
		super.descripcion = this.descripcion;
		super.teclaRapida = this.teclaRapida;
		
		return super.doStartTag();
	}

	public String getIcono() {
		return icono;
	}

	public void setIcono(String icono) {
		this.icono = icono;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getOnclick() {
		return onclick;
	}

	public void setOnclick(String onclick) {
		this.onclick = onclick;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
}
