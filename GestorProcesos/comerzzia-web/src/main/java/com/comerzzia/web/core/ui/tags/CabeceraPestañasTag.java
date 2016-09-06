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

public class CabeceraPestañasTag extends BodyTagSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1751921609374626183L;

	private String pestañaActiva;

	public int doStartTag() throws JspException {
		try{
			JspWriter out = pageContext.getOut();
			out.println("<tr height=\"22px\">");
			out.println("<td colspan=\"3\">");
			out.println("<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" class=\"tablaPestanas\">");
			out.println("<tr>");
			pageContext.setAttribute(TagKeys.PESTAÑA_ACTIVA, pestañaActiva);
		}catch (Exception e){
			throw new JspTagException("doStartTag() - Excepción en la clase del tag CabeceraPestañasTag" , e);
		}
		
		return EVAL_BODY_BUFFERED;
	}
	
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			out.println("<td background='comun/images/tablas/horizontal.gif' style=\"background-repeat:repeat-x;background-position:0 -11px\" width=\"100%\"></td>");
			out.println("<td width=\"7\" style=\"background-color: white;\">");
			out.println("&nbsp;&nbsp;");
			out.println("</td>");
			out.println("</tr>");
			out.println("</table>");
			out.println("</td>");
			out.println("</tr>");
		    
		} catch (Exception e){
			throw new JspTagException("doEndTag() - Excepción en la clase del tag CabeceraPestañasTag" , e);
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
	    	  throw new JspTagException("doAfterBody() - Excepción en la clase del tag CabeceraPestañasTag" , e);
		  }
			
	      return(SKIP_BODY); 
	}



	public String getPestañaActiva() {
		return pestañaActiva;
	}



	public void setPestañaActiva(String pestañaActiva) {
		this.pestañaActiva = pestañaActiva;
	}

}

