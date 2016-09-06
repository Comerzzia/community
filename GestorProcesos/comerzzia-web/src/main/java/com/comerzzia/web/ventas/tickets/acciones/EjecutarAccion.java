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
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.tickets.errores.ServicioErroresTickets;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.tickets.ui.FormularioTicketBean;


public class EjecutarAccion extends Accion {
	
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "ejecutar";
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
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisos(this.getAccionMenu());
    		if (!permisos.isPuedeEjecutar()) {
    			return SIN_PERMISO;
    		}
    		
    		// Inicializamos el formulario
    		FormularioTicketBean formulario = (FormularioTicketBean) sesion.getAttribute(WebKeys.FORMULARIO_TICKET);
    		if (formulario == null) {
    			formulario = new FormularioTicketBean();
    			
    			sesion.setAttribute(WebKeys.FORMULARIO_TICKET, formulario);
    		}
    		formulario.inicializarParametrosBuscar();
    		
    		// Inicializamos los parámetros de búsqueda de los tickets erroneos,
    		// comprobamos si existen tickets con errores en cuyo caso se mostraremos 
    		// la pestaña de Errores
    		ParametrosBuscarErrorTicketsBean param = new ParametrosBuscarErrorTicketsBean();
    		param.setNumPagina(1);
    		formulario.getPestaña(1).setParam(param);
    		if(ServicioErroresTickets.consultar(param, datosSesion).getPagina().size() > 0){
    			formulario.setPestañaActiva(1);
    			formulario.getFormularioPestañaActiva().inicializar();
    		}
    		else {
    			param.setNumPagina(0);
    			formulario.setPestañaActiva(0);
    			formulario.getFormularioPestañaActiva().inicializar();
    		}

    		return getControlador().getAccion("verFormulario").ejecutar(request);
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
    }
}
