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

import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.comerzzia.persistencia.core.usuarios.UsuarioBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.xml.XMLDocumentUtils;
import com.comerzzia.web.base.WebKeys;

public class MainTag extends BodyTagSupport{

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 420954178300740517L;
	
	private static final String APLICACION = "APLICACION";
	private static final String APLICACIONES = "APLICACIONES";
	
	@SuppressWarnings("unchecked")
	public int doStartTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			HttpSession session = pageContext.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean)session.getAttribute(WebKeys.DATOS_SESION);
			String empresa = null;
			if (datosSesion.getEmpresa() != null && datosSesion.getEmpresa().getDesEmp() != null) {
				empresa = datosSesion.getEmpresa().getDesEmp();
			}
			else {
				empresa = "";
			}
			
	        // Javascript para mostrar/ocultar menu
	        out.println("<script type='text/javascript' language='javascript'>");
	        out.println("function __comerzzia__OcultarMenuLateral() {");
	        out.println("document.getElementById('menuLateral').style.display ='none';");
			out.println("document.getElementById('cerrarMenu').style.display ='none';");
			out.println("document.getElementById('mostrarMenu').style.display ='block';");
			out.println("document.cookie = 'comerzzia.menuLateral.visible=0';");
			out.println("}");
			
			out.println("function __comerzzia__MostrarMenuLateral() {");
	        out.println("document.getElementById('menuLateral').style.display ='';");
			out.println("document.getElementById('cerrarMenu').style.display ='block';");
			out.println("document.getElementById('mostrarMenu').style.display ='none';");
			out.println("document.cookie = 'comerzzia.menuLateral.visible=1';");
			out.println("}");
	        out.println("</script>");
	        // Fin javascript para mostrar/ocultar menu
	        
	        // javascript para mostrar ventana de consulta de las teclas rápidas
	        out.println("<script type='text/javascript' language='javascript'>");
	        out.println("function __comerzzia__consultaTeclasRapidas() {");
	        out.println("	var url = 'teclasRapidas.screen';");
	        out.println("	var rt = abrirVentanaModal(url, '500px', '450px');");
			out.println("}");
	        out.println("</script>");
	        // Fin de javascript
	        
	        // javascript para mostrar ventana de a cerca de
	        out.println("<script type='text/javascript' language='javascript'>");
	        out.println("function __comerzzia__acercaDe() {");
	        out.println("	var url = 'acercaDe.screen';");
	        out.println("	var rt = abrirVentanaModal(url, '315px', '710px');");
			out.println("}");
	        out.println("</script>");
	        // Fin de javascript
	        
	        
	        String ocultarCerrarMenu = "";
	        String ocultarMostrarMenu = "";
	        if(menuLateralVisible()) {
	        	ocultarMostrarMenu = " style=\"display:none;\"";
	        }
	        else {
	        	ocultarCerrarMenu = " style=\"display:none;\"";
	        }
	        
	        
			String aplicacion = (String) datosSesion.getAtributos().get(APLICACION);
			UsuarioBean usuario = datosSesion.getUsuario();
			List<String> aplicaciones = (List<String>) datosSesion.getAtributos().get(APLICACIONES);
			
			// Inicio del pintado del contenedor principal
			out.println("<table class=\"container\">");
			
			// Inicio del pintado de la cabecera
	        out.println("<tr class='cabecera'>");
	        out.println("<td>");
	        out.println("<table width='100%' border='0' cellspacing='0' style='margin-left:6px'>");
	        out.println("<tr>");
	        out.println("<td class=\"tdLogo\"><img src='comun/images/logos/logo_comerzzia.png' alt='Comerzzia' style='margin-left: 20px;height:40px'></img></td>");
	        
	        // Nombre de la empresa
	        out.println("<td style=\"padding:0;margin:0;padding-right:13px\">");
	        out.println("<table class=\"cuadro nombreEmpresa controlCabecera\" cellspacing=\"0\" style=\"width:100%\" cellpadding=\"0\">");
			
	        out.println("<tr>");
	    	out.println("<td style=\"height:4;background:url(comun/images/tablas/esquinas.gif) 0 72px;\"><img src=\"comun/images/tablas/vacio.gif\"  width=4 height=4></img></td>");
	    	out.println("<td colspan=\"3\" style=\"background-position:0 7px\" background=\"comun/images/tablas/horizontal.gif\"></td>");
	    	out.println("<td style=\"width:4;height:4;background:url(comun/images/tablas/esquinas.gif) 4px 72px;\"><img src=\"comun/images/tablas/vacio.gif\" width=4 height=4></img></td>");
	    	out.println("</tr>");  
	    	
	    	out.println("<tr style=\"vertical-align:top\">");
	    	out.println("<td style=\"background: url(comun/images/tablas/vertical.gif) repeat-y \"  width=4></td>");
	    	out.println("<td width='24px'>");
	    	out.println("<img class=\"iconoCabeceraPrincipal\" src='comun/images/iconos/empresa.gif' width=16 height=16></img>");
	    	out.println("</td>");
	    	out.println("<td>");
	    	out.println("<a class=\"textoCabeceraPrincipal\" href=\"inicio.screen\">"+empresa+"</a>");
	    	out.println("</td>");
	    	
	    	out.println("<td align=\"right\">");
	    	out.println("<table cellspacing=\"0\" cellpadding=\"0\">");
	    	out.println("<tr>");
	    	// Pintamos iconos de cabecera
	    	out.println("<td nowrap=\"nowrap\">");
			out.println("<div id='cerrarMenu'"+ ocultarCerrarMenu+ ">");
			out.println("<img class=\"iconoCabecera\" src='comun/images/iconos/ocultarMenu.gif'></img>");
			out.println("<a class=\"textoCabecera\" href='#' onclick='__comerzzia__OcultarMenuLateral()'>Ocultar</a>");
			out.println("</div>");
			out.println("<div id='mostrarMenu'"+ ocultarMostrarMenu+ ">");
			out.println("<img class=\"iconoCabecera\" src='comun/images/iconos/mostrarMenu.gif'></img>");
			out.println("<a class=\"textoCabecera\" href='#' onclick='__comerzzia__MostrarMenuLateral()'>Mostrar</a>");
			out.println("</div>");
			out.println("</td>");
			out.println("<td width=3></td>");
			out.println("<td nowrap=\"nowrap\">");
			out.println("<img class=\"iconoCabecera\" src='comun/images/menu/perfiles.gif'></img>");
			out.println("<a class=\"textoCabecera\" href=\"miPerfil\">Mi Perfil</a>");
			out.println("</td>");
			out.println("<td width=3></td>");
			out.println("<td nowrap=\"nowrap\">");
			out.println("<img class=\"iconoCabecera\" src='comun/images/iconos/impresora.gif'></img>");
			out.println("<a class=\"textoCabecera\" href='javascript:window.print()' onclick=''>Imprimir</a>");
			out.println("</td>");
			out.println("<td width=3></td>");
			out.println("<td nowrap=\"nowrap\">");
			out.println("<img class=\"iconoCabecera\" src='comun/images/iconos/teclasRapidas.gif'></img>");
			out.println("<a class=\"textoCabecera\" href='#' onclick='__comerzzia__consultaTeclasRapidas();'>Teclas Rápidas</a>");
			out.println("</td>");
			out.println("<td width=3></td>");
			out.println("<td nowrap=\"nowrap\">");
			out.println("<img class=\"iconoCabecera\" src='comun/images/iconos/manual.gif'></img>");
			out.println("<a class=\"textoCabecera\" target='_blank' href='http://www.comerzzia.es/portal/web/guest/clientes/documentacion/' onclick=''>Documentación</a>");
			out.println("</td>");
			out.println("<td width=3></td>");
			out.println("<td nowrap=\"nowrap\">");
			out.println("<img class=\"iconoCabecera\" src='comun/images/iconos/info.gif'></img>");
			out.println("<a class=\"textoCabecera\" href='#' onclick='__comerzzia__acercaDe();'>Acerca de</a>");
			out.println("</td>");
			out.println("<td width=3></td>");
			out.println("<td nowrap=\"nowrap\">");
			out.println("<img class=\"iconoCabecera\" src='comun/images/iconos/logout.png'></img>");
			out.println("<a class=\"textoCabecera\" href=\"login\" onclick=''>Desconectar</a>");
        	out.println("</td>");
        	
        	out.println("</tr>");
        	out.println("</table>");
	    	out.println("</td>");
        	
        	out.println("<td style=\"background: url(comun/images/tablas/vertical.gif) repeat-y 3px 0\" width=\"4\"></td>");
	    	out.println("</tr>");
	    	
	    	out.println("<tr>");
	    	
	    	out.println("<td style=\"height:4;background:url(comun/images/tablas/esquinas.gif) 0 62px;\"><img src=\"comun/images/tablas/vacio.gif\" width=4 height=4></img></td>");
	    	out.println("<td colspan=\"3\" style=\"background  : url(comun/images/tablas/horizontal.gif) 0 -57px\"></td>");
	    	out.println("<td style=\"width:4;height:4;background  :url(comun/images/tablas/esquinas.gif) 4px 62px;\"><img src=\"comun/images/tablas/vacio.gif\" width=4 height=4></img></td>");
	    	
	    	out.println("</tr>");
			out.println("</table>");
	        out.println("</td>");
	        
	        // Fin del pintado de la cabecera
	        out.println("</tr>");
	        out.println("</table>");
	        out.println("</td>");
	        out.println("</tr>");
			
	        // Inicio del pintado del cuerpo
	        out.println("<tr>");
	        out.println("<td>");
	        out.println("<table id=\"cuerpo\" cellspacing=\"5\">");
	        out.println("<tr style=\"width: 100%;\">");

	        // Javascript para mostrar/ocultar los puntos de menu
	        out.println("<script type='text/javascript' language='javascript'>");
			out.println("function __comerzzia__mostrarMenu(idMenu){");
			out.println("divs = document.getElementsByTagName(\"div\");");
			out.println("for (var i=0; i < divs.length; i++) {");
			out.println("if (divs[i].id.indexOf(\"__comerzzia__menu_\") == 0) {");
			out.println("if (idMenu == divs[i].id) {");
			out.println("document.getElementById(idMenu).className = 'botonMenuLateral seleccionado';");
			out.println("document.getElementById('link' + idMenu).className= 'botonSeleccionado';");
			out.println("document.getElementById('contenido'+ idMenu).style.display = \"block\";");
			out.println("document.cookie = 'comerzzia.opcionMenu.visible=' + idMenu;");
			out.println("}else{");
			out.println("document.getElementById(divs[i].id).className= 'botonMenuLateral';");
			out.println("document.getElementById('link'+ divs[i].id).className= '';");
			out.println("document.getElementById('contenido'+ divs[i].id).style.display = \"none\";");
			out.println("}");
			out.println("}");
			out.println("}");
			out.println("}");
			out.println("</script>");
	        // Fin javascript para marcar y mostrar el punto de menú donde nos encontramos
			
			String visibilidad = "";
			if(!menuLateralVisible()) {
				visibilidad = "display: none;";
			}

			// Inicio del pintado del menu lateral
			out.println("<td valign=\"top\" id=\"menuLateral\" style=\"" + visibilidad + "\">");
	        out.println("<div>");
	        out.println("<table cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#ffffff\">");
	        out.println("<tbody>");
	        out.println("<tr>");
	        out.println("<td width=\"5\" valign=\"top\" style=\"background: url(comun/images/tablas/menu_esquinas.gif) 0 0;\"></td>");
	        out.println("<td height=\"24\" style=\"background: url(comun/images/tablas/menu_horizontal.gif)\">");
	        out.println("<table width=\"100%\" cellspacing=\"0\" cellpadding=\"6\" border=\"0\">");
	        out.println("<tbody>");
	        out.println("<tr>");
	        out.println("<td>");
	        out.println("<table cellspacing=\"0\" cellpadding=\"0\" style=\"white-space: nowrap;\">");
	        out.println("<tbody>");
	        out.println("<tr>");
	        out.println("<td><div class=\"titulo grande segundoColor\">Menú" + " " + aplicacion + "</div></td>");

	        // Desplegable de cambio de menú de aplicaciones
	        if (usuario.isPuedeCambiarAplicacion() && aplicaciones.size() > 0) {
	        	
	        	out.println("<script type='text/javascript' language='javascript'>");
				out.println("function __comerzzia__cambioMenu(aplicacion){");
				out.println("document.cookie = \"comerzzia.opcionMenu.visible=-1\";");
				out.println("document.location.href = 'aplicaciones?accion=cambioMenu&aplicacion=' + aplicacion");
				out.println("}");
				out.println("</script>");
	        	
	        	out.println("<td style=\"width: 1%;\">");
				out.println("<a href=\"#\" onclick=\"javascript:_toggleMenu(event, '__comerzzia__cambioMenu'); return false;\" title=\"Aplicaciones\">");
				out.println("<img height=\"16\" width=\"16\" align=\"top\" border=\"0\" src=\"comun/images/iconos/more.gif\" style=\"cursor: pointer;float:none\"/>");
				out.println("</a>");
				out.println("<div id=\"__comerzzia__cambioMenu" + "\" class=\"cuadroAplicaciones\" style=\"display:none;\">");
				out.println("<table class=\"masAcciones\" cellspacing=\"4\" cellpadding=\"0\" border=\"0\">");
				out.println("<tbody>");

				for (String ap : aplicaciones) {
					out.println("<tr>");
					pintarAplicacion(out, 0, "comun/images/menu/menu_aplicaciones.gif", ap, ap, "Menú " + ap);
					out.println("</tr>");
				}

				out.println("</tbody>");
				out.println("</table>");
				out.println("</div>");
	        }


	        out.println("</tr>");
	        out.println("</tbody>");
	        out.println("</table>");
	        out.println("</td>");
	        out.println("</tr>");
	        out.println("</tbody>");
	        out.println("</table>");
	        out.println("</td>");
	        out.println("<td width=\"5\" valign=\"top\" align=\"right\" style=\"background: url(comun/images/tablas/menu_esquinas.gif) 5px 0;\"></td>");
	        out.println("</tr>");
	        
	        // Obtenemos el menú
	        if (datosSesion != null) {
		        Document document = datosSesion.getArbolMenu().getDocument();
		        NodeList nodos = document.getElementsByTagName("menu");
		        
		        // Recorremos los nodos principales del menú pintando cada panel de menú
		        out.println("<tr>");
		        out.println("<td colspan=\"3\">");
		        out.println("<div class=\"panelMenuLateral\">");
		        
		        String opcionMenuVisible = opcionMenuVisible();
		        boolean nodoVisible = false;
		        for (int i = 0; i < nodos.getLength(); i++) {
		        	nodoVisible = (opcionMenuVisible.equals("__comerzzia__menu_" + i));   // TODO: Mejorar
		        	pintarMenu(nodos.item(i), i, nodoVisible, out);
		        }
		        
		        out.println("</div>");
		        out.println("</td>");
		        out.println("</tr>");
	        }
	        
	        // Pintamos el pie del menú
	        out.println("<tr>");
	        out.println("<td style=\"background:url(comun/images/tablas/menu_esquinas.gif) 0 12px\"><img height=\"12\" width=\"5\" src=\"comun/images/tablas/vacio.gif\"></img></td>");
	        out.println("<td width=\"100%\" style=\"background: url(comun/images/tablas/menu_horizontal.gif) repeat 0 12px\"></td>");
	        out.println("<td style=\"background:url(comun/images/tablas/menu_esquinas.gif) 5px 12px\"><img height=\"12\" width=\"5\" src=\"comun/images/tablas/vacio.gif\"></img></td>");
	        out.println("</tr>");
	        
	        out.println("</tbody>");
	        out.println("</table>");
	        out.println("</div>");
	        out.println("</td>");
	        // Fin del pintado del menu lateral
	        
	        // Inicio del panel de contenido
	        out.println("<td width=\"85%\" valign=\"top\">");
			
			return EVAL_BODY_BUFFERED;
		}
		catch(Exception e) {
			throw new JspTagException("doStartTag() - Excepción en la clase del tag MainTag", e);
		}
	}
	
	
	private void pintarMenu(Node nodoMenu, int indice, boolean visible, JspWriter out) throws Exception {
		Element menu = (Element)nodoMenu;
		String titulo = menu.getAttribute("titulo");

		String claseDiv = "botonMenuLateral";
		String claseLink = "";
		String estilo = "style=\"display:none;\"";
		
		if (visible) {
			claseDiv = "botonMenuLateral seleccionado";
			claseLink = "botonSeleccionado"; 
			estilo = "";
		}
		
		
		out.println("<div id=\"__comerzzia__menu_" + indice + "\" class=\"" + claseDiv + "\">");
		out.println("<a id=\"link__comerzzia__menu_" + indice + "\" class=\"" + claseLink + "\" href=\"#\" " + 
				    "onclick=\"__comerzzia__mostrarMenu('__comerzzia__menu_" + indice + 
				    "')\">" + titulo + "</a>");
		out.println("</div>");
		
		// Pintamos los elementos de menú de este nodo
		out.println("<div id=\"contenido__comerzzia__menu_" + indice + "\" class=\"panelDesplegado\" " + estilo + ">");
		out.println("<table class=\"tablaOpciones\">");
		out.println("<tr valign=top>");
		out.println("<td width=\"100%\">");
		out.println("<table cellspacing=\"2\" cellpadding=\"2\" width=\"100%\">");
		
		// Solo tenemos dos niveles de menú, por lo que vamos a recorrer sus hijos directos y no vamos a hacer recursividad
		NodeList menuItems = menu.getChildNodes();
        for(int j=0; j<menuItems.getLength(); j++) {
        	Element menuItem = (Element)menuItems.item(j);
            String tituloItem = menuItem.getAttribute("titulo");
            String tipoAccion = XMLDocumentUtils.getTagValue(menuItem, "tipoAccion", true);
            String ejecucion = XMLDocumentUtils.getTagValue(menuItem, "ejecucion", true);
            String parametros = XMLDocumentUtils.getTagValue(menuItem, "parametros", true);
            String icono = XMLDocumentUtils.getTagValue(menuItem, "icono", true);
            
            // Obtenemos la url de la opción de menú
            String url = "";
            if (tipoAccion != null && tipoAccion.equals("URL")) {
            	if (ejecucion != null) {
            		url = ejecucion;
            		if (parametros != null && parametros.length() > 0) {
            			url += "?" + parametros;
            		}
            	}
            }
            
            out.println("<tr>");
    		
    		if(tituloItem.equals("-")){
        		out.println("<td class='separadorMenu'>");
        		out.println("</td>");
    		}
    		else{
        		out.println("<td>");
        		if(icono.equals("")){
            		out.println("<img src='comun/images/menu/menu_item.gif'/>");
        		}
        		else{
        			out.println("<img src=\"" + icono + "\" onerror=\"this.src='comun/images/menu/menu_item.gif'\"/>");
        		}
    			out.println("<a href='" + url + "'>" + tituloItem + "</a>");
        		out.println("</td>");
    		}
    		
    		out.println("</tr>");
        }
		
		out.println("</table>");
		out.println("</td>");
		out.println("</tr>");
		out.println("</table>");
		out.println("</div>");
	}
	
	public int doAfterBody() throws JspException {
		BodyContent body = getBodyContent();
		
		try {
			JspWriter out = body.getEnclosingWriter();
			out.println(body.getString());
			body.clearBody();
			
			return SKIP_BODY;
		}
		catch (Exception e) {
			throw new JspTagException("doAfterBody() - Excepción en la clase del tag MainTag", e);
		}
	}
	
	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
			out.println("</td>");
			out.println("</tr>");
			out.println("</table>");
			out.println("</td>");
			out.println("</tr>");
			// Fin del pintado del cuerpo
			
			out.println("</table>");
			// Fin del pintado del contenedor principal
			
			return EVAL_BODY_BUFFERED;
		}
		catch(Exception e) {
			throw new JspTagException("doEndTag() - Excepción en la clase del tag MainTag", e);
		}
	}
	
	/**
	 * Indica si el menú debe estar visible u oculto en función del valor de la
	 * cookie comerzzia.menu.visible
	 * Si vale 0 se establecerá oculto
	 * Si vale 1 se establecerá visible
	 */
	private boolean menuLateralVisible() {
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
				
		if (getCookieValue(request.getCookies(), "comerzzia.menuLateral.visible", "1").equals("1")) {
			return true;
		}
		else {
			return false;
		}
	}
	
	/**
	 * Indica qué punto del menú está desplegado.
	 * cookie comerzzia.opcionMenu.visible
	 */
	private String opcionMenuVisible() {
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
		
		return getCookieValue(request.getCookies(), "comerzzia.opcionMenu.visible", "-1");
	}

	private static String getCookieValue(Cookie[] cookies, String cookieName, String defaultValue) {
		for(int i=0; i<cookies.length; i++) {
			Cookie cookie = cookies[i];
			if (cookieName.equals(cookie.getName())) {
				return cookie.getValue();
			}
		}
		
		return defaultValue;
	}
	
	/**
	 * Pinta la aplicación para el cambio de menú.
	 * 
	 * @param out
	 * @param margen
	 * @param icono
	 * @param titulo
	 * @param aplicacion
	 * @param descripcion
	 * @throws IOException
	 */
	private void pintarAplicacion(JspWriter out, int margen, String icono, String titulo, String aplicacion, String descripcion) throws IOException {
		if((icono != null && !icono.isEmpty()) || (titulo != null && !titulo.isEmpty())) {
			out.println("<td class=\"accion\" nowrap=\"nowrap\">");
			out.println("<a href=\"#\" onclick=\"__comerzzia__cambioMenu('" + aplicacion + "')\" style=\"cursor: pointer; margin-right:"+ margen +";\">");
			if(icono != null && !icono.isEmpty()) {
				String alt = (descripcion != null) ? descripcion : "";
				out.println("<img src=\"" + icono + "\" border=\"0\" align=\"absmiddle\" title=\"" + alt + "\" alt=\"" + alt + "\" >");
			}
			if (titulo != null && !titulo.isEmpty()) {
				out.println(titulo);
			}
			out.println("</a>");
		    out.println("</td>");
		}
	}
}
