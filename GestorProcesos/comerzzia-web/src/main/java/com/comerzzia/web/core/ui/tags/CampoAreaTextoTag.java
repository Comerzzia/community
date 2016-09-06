/**
 * 
 */
package com.comerzzia.web.core.ui.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * @author JMTM
 *
 */
public class CampoAreaTextoTag extends TagSupport {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4169122179418745727L;
	private String id = null;
	private String valor = null;
	private String clase = null;
	private Integer longitudMaxima = null;
	private String anchura = null;
	private String altura = null;
	private String estilo = null;
	private boolean soloLectura = false;
	private boolean editable = true; // Por defecto, el campo siempre será editable
	private boolean requerido = false;


	public int doStartTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
			String textarea = "<textarea id=\"" + id + "\" name=\"" + id + "\"";
			
			if(clase != null && !clase.isEmpty()) {
				textarea += " class=\"" + clase + "\"";
			}
			else {
				if(editable && requerido) {
					textarea += " class=\"campo requerido\"";
				}
				else if(soloLectura){
					textarea += " class=\"campo soloLectura\"";
				}
				else {
					textarea += " class=\"campo\"";
				}
			}
			
			// Definici�n del estilo personalizado, m�s la anchura indicada si viene
			String style = " style=\"";
			if(anchura != null && !anchura.isEmpty()) {
				style += "width:" + anchura + ";";
			}
			if(altura != null && !altura.isEmpty()) {
				style += "height:" + altura + ";";
			}
			if(estilo != null && !estilo.isEmpty()) {
				style += estilo;
			}
			style += "\"";
			textarea += style;
			// Fin del estilo personalizado
			
			if(soloLectura) {
				textarea += " readonly=\"readonly\" tabindex=\"-1\"";
			}
			
			// Antes de terminar el tag, comprobar si se ha especificado longitud para escrbir antes el JS que limita dicha longitud
			if(longitudMaxima != null && longitudMaxima > 0) {
				out.println("<script type=\"text/javascript\">");
				out.println("    function compruebaLongitud(p,l){var t=p.value;if(t.length>=l){t=t.substring(0,l);p.value=t;}}");
				out.println("</script>");
				
				textarea += " onkeypress=\"compruebaLongitud(this, " + longitudMaxima + ");\" onkeyup=\"compruebaLongitud(this, " + longitudMaxima + ");\"";
			}
			
			textarea += ">";
			
			if(valor != null && !valor.isEmpty()) {
				textarea += valor;
			}
			
			textarea += "</textarea>";
			
			out.println(textarea);
			
			return SKIP_BODY;
		}
		catch (Exception ex){
			throw new JspTagException("Excepción en la clase del tag" , ex);
		}
	}
	
	public int doEndTag() throws JspException {
		return SKIP_BODY;
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
	
	
	public String getAltura() {
		return altura;
	}
	public void setAltura(String altura) {
		this.altura = altura;
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
