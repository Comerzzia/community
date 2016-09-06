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
import javax.servlet.jsp.JspTagException;

public class DescripcionAyudaTag extends AyudaTag{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8210011947105893975L;

	/* Descripción */
	private String idDescripcion = null;
	private String valorDescripcion = null;
	private String anchuraDescripcion = null;
	private String estiloDescripcion = null;
	private boolean editable = false;

	public int doStartTag() throws JspException {
		try {
			//Cogemos el padre para pasarle los parámetros del hijo
			AyudaTag ayuda = (AyudaTag)findAncestorWithClass(this, AyudaTag.class);
			ayuda.setIdDescripcion(idDescripcion);
			ayuda.setValorDescripcion(valorDescripcion);
			ayuda.setAnchuraDescripcion(anchuraDescripcion);
			ayuda.setEstiloDescripcion(estiloDescripcion);
			ayuda.setEditable(editable);

			return SKIP_BODY;
		}
		catch (Exception e) {
			throw new JspTagException("doStartTag() - Excepción en la clase del tag DescripcionAyudaTag" , e);
		}
	}
	
	public int doEndTag() {
		return SKIP_BODY;
	}
	

	public String getValorDescripcion() {
		return valorDescripcion;
	}

	public void setValorDescripcion(String valorDescripcion) {
		this.valorDescripcion = valorDescripcion;
	}

	public String getAnchuraDescripcion() {
		return anchuraDescripcion;
	}

	public void setAnchuraDescripcion(String anchuraDescripcion) {
		this.anchuraDescripcion = anchuraDescripcion;
	}

	public String getEstiloDescripcion() {
		return estiloDescripcion;
	}

	public void setEstiloDescripcion(String estiloDescripcion) {
		this.estiloDescripcion = estiloDescripcion;
	}

	public String getIdDescripcion() {
		return idDescripcion;
	}

	public void setIdDescripcion(String idDescripcion) {
		this.idDescripcion = idDescripcion;
	}

	public boolean isEditable() {
		return editable;
	}

	public void setEditable(boolean editable) {
		this.editable = editable;
	}
}

