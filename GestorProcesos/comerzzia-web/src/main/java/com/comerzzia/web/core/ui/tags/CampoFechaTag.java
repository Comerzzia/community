/**
 * 
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
public class CampoFechaTag extends BodyTagSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3760576643812337685L;
	
	private String id;
	private String valor = null;
	private boolean mostrarCheckbox = false;
	private boolean marcarCheckbox = false;
	private String clase = null;
	private Integer longitudMaxima = null;
	private String anchura = null;
	private String estilo = null;
	private boolean soloLectura = false;
	private boolean editable = false;
	private boolean requerido = false;
	private String contenido;
	
	private String anchuraPorDefecto = "65"; // Anchura (en pixels) por defecto del input de tipo fecha
	private Integer longitudMaximaPorDefecto = 10; // Longitud máxima por defecto del input de tipo fecha
	
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
			throw new JspTagException("doStartTag() - Excepción en la clase del tag CampoFechaTag", e);
		}
	}
	
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
			out.println("<nobr>");
			// Controlar si se pinta el checkbox comprobando si está marcado y si es solo lectura o no
			if(mostrarCheckbox) {
				out.println("<input type=\"checkbox\" id=\"chk" + Character.toUpperCase(id.charAt(0)) + id.substring(1)+"\" name=\"chk" + Character.toUpperCase(id.charAt(0)) + id.substring(1) + "\" " + ((marcarCheckbox) ? "checked=\"checked\"" : "") + " />");
			}
			
			// Construir input de fecha
			String input = "<input id=\"" + id + "\" name=\"" + id + "\" type=\"text\"";
			
			if(contenido != null) {
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
			
			String maxlengh = " maxlength=\"" + longitudMaximaPorDefecto + "\"";
			if(longitudMaxima != null) {
				maxlengh = " maxlength=\"" + longitudMaxima + "\"";
			}
			input += maxlengh;
			
			String width = " width=\"" + anchuraPorDefecto + "\"";
			if(anchura != null && !anchura.isEmpty()) {
				width = " width=\"" + anchura + "\"";
			}
			input += width;
			
			// Definición del estilo personalizado, más la anchura indicada si viene
			String style = " style=\"width:" + anchuraPorDefecto + ";";
			style += "width:" + anchuraPorDefecto + ";";
			if(estilo != null && !estilo.isEmpty()) {
				style += estilo;
			}
			style += "\"";
			input += style;
			// Fin del estilo personalizado
			
			if(soloLectura) {
				input += " readonly=\"readonly\" tabindex=\"-1\"";
			}
			
			input += " />";
			// Fin input de fecha
			
			out.println(input);
			
			// Añadir la imagen del calendario
			String imagen = "<img id=\""+ "img" + Character.toUpperCase(id.charAt(0)) + id.substring(1) + "\" src=\"comun/images/iconos/calendario.gif\" class=\"imagenCalendario\" align=\"absmiddle\" ";
	        if(!soloLectura && mostrarCheckbox){
	        	imagen += "onMouseUp=\"onClickCalendario('chk" + Character.toUpperCase(id.charAt(0)) + id.substring(1)+"');\" ";
	        }
	        imagen += "/>";
			out.println(imagen);
	        
	        out.println("</nobr>");
	        
			return EVAL_PAGE;
		}
		catch (IOException e) {
			 throw new JspTagException("Excepción en la clase del tag" , e);
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
	
	
	public boolean isMostrarCheckbox() {
		return mostrarCheckbox;
	}
	public void setMostrarCheckbox(boolean mostrarCheckbox) {
		this.mostrarCheckbox = mostrarCheckbox;
	}
	
	
	public boolean isMarcarCheckbox() {
		return marcarCheckbox;
	}
	public void setMarcarCheckbox(boolean marcarCheckbox) {
		this.marcarCheckbox = marcarCheckbox;
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
}
