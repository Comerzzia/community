/**
 * 
 */
package com.comerzzia.web.core.ui.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;

/**
 * @author JMTM
 *
 */
public class CabeceraPanelResultadosTag extends CabeceraPanelTag {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7098624997511607009L;
	
	private String titulo = "Resultados";
	private String numPorPagina;
	
	public int doStartTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			super.setTitulo(titulo);
			super.doStartTag();
			
			if (numPorPagina != null){
        		out.println("<td align=\"right\">");
        		out.println("<span id=\"browse:items-txt1\">Resultados por página</span>");
     	        out.println("<input id=\"tamanoPagina\" name=\"tamanoPagina\" type=\"text\" class=\"campo numero\" maxlength=\"3\" value=\"" + numPorPagina + "\" >");
     	        out.println("</td>");
        	}
		
		} catch (Exception ex) {
		    throw new JspTagException("doStartTag() - Excepción en la clase del tag CabeceraPanelTag" , ex);
		}
		
		return EVAL_BODY_BUFFERED;
	}
	
	public int doAfterBody() throws JspException {
		return super.doAfterBody();
	}

	public int doEndTag() throws JspException {
		return super.doEndTag();
	}

	/**
	 * @return the titulo
	 */
	public String getTitulo() {
		return titulo;
	}

	/**
	 * @param titulo the titulo to set
	 */
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	/**
	 * @return the numPorPagina
	 */
	public String getNumPorPagina() {
		return numPorPagina;
	}

	/**
	 * @param numPorPagina the numPorPagina to set
	 */
	public void setNumPorPagina(String numPorPagina) {
		this.numPorPagina = numPorPagina;
	}

}
