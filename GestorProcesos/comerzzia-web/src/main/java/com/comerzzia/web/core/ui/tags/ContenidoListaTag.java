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

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;

public class ContenidoListaTag extends BodyTagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -894769306702944730L;

	// Atributos que recibe la clase del tag en su invocación
	protected List<Object> lista = null;
	protected String variable;

	// Atributos necesarios para la iteración
	private Iterator<?> iterator = null;
	private int indice = 0; // Representa la posición del elemento en la lista
	private int contadorVueltas = 0; // Se utiliza para pintar un estilo de fila u otro 
	
	//atributo para mostrar los elementos borrados o no
	protected boolean verBorrados = false;
	
	
	// TODO: cambiar atributo contadorVuentas por un boolean que indique si la fila es par o no
	// TODO: Eliminar atributo iterator y recorrer la lista con el índice que ya tenemos como atributo
	
	
	public int doStartTag() throws JspTagException {
		try {
			JspWriter out = pageContext.getOut();
			
			// Inicializar los contadores y poner en el pageContext su valor para saber en la JSP el índice actual
			indice = -1;
			contadorVueltas = 0;
			
			out.println("<tbody>");
			
			Object siguiente = obtenerSiguiente();
			if (siguiente != null){
				pageContext.setAttribute(TagKeys.INDICE, indice);
				
				pageContext.setAttribute(variable, siguiente);
				
				return EVAL_BODY_BUFFERED;
			}
			else {
				// Mensaje de que no existen resultados
				out.println("<tr height=\"30px\">");
				out.println("<td align=\"center\" colspan=\"99\">");
				out.println("No se han encontrado resultados");
				out.println("</td>");
				out.println("</tr>");
				
				return SKIP_BODY;
			}
		}
		catch (Exception e) {
			throw new JspTagException("doStartTag() - Excepción en la clase del tag ResultadosTag", e);
		}
	}
	
	public void doInitBody() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			if(lista.get(indice) instanceof MantenimientoBean && !((MantenimientoBean) lista.get(indice)).isActivo()){
				out.println("<tr class=\"fila par inactivo\">");
			}else{
				out.println("<tr class=\"fila par\">");
			}
		}
		catch (Exception e) {
			throw new JspTagException("doInitBody() - Excepción en la clase del tag doInitBody", e);
		}
	}

	public int doAfterBody() throws JspTagException {
		try {
			BodyContent body = getBodyContent();
			JspWriter out = body.getEnclosingWriter();
			
			body.writeOut(getPreviousOut());
			out.println("</tr>");
			
			// Limpiar, ya que la siguiente vez el contenido del cuerpo está vacío 
			body.clearBody();
			
			Object siguiente = obtenerSiguiente();
			if (siguiente != null){
				//tenemos un objeto que pintar
				
				pageContext.setAttribute(TagKeys.INDICE, indice);
				
				// Incrementar el contador de vueltas y poner el elemento en el pageContext para recuperarlo en la JSP
				contadorVueltas++;
				
				pageContext.setAttribute(variable, siguiente);
				
				String clase = "fila";
				// Dependiendo del módulo del valor del contador de vueltas, se usará un estilo u otro para la fila
				if (contadorVueltas % 2 == 0) {
					clase += " par";
				} else {
					clase += " impar";
				}
				//Si esta inactivo se añade a la clase
				if(lista.get(indice) instanceof MantenimientoBean && !((MantenimientoBean) lista.get(indice)).isActivo()){
					clase += " inactivo";
				}
				
				out.println("<tr class=\"" + clase + "\">");
				
				return EVAL_BODY_AGAIN; 
			}else{
				return SKIP_BODY;
			}
		}
		catch (Exception e) {
			throw new JspTagException("doAfterBody() - Excepción en la clase del tag ResultadosTag", e);
		}
	}
	
	/**
	 * @return
	 */
	private Object obtenerSiguiente() {
		if (iterator == null) {
			return null;
		}
		
		while (iterator.hasNext()){
			indice++;
			Object siguiente = iterator.next();
			
			if (verBorrados) {
				return siguiente;
			}
			else if (siguiente instanceof MantenimientoBean) {
				if (((MantenimientoBean) siguiente).getEstadoBean() != Estado.BORRADO) {
					return siguiente;
				}
			}
			else {
				return siguiente;
			}
		}
		
		return null;
	}

	public int doEndTag() throws JspException {
		try {
			JspWriter out = pageContext.getOut();
			
			out.println("</tbody>");
			
			return SKIP_BODY;
		}
		catch (Exception e) {
			throw new JspTagException("doEndTag() - Excepción en la clase del tag ResultadosTag", e);
		}
	}
	
	public List<?> getLista() {
		return lista;
	}
	
	public void setLista(List<?> lista) {
		this.lista= new ArrayList<Object>();
		
		// TODO: mejorar la asignación entre listas con tipo genérico en la parte derecha.
		if (lista != null && lista.size() > 0) {
			for(int i = 0; i < lista.size(); i++) {
				this.lista.add(lista.get(i));
			}
			
			iterator = this.lista.iterator();
		}
	}

	public String getVariable() {
		return variable;
	}

	public void setVariable(String variable) {
		this.variable = variable;
	}

	/**
	 * @return the verBorrados
	 */
	public boolean isVerBorrados() {
		return verBorrados;
	}

	/**
	 * @param verBorrados the verBorrados to set
	 */
	public void setVerBorrados(boolean verBorrados) {
		this.verBorrados = verBorrados;
	}
}

