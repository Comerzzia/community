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

package com.comerzzia.web.core.usuarios.miperfil.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.core.usuarios.UsuarioBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.usuarios.ServicioUsuarios;
import com.comerzzia.servicios.core.usuarios.UsuarioException;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class CambiarContraseñaAccion extends Accion {
	
	private static final Vista NEXT_PAGE = new Vista("core/usuarios/miPerfil/jsp/miPerfil.jsp", Vista.INTERNA);

	public String getNombre() {
		return "cambiarContrasena";
	}

	public Vista ejecutar(HttpServletRequest request) {
		boolean correcta = true;
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);

			// Recogemos el id del usuario
			Long idUsuario = datosSesion.getUsuario().getIdUsuario();
			UsuarioBean usuario = null;
			try {
				usuario = ServicioUsuarios.consultar(idUsuario);
			} catch (Exception e) {
				setMensajeError(request,
						"Se ha producido un error al acceder al registro");
				return getControlador().getAccion("ver").ejecutar(request);
			}

			// Recogemos la antigua clave
			String antigua = request.getParameter("claveAnt");

			// Comprobamos que la antigua clave sea correcta
			correcta = usuario.getClave().equals(antigua);

			if (!correcta) {
				throw new UsuarioException();
			}

			// Recogemos la nueva clave
			String clave = request.getParameter("clave");

			// Guardamos los cambios
			ServicioUsuarios.cambiarClaveUsuario(idUsuario, clave);

			// Mensaje para la ventana de información
			setMensaje(request, "La contraseña se ha cambiado correctamente");

			return NEXT_PAGE;
		} catch (UsuarioException e) {
			if (correcta) {
				setMensajeError(request,"No se ha podido cambiar la contraseña");
			} else {
				setMensajeError(request, "La antigua contraseña no es correcta");
			}

			return NEXT_PAGE;
		} catch (Exception e) {
			e.printStackTrace();
			setError(request, e);

			return NEXT_PAGE;
		}
	}
}
