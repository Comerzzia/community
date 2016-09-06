/**
 * Copyright 2009-2014 RED.ES - Desarrollado por TIER1
 * 
 * Licencia con arreglo a la EUPL, versión 1.1 o -en cuanto 
 * sean aprobadas por la comisión Europea- versiones 
 * posteriores de la EUPL (la "Licencia").
 * Solo podrá usarse esta obra si se respeta la Licencia.
 * 
 * http://ec.europa.eu/idabc/eupl.html
 * 
 * Salvo cuando lo exija la legislación aplicable o se acuerde
 * por escrito, el programa distribuido con arreglo a la
 * Licencia se distribuye "TAL CUAL",
 * SIN GARANTÍAS NI CONDICIONES DE NINGÚN TIPO, 
 * ni expresas ni implícitas.
 * Véase la Licencia en el idioma concreto que rige
 * los permisos y limitaciones que establece la Licencia.
 */

package com.comerzzia.web.core.ui.tags;

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;

import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.WebKeys;


public class PanelCMZBackofficeTag extends PanelCMZTag {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 1917375842403684177L;

	private static final String CODALMACEN_SELECCIONADO = "CODALMACEN_SELECCIONADO";
	private static final String DESALMACEN_SELECCIONADO = "DESALMACEN_SELECCIONADO";

	public int doEndTag()throws JspTagException {
		try {
			JspWriter out = pageContext.getOut();
			
			DatosSesionBean datosSesion = (DatosSesionBean)pageContext.getSession().getAttribute(WebKeys.DATOS_SESION);
			String usuario = "";
			String almacen = "";
			
			try {
				if (datosSesion != null) {
					usuario = datosSesion.getUsuario().getDesUsuario();
					almacen = (String) datosSesion.getAtributos().get(CODALMACEN_SELECCIONADO) +
								" " + (String) datosSesion.getAtributos().get(DESALMACEN_SELECCIONADO);
				}
			} catch (Exception ignore) {;}

		    // Pie del panel
			out.println("<tr>");
			out.println("<td colspan=\"4\" style=\"height:1\">");
			out.println("<table class=\"fondoPie\" cellspacing=\"0\" cellpadding=\"0\">");			
			out.println("<tr height=\"7px\">");
	        out.println("<td style=\"background:url(comun/images/tablas/esquinas.gif) 0 9px\"><img src=\"comun/images/tablas/vacio.gif\" width=\"4\" height=\"9\"></td>");
	        out.println("<td style=\"background: url(comun/images/tablas/horizontal.gif) 0 16px\"></td>");
	        out.println("<td style=\"background:url(comun/images/tablas/esquinas.gif) 4px 9px\"><img src=\"comun/images/tablas/vacio.gif\" width=\"4\" height=\"9\"></td>");
	        out.println("</tr>");
	        out.println("<tr height=\"20px\">");
	        out.println("<td style=\"background: url(comun/images/tablas/vertical.gif)\" width=\"4\"></td>");
	        out.println("<td>");
	        out.println("<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\">");
	        out.println("<tr>");
        	out.println("<td align=\"left\" class=\"usuario\">USUARIO: " + usuario + "</td>");
	        out.println("<td align=\"right\" class=\"entidad\">" + almacen + "</td>");
	        out.println("</tr>");
	        out.println("</table>");
	        out.println("</td>");
	        out.println("<td style=\"background: url(comun/images/tablas/vertical.gif) 19px 0\" width=\"4\"></td>");
	        out.println("</tr>");
	        out.println("<tr height=\"7px\">");
	        out.println("<td style=\"background:url(comun/images/tablas/esquinas.gif) 0 65px\"></td>");
	        out.println("<td width=100% style=\"background-image: url(comun/images/tablas/horizontal.gif);background-position: 0 23px\"></td>");
	        out.println("<td style=\"background:url(comun/images/tablas/esquinas.gif) 4px 65px\"></td>");
	        out.println("</tr>");
		    
	        out.println("</table>");
	        out.println("</td>");
	        out.println("</tr>");
	        
	        out.println("</table>");
		} 
		catch (Exception ex){
			throw new JspTagException("Excepción en la clase del tag" , ex);
		}
		
		return SKIP_BODY;
	}
}
