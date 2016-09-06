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
import javax.servlet.jsp.tagext.TagSupport;

public class ItemCabeceraListaTag extends TagSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6468307148034933239L;

	private String nombre;
	private Integer columna;
	private String ordenColumna;
	private String estilo;
	
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		
		try {
        	String cabecera = "<th class=\"cabeceraResultados\"";
        	if (estilo != null) {
        		cabecera += " style=\"" + estilo + "\"";
        	}
        	cabecera += ">";
        	
        	out.println(cabecera);
    		out.println("<nobr>");
        	
        	// Obtener el orden actual para determinar
        	String ordenActual = (String)pageContext.getAttribute(TagKeys.ORDEN_ACTUAL);
        	
        	// Comprobar si se está usando ordenación
        	if (ordenActual != null && !ordenActual.isEmpty()
        			&& ordenColumna != null && !ordenColumna.isEmpty()
        			&& columna != null && columna > 0) {
        		
        		out.println("<a href=\"#\" class=\"cabeceraResultados\" onclick=\"ordenar(" + columna + ");\">");
        		String imagenOrdenacion = null;
        		
        		// Comprobar si se está ordenando por la columna en cuestión
        		if(ordenActual.equals(ordenColumna) || ordenActual.equals(ordenColumna + " DESC")) {
        			imagenOrdenacion = "<img height=\"6\" width=\"10\" border=\"0\" src=\"comun/images/iconos/";
	        		
	        		// Comprobar si el orden es ascendiente o descendiente
	        		if (ordenActual.endsWith("DESC")) {
	        			imagenOrdenacion += "orden_des.gif\"";
	        		}
	        		else {
	        			imagenOrdenacion += "orden_asc.gif\"";
	        		}
	        		
	        		imagenOrdenacion += " />";
        		}
        		
            	out.println(nombre);
            	
            	if(imagenOrdenacion != null) {
            		out.println(imagenOrdenacion);
            	}
            	
        		out.println("</a>");
        	}
        	else {
        		out.println(nombre);
        	}
        	
    		out.println("</nobr>");
        	out.println("</th>");
        	
        	return SKIP_BODY;
		}
		catch (Exception e) {
		    throw new JspTagException("doStartTag() - Excepción en la clase del tag ColumnaTag" , e);
		}
	}
	
	
	public int doEndTag() throws JspException {
		return SKIP_BODY;
	}


	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	
	public Integer getColumna() {
		return columna;
	}
	public void setColumna(Integer columna) {
		this.columna = columna;
	}
	
	
	public String getOrdenColumna() {
		return ordenColumna;
	}
	public void setOrdenColumna(String ordenColumna) {
		this.ordenColumna = ordenColumna;
	}
	
	
	public String getEstilo() {
		return estilo;
	}
	public void setEstilo(String estilo) {
		this.estilo = estilo;
	}
}
