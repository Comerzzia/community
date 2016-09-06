/**
 * 
 */
package com.comerzzia.web.core.ui.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

/**
 * @author JMTM
 *
 */
public class AccionesTag extends BodyTagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6727268546583377821L;

	private int numAccionesVisibles;
	private String alineacion;
	private int idMasAcciones = 0;
	private String idAcciones;
	
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		try {
			if (alineacion != null)
				out.println("<td align=\""+ alineacion +"\">");
			else
				out.println("<td align=\"right\">");
			
			out.println("<table cellspacing=\"0\" cellpadding=\"0\">");
			out.println("<tr>");
			
			pageContext.setAttribute("numAccionesVisibles", numAccionesVisibles);
			pageContext.setAttribute("numAccionesPintadas", 0);
			pageContext.setAttribute("idMasAcciones", idMasAcciones);
			pageContext.setAttribute("idAcciones", idAcciones);
			pageContext.setAttribute("accionesAgrupadas", false);
			
		} catch (Exception e) {
			throw new JspTagException("doStartTag() - Excepción en la clase del tag AccionesTag" , e);
		}	
    	return EVAL_BODY_BUFFERED;
	}

	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			out.println("</td>");
			out.println("</tr>");
    		out.println("</table>");
		    
		} catch (Exception ex){
			throw new JspTagException("doEndTag() - Excepción en la clase del tag AccionesTag" , ex);
		}
		
		return EVAL_PAGE;
	}


	public int doAfterBody() throws JspException {
		BodyContent body = getBodyContent();

	      try {
			JspWriter out = body.getEnclosingWriter();
		    out.println(body.getString());
		    
		    //si se han agrupado acciones cerramos el div del cuadro de mas acciones antes de volver a pintar las acciones
		    //del siguiente resultado.
		    if ((Boolean)pageContext.getAttribute("accionesAgrupadas")){
		    	//asignamos un identificador al cuadro de más acciones
		    	this.idMasAcciones ++;
		    	pageContext.setAttribute("idMasAcciones", this.idMasAcciones);
				pageContext.setAttribute("idAcciones", this.idAcciones);
		    	out.println("</tbody>");
				out.println("</table>");
				out.println("</div>");
				out.println("</td>");
			}
		    
		    body.clearBody();
		    
	      } catch(Exception e) {
	    	  throw new JspTagException("doAfterBody() - Excepción en la clase del tag AccionesTag" , e);
		  }
			
	      return SKIP_BODY; 
	}


	public String getAlineacion() {
		return alineacion;
	}

	public void setAlineacion(String alineacion) {
		this.alineacion = alineacion;
	}

	public int getIdMasAcciones() {
		return idMasAcciones;
	}

	public void setIdMasAcciones(int idMasAcciones) {
		this.idMasAcciones = idMasAcciones;
	}

	/**
	 * @return the numAccionesVisibles
	 */
	public int getNumAccionesVisibles() {
		return numAccionesVisibles;
	}

	/**
	 * @param numAccionesVisibles the numAccionesVisibles to set
	 */
	public void setNumAccionesVisibles(int numAccionesVisibles) {
		this.numAccionesVisibles = numAccionesVisibles;
	}

	public String getIdAcciones() {
		return idAcciones;
	}

	public void setIdAcciones(String idAcciones) {
		this.idAcciones = idAcciones;
	}
	
	
}
