/**
 * 
 */
package com.comerzzia.web.core.ui.tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;

import com.comerzzia.util.paginacion.PaginaResultados;

/**
 * @author JMTM
 *
 */
public class ContenidoListaPaginadaTag extends ContenidoListaTag {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8637743432827711369L;
	
	private PaginaResultados paginaResultados;
	private String variable;
	
	public int doStartTag() throws JspTagException {
		super.setLista(this.paginaResultados.getPagina());
		super.setVariable(this.variable);
		return super.doStartTag();
	}
	
	public void doInitBody() throws JspException {
		super.doInitBody();
	}
	
	public int doAfterBody() throws JspTagException {
		return super.doAfterBody();
	}
	
	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		
		try {
			// Inicio del pintado de la paginación
		    out.println("<tr>");
		    out.println("<td colspan=\"99\" align=\"center\">");
		    if (paginaResultados.getTotalResultados() != 0) {
		    	out.println("<span class=\"paginacion\">");
		    	if(paginaResultados.getNumPagina() > 0 && !paginaResultados.isEsPrimeraPagina()) {
		    		out.println("<img src=\"comun/images/iconos/paginaPrimera.gif\" width=\"16\" height=\"16\" border=\"0\" onClick=\"paginar('1')\" style=\"cursor: pointer;\">&nbsp;");
		    		out.println("<img src=\"comun/images/iconos/paginaPrevia.gif\" width=\"16\" height=\"16\" border=\"0\" onClick=\"paginar('" + paginaResultados.getAnteriorPagina() + "')\" style=\"cursor: pointer;\">&nbsp;");
		    	}
		    	else {
		    		out.println("<img src=\"comun/images/iconos/paginaPrimera_no.gif\" width=\"16\" height=\"16\" border=\"0\">&nbsp;");
		    		out.println("<img src=\"comun/images/iconos/paginaPrevia_no.gif\" width=\"16\" height=\"16\" border=\"0\">&nbsp;");
		    	}
		    	out.println("<b>Pág. " + paginaResultados.getNumPagina() + "/" + +paginaResultados.getNumeroTotalPaginas() + "</b>&nbsp;");
		    	if(!paginaResultados.isEsUltimaPagina()) {
		    		out.println("<img src=\"comun/images/iconos/paginaSiguiente.gif\" width=\"16\" height=\"16\" border=\"0\" onClick=\"paginar('" + paginaResultados.getSiguientePagina() + "')\" style=\"cursor: pointer;\">&nbsp;");
		    		out.println("<img src=\"comun/images/iconos/paginaFinal.gif\" width=\"16\" height=\"16\" border=\"0\" onClick=\"paginar('" + paginaResultados.getNumeroTotalPaginas() + "')\" style=\"cursor: pointer;\">");
		    	}
		    	else {
		    		out.println("<img src=\"comun/images/iconos/paginaSiguiente_no.gif\" width=\"16\" height=\"16\" border=\"0\">&nbsp;");
		    		out.println("<img src=\"comun/images/iconos/paginaFinal_no.gif\" width=\"16\" height=\"16\" border=\"0\">");
		    	}
		    	out.println("</span>");
		    }
		    out.println("</td>");
		    out.println("</tr>");
			// Fin del pintado de la paginación
		    
			out.println("</tbody>");
			
			return SKIP_BODY;
		}
		catch (IOException e) {
			throw new JspTagException("doEndTag() - Excepción en la clase del tag ResultadosPaginadosTag",e);
		}
	}

	/**
	 * @return the paginaResultados
	 */
	public PaginaResultados getPaginaResultados() {
		return paginaResultados;
	}

	/**
	 * @param paginaResultados the paginaResultados to set
	 */
	public void setPaginaResultados(PaginaResultados paginaResultados) {
		this.paginaResultados = paginaResultados;
	}

	/**
	 * @return the variable
	 */
	public String getVariable() {
		return variable;
	}

	/**
	 * @param variable the variable to set
	 */
	public void setVariable(String variable) {
		this.variable = variable;
	}

}
