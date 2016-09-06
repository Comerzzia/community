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

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.GenericPortlet;
import javax.portlet.PortletConfig;
import javax.portlet.PortletContext;
import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import com.comerzzia.util.log.Logger;

public abstract class Portlet extends GenericPortlet {

    public static final String NEXT_PAGE    = "nextPage";
    public static final String ACCION       = "accion";


	/** Vista error general del portlet (se mostrará cuando salte alguna excepción en processAction) */
	protected static final Vista ERROR_VIEW = new Vista("/comun/error/error.jsp", Vista.INTERNA); 

	/** Mapa de acciones que puede ejecutar el portlet. */
	private Map<String,Accion> acciones;
     
	/** Log */
	protected static Logger log; 
	 
	/** Método de inicialización del portlet */
	public void init(PortletConfig pConfig) throws PortletException {
		super.init(pConfig);
		log = Logger.getMLogger(this.getClass());
		acciones = new HashMap<String, Accion>();
		loadAcciones();
	}

	/** doView */
	public void doView(RenderRequest portletRequest,RenderResponse portletResponse)throws PortletException,IOException {
		log.debug("doView() -- Ejecutando doView()");
		Vista nextView = getNextView(portletRequest);
		returnView(portletRequest, portletResponse, nextView);
	}

	/** doEdit */
	public void doEdit(RenderRequest portletRequest,RenderResponse portletResponse)throws PortletException,IOException {
		// comprobamos modo de ejecución
		log.debug("doEdit() -- Ejecutando doEdit()");
		Vista nextView = getNextView(portletRequest);
		returnView(portletRequest, portletResponse, nextView);
	}

	/** doHelp */
	public void doHelp(RenderRequest portletRequest,RenderResponse portletResponse)throws PortletException,IOException {
		log.debug("doHelp() -- NO IMPLEMENTADO");
	}

	/** Devuelve la jsp representada por la vista nextPage. */
	private void returnView (RenderRequest request, RenderResponse response, Vista nextPage)throws IOException, PortletException{
		response.setContentType("text/html");
		PortletContext context = getPortletContext();
		PortletRequestDispatcher rd = context.getRequestDispatcher(nextPage.getURL());
		rd.include(request, response);
	}
	
	/** Obtiene la siguiente vista a devolver recibida por parámetro desde una jsp o como 
	 *  atributo desde una acción. 
	 */
	private Vista getNextView (RenderRequest portletRequest){
		Vista nextPage = (Vista)portletRequest.getAttribute(NEXT_PAGE);
		// Comprobamos si la vista es null y devolvemos acción inicio
		if (nextPage == null){
			// Comprobamos si la hemos recibido por parámetro (renderURL)
			if (portletRequest.getParameter(NEXT_PAGE)!=null){
				log.debug("getNextView() -- Vista recibida por parametro. ");
				nextPage = new Vista(portletRequest.getParameter(NEXT_PAGE));
			}
			// Si no, devolvemos la vista inicial por defecto
			else{
				nextPage = ejecutarInicio(portletRequest); 
			}
		}
		log.debug("getNextView() -- VISTA: " + nextPage.getURL());
		return nextPage;
	}

	/** Método que ejecuta las acciones del portlet */
	public void processAction(ActionRequest request, ActionResponse response)throws PortletException, IOException {
		try{
			// obtenemos la acción a ejecutar
			String nombreAccion = request.getParameter(ACCION);
			log.debug("processAction() -- ACCION: " + nombreAccion);
			
			// comprobamos si la acción es null
			if (nombreAccion == null){
				log.error("processAction() -- SE HA RECIBIDO UNA ACCION NULL");
				return;
			}
			
			// ejecutamos la acción
			Accion accion = acciones.get(nombreAccion);
			if (accion == null){
				log.fatal("processAction() -- ACCION NO IMPLEMENTADA");
				throw new PortletException();
			}
			Vista nextPage = accion.ejecutar(request);
			request.setAttribute(NEXT_PAGE, nextPage);
		}
		catch(Exception e){
			log.error("processAction() -- ERROR: " + e.getMessage());
			e.printStackTrace();
			request.setAttribute(NEXT_PAGE, ERROR_VIEW);
		}
	}
	
	/** Método auxiliar para añadir acciones al mapa de acciones.*/ 
	protected void añadirAccion(Accion accion){
		accion.setPortlet(this);
		acciones.put(accion.getNombre(), accion);
	}
	
	public Accion getAccion(String nombreAccion){
		return acciones.get(nombreAccion);
	}

	/** Método que ejecuta la acción de inicio. */
	protected abstract Vista ejecutarInicio(RenderRequest request);

	/** Método que carga las acciones que puede ejecutar el portlet */
	protected abstract void loadAcciones();
}
