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
import javax.servlet.jsp.tagext.BodyTagSupport;

public class PestañaTag extends BodyTagSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7058718947133642107L;
	
	private String titulo = null;
	private String width = "90";
	private String onclick = null;
	private String accion = null;
	
	public int doStartTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
			String activa = (String)pageContext.getAttribute(TagKeys.PESTAÑA_ACTIVA);
			if (activa.equalsIgnoreCase(accion)) {
				out.println("<td style=\"background:url(comun/images/tablas/pestanas.gif) 0 0\"><img name=\"p1_1\" src=\"comun/images/tablas/vacio.gif\" width=5 height=22></td>");
				out.println("<td nowrap=\"nowrap\" class=\"etiquetaPestaña\"><div id=\"p1_2\" onclick=\"\"  align=\"center\" style=\"background:url(comun/images/tablas/horizontal.gif) repeat-x 0 -10px\"><font>"+ titulo +"</font></div></td>");
				out.println("<td style=\"background:url(comun/images/tablas/pestanas.gif) 5px 0\"><img name=\"p1_3\" src=\"comun/images/tablas/vacio.gif\" width=5 height=22></td>");
			}
			else{
				out.println("<td style=\"background:url(comun/images/tablas/pestanas.gif) 0 22px\"><img name=\"p1_1\" src=\"comun/images/tablas/vacio.gif\" width=5 height=22></td>");
				out.println("<td nowrap=\"nowrap\" class=\"etiquetaPestaña\"><div id=\"p1_2\" onclick=\""+ onclick +"\"   align=\"center\" style=\"background:url(comun/images/tablas/horizontal.gif) repeat-x 0 -32px\"><font>"+ titulo +"</font></div></td>");
				out.println("<td style=\"background:url(comun/images/tablas/pestanas.gif) 5px 22px\"><img name=\"p1_3\" src=\"comun/images/tablas/vacio.gif\" width=5 height=22></td>");
			}
			
			return SKIP_BODY;
		}
		catch (Exception e){
			throw new JspTagException("doStartTag() - Excepción en la clase del tag PestañaTag" , e);
		}
	}
	
	
	public String getWidth() {
		return width;
	}
	public void setWidth(String width) {
		this.width = width;
	}
	
	public String getOnclick() {
		return onclick;
	}
	public void setOnclick(String onclick) {
		this.onclick = onclick;
	}
	
	public String getAccion() {
		return accion;
	}
	public void setAccion(String accion) {
		this.accion = accion;
	}

	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
}
