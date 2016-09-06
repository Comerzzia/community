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

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;


public class CuerpoPanelPrincipalTag extends BodyTagSupport {
	
	// TODO: habría que unificar esta clase con la CuerpoPanelTag, ya que deberían hacer lo mismo

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -4301551935706143144L;

	
	private String alineacion = "top";
	
	
	public int doStartTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			out.println("<tr>");
			out.println("<td colspan=\"4\">");
			out.println("<table class=\"cuerpoCentral\" cellspacing=\"0\" cellpadding=\"0\">");
			
			// Lateral izquierdo del panel
			out.println("<tr>");
		    out.println("<td style=\"padding-left:3px;background: url(comun/images/tablas/vertical.gif) repeat-y 0 0\" width=\"3\" height=\"100%\"></td>");
		    out.println("<td style=\"width:100%\" valign=\""+ alineacion +"\">");
		    
		    return EVAL_BODY_BUFFERED;
		}
		catch (IOException e) {
			throw new JspException(e);
		}
	}
	
	
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
			// Lateral derecho del panel
			out.println("&nbsp;");
			out.println("</td>");
		    out.println("<td style=\"padding-right:4px;background: url(comun/images/tablas/vertical.gif) repeat-y 3px 0\" width=\"4\"></td>");
		    out.println("</tr>");
		    
		    out.println("</table>");
		    out.println("</td>");
		    out.println("</tr>");
		    
		    return SKIP_BODY;
		}
		catch (Exception ex){
			throw new JspTagException("Excepción en la clase del tag" , ex);
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
		catch (IOException ioe) {
			throw new JspTagException("Excepción en la clase del tag", ioe);
		}
	}


	/**
	 * @return the alineacion
	 */
	public String getAlineacion() {
		return alineacion;
	}


	/**
	 * @param alineacion the alineacion to set
	 */
	public void setAlineacion(String alineacion) {
		this.alineacion = alineacion;
	}
}
