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

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.core.acciones.AccionBean;
import com.comerzzia.persistencia.core.permisos.PermisoBean;
import com.comerzzia.servicios.core.acciones.AccionException;
import com.comerzzia.servicios.core.acciones.AccionNotFoundException;
import com.comerzzia.servicios.core.acciones.ServicioAcciones;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class VerPermisosUsuarioAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("core/permisos/jsp/efectivos.jsp", Vista.INTERNA);
	
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "verPermisosUsuario";
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
    		
    		PermisosEfectivosAccionBean permisosEfectivos = datosSesion.getPermisosCache(accion);
    		List<PermisoBean> permisos = permisosEfectivos.getListaPermisos();
    		Collections.sort(permisos);
    		
    		request.setAttribute("accion", accion);
    		request.setAttribute(WebKeys.PERMISOS, permisos);
    		return NEXT_PAGE;
    	}
    	catch(AccionNotFoundException e){
            setError(request, e);
            return ERROR_WIN;
    	}
    	catch(AccionException e){
            setError(request, e);
            return ERROR_WIN;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            return ERROR_WIN;
        }
    }

}
