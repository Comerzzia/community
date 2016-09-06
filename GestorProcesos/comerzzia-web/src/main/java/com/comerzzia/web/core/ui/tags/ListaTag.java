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

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class ListaTag extends BodyTagSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8255042254780387123L;

	public int doStartTag() throws JspTagException{
		try {
			JspWriter out = pageContext.getOut();
	        out.println("<table cellspacing=\"2\" cellpadding=\"0\" border=\"0\" width=\"100%\" id=\"cuadroResultados\">");
	        out.println("<tr>");
	        out.println("<td width=\"100%\" valign=\"top\">");
	        out.println("<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" width=\"100%\">");
	        out.println("<table cellspacing=0 cellpadding=0 class=\"tablaResultados\" width=\"100%\">");
	        out.println("<tr>");
	        out.println("<td>");
	    
		
		} catch (Exception e) {
		    throw new JspTagException("doStartTag() - Excepción en la clase del tag ListaTag" , e);
		}
		
		return EVAL_BODY_BUFFERED;
	}


	public int doEndTag()throws JspTagException {
		try {
			JspWriter out = pageContext.getOut();
			out.println("</td>");
			out.println("</tr>");
		    out.println("</table>");
		    out.println("</td>");
		    out.println("</tr>");
		    out.println("</table>");
		    
		} catch (Exception e){
			throw new JspTagException("doEndTag() - Excepción en la clase del tag ListaTag" , e);
		}
		
		return 0;
	}
	
	public int doAfterBody() throws JspTagException {
      BodyContent body = getBodyContent();

      try {
		JspWriter out = body.getEnclosingWriter();
	    out.println(body.getString());
	    body.clearBody();
	    
      } catch(Exception e) {
    	  throw new JspTagException("doAfterBody() - Excepción en la clase del tag ListaTag" , e);
	  }
		
      return(SKIP_BODY); 
	}
}
