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

import com.comerzzia.persistencia.ventas.tickets.errores.ParametrosBuscarErrorTicketsBean;
import com.comerzzia.persistencia.ventas.tickets.historico.ParametrosBuscarHistoricoTicketsBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.tickets.ServicioTickets;
import com.comerzzia.servicios.ventas.tickets.errores.ServicioErroresTickets;
import com.comerzzia.servicios.ventas.tickets.historico.ServicioHistoricoTickets;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.tickets.ui.FormularioTicketBean;


public class VerFormularioAccion extends Accion {
	
	private static final Vista NEXT_PAGE = new Vista("ventas/tickets/monitorizacion/jsp/ticket.jsp", Vista.INTERNA);

	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
	public String getNombre() {
		return "verFormulario";
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
			
			// Actualizamos el formulario
			FormularioTicketBean formulario = (FormularioTicketBean) sesion.getAttribute(WebKeys.FORMULARIO_TICKET);
			inicializaPestañaActiva(formulario, datosSesion, request, sesion);
			
			return NEXT_PAGE;
		}
		catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
		}
	}
	
	
	private void inicializaPestañaActiva(FormularioTicketBean formulario, DatosSesionBean datosSesion, HttpServletRequest request, HttpSession sesion) throws Exception {
		// Actualizamos la pestaña activa
		switch (formulario.getPestañaActiva()) {
			case 0:
				formulario.getFormularioPestañaActiva().setRegistros(ServicioTickets.consultarResumenPendientes(datosSesion));
				break;
				
			case 1:
				// Obtenemos los parámetros de búsqueda y consultamos los tickets erroneos
				ParametrosBuscarErrorTicketsBean paramBuscarTicketsErroneos = formulario.getParametrosBuscarErrorTicket();
				// Si tenemos página, realizamos la búsqueda
				if (paramBuscarTicketsErroneos.getNumPagina() > 0) {
					PaginaResultados paginaResultadosErroneos = ServicioErroresTickets.consultar(paramBuscarTicketsErroneos, datosSesion);
	                request.setAttribute(WebKeys.PAGINA_RESULTADOS, paginaResultadosErroneos);
				}
                break;
            
			case 2:
				//Obtenemos los parámetros de búsqueda y consultamos el historico de tickets porcesados
				ParametrosBuscarHistoricoTicketsBean paramBuscarTicketsProcesados = formulario.getParametrosBuscarHistoricoTicket();
				// Si tenemos página, realizamos la búsqueda
	            if (paramBuscarTicketsProcesados.getNumPagina() > 0) {
	                PaginaResultados paginaResultadosProcesados = ServicioHistoricoTickets.consultar(paramBuscarTicketsProcesados, datosSesion);
	                request.setAttribute(WebKeys.PAGINA_RESULTADOS, paginaResultadosProcesados);
	            }
	            break;
		}
	}
}
