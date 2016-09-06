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
public class AccionNavegacionRegistrosTag extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3613760565241132902L;
	
	private int actual;
	private int total;
	private int primero;
	private int anterior;
	private int siguiente;
	private int ultimo;
	private String onclick;

	public int doStartTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();

			String img = null;
			String func = null;
			String estilo = null;
			
			// Botón Primer Registro
			if (primero == -1) {
				img = "comun/images/iconos/paginaPrimera_no.gif";
				func = "";
				estilo = "";
			}
			else {
				img = "comun/images/iconos/paginaPrimera.gif";
				func = onclick + "('"+ primero +"')";
				estilo = "cursor:pointer;";
			}
			
			out.println("<td class=\"accion\" nowrap=\"nowrap\">");
			out.println("<img src=\""+ img +"\" onclick=\""+ func +"\" style=\""+ estilo +" margin-right: 3px;\"  border=\"0\" align=\"absmiddle\" title=\"Primer Registro\" alt=\"Primer Registro\" >");
		    out.println("</td>");
		    
		    
		    // Botón Anterior Registro
		    if (anterior == -1) {
				img = "comun/images/iconos/paginaPrevia_no.gif";
				func = "";
				estilo = "";
			}
			else {
				img = "comun/images/iconos/paginaPrevia.gif";
				func = onclick + "('"+ anterior +"')";
				estilo = "cursor:pointer;";
			}
		    
		    out.println("<td class=\"accion\" nowrap=\"nowrap\">");
		    out.println("<img src=\""+ img +"\" onclick=\""+ func +"\" style=\""+ estilo +" margin-right: 3px;\"  border=\"0\" align=\"absmiddle\" title=\"Anterior\" alt=\"Anterior\" >");
		    out.println("</td>");
		    
		    
		    // Indicador de registro actual y número total de registros
		    out.println("<td>");
		    out.println("<b>Reg. " + actual + "/" + total + "</b>&nbsp;");
		    out.println("</td>");
		    
		    
		    // Botón Siguiente Registro
		    if (siguiente == -1) {
				img = "comun/images/iconos/paginaSiguiente_no.gif";
				func = "";
				estilo = "";
			}
			else {
				img = "comun/images/iconos/paginaSiguiente.gif";
				func = onclick + "('"+ siguiente +"')";
				estilo = "cursor:pointer;";
			}
		    
		    out.println("<td class=\"accion\" nowrap=\"nowrap\">");
		    out.println("<img src=\""+ img +"\" onclick=\""+ func +"\" style=\""+ estilo +" margin-right: 3px;\"  border=\"0\" align=\"absmiddle\" title=\"Siguiente\" alt=\"Siguiente\" >");
		    out.println("</td>");
		    
		    
		    // Botón Último Registro
		    if (ultimo == -1) {
				img = "comun/images/iconos/paginaFinal_no.gif";
				func = "";
				estilo = "";
			}
			else {
				img = "comun/images/iconos/paginaFinal.gif";
				func = onclick + "('"+ ultimo +"')";
				estilo = "cursor:pointer;";
			}
		    
		    out.println("<td class=\"accion\" nowrap=\"nowrap\">");
		    out.println("<img src=\""+ img +"\" onclick=\""+ func +"\" style=\""+ estilo +" margin-right: 3px;\"  border=\"0\" align=\"absmiddle\" title=\"Último Registro\" alt=\"Último Registro\" >");
		    out.println("</td>");
			
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
	 * @return the actual
	 */
	public int getActual() {
		return actual;
	}

	/**
	 * @param actual the actual to set
	 */
	public void setActual(int actual) {
		this.actual = actual;
	}

	/**
	 * @return the total
	 */
	public int getTotal() {
		return total;
	}

	/**
	 * @param total the total to set
	 */
	public void setTotal(int total) {
		this.total = total;
	}

	/**
	 * @return the primero
	 */
	public int getPrimero() {
		return primero;
	}

	/**
	 * @param primero the primero to set
	 */
	public void setPrimero(int primero) {
		this.primero = primero;
	}

	/**
	 * @return the anterior
	 */
	public int getAnterior() {
		return anterior;
	}

	/**
	 * @param anterior the anterior to set
	 */
	public void setAnterior(int anterior) {
		this.anterior = anterior;
	}

	/**
	 * @return the siguiente
	 */
	public int getSiguiente() {
		return siguiente;
	}

	/**
	 * @param siguiente the siguiente to set
	 */
	public void setSiguiente(int siguiente) {
		this.siguiente = siguiente;
	}

	/**
	 * @return the ultimo
	 */
	public int getUltimo() {
		return ultimo;
	}

	/**
	 * @param ultimo the ultimo to set
	 */
	public void setUltimo(int ultimo) {
		this.ultimo = ultimo;
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
