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

import com.comerzzia.servicios.core.permisos.PermisosAccionBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class AltaPerfilAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("core/permisos/jsp/administrar.jsp", Vista.INTERNA);

	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "altaPerfil";
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
    		PermisosAccionBean permisos = (PermisosAccionBean) sesion.getAttribute(WebKeys.PERMISOS);

    		// comprobamos permisos sobre la acción
    		PermisosEfectivosAccionBean misPermisos = datosSesion.getPermisosCache(permisos.getAccion());
    		if (!misPermisos.isPuedeAdministrar()){
    			return SIN_PERMISO; 
    		}
    		
    		Long idPerfil = Long.parseLong(request.getParameter("idPerfil"));
    		String desPerfil = request.getParameter("desPerfil");

    		// comprobamos que el perfil no tiene ya permisos para esta acción
    		// y lo añadimos con los permisos por defecto
    		if (permisos.getPermisosPerfil(idPerfil) == null){
        		permisos.addPerfilDefault(idPerfil, desPerfil);
    		}
    		else{
    			setMensajeAviso(request, "El perfil seleccionado ya tiene configurados permisos para esta acción");
    		}

    		
    		request.setAttribute("misPermisos", misPermisos);
    		return NEXT_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setMensajeError(request, "Ha ocurrido un error al intentar añadir el perfil seleccionado.", e);
            return NEXT_PAGE;
        }
    }

}
