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

package com.comerzzia.web.core.permisos.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.core.acciones.AccionBean;
import com.comerzzia.servicios.core.acciones.AccionException;
import com.comerzzia.servicios.core.acciones.AccionNotFoundException;
import com.comerzzia.servicios.core.acciones.ServicioAcciones;
import com.comerzzia.servicios.core.permisos.PermisoException;
import com.comerzzia.servicios.core.permisos.PermisosAccionBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.permisos.ServicioPermisos;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class AdministrarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("core/permisos/jsp/administrar.jsp", Vista.INTERNA);
	
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "administrar";
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
    		
    		Long idAccion = Long.parseLong(request.getParameter("idAccion"));
    		AccionBean accion = ServicioAcciones.obtenerAccion(idAccion);
    		
    		PermisosEfectivosAccionBean permisosEfectivos = datosSesion.getPermisos(accion); 
    		// Comprobamos los permisos de la acción
    		if (!permisosEfectivos.isPuedeAdministrar()) {
    			return SIN_PERMISO;
    		}

    		PermisosAccionBean permisos = ServicioPermisos.obtenerPermisosAccion(accion);
    		
    		request.setAttribute("misPermisos", permisosEfectivos);
    		sesion.setAttribute(WebKeys.PERMISOS, permisos);
    		return NEXT_PAGE;
    	}
    	catch(AccionNotFoundException e){
            setError(request, e);
            return ERROR_PAGE;
    	}
    	catch(AccionException e){
            setError(request, e);
            return ERROR_PAGE;
    	}
    	catch (PermisoException e) {
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
