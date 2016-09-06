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
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class ItemContenidoListaTag extends BodyTagSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1347934060285895418L;
	
	private String valor;
	private String alineacion;
	private String onclick;
	private String contenido;

	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		try {
			if (alineacion != null){
				out.println("<td style=\"text-align:"+ alineacion +"\">");
			}
			else {
				out.println("<td style=\"text-align: left;\">");
			}
			contenido = valor;
			return EVAL_BODY_BUFFERED;
		}
		catch (Exception e) {
			throw new JspTagException("doStartTag() - Excepción en la clase del tag ItemContenidoListaTag", e);
		}
	}
	
	public int doAfterBody() throws JspTagException {
		BodyContent body = getBodyContent();

		try {
			String contenidoBody = body.getString().trim();
			if (contenidoBody != null && !contenidoBody.isEmpty()){
				contenido = contenidoBody;
			}
			
			body.clearBody();
			return SKIP_BODY;
		}
		catch (Exception e) {
			throw new JspTagException("doStartTag() - Excepción en la clase del tag ItemContenidoListaTag", e);
		}
	}
	
	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();

		try {
			if (contenido == null){
				contenido = "";
			}
			if (onclick != null && !onclick.isEmpty()){
				out.println("<a  href=\"#\" style=\"cursor: pointer;\" onclick=\""+ onclick +"\">");
				out.println("<span>" + contenido + "</span>");
				out.println("</a>");
			}
			else{
				out.println("<span>" + contenido + "</span>");
			}
			out.println("</td>");
		}
		catch (Exception e) {
			throw new JspTagException("doEndTag() - Excepción en la clase del tag ItemContenidoListaTag", e);
		}
		return EVAL_PAGE;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public String getAlineacion() {
		return alineacion;
	}

	public void setAlineacion(String alineacion) {
		this.alineacion = alineacion;
	}

	public String getOnclick() {
		return onclick;
	}

	public void setOnclick(String onclick) {
		this.onclick = onclick;
	}

}
