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

/**
 * @author JMTM
 *
 */
public class PanelTag extends BodyTagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3035029323850193585L;

	
	public int doStartTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
	        out.println("<table class=\"cuadro\" cellspacing=\"0\" cellpadding=\"0\">");
	        
	        out.println("<tr>");
	        out.println("<td style=\"width:7;height:7; background:url(comun/images/tablas/esquinas.gif) 0 -88px\"></td>");
	        out.println("<td background=\"comun/images/tablas/horizontal.gif\" style=\"background-position:0 7px\"></td>");
	        out.println("<td style=\"width:7;height:7; background:url(comun/images/tablas/esquinas.gif) 0 -81px\"></td>");
	        out.println("</tr>");
		
		} catch (Exception ex) {
		    throw new JspTagException("doStartTag() - Excepción en la clase del tag PanelTag" , ex);
		}
		
		return EVAL_BODY_BUFFERED;
	}
	
	public int doAfterBody() throws JspException {
		 BodyContent body = getBodyContent();

	      try {
			JspWriter out = body.getEnclosingWriter();
		    out.println(body.getString());
		    body.clearBody();
		    
	      } catch(Exception e) {
	    	  throw new JspTagException("doAfterBody() - Excepción en la clase del tag PanelTag" , e);
		  }
			
	      return SKIP_BODY; 
	}

	
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
		    out.println("<tr>");
		    out.println("<td style=\"background: url(comun/images/tablas/esquinas.gif) 0 88px\"><img src='comun/images/tablas/vacio.gif' width=7 height=4 alt=''></img></td>");
		    out.println("<td style=\"background: url(comun/images/tablas/horizontal.gif) 0 -7px;width:100%; height:4; \"></td>");
		    out.println("<td style=\"background: url(comun/images/tablas/esquinas.gif) 0 84px\"><img src='comun/images/tablas/vacio.gif' width=7 height=4 alt=''></img></td>");
		    out.println("</tr>");
		    out.println("</table>");
		    
		} catch (Exception ex){
			throw new JspTagException("doEndTag() - Excepción en la clase del tag PanelTag" , ex);
		}
		
		return SKIP_BODY;
	}

}
