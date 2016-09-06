/**
 * 
 */
package com.comerzzia.web.core.ui.tags;

import javax.servlet.jsp.JspException;

/**
 * @author JMTM
 *
 */
public class PiePanelTag extends CuerpoPanelTag {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1287046683875312449L;
	
	private String alineacion;

	public int doStartTag() throws JspException {
		super.setAlineacion(alineacion);
		return super.doStartTag();
	}
	
	public int doAfterBody() throws JspException {
		return super.doAfterBody();
	}

	
	public int doEndTag() throws JspException {
		return super.doEndTag();
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
}
