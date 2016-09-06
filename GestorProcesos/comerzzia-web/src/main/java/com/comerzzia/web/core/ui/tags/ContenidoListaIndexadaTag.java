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

import com.comerzzia.web.base.TeclasRapidasKeys;

public class ContenidoListaIndexadaTag extends ContenidoListaTag {

	/**
	 * 
	 */
	private static final long serialVersionUID = 247727858702546100L;
	
	//accion asociada a la pulsación de las teclas rápidas correspondientes
	private String accion = "verRegistroPestaña(0);";
	
	@Override
	public int doStartTag() throws JspTagException {
		try {
			JspWriter out = pageContext.getOut();
			
			if(lista.size() > 0){
				out.println("<script type=\"text/javascript\">");
			    out.println("    $(document).bind(\"keydown\", \"" + TeclasRapidasKeys.MODO_TABLA_FICHA_HK + "\", function(event) {");
			    out.println("     " + accion);
			    out.println("         event.stopPropagation();");
			    out.println("         event.preventDefault();");
			    out.println("         return false;");
			    out.println("    })");
			    out.println("</script>");
			}
			
			return super.doStartTag();	
			
		} catch (Exception e) {
			throw new JspTagException("doStartTag() - Excepción en la clase del tag ResultadosTag", e);
		}
	}

	public String getAccion() {
		return accion;
	}

	public void setAccion(String accion) {
		this.accion = accion;
	}
}
