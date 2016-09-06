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


public class CabeceraPanelPrincipalTag extends BodyTagSupport {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -9130259949622596689L;
	
	private String titulo;
	private String icono;
	
	
	public int doStartTag() throws JspException {
		try{
			JspWriter out = pageContext.getOut();
			
			// Iniciamos la cabecera
	        
			out.println("<tr>");
	        out.println("<td colspan=\"4\" valign=\"top\" style=\"height:1\">");
	        out.println("<table class=\"fondoPrincipal\" cellpadding=\"0\" cellspacing=\"0\">");
	        
	        out.println("<tr height=\"7px\">");
	        out.println("<td valign=\"top\" style=\"background:url(comun/images/tablas/esquinas.gif) 0 72px\"></td>");
	        out.println("<td width=100% style=\"background: url(comun/images/tablas/horizontal.gif) 0 -53px; background-repeat:repeat-x;\" valign=\"top\"></td>");
	        out.println("<td valign=\"top\" style=\"background:url(comun/images/tablas/esquinas.gif) 4px 72px\"></td>");	        out.println("</tr>");
	        out.println("</tr>");
	        
	        out.println("<tr height=\"20px\">");
	        out.println("<td style=\"background: url(comun/images/tablas/vertical.gif) 0 0\" width=\"4\"></td>");
	        out.println("<td >");
	        out.println("<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">");
	        out.println("<tr>");
	        
	        // Pintamos el icono si lo tenemos
	        if(icono != null && !icono.isEmpty()) {
		        out.println("<td width=\"22\">");
		        out.println("<img id=\"_icono_menu_item\" src=\"" + icono + "\" onerror=\"this.src='comun/images/menu/menu_item.gif'\">");
		        out.println("</td>");
	        }
	        
	        // Pintamos el título
	        out.println("<td>");
	        out.println("<div class=\"titulo grande\">" + titulo + "</div>");
	        out.println("</td>");
		}
		catch (Exception e) {
			throw new JspTagException("Excepción en la clase del tag" , e);
		}
		
		return EVAL_BODY_BUFFERED;
	}
	
	
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
			// Finalizamos la cabecera

		 	out.println("</tr>");
	        out.println("</table>");
	        out.println("</td>");
	        out.println("<td style=\"background: url(comun/images/tablas/vertical.gif) 19px 0\"></td>");
	        out.println("</tr>");
	        
	        out.println("<tr height=\"7px\">");
	        out.println("<td style=\"background:url(comun/images/tablas/esquinas.gif) 0 0\"><img src=\"comun/images/tablas/vacio.gif\" width=4 height=7></td>");
	        out.println("<td style=\"background: url(comun/images/tablas/horizontal.gif) 0 18px\"></td>");
	        out.println("<td style=\"background:url(comun/images/tablas/esquinas.gif) 4px 0\"><img src=\"comun/images/tablas/vacio.gif\" width=4 height=7\"></td>");
	        out.println("</tr>");
	        
			out.println("</table>");
			out.println("</td>");
			out.println("</tr>");
		}
		catch (Exception e) {
			throw new JspTagException("Excepción en la clase del tag" , e);
		}
		
		return SKIP_BODY;
	}
	
	
	public int doAfterBody() throws JspTagException {
		BodyContent body = getBodyContent();

		try {
			JspWriter out = body.getEnclosingWriter();
			out.println(body.getString());
			body.clearBody();
		}
		catch(IOException ioe) {
			throw new JspTagException("Excepción en la clase del tag" , ioe);
		}
	
		return SKIP_BODY; 
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
