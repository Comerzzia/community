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

package com.comerzzia.web.sincronizacion.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.sincronizacion.TrabajoSincronizadorBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.sincronizacion.ServicioSincronizador;
import com.comerzzia.servicios.sincronizacion.TrabajoSincronizadorException;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.sincronizacion.ui.FormularioSincronizacionBean;

public class SalvarAccion extends Accion {

	@Override
	public String getNombre() {
		return "salvar";
	}
	
	@Override
	public Vista ejecutar(HttpServletRequest request) {
		try {
    		HttpSession sesion = request.getSession();
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeEjecutar()) {
    			return SIN_PERMISO;
    		}
    		
    		// Obtenemos el trabajo del formulario y lo salvamos
    		FormularioSincronizacionBean formulario = (FormularioSincronizacionBean) sesion.getAttribute(WebKeys.FORMULARIO_SINCRONIZACION);
    		TrabajoSincronizadorBean trabajo = (TrabajoSincronizadorBean) formulario.getFormularioPestañaActiva().getRegistroActivo();
    		ServicioSincronizador.modificar(trabajo, datosSesion);
    		formulario.getFormularioPestañaActiva().aceptar();
	    	
    		// Volvemos a consultar el trabajo
    		try {
    			trabajo = ServicioSincronizador.consultar(trabajo.getIdTrabajo(), datosSesion);
    			formulario.getFormularioPestañaActiva().inicializar(trabajo);
    			
    			setMensaje(request, "El trabajo se ha grabado correctamente");
    			return getControlador().getAccion("verFormulario").ejecutar(request);
    		}
    		catch (Exception e) {
    			setMensajeError(request, "El trabajo se ha salvado correctamente pero no se ha podido acceder al registro", e);
    			return getControlador().getAccion("verFormulario").ejecutar(request);
    		}
	    		    		
    	}
		catch (TrabajoSincronizadorException e) {
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
