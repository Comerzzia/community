/**
 * 
 */
package com.comerzzia.web.core.ui.tags;

import javax.servlet.jsp.JspTagException;

/**
 * @author JMTM
 *
 */
public class CabeceraListaPaginadaTag extends CabeceraListaTag {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5339757570712963447L;
	
	private String ordenActual;

	
	public int doAfterBody() throws JspTagException {
		return super.doAfterBody();
	}

	
	public int doEndTag() throws JspTagException {
		return super.doEndTag();
	}

	
	public int doStartTag() throws JspTagException {
		if (ordenActual != null && !ordenActual.equals(""))
			super.setOrdenActual(ordenActual);
		return super.doStartTag();
	}


	/**
	 * @return the ordenActual
	 */
	public String getOrdenActual() {
		return ordenActual;
	}


	/**
	 * @param ordenActual the ordenActual to set
	 */
	public void setOrdenActual(String ordenActual) {
		this.ordenActual = ordenActual;
	}

}
