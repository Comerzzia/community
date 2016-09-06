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

import com.comerzzia.servicios.core.permisos.PermisoConstraintViolationException;
import com.comerzzia.servicios.core.permisos.PermisoException;
import com.comerzzia.servicios.core.permisos.PermisosAccionBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.permisos.ServicioPermisos;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class SalvarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("core/permisos/jsp/administrar.jsp", Vista.INTERNA);

	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "salvar";
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

    		PermisosEfectivosAccionBean misPermisos = datosSesion.getPermisosCache(permisos.getAccion());
    		if (!misPermisos.isPuedeAdministrar()){
    			return SIN_PERMISO; 
    		}

			ServicioPermisos.salvarPermisosAccion(permisos, misPermisos);
    		return getControlador().getAccion("volver").ejecutar(request);
    	}
    	catch (PermisoConstraintViolationException e){
            setMensajeError(request, e.getMessage(), e);
            return NEXT_PAGE;
    	}
    	catch (PermisoException e) {
            setMensajeError(request, e.getMessage(), e);
            return NEXT_PAGE;
		}
    	catch (Exception e) {
            e.printStackTrace();
            setMensajeError(request, "Ha ocurrido un error inesperado al intentar salvar los permisos que había configurado.", e);
            return NEXT_PAGE;
        }
    }

}
