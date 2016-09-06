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

package com.comerzzia.portlets.base;

import javax.portlet.ActionRequest;

/**
 * Acción que se ejecuta en el servidor
 */
public abstract class Accion {

	protected static final Vista ERROR_GENERAL = new Vista("/comun/error/error.jsp", Vista.INTERNA); 
    
	protected Portlet portlet;
	
    /**
     * Constructor
     */
    public Accion() {
    }
    
    /**
     * Devuelve el nombre identificador de la acción 
     * @return 
     */
	public abstract String getNombre();
	
	/**
     * Ejecutará el código necesario para realizar la acción 
     * @param request datos de la peticion
     * @return 
     */
	public abstract Vista ejecutar(ActionRequest request);
	
	
	public void setMensajeError(ActionRequest request, String msg){
		request.setAttribute(WebKeys.MENSAJE_ERROR, msg);
	}

	public void setMensajeInfo(ActionRequest request, String msg){
		request.setAttribute(WebKeys.MENSAJE_INFO, msg);
	}

	public Portlet getPortlet() {
		return portlet;
	}

	public void setPortlet(Portlet portlet) {
		this.portlet = portlet;
	}
	
	
}
