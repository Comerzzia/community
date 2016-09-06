/**
 * 
 */
package com.comerzzia.web.core.ui.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 */
public class BotonTag extends TagSupport {

	/**
	 * 
	 */ //TODO: TAGLIB: Pensar si estaría bien poner un atributo para el ancho del botón, sería útil para el asistente de las tarifas
	private static final long serialVersionUID = -4044791423380206846L;
	
	protected String id;
	protected String valor;
	protected String onclick;
	
	
	public int doStartTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			out.println("<input type=\"button\" id=\""+ id +"\" class=\"boton\" name=\""+ id +"\" value=\""+ valor +"\" onclick=\""+ onclick + "\" />");	
		}
		catch (Exception ex){
			throw new JspTagException("Excepción en la clase del tag" , ex);
		}
		
		return SKIP_BODY;
	}

	public int doEndTag() throws JspException {
		return SKIP_BODY;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the valor
	 */
	public String getValor() {
		return valor;
	}

	/**
	 * @param valor the valor to set
	 */
	public void setValor(String valor) {
		this.valor = valor;
	}

	/**
	 * @return the onclick
	 */
	public String getOnclick() {
		return onclick;
	}

	/**
	 * @param onclick the onclick to set
	 */
	public void setOnclick(String onclick) {
		this.onclick = onclick;
	}
}
