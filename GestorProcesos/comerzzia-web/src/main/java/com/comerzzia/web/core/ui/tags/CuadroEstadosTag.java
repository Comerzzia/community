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

import java.util.List;

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.comerzzia.persistencia.core.estados.EstadoBean;

public class CuadroEstadosTag extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8603196452120471805L;
	
	private String titulo = null;
	private List<EstadoBean> estados = null;
	
	
	public int doStartTag () throws JspTagException {
		try {
			JspWriter out = pageContext.getOut();
			
			PanelTag panelTag = new PanelTag();
			panelTag.setPageContext(pageContext);
			panelTag.doStartTag();
			
			CabeceraPanelTag cabeceraPanelTag = new CabeceraPanelTag();
			cabeceraPanelTag.setPageContext(pageContext);
			cabeceraPanelTag.setTitulo(titulo);
			cabeceraPanelTag.doStartTag();
			
			// Menú más acciones
			out.println("<td class=\"accion\" style=\"text-align: right;padding-left:10px\">");
			out.println("  <a href=\"#\" onclick=\"javascript:_toggleMenu(event, '__comerzzia__masAcciones_cuadro_estados_'); return false;\" title=\"Más Acciones\">Más Acciones");
			out.println("    <img height=\"16\" width=\"16\" align=\"top\" border=\"0\" src=\"comun/images/iconos/more.gif\" style=\"cursor: pointer;float:none\"/>");
			out.println("  </a>");
			out.println("  <div id=\"__comerzzia__masAcciones_cuadro_estados_\" class=\"cuadroMasAccionesEstados\" style=\"display:none;\">");
			out.println("    <table class=\"masAccionesEstados\" cellspacing=\"4\" cellpadding=\"0\" border=\"0\">");
			out.println("      <tbody>");
	        out.println("        <tr>");
	        out.println("          <td class=\"accion\" nowrap=\"nowrap\">");
	        out.println("            <a href=\"#\" onclick=\"__seleccionar__Estados__(1);\" style=\"cursor: pointer; margin-right: \">");
	        out.println("              <img src=\"comun/images/iconos/checkbox.png\" border=\"0\" align=\"absmiddle\" title=\"Seleccionar todos\" alt=\"Seleccionar todos\" />");
	        out.println("              Seleccionar todos");
	        out.println("            </a>");
	        out.println("          </td>");
	        out.println("        </tr>");
	        out.println("        <tr>");
	        out.println("          <td class=\"accion\" nowrap=\"nowrap\">");
	        out.println("            <a href=\"#\" onclick=\"__seleccionar__Estados__(0);\" style=\"cursor: pointer; margin-right: \">");
	        out.println("              <img src=\"comun/images/iconos/checkboxVacio.png\" border=\"0\" align=\"absmiddle\" title=\"Deseleccionar todos\" alt=\"Deseleccionar todos\" />");
	        out.println("              Deseleccionar todos");
	        out.println("            </a>");
	        out.println("          </td>");
	        out.println("        </tr>");
	        out.println("        <tr>");
	        out.println("          <td class=\"accion\" nowrap=\"nowrap\">");
	        out.println("            <a href=\"#\" onclick=\"__invertir__Seleccion__Estados__();\" style=\"cursor: pointer; margin-right: \">");
	        out.println("              <img src=\"comun/images/iconos/invertir.png\" border=\"0\" align=\"absmiddle\" title=\"Invertir selección\" alt=\"Invertir selección\" />");
	        out.println("              Invertir selección");
	        out.println("            </a>");
	        out.println("          </td>");
	        out.println("        </tr>");
	        out.println("      </tbody>");
	        out.println("    </table>");
	        out.println("  </div>");
	        out.println("</td>");
	        // Fin Menú más acciones
			
			cabeceraPanelTag.doEndTag();
			
			// Introducción de los scripts necesarios para las acciones en "Más acciones"
			out.println("<script type=\"text/javascript\">");
			out.println("function __seleccionar__Estados__(marca) {var inputs = document.getElementsByTagName(\"input\");for (var i = 0; i < inputs.length; i++) {if(inputs[i].type == \"checkbox\") {if(inputs[i].name.substring(0, 11) == \"_chkEstado_\") {inputs[i].checked = marca;}}}}");
			out.println("function __invertir__Seleccion__Estados__() {var inputs = document.getElementsByTagName(\"input\");for (var i = 0; i < inputs.length; i++) {if(inputs[i].type == \"checkbox\") {if(inputs[i].name.substring(0, 11) == \"_chkEstado_\") {inputs[i].checked = (inputs[i].checked) ? 0 : 1;}}}}");
			out.println("</script>");
			
			CuerpoPanelTag cuerpoPanelTag = new CuerpoPanelTag();
			cuerpoPanelTag.setPageContext(pageContext);
			cuerpoPanelTag.doStartTag();
			
			// Inicio del pintado de los estados
			out.println("        <table width=\"100%\" align=\"left\">");
			for(int i = 0; i < estados.size(); i++) {
				EstadoBean estado = estados.get(i);
				String name = "_chkEstado_" + estado.getEstado();
				String image = estado.getIcono();
				
				out.println("      <tr>");
				out.println("        <td nowrap=\"nowrap\">");
				out.println("          <input type=\"checkbox\" id=\"" + name + "\" name=\"" + name + "\"" + ((estado.isChecked()) ? "checked=\"checked\"" : "") + " />");
				out.println("          <font class=\"subtituloTabla\">" + estado.getDesEstado() + "</font>");
				out.println("        </td>");
				out.println("        <td>");
				out.println("          <img height=\"16\" width=\"16\" align=\"absmiddle\" src=\"" + image + "\" title=\"" + estado.getAmbitoAplicacion() + "\" alt=\"" + estado.getAmbitoAplicacion() + "\" />");
				out.println("        </td>");
				out.println("      </tr>");
			}
			out.println("        </table>");
			// Fin del pintado de los estados
			
			return SKIP_BODY;
		}
		catch (Exception e) {
			throw new JspTagException("doStartTag() - Excepción en la clase del tag EstadosTag" , e);
		}
	}
	
	public int doEndTag () throws JspTagException {
		try {
			CuerpoPanelTag cuerpoPanelTag = new CuerpoPanelTag();
			cuerpoPanelTag.setPageContext(pageContext);
			cuerpoPanelTag.doEndTag();
			
			PanelTag panelTag = new PanelTag();
			panelTag.setPageContext(pageContext);
			panelTag.doEndTag();
			
			return SKIP_BODY;
		}
		catch (Exception e) {
			throw new JspTagException("doEndTag() - Excepción en la clase del tag EstadosTag" , e);
		}
	}
	
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	
	public List<EstadoBean> getEstados() {
		return estados;
	}
	public void setEstados(List<EstadoBean> estados) {
		this.estados = estados;
	}
}
