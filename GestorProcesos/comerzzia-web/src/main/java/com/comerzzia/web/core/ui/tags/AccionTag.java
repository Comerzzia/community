/**
 * 
 */
package com.comerzzia.web.core.ui.tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * @author JMTM
 *
 */
public class AccionTag extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1634894511333542478L;
	
	protected String icono;
	protected String titulo;
	protected String onclick;
	protected String descripcion;
	protected String teclaRapida;
	
	
	public int doStartTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
			if(teclaRapida != null && !teclaRapida.isEmpty()){
				out.println("<script type=\"text/javascript\">");
			    out.println("    $(document).bind(\"keydown\", \"" + teclaRapida + "\", function(event) {");
			    out.println("     " + onclick);
			    out.println("         event.stopPropagation();");
			    out.println("         event.preventDefault();");
			    out.println("         return false;");
			    out.println("    })");
			    out.println("</script>");				
			}
			
			//contador para agrupar las acciones
			int numAccionesPintadas = (Integer)pageContext.getAttribute("numAccionesPintadas");
			int numAccionesSinAgrupar = (Integer)pageContext.getAttribute("numAccionesVisibles");
			
			if (numAccionesSinAgrupar == 0 || numAccionesPintadas < numAccionesSinAgrupar) {
				// Pintar la acción
				pintarAccion(out, 3);
			}
			else {
				//accion agrupada
				if (!(Boolean)pageContext.getAttribute("accionesAgrupadas")){
					pageContext.setAttribute("accionesAgrupadas", true);
			    	String idAcciones = (String)pageContext.getAttribute("idAcciones");
			    	if (idAcciones==null){
			    		idAcciones = ((Integer)pageContext.getAttribute("idMasAcciones")).toString();
			    	}
			    	//incluimos el botón de más acciones
					out.println("<td class=\"accion\" style=\"text-align: right;\">");
					out.println("<a href=\"#\" onclick=\"javascript:_toggleMenu(event, '__comerzzia__masAcciones_"+ idAcciones +"'); return false;\" title=\"Más Acciones\">Más Acciones");
					out.println("<img height=\"16\" width=\"16\" align=\"top\" border=\"0\" src=\"comun/images/iconos/more.gif\" style=\"cursor: pointer;float:none\"/>");
					out.println("</a>");
					out.println("<div id=\"__comerzzia__masAcciones_"+ idAcciones +"\" class=\"cuadroMasAcciones\" style=\"display:none;\">");
					out.println("<table class=\"masAcciones\" cellspacing=\"4\" cellpadding=\"0\" border=\"0\">");
					out.println("<tbody>");
				}
				out.println("<tr>");
				
				// Para pintar la acción
				pintarAccion(out, 0);
				
				out.println("</tr>");
				
			}
			
			numAccionesPintadas++;
			pageContext.setAttribute("numAccionesPintadas", numAccionesPintadas);
			
		}
		catch (Exception ex){
			throw new JspTagException("Excepción en la clase del tag" , ex);
		}
		
		return SKIP_BODY;
	}

	/**
	 * Para pintar la acción es necesario que al menos venga el icono o el texto
	 * 
	 * @param out
	 * @throws IOException
	 */
	private void pintarAccion(JspWriter out, int margen) throws IOException {
		if((icono != null && !icono.isEmpty()) || (titulo != null && !titulo.isEmpty())) {
			out.println("<td class=\"accion\" nowrap=\"nowrap\">");
			out.println("<a href=\"#\" onclick=\"" + onclick + "\" style=\"cursor: pointer; margin-right:"+ margen +";\">");
			if(icono != null && !icono.isEmpty()) {
				String alt = (descripcion != null) ? descripcion : "";
				out.println("<img src=\"" + icono + "\" border=\"0\" align=\"absmiddle\" title=\"" + alt + "\" alt=\"" + alt + "\" >");
			}
			if (titulo != null && !titulo.isEmpty()) {
				out.println(titulo);
			}
			out.println("</a>");
		    out.println("</td>");
		}
	}
	
	public int doEndTag() throws JspException {
		return SKIP_BODY;
	}
	
	
	public String getIcono() {
		return icono;
	}
	public void setIcono(String icono) {
		this.icono = icono;
	}
	
	
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	
	public String getOnclick() {
		return onclick;
	}
	public void setOnclick(String onclick) {
		this.onclick = onclick;
	}

	/**
	 * @return the descripcion
	 */
	public String getDescripcion() {
		return descripcion;
	}

	/**
	 * @param descripcion the descripcion to set
	 */
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

}
