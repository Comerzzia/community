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

/**
 * @author JMTM
 *
 */
public class CabeceraPanelTag extends BodyTagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 808380549830679533L;
	
	//atributos para la cabecera
	private String titulo;
	private String icono;
	

	public int doStartTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
		
	        out.println("<tr height=\"16\" style=\"background-color:#eef2f7\">");
	        out.println("<td style=\"background: url(comun/images/tablas/vertical.gif) repeat-y -11px 0\" width=\"4\"></td>");
	        out.println("<td class=\"fondoSecundario\">");
	        out.println("<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">");
	        out.println("<tr>");
	        if(icono != null && !icono.isEmpty()) {
	        	out.println("<td width=\"22\">");
 		        out.println("<img src=\"" + icono + "\" width=\"18px\">");
 		        out.println("</td>");
	        }
	        if(titulo != null && !titulo.isEmpty()) {
	        	out.println("<td><span class=\"titulo\">" + titulo + "</span></td>");
	        }
		
		} catch (Exception ex) {
		    throw new JspTagException("doStartTag() - Excepción en la clase del tag CabeceraPanelTag" , ex);
		}
		
		return EVAL_BODY_BUFFERED;
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
			throw new JspTagException("doAfterBody() - Excepción en la clase del tag CabeceraPanelTag", ioe);
		} 
	}

	
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
	        out.println("</tr>");
	        out.println("</table>");
	        out.println("</td>");
	        out.println("<td style=\"background: url(comun/images/tablas/vertical.gif) 7px 0\" width=\"4\"></td>");
	        out.println("</tr>");

	        out.println("<tr>");
	        out.println("<td style=\"background:url(comun/images/tablas/esquinas.gif) 0 44px\"><img src=\"comun/images/tablas/vacio.gif\" width=\"7\" height=\"7\"></img></td>");
	        out.println("<td style=\"background: url(comun/images/tablas/horizontal.gif) 1px 0\"></td>");
	        out.println("<td style=\"background:url(comun/images/tablas/esquinas.gif) 7px 37px\"><img src=\"comun/images/tablas/vacio.gif\" width=\"7\" height=\"7\"></img></td>");
	        out.println("</tr>");
		    
		    return EVAL_PAGE;
		}
		catch (Exception ex){
			throw new JspTagException("doEndTag() - Excepción en la clase del tag CabeceraPanelTag" , ex);
		}
	}
	
	
	/**
	 * @return the titulo
	 */
	public String getTitulo() {
		return titulo;
	}

	/**
	 * @param titulo the titulo to set
	 */
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	/**
	 * @return the icono
	 */
	public String getIcono() {
		return icono;
	}

	/**
	 * @param icono the icono to set
	 */
	public void setIcono(String icono) {
		this.icono = icono;
	}
}
