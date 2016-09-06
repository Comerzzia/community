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

public class CuerpoPestañaTag extends BodyTagSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5998271061689855914L;
	
	
	public int doStartTag() throws JspException {
		try{
			JspWriter out = pageContext.getOut();
			out.println("<tr>");
			out.println("<td colspan=\"3\">");
			out.println("<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" class=\"cuadroPestanas\">");
			//tr para pintar la esquina superior derecha
			out.println("<tr style=\"height:5px; valign:top;\">");
			out.println("<td background='comun/images/tablas/vertical.gif' style=\"background-position:-4px 0;background-repeat:repeat-y;width:7px\"><img src='comun/images/tablas/vacio.gif' width=7 height=5 alt=''></td>");
			out.println("<td style=\"background-color: white\">");
			out.println("</td>");
			out.println("<td style=\"width:7;height:5;background:url(comun/images/tablas/esquinas.gif) 0 51px\" width=7 height=5 alt=''></td>");
			out.println("</tr>");
			//fin tr para pintar la esquina superior derecha
			//tr para pintar el recuadro del contenido, incluyendo ambos bordes 
			out.println("<tr valign=top>");
			out.println("<td background='comun/images/tablas/vertical.gif' width=\"7px\" style=\"background-repeat: repeat-y;background-position:-4px 0;width:7px\"><img src='comun/images/tablas/vacio.gif' width=7 height=7 alt=''></td>");
			out.println("<td bgcolor='white' width=\"100%\">");
			
		}catch (Exception e){
			throw new JspTagException("doStartTag() - Excepción en la clase del tag CuerpoPestañaTag" , e);
		}
		
		return EVAL_BODY_BUFFERED;
	}
	
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			out.println("</td>");
			out.println("<td background='comun/images/tablas/vertical.gif' style=\"background-position:6px;background-repeat: repeat-y;\"><img src='comun/images/tablas/vacio.gif' width=7 height=7 alt=''></td>");
			out.println("</tr>");
			out.println("</table>");
			out.println("</td>");
			out.println("</tr>");
		    
		} catch (Exception e){
			throw new JspTagException("doEndTag() - Excepción en la clase del tag CuerpoPestañaTag" , e);
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
	    	  throw new JspTagException("doAfterBody() - Excepción en la clase del tag CuerpoPestañaTag" , e);
		  }
			
	      return(SKIP_BODY); 
	}

}
