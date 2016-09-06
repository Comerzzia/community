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

public class CodigoAyudaTag extends AyudaTag{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6598145519670759845L;
	
	/* Código */
	private String idCodigo = null;
	private String valorCodigo = null;
	private String longitudMaximaCodigo = null;
	private String anchuraCodigo = null;
	private String estiloCodigo = null;
	private String onchange = null;

	public int doStartTag() throws JspException {
		try {
			//Cogemos el padre para pasarle los parámetros del hijo
			AyudaTag ayuda = (AyudaTag)findAncestorWithClass(this, AyudaTag.class);
			ayuda.setIdCodigo(idCodigo);
			ayuda.setValorCodigo(valorCodigo);
			ayuda.setLongitudMaximaCodigo(longitudMaximaCodigo);
			ayuda.setAnchuraCodigo(anchuraCodigo);
			ayuda.setEstiloCodigo(estiloCodigo);
			ayuda.setOnchange(onchange);
			
			return SKIP_BODY;
		}
		catch (Exception e) {
			throw new JspTagException("doStartTag() - Excepción en la clase del tag CodigoAyudaTag" , e);
		}
	}
	
	public int doEndTag() {
		return SKIP_BODY;
	}
	
	
	public String getValorCodigo() {
		return valorCodigo;
	}

	public void setValorCodigo(String valorCodigo) {
		this.valorCodigo = valorCodigo;
	}

	public String getLongitudMaximaCodigo() {
		return longitudMaximaCodigo;
	}

	public void setLongitudMaximaCodigo(String longitudMaximaCodigo) {
		this.longitudMaximaCodigo = longitudMaximaCodigo;
	}

	public String getAnchuraCodigo() {
		return anchuraCodigo;
	}

	public void setAnchuraCodigo(String anchuraCodigo) {
		this.anchuraCodigo = anchuraCodigo;
	}

	public String getEstiloCodigo() {
		return estiloCodigo;
	}

	public void setEstiloCodigo(String estiloCodigo) {
		this.estiloCodigo = estiloCodigo;
	}

	public String getIdCodigo() {
		return idCodigo;
	}

	public void setIdCodigo(String idCodigo) {
		this.idCodigo = idCodigo;
	}

	public String getOnchange() {
		return onchange;
	}

	public void setOnchange(String onchange) {
		this.onchange = onchange;
	}
}
