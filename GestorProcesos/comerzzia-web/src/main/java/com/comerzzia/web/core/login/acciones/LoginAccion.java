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

package com.comerzzia.web.core.login.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.servicios.core.login.InvalidLoginException;
import com.comerzzia.servicios.core.login.LoginException;
import com.comerzzia.servicios.core.login.ServicioLogin;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;


public class LoginAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("inicio.screen", Vista.EXTERNA);
	private static final Vista ERROR_LOGIN = new Vista("core/login/jsp/login.jsp", Vista.INTERNA);
	private static final Vista CONFIG_PAGE = new Vista("asistenteConfig", Vista.EXTERNA);
	
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "login";
    }
    
    /**
     * Ejecuta la acción
     * @param request Datos de la petición
     * @return Vista con la siguiente pagina a mostrar
     */
    public Vista ejecutar(HttpServletRequest request) {
    	try {
    		HttpSession sesion = request.getSession();
    		String usuario = request.getParameter("usuario");
            String clave = request.getParameter("clave");
            
            DatosSesionBean datosSesion = ServicioLogin.iniciarSesion(usuario.toUpperCase(), clave);
            sesion.setAttribute(WebKeys.DATOS_SESION, datosSesion);
            
            // Si la empresa no está configurada redirigimos al asistente de
            // configuración de empresa
            if (datosSesion.getEmpresa().getDesEmp() == null || datosSesion.getEmpresa().getDesEmp().isEmpty()) {
            	return CONFIG_PAGE;
            }
            
            return NEXT_PAGE;
    	}
    	catch (InvalidLoginException e) {
            setMensajeError(request, e.getMessage(), e);
            return ERROR_LOGIN;
        }
        catch (LoginException e) {
            setMensajeError(request, "En estos momentos no es posible acceder al sistema", e);
            return ERROR_LOGIN;
        }
        catch (Exception e) {
            e.printStackTrace();
            setMensajeError(request, "En estos momentos no es posible acceder al sistema", e);
            
            return ERROR_LOGIN;
        }
    }
}
