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
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class CampoTextoTag extends BodyTagSupport{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -9214152398345403038L;

	private String id = null;
	private String valor = null;
	private String clase = null;
	private Integer longitudMaxima = null;
	private String anchura = null;
	private String estilo = null;
	private boolean soloLectura = false;
	private boolean editable = true; // Por defecto, el campo siempre será editable
	private boolean requerido = false;
	private String onChange = null; 
	private String contenido = null;

	// TODO: TAGLIB: Estaría bien añadir atributo tabindex. El atributo onChange sería mejor que fuera onchange, como en los input normales.

	public int doStartTag() throws JspException {
		contenido = valor;
		return EVAL_BODY_BUFFERED;
	}
	

	public int doAfterBody() throws JspTagException {
		BodyContent body = getBodyContent();

		try {
			String contenidoBody = body.getString().trim();
			if (contenidoBody != null && !contenidoBody.isEmpty()){
				contenido = contenidoBody;
			}
			
			body.clearBody();
			return SKIP_BODY;
		}
		catch (Exception e) {
			throw new JspTagException("doStartTag() - Excepción en la clase del tag CampoTextoTag", e);
		}
	}

	
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
			String input = "<input id=\"" + id + "\" name=\"" + id + "\" type=\"text\"";
			
			if(contenido != null && !contenido.isEmpty()) {
				contenido = contenido.replaceAll("\"", "&#034;");
				input += " value=\"" + contenido + "\"";
			}
			else {
				input += " value=\"\"";
			}
			
			if(clase != null && !clase.isEmpty()) {
				input += " class=\"" + clase + "\"";
			}
			else {
				if(editable && requerido) {
					input += " class=\"campo requerido\"";
				}
				else if(soloLectura){
					input += " class=\"campo soloLectura\"";
				}
				else {
					input += " class=\"campo\"";
				}
			}
			
			if(longitudMaxima != null) {
				input += " maxlength=\"" + longitudMaxima + "\"";
			}
			
			if(anchura != null && !anchura.isEmpty()) {
				input += " width=\"" + anchura + "\"";
			}
			
			// Definición del estilo personalizado, más la anchura indicada si viene
			String style = " style=\"";
			if(anchura != null && !anchura.isEmpty()) {
				style += "width:" + anchura + ";";
			}
			if(estilo != null && !estilo.isEmpty()) {
				style += estilo;
			}
			style += "\"";
			input += style;
			// Fin del estilo personalizado
			
			if(soloLectura) {
				input += " readonly=\"readonly\" tabindex=\"-1\" ";
			}
			
			if(onChange != null && !onChange.isEmpty()) {
				input += " onchange=\"" + onChange + "\"";
			}

			input += " />";
			
			out.println(input);
			
			return SKIP_BODY;
		}
		catch (Exception ex){
			throw new JspTagException("Excepción en la clase del tag CampoTextoTag" , ex);
		}
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
	
	
	public String getClase() {
		return clase;
	}
	
	
	public void setClase(String clase) {
		this.clase = clase;
	}
	
	
	public Integer getLongitudMaxima() {
		return longitudMaxima;
	}
	
	
	public void setLongitudMaxima(Integer longitudMaxima) {
		this.longitudMaxima = longitudMaxima;
	}
	
	
	public String getAnchura() {
		return anchura;
	}
	
	
	public void setAnchura(String anchura) {
		this.anchura = anchura;
	}
	
	
	public String getEstilo() {
		return estilo;
	}
	
	
	public void setEstilo(String estilo) {
		this.estilo = estilo;
	}
	
	
	public boolean isSoloLectura() {
		return soloLectura;
	}
	
	
	public void setSoloLectura(boolean soloLectura) {
		this.soloLectura = soloLectura;
	}
	
	
	public boolean isEditable() {
		return editable;
	}
	
	
	public void setEditable(boolean editable) {
		this.editable = editable;
	}
	
	
	public boolean isRequerido() {
		return requerido;
	}
	
	
	public void setRequerido(boolean requerido) {
		this.requerido = requerido;
	}

	public String getOnChange() {
		return onChange;
	}

	public void setOnChange(String onChange) {
		this.onChange = onChange;
	}
}
