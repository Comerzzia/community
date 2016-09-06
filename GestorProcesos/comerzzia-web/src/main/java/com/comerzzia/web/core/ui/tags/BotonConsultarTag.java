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

import com.comerzzia.web.base.TeclasRapidasKeys;

public class BotonConsultarTag extends BotonTag {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7102158752686141645L;
	
	private String onclick = "";
	private String id = "btnConsultar";
	private String valor = "Consultar";

	@Override
	public int doStartTag() throws JspException {
		super.onclick = this.onclick;
		super.id = this.id;
		super.valor = this.valor;
		
		try {
			JspWriter out = pageContext.getOut();
			out.println("<script type=\"text/javascript\">");
		    out.println("    $(document).bind(\"keydown\", \"" + TeclasRapidasKeys.ACCION_CONSULTAR_HK + "\", function(event) {");
		    out.println("     " + onclick);
		    out.println("         event.stopPropagation();");
		    out.println("         event.preventDefault();");
		    out.println("         return false;");
		    out.println("    })");
		    out.println("</script>");
		    
		    return super.doStartTag();
			
		} catch (Exception e) {
			throw new JspTagException("Excepción en la clase del tag" , e);
		}
	}

	public String getOnclick() {
		return onclick;
	}

	public void setOnclick(String onclick) {
		this.onclick = onclick;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

}
