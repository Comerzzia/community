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

package com.comerzzia.web.core.usuarios.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.usuarios.ServicioUsuarios;
import com.comerzzia.servicios.core.usuarios.UsuarioException;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class RestablecerContraseñaAccion extends Accion{

	private static final Vista NEXT_PAGE = new Vista("core/usuarios/mantenimiento/jsp/usuario.jsp", Vista.INTERNA);
	
	public String getNombre() {
		return "restablecerContrasena";
	}

	public Vista ejecutar(HttpServletRequest request) {
		try{
    		HttpSession sesion = request.getSession();
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeEditar()) {
    			return SIN_PERMISO;
    		}

    		//Recogemos el id del usuario
    		Long idUsuario = Long.parseLong(request.getParameter(WebKeys.ID_OBJETO));
    		
    		//Recogemos la nueva clave
    		String clave = request.getParameter("clave");
    		
    		//Guardamos los cambios
			ServicioUsuarios.cambiarClaveUsuario(idUsuario, clave);
			
			//Mensaje para la ventana de información
			setMensaje(request, "La contraseña se ha restablecido correctamente");
			
			return NEXT_PAGE;
		}    	
		catch (UsuarioException e) {
			setMensajeError(request, "No se ha podido restablecer la contraseña");
            return NEXT_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return NEXT_PAGE;
        }
	}
}
