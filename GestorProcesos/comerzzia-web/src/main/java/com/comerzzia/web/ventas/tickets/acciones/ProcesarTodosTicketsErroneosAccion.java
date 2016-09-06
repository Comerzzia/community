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

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.ventas.tickets.errores.ErrorTicketBean;
import com.comerzzia.persistencia.ventas.tickets.errores.ParametrosBuscarErrorTicketsBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.tickets.ServicioTickets;
import com.comerzzia.servicios.ventas.tickets.TicketConstraintViolationException;
import com.comerzzia.servicios.ventas.tickets.TicketException;
import com.comerzzia.servicios.ventas.tickets.errores.ErrorTicketException;
import com.comerzzia.servicios.ventas.tickets.errores.ServicioErroresTickets;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.tickets.ui.FormularioTicketBean;


public class ProcesarTodosTicketsErroneosAccion extends Accion {

	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "procesarTodosTicketsErroneos";
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
    		
        	// Obtenemos la lista de los tickets erróneos de la última consulta realizada en el formulario
    		FormularioTicketBean formulario = (FormularioTicketBean) sesion.getAttribute(WebKeys.FORMULARIO_TICKET);
    		ParametrosBuscarErrorTicketsBean paramBuscarTicketsErroneos = formulario.getParametrosBuscarErrorTicket();
			List<ErrorTicketBean> lstTicketsErroneos = ServicioErroresTickets.consultarTicketsErroneos(paramBuscarTicketsErroneos, datosSesion);
			
			// Y los volvemos a procesar
			int correctos = 0;
			int erroneos = 0;
			for (int i = 0; i < lstTicketsErroneos.size(); i++) {
				try {
					ServicioTickets.crearAlbaranDesdeTicketError(lstTicketsErroneos.get(i).getUidTicket(), datosSesion);
					correctos++;
				} 
				catch (TicketConstraintViolationException e) {
					erroneos++;
				} 
				catch (TicketException e) {
					erroneos++;
				}
			}
			
			if (correctos > 0) {
				setMensaje(request, "Se han procesado correctamente " + correctos + " tickets");
			}
			
			if (erroneos > 0) {
				setMensajeAviso(request, "Quedan " + erroneos + " tickets con errores sin procesar");
			}
    		
    		return getControlador().getAccion("verFormulario").ejecutar(request);
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
