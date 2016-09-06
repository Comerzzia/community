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

import com.comerzzia.persistencia.core.usuarios.UsuarioBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.usuarios.ServicioUsuarios;
import com.comerzzia.servicios.core.usuarios.UsuarioException;
import com.comerzzia.servicios.core.usuarios.UsuarioNotFoundException;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.core.usuarios.ui.FormularioUsuarioBean;


public class VerAccion extends Accion {

	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "ver";
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
    		
    		// Obtenemos el usuario
    		Long idUsuario = Long.parseLong(request.getParameter(WebKeys.ID_OBJETO));
    		UsuarioBean usuario = ServicioUsuarios.consultar(idUsuario);
    		
    		// Inicalizamos el formulario
    		FormularioUsuarioBean formulario = (FormularioUsuarioBean) sesion.getAttribute(WebKeys.FORMULARIO_USUARIO);
    		formulario.inicializar(usuario);
    		
    		// Mostramos el formulario
    		return getControlador().getAccion("verFormulario").ejecutar(request);
    	}
    	catch (UsuarioNotFoundException e) {
    		// Si no se encuentra el registro volvemos al buscador y enviamos en mensaje de error
            setMensajeError(request, "No se ha encontrado el registro", e);
            return getControlador().getAccion("buscar").ejecutar(request);
    	}
    	catch (UsuarioException e) {
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
