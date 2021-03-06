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

package com.comerzzia.web.ventas.tickets.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.ventas.tickets.errores.ErrorTicketBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.tickets.errores.ErrorTicketException;
import com.comerzzia.servicios.ventas.tickets.errores.ErrorTicketNotFoundException;
import com.comerzzia.servicios.ventas.tickets.errores.ServicioErroresTickets;
import com.comerzzia.util.xml.XMLDocumentUtils;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.tickets.ui.FormularioTicketBean;


public class VerTicketErroneoAccion extends Accion {
	
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "verTicketErroneo";
    }
    
    /**
     * Ejecuta la acción
     * @param request Datos de la petición
     * @return Vista con la siguiente pagina a mostrar
     */
    public Vista ejecutar(HttpServletRequest request) {
    	try {
    		HttpSession sesion = request.getSession();
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeEjecutar()) {
    			return SIN_PERMISO;
    		}

    		// Obtenemos el ticket
    		String uidTicket = request.getParameter(WebKeys.ID_OBJETO);
    		ErrorTicketBean ticket = ServicioErroresTickets.consultar(uidTicket, datosSesion);
    		
    		// TODO: Ver si este método puede estar directamente en ErrorTicketBean o incluso en TicketBean
    		ticket.setXmlError(XMLDocumentUtils.DocumentToString(ticket.getXml()));

			//Obtengo el formulario e inicializo el formulario y la pestaña, 
			//indicando que está en consulta
			FormularioTicketBean formulario = (FormularioTicketBean) sesion.getAttribute(WebKeys.FORMULARIO_TICKET);
    		formulario.getFormularioPestañaActiva().inicializar(ticket);
			formulario.getFormularioPestañaActiva().setModoVisualizacionFicha();
			
    		// Mostramos el formulario
    		return getControlador().getAccion("verFormulario").ejecutar(request);
    	}
    	catch (ErrorTicketNotFoundException e) {
    		// Si no se encuentra el registro volvemos a ver el formulario
    		setMensajeError(request, "No se ha encontrado el registro", e);
            return getControlador().getAccion("verFomulario").ejecutar(request);
    	}
    	catch (ErrorTicketException e) {
    		setError(request, e);
    		
            return ERROR_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
    }
}
