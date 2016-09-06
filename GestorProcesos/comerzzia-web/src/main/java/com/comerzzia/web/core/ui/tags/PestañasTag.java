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

public class PestañasTag extends BodyTagSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6646832707767937657L;

	public int doStartTag() throws JspException {
		try{
			JspWriter out = pageContext.getOut();
			out.println("<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" class=\"cuadro pestañas\">");
		}catch (Exception e){
			throw new JspTagException("doStartTag() - Excepción en la clase del tag PestañasTag" , e);
		}
		
		return EVAL_BODY_BUFFERED;
	}
	

	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
			//pie del cuadro de pestañas
			out.println("<tr height=\"4px;\">");
		    out.println("<td style=\"background: url(comun/images/tablas/esquinas.gif) 0 88px\"><img src='comun/images/tablas/vacio.gif' width=7 height=4 alt=''></img></td>");
			out.println("<td style=\"background: url(comun/images/tablas/horizontal.gif) 0 -7px; width:100%; height:4; \" alt=''></td>");
		    out.println("<td style=\"background: url(comun/images/tablas/esquinas.gif) 0 84px\"><img src='comun/images/tablas/vacio.gif' width=7 height=4 alt=''></img></td>");
			out.println("</tr>");
			//fin pie del cuadro de pestañas
			out.println("</table>");
		    
		} catch (Exception e){
			throw new JspTagException("doEndTag() - Excepción en la clase del tag PestañasTag" , e);
		}
		
		return 0;
	}
	
	public int doAfterBody() throws JspException {
		BodyContent body = getBodyContent();

	      try {
			JspWriter out = body.getEnclosingWriter();
		    out.println(body.getString());
		    body.clearBody();
		    
	      } catch(Exception e) {
	    	  throw new JspTagException("doAfterBody() - Excepción en la clase del tag PestañasTag" , e);
		  }
			
	      return(SKIP_BODY); 
	}
}
