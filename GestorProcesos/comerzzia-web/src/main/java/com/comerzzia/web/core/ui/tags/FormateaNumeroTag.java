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

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.comerzzia.util.numeros.Numero;

public class FormateaNumeroTag extends BodyTagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9089943173777303827L;
	
	private Object valor;
	private boolean valorEspecificado;
	private String variable;
	private boolean variableEspecificada;
	private int numDecimales;
	private boolean numDecimalesEspecificado;
	
	public FormateaNumeroTag (){
		inicio();
	}
	
	/**
	 * Método para inicializar las variables del tag
	 */
	private void inicio(){
		this.valor = null;
		this.valorEspecificado = false;
		this.variable = null;
		this.variableEspecificada = false;
		this.numDecimalesEspecificado = false;
	}
	
	public int doEndTag() throws JspException {
		String valorFormateado = null;
		Object v = null;
		
		if (valorEspecificado){
			//el valor se especifica en el tag
			v = this.valor;
		}else if (bodyContent != null && (bodyContent.getString() != null)){
			//el valor se especifica en el cuerpo del tag
			v = bodyContent.getString().trim();
		}
		
		//si no tenemos valor especificado, eliminamos la variable
		if (v == null || v.equals("")){
			if (this.variable != null){
				pageContext.removeAttribute(this.variable);
			}
			return EVAL_PAGE;
		}
		
		//si el valor lo recogemos del body, debemos deformatearlo
		if (v instanceof String){
			try {
		        if (((String)v).indexOf(46) != -1)
		          v = Double.valueOf((String)v);
		        else
		          v = Long.valueOf((String)v);
		      }
		      catch (NumberFormatException nfe) {
		    	  throw new JspTagException("doEndTag() - Error de formato en la clase del tag FormateaNumeroTag", nfe);
		      }
		}
		
		//obtenemos el valor formateado
		if (numDecimalesEspecificado){
			 valorFormateado = Numero.formatea(v, this.numDecimales);
		}else{
			valorFormateado = Numero.formatea(v);
		}
		
	    if (variableEspecificada){
	    	pageContext.setAttribute(this.variable, valorFormateado);
	    }else{
	    	try{
	    		pageContext.getOut().print(valorFormateado);
	    	}catch (IOException ioe){
	    		throw new JspTagException("doEndTag() - Error en la clase del tag FormateaNumeroTag", ioe);
	    	}
	    }
	    
		return EVAL_PAGE;
	}


	public Object getValor() {
		return valor;
	}


	public void setValor(Object valor) {
		this.valor = valor;
		this.valorEspecificado = true;
	}


	public String getVariable() {
		return variable;
	}


	public void setVariable(String variable) {
		this.variable = variable;
		this.variableEspecificada = true;
	}


	public int getNumDecimales() {
		return numDecimales;
	}


	public void setNumDecimales(int numDecimales) {
		this.numDecimales = numDecimales;
		this.numDecimalesEspecificado = true;
	}
}
