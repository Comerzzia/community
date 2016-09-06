/**
 * 
 */
package com.comerzzia.web.core.ui.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;

/**
 * @author JMTM
 *
 */
public class ItemContenidoListaPaginadaTag extends ItemContenidoListaTag {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7118650005029681126L;
	
	private String valor;
	private String alineacion;
	private String onclick;

	public int doStartTag() throws JspException {
		super.setValor(valor);
		if (this.alineacion != null && !this.alineacion.equals(""))
			super.setAlineacion(alineacion);
		if (this.onclick != null && !this.onclick.equals(""))
			super.setOnclick(onclick);
		
		return super.doStartTag();
	}
	
	public int doAfterBody() throws JspTagException {
		return super.doAfterBody();
	}
	
	public int doEndTag() throws JspException {
		return super.doEndTag();
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
	 * @return the alineacion
	 */
	public String getAlineacion() {
		return alineacion;
	}

	/**
	 * @param alineacion the alineacion to set
	 */
	public void setAlineacion(String alineacion) {
		this.alineacion = alineacion;
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
