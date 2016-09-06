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

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;


public class PanelPrincipalTag extends BodyTagSupport {
	
	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -2959918652934910905L;


	public int doStartTag() throws JspTagException{
		try {
			JspWriter out = pageContext.getOut();
			
			//Importamos los scripts para el uso de las teclas rapidas
			out.println("");
			out.println("<script type='text/javascript' language='javascript' src='comun/js/jquery-1.3.2.min.js'></script>");
			out.println("<script type='text/javascript' language='javascript' src='comun/js/jquery.hotkeys.min.js'></script>");
			out.println("");

	        out.println("<table cellspacing='0' cellpadding='0' class='cuadroPrincipal'>");
		}
		catch (Exception ex) {
		    throw new JspTagException("Excepción en la clase del tag" , ex);
		}
		
		return EVAL_BODY_BUFFERED;
	}
	
	
	public int doEndTag()throws JspTagException {
		try {
			JspWriter out = pageContext.getOut();
						
		    // Pie del panel
		    out.println("<tr height=\"4px\">");
	        out.println("<td style=\background:url(comun/images/tablas/esquinas.gif) 0 0\" width=4 height=4></td>");
	        out.println("<td width=100% style=\"background: url(comun/images/tablas/horizontal.gif) 0 0\"></td>");
	        out.println("<td style=\background:url(comun/images/tablas/esquinas.gif) 0 0\" width=4 height=4></td>");
	        out.println("</tr>");
	        
	        // TODO: posibilidad de que se pueda pintar un pie, al que se le pueda pasar un texto
		} 
		catch (Exception ex){
			throw new JspTagException("Excepción en la clase del tag" , ex);
		}
		
		return SKIP_BODY;
	}
	
	
	public int doAfterBody() throws JspTagException {
		BodyContent body = getBodyContent();

		try {
			JspWriter out = body.getEnclosingWriter();
			out.println(body.getString());
			body.clearBody();
			
			return SKIP_BODY;
		}
		catch (IOException ioe) {
			throw new JspTagException("Excepción en la clase del tag", ioe);
		}
	}
}
