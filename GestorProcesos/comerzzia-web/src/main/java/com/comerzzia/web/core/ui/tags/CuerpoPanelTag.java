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


public class CuerpoPanelTag extends BodyTagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5720894273018165638L;

	private String alineacion = "top";

	
	public int doStartTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
	        out.println("<tr style=\"vertical-align:top\">");
	        out.println("<td style=\"background: url(comun/images/tablas/vertical.gif) repeat-y -4px 0\" width=\"4\"></td>");
	        out.println("<td>");
	        out.println("<table class=\"cuadroBusquedaDesplegable\" cellspacing=\"2\" cellpadding=\"0\" border=\"0\"  id=\"cuadroBusqueda\">");
	        out.println("<tr>");
	        out.println("<td>");
		    
		    return EVAL_BODY_BUFFERED;
		}
		catch (Exception e) {
			throw new JspTagException("doStartTag() - Excepción en la clase del tag ContenidoPanelTag", e);
		}
	}
	
	
	public int doAfterBody() throws JspException {
		try {
			BodyContent body = getBodyContent();
			JspWriter out = body.getEnclosingWriter();
			out.println(body.getString());
			body.clearBody();
			
			return SKIP_BODY;
		}
		catch (Exception e) {
			throw new JspTagException("doAfterBody() - Excepción en la clase del tag ContenidoPanelTag", e);
		}
	}
	
	
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
			out.println("</td>");
			out.println("</tr>");
			out.println("</table>");
			out.println("</td>");
			out.println("<td style=\"background: url(comun/images/tablas/vertical.gif) repeat-y 6px 0\" width=\"4\"></td>");
			out.println("</tr>");
		    
		    return SKIP_BODY;
		}
		catch (Exception e) {
			throw new JspTagException("doEndTag() - Excepción en la clase del tag ContenidoPanelTag", e);
		}
	}
	
	
	public String getAlineacion() {
		return alineacion;
	}
	
	
	public void setAlineacion(String alineacion) {
		this.alineacion = alineacion;
	}
}
