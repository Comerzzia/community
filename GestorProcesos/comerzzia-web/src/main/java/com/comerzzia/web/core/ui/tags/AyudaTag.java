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

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.comerzzia.persistencia.core.ayudas.AyudaBean;
import com.comerzzia.servicios.core.ayudas.AyudaException;
import com.comerzzia.servicios.core.ayudas.Ayudas;
import com.comerzzia.web.base.TeclasRapidasKeys;

public class AyudaTag extends BodyTagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9037620810437693229L;
	
	/* Código */
	private String idCodigo = null;
	private String valorCodigo = null;
	private String longitudMaximaCodigo = null;
	private String anchuraCodigo = null;
	private String estiloCodigo = null;
	private String onchange = null;

	/* Descripción */
	private String idDescripcion = null;
	private String valorDescripcion = null;
	private String anchuraDescripcion = null;
	private String estiloDescripcion = null;
	private boolean editable = false;

	/* Comunes */
	private boolean soloLectura = false;
	private boolean requerido = false;
	private String accionAyudaXML = null;
	private String nombreAyuda = null;
	private String onclick = null;
	private String campoFiltro = null;
	
	public int doStartTag() throws JspException {
		try {
			return EVAL_BODY_BUFFERED;
		}
		catch (Exception e) {
			throw new JspTagException("doStartTag() - Excepción en la clase del tag AyudaTag" , e);
		}
	}
	
	public int doAfterBody() throws JspException {
		try {
			BodyContent body = getBodyContent();
			JspWriter out = body.getEnclosingWriter();
			out.println(body.getString());
			body.clearBody();
			
			return SKIP_BODY;
		}
		catch (Exception e) {
			throw new JspTagException("doAfterBody() - Excepción en la clase del tag AyudaTag", e);
		}
	}

	public int doEndTag()throws JspTagException{
		try {
			JspWriter out = pageContext.getOut();
			
			//Obtenemos el bean de la ayuda según el nombre de esta
			Ayudas ayudas = Ayudas.getInstance();
			AyudaBean ayuda = ayudas.getAyuda(nombreAyuda);

			String inputCodigo = obtenerInputCodigo(out, ayuda);
			out.println(inputCodigo);
			
			String inputDescripcion = obtenerInputDescripcion(out);
			out.println(inputDescripcion);

			String imagenDesplegable = "";
			if(!soloLectura) {
				if((onclick != null) && (!onclick.equals(""))){
					imagenDesplegable = "<img src=\"comun/images/iconos/desplegable.gif\" class=\"prismaticos\" align=\"absMiddle\" border=\"0\" valign=\"middle\"  onClick=\"" + onclick + "\"  WIDTH=\"16\" HEIGHT=\"16\"/>";
				}
				else if(((accionAyudaXML != null) && (!accionAyudaXML.equals("")) && ((campoFiltro != null) && (!campoFiltro.equals(""))))){
					imagenDesplegable = "<img src=\"comun/images/iconos/desplegable.gif\" class=\"prismaticos\" align=\"absMiddle\" border=\"0\" valign=\"middle\"  onClick=\"buscar('" + nombreAyuda + "','" + idCodigo + "', '" + idDescripcion + "', '" + accionAyudaXML + "', '" + campoFiltro + "')\"  WIDTH=\"16\" HEIGHT=\"16\"/>";
				}
				else if((accionAyudaXML != null) && (!accionAyudaXML.equals(""))){
					imagenDesplegable = "<img src=\"comun/images/iconos/desplegable.gif\" class=\"prismaticos\" align=\"absMiddle\" border=\"0\" valign=\"middle\"  onClick=\"buscar('" + nombreAyuda + "','" + idCodigo + "', '" + idDescripcion + "', '" + accionAyudaXML + "', " + campoFiltro + ")\"  WIDTH=\"16\" HEIGHT=\"16\"/>";
				}
				else if((campoFiltro != null) && (!campoFiltro.equals(""))){
					imagenDesplegable = "<img src=\"comun/images/iconos/desplegable.gif\" class=\"prismaticos\" align=\"absMiddle\" border=\"0\" valign=\"middle\"  onClick=\"buscar('" + nombreAyuda + "','" + idCodigo + "', '" + idDescripcion + "', " + accionAyudaXML + ", '" + campoFiltro + "')\"  WIDTH=\"16\" HEIGHT=\"16\"/>";
				}
				else{
					imagenDesplegable = "<img src=\"comun/images/iconos/desplegable.gif\" class=\"prismaticos\" align=\"absMiddle\" border=\"0\" valign=\"middle\"  onClick=\"buscar('" + nombreAyuda + "','" + idCodigo + "', '" + idDescripcion + "')\"  WIDTH=\"16\" HEIGHT=\"16\"/>";
				}

				if(!ayuda.isCampoCodigoVisible() && !editable){
					imagenDesplegable += "&nbsp;&nbsp;<img src=\"comun/images/iconos/borrarDatos.gif\" style=\"VERTICAL-ALIGN:top;HEIGHT: 16px; CURSOR: pointer;\" onClick=\"borrarDatos('" + idCodigo + "', '" + idDescripcion + "')\" align=\"absMiddle\" border=\"0\" valign=\"middle\" WIDTH=\"16\" HEIGHT=\"16\" />";
				}
				
				out.println("");
				out.println("<script type=\"text/javascript\">");
				String funcion = "";
				if(onclick != null && !onclick.isEmpty()){
					funcion = onclick;
				}
				else if(((accionAyudaXML != null) && (!accionAyudaXML.equals("")) && ((campoFiltro != null) && (!campoFiltro.equals(""))))){
					funcion =  "buscar('" + nombreAyuda + "','" + idCodigo + "', '" + idDescripcion + "', '" + accionAyudaXML + "', '" + campoFiltro + "')";
				}
				else if((accionAyudaXML != null) && (!accionAyudaXML.equals(""))){
					funcion = "buscar('" + nombreAyuda + "','" + idCodigo + "', '" + idDescripcion + "', '" + accionAyudaXML + "', " + campoFiltro + ")";
				}
				else if((campoFiltro != null) && (!campoFiltro.equals(""))){
					funcion = "buscar('" + nombreAyuda + "','" + idCodigo + "', '" + idDescripcion + "', " + accionAyudaXML + ", '" + campoFiltro + "')";
				}
				else{
					funcion = "buscar('" + nombreAyuda + "','" + idCodigo + "', '" + idDescripcion + "')";
				}
				
				out.println("$('#" + idCodigo + "').bind('keydown',\"" + TeclasRapidasKeys.ABRIR_AYUDA_HK + "\", function(event) {");
				out.println("	" + funcion + ";");
			    out.println("	event.stopPropagation();");
			    out.println("	event.preventDefault();");
				out.println("	return false;});");
				out.println("</script>");
				out.println("");
			}
			
			
			out.println(imagenDesplegable);

		}
		catch (Exception e) {
			throw new JspTagException("doEndTag() - Excepción en la clase del tag AyudaTag" , e);
		}

		return SKIP_BODY;
	}
	
	private String obtenerInputCodigo(JspWriter out, AyudaBean ayuda) throws AyudaException {
		//Empezamos a contruir el input
		String input = "<input id=\"" + idCodigo + "\" name=\"" + idCodigo + "\"";
		
		//Comprobamos si el campo código es visible o no
		if(ayuda.isCampoCodigoVisible()) {
			input += "  type=\"text\"";
			//Indicamos cual será la clase del campo
			if(soloLectura){
				input += " class=\"campo soloLectura\" readonly=\"readonly\" tabindex=\"-1\"";
			}
			else if(requerido) {
				input += " class=\"campo requerido\"";
			}
			else {
				input += " class=\"campo\"";
			}
			//Indicamos la longitud máxima del código
			if(longitudMaximaCodigo != null) {
				input += " maxlength=\"" + longitudMaximaCodigo + "\"";
			}
			//Indicamos su anchura
			if(anchuraCodigo != null && !anchuraCodigo.isEmpty()) {
				input += " width=\"" + anchuraCodigo + "\"";
			}
			//Definimos a qué ayuda XML llamará
			if((accionAyudaXML != null) && (!accionAyudaXML.equals(""))){
				input += " onchange=\"return buscarAccionXML('" + accionAyudaXML + "','" + idCodigo + "','" + idDescripcion + "')\"";
			}
			else{
				if((onchange != null) && (!onchange.isEmpty())){
					input += " onchange=\"" + onchange + " \"";					
				}
				else{
					input += " onchange=\"return buscarXML('" + nombreAyuda + "','" + idCodigo + "', '" + idDescripcion + "')\" ";
				}
			}
		}
		else {
			input += "  type=\"hidden\"";
		}

		//Indicamos el valor del campo código por defecto
		if(valorCodigo != null && !valorCodigo.isEmpty()) {
			input += " value=\"" + valorCodigo + "\"";
		}
		else {
			input += " value=\"\"";
		}
		
		// Definición del estilo personalizado, más la anchura indicada si viene
		String style = " style=\"";
		if(anchuraCodigo != null && !anchuraCodigo.isEmpty()) {
			style += "width:" + anchuraCodigo + ";";
		}
		if(estiloCodigo != null && !estiloCodigo.isEmpty()) {
			style += estiloCodigo;
		}
		style += "\"";
		input += style;
		// Fin del estilo personalizado
		
		// capturamos evento onkeydown
		input += " onkeydown=\"_onkeydownAyuda(event, this, \'"+ idDescripcion +"\');\" ";
		
		//Cerramos el campo input
		input += " />";
		
		return input;
	}

	private String obtenerInputDescripcion(JspWriter out) {
		String input = "<input id=\"" + idDescripcion + "\" name=\"" +idDescripcion + "\" type=\"text\"";
		
		if(valorDescripcion != null && !valorDescripcion.isEmpty()) {
			valorDescripcion = valorDescripcion.replaceAll("\"", "&#034;");
			input += " value=\"" + valorDescripcion + "\"";
		}
		else {
			input += " value=\"\"";
		}
		
		//Indicamos la anchura del campo
		if(anchuraDescripcion != null && !anchuraDescripcion.isEmpty()) {
			input += " width=\"" + anchuraDescripcion + "\"";
		}
		
		// Definición del estilo personalizado, más la anchura indicada si viene
		String style = " style=\"";
		if(anchuraDescripcion != null && !anchuraDescripcion.isEmpty()) {
			style += "width:" + anchuraDescripcion + ";";
		}
		if(estiloDescripcion != null && !estiloDescripcion.isEmpty()) {
			style += estiloDescripcion;
		}
		style += "\"";
		input += style;
		// Fin del estilo personalizado
		
		//Indicamos cual será la clase del campo
		if(editable){
			input += " class=\"campo soloLectura requerido\"";
		}
		else{
			input += " class=\"campo soloLectura\"";
		}

		//Indicamos que el campo será solo lectura
		input += " readonly=\"readonly\" tabindex=\"-1\"";
		
		//Cerramos el input de la descripción
		input += " />";
		
		return input;
	}

	public boolean isSoloLectura() {
		return soloLectura;
	}

	public void setSoloLectura(boolean soloLectura) {
		this.soloLectura = soloLectura;
	}

	public boolean isRequerido() {
		return requerido;
	}

	public void setRequerido(boolean requerido) {
		this.requerido = requerido;
	}

	public String getAccionAyudaXML() {
		return accionAyudaXML;
	}

	public void setAccionAyudaXML(String accionAyudaXML) {
		this.accionAyudaXML = accionAyudaXML;
	}

	public String getNombreAyuda() {
		return nombreAyuda;
	}

	public void setNombreAyuda(String nombreAyuda) {
		this.nombreAyuda = nombreAyuda;
	}

	public String getIdCodigo() {
		return idCodigo;
	}

	public void setIdCodigo(String idCodigo) {
		this.idCodigo = idCodigo;
	}

	public String getValorCodigo() {
		return valorCodigo;
	}

	public void setValorCodigo(String valorCodigo) {
		this.valorCodigo = valorCodigo;
	}

	public String getLongitudMaximaCodigo() {
		return longitudMaximaCodigo;
	}

	public void setLongitudMaximaCodigo(String longitudMaximaCodigo) {
		this.longitudMaximaCodigo = longitudMaximaCodigo;
	}

	public String getAnchuraCodigo() {
		return anchuraCodigo;
	}

	public void setAnchuraCodigo(String anchuraCodigo) {
		this.anchuraCodigo = anchuraCodigo;
	}

	public String getEstiloCodigo() {
		return estiloCodigo;
	}

	public void setEstiloCodigo(String estiloCodigo) {
		this.estiloCodigo = estiloCodigo;
	}

	public String getIdDescripcion() {
		return idDescripcion;
	}

	public void setIdDescripcion(String idDescripcion) {
		this.idDescripcion = idDescripcion;
	}

	public String getValorDescripcion() {
		return valorDescripcion;
	}

	public void setValorDescripcion(String valorDescripcion) {
		this.valorDescripcion = valorDescripcion;
	}

	public String getAnchuraDescripcion() {
		return anchuraDescripcion;
	}

	public void setAnchuraDescripcion(String anchuraDescripcion) {
		this.anchuraDescripcion = anchuraDescripcion;
	}

	public String getEstiloDescripcion() {
		return estiloDescripcion;
	}

	public void setEstiloDescripcion(String estiloDescripcion) {
		this.estiloDescripcion = estiloDescripcion;
	}

	public String getOnchange() {
		return onchange;
	}

	public void setOnchange(String onchange) {
		this.onchange = onchange;
	}

	public String getOnclick() {
		return onclick;
	}

	public void setOnclick(String onclick) {
		this.onclick = onclick;
	}

	public boolean isEditable() {
		return editable;
	}

	public void setEditable(boolean editable) {
		this.editable = editable;
	}

	public String getCampoFiltro() {
		return campoFiltro;
	}

	public void setCampoFiltro(String campoFiltro) {
		this.campoFiltro = campoFiltro;
	}
}
