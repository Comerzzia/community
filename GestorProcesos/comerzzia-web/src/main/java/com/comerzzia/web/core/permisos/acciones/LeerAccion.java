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

import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.servicios.core.permisos.PermisosAccionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class LeerAccion extends Accion {

	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "leer";
    }
    
    /**
     * Ejecuta la acción
     * @param request Datos de la petición
     * @return Vista con la siguiente pagina a mostrar
     */
    @SuppressWarnings("unchecked")
	public Vista ejecutar(HttpServletRequest request) {
    	try {
    		HttpSession sesion = request.getSession();
    		
    		PermisosAccionBean permisos = (PermisosAccionBean) sesion.getAttribute(WebKeys.PERMISOS); 
    		permisos.borrarPermisos(); 

    		String operacion = request.getParameter("operacion");

			// recorremos todo el mapa de parámetros recibidos 
			Map<String, Object> parametrosMap = request.getParameterMap();
			Iterator<String> it = parametrosMap.keySet().iterator();
			while (it.hasNext()){
				String parametro = it.next();
				if (parametro.indexOf("permiso")!=-1){
					String[] idPermiso = parametro.split("\\|");
					String tipo = idPermiso[1]; // PER o USU
					Long id = Long.parseLong(idPermiso[2]); // idUsuario o idPerfil
					Byte idOperacion = Byte.parseByte(idPermiso[3]); // idOperacion
					String bytePermiso = request.getParameter(parametro); // 0,1,2 o vacío
					
					if (!bytePermiso.isEmpty()){
						Byte acceso = Byte.parseByte(bytePermiso);
						if (tipo.equals("PER")){
							permisos.addPermisoPerfil(id, idOperacion, acceso);
						}
						else { // --> (tipo.equals("USU"))
							permisos.addPermisoUsuario(id, idOperacion, acceso);
						}
					}
				}
			}
			
    		return getControlador().getAccion(operacion).ejecutar(request);
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setMensajeError(request, "Se ha producido un error al intentar leer los permisos que había configurado.", e);
            return getControlador().getAccion("administrar").ejecutar(request);
        }
    }

}
