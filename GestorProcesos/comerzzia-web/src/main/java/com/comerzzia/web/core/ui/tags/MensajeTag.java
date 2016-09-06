/**
 * 
 */
package com.comerzzia.web.core.ui.tags;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.comerzzia.web.base.WebKeys;

/**
 * @author JMTM
 *
 */
public class MensajeTag extends TagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4620941010725468755L;


	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		String mensaje= "";
		String imagen= "";
		String clase= "";
		try {
			// MENSAJE
	        if (pageContext.getRequest().getAttribute(WebKeys.MENSAJE) != null){
	        	out.println("<div id=\"mensajeEstandar\" style=\"display:none;\">");
	        	mensaje = (String)pageContext.getRequest().getAttribute(WebKeys.MENSAJE);
	        	imagen = "comun/images/iconos/mensaje_estandar.png";
	        	clase = "cuadro estandar";
	        	pintaMensaje(mensaje,imagen,clase,out);
	        }
	        // INFO
	        if (pageContext.getRequest().getAttribute(WebKeys.MENSAJE_INFO) != null){
	        	out.println("<div id=\"mensajeInfo\" style=\"display:none;\">");
	        	mensaje = (String)pageContext.getRequest().getAttribute(WebKeys.MENSAJE_INFO);
	        	imagen = "comun/images/iconos/mensaje_info.png";
	        	clase= "cuadro info";
	        	pintaMensaje(mensaje,imagen,clase,out);
			}
			// AVISO
			if (pageContext.getRequest().getAttribute(WebKeys.MENSAJE_AVISO) != null){
				out.println("<div id=\"mensajeAviso\" style=\"display:none;\">");
				mensaje = (String)pageContext.getRequest().getAttribute(WebKeys.MENSAJE_AVISO);
	        	imagen = "comun/images/iconos/mensaje_aviso.png";
	        	clase= "cuadro aviso";
	        	pintaMensaje(mensaje,imagen,clase,out);
			}
	        // ERROR 
	        if (pageContext.getRequest().getAttribute(WebKeys.MENSAJE_ERROR) != null){
	        	out.println("<div id=\"mensajeError\" style=\"display:none;\">");
	        	mensaje = (String)pageContext.getRequest().getAttribute(WebKeys.MENSAJE_ERROR);
	        	imagen = "comun/images/iconos/mensaje_error.png";
	        	clase= "cuadro error";
	        	pintaMensaje(mensaje,imagen,clase,out);
	        }

			

		    // si tenemos un mensaje de informacion o un mensaje de error.
		    if (!mensaje.isEmpty()){
		    	//script que se encarga de ocultar el mensaje pasado un tiempo.
		    	out.println("<script language=\"JavaScript\">");
		    	out.println("if(document.getElementById('mensajeEstandar')){document.getElementById('mensajeEstandar').style.display='block';setTimeout(\"document.getElementById('mensajeEstandar').style.display='none';\",5000);}");
		    	out.println("if(document.getElementById('mensajeInfo')){document.getElementById('mensajeInfo').style.display='block';setTimeout(\"document.getElementById('mensajeInfo').style.display='none';\",5000);}");
		    	out.println("if(document.getElementById('mensajeAviso')){document.getElementById('mensajeAviso').style.display='block';}");
		    	out.println("if(document.getElementById('mensajeError')){document.getElementById('mensajeError').style.display='block';}");
		    	out.println("</script>");
		    }
		    	
			return SKIP_BODY;
		}
		catch (Exception e) {
			throw new JspTagException("doStartTag() - Excepción en la clase del tag ResultadoTag", e);
		}
	}

	private void pintaMensaje(String mensaje, String imagen, String clase,JspWriter out) throws IOException{

		out.println("<table class=\""+clase+"\" cellspacing=\"0\" cellpadding=\"0\">");
		out.println("<tr>");
		out.println("<td style=\"width:4;height:4;background:url(comun/images/tablas/esquinas.gif) 0px 72px;\"><img src=\"comun/images/tablas/vacio.gif\" width=4 height=4></img></td>");
		out.println("<td widht=\"4px\" height=\"1px\" style=\"background:url(comun/images/tablas/horizontal.gif) repeat-x 0 -53px;width:4;height:1\"></td>");
		out.println("<td style=\"width:4;height:4;background:url(comun/images/tablas/esquinas.gif) 4px 72px;\"><img src=\"comun/images/tablas/vacio.gif\" width=4 height=4></img></td>");
    	out.println("</tr>");  
    	out.println("<tr style=\"vertical-align:top\">");
    	out.println("<td style=\"background: url(comun/images/tablas/vertical.gif) repeat-y \" width=\"4\"></td>");
    	out.println("<td class=\"mensaje\" width=\"100%\">");
    	out.println("<img src=\""+ imagen +"\"/>");
    	out.println("<span>&nbsp;"+ mensaje +"&nbsp;</span>");
    	out.println("</td>");
    	out.println("<td style=\"background: url(comun/images/tablas/vertical.gif) repeat-y 3px 0\" width=\"4\"></td>");
    	out.println("</tr>");
    	out.println("<tr>");
    	out.println("<td style=\"width:4;height:4;background:url(comun/images/tablas/esquinas.gif) 0px 62px;\"><img src=\"comun/images/tablas/vacio.gif\" width=4 height=4></img></td>");
    	out.println("<td widht=\"4px\" height=\"1px\" style=\"background:url(comun/images/tablas/horizontal.gif) repeat-x 0 -57px;width:4;height:1\"></td>");
    	out.println("<td style=\"width:4;height:4;background:url(comun/images/tablas/esquinas.gif) 4px 62px;\"><img src=\"comun/images/tablas/vacio.gif\" width=4 height=4></img></td>");    	out.println("</tr>");
		out.println("</table>");
		out.println("</div>");
	}
	
	public int doEndTag() throws JspException {
		return SKIP_BODY;
	}
}
