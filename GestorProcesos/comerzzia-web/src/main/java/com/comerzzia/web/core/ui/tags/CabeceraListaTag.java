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

public class CabeceraListaTag extends BodyTagSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6169292408838193459L;

	private String ordenActual = null;
	
	public int doStartTag() throws JspTagException{
		try {
			JspWriter out = pageContext.getOut();
	        out.println("<thead>");
	        out.println("<tr>");

	        // Poner como atributo el orden actual para luego indicar la ordenación en la columna correspondiente
	        pageContext.setAttribute(TagKeys.ORDEN_ACTUAL, ordenActual);

		} catch (Exception ex) {
		    throw new JspTagException("doStartTag() - Excepción en la clase del tag CabeceraListaTag" , ex);
		}
		
		return EVAL_BODY_BUFFERED;
	}
	
	public int doEndTag()throws JspTagException {
		try {
			JspWriter out = pageContext.getOut();
			out.println("</tr>");
	        out.println("</thead>");
		    
		} catch (Exception e){
			throw new JspTagException("doEndTag() - Excepción en la clase del tag CabeceraListaTag" , e);
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
    	  throw new JspTagException("doAfterBody() - Excepción en la clase del tag CabeceraListaTag" , e);
	  }
		
      return(SKIP_BODY); 
	}

	public String getOrdenActual() {
		return ordenActual;
	}

	public void setOrdenActual(String ordenActual) {
		this.ordenActual = ordenActual;
	}
}
