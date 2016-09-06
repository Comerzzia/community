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
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.usuarios.perfiles.ServicioPerfilesUsuarios;
import com.comerzzia.servicios.general.tiendas.usuarios.ServicioAlmacenesUsuarios;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.core.usuarios.ui.FormularioUsuarioBean;

public class VerFormularioAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("core/usuarios/mantenimiento/jsp/usuario.jsp", Vista.INTERNA);

	/**
	 * Devuelve el nombre de la acción
	 * 
	 * @return String con el nombre de la acción
	 */
	public String getNombre() {
		return "verFormulario";
	}

	/**
	 * Ejecuta la acción
	 * 
	 * @param request
	 *            Datos de la petición
	 * @return Vista con la siguiente pagina a mostrar
	 */
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion
					.getAttribute(WebKeys.DATOS_SESION);

			// Actualizamos el formulario
			FormularioUsuarioBean formulario = (FormularioUsuarioBean) sesion
					.getAttribute(WebKeys.FORMULARIO_USUARIO);
			inicializaPestañaActiva(formulario, datosSesion, request);

			return NEXT_PAGE;
		} catch (Exception e) {
			e.printStackTrace();
			setError(request, e);

			return ERROR_PAGE;
		}
	}

	private void inicializaPestañaActiva(FormularioUsuarioBean formulario,
			DatosSesionBean datosSesion, HttpServletRequest request)
			throws Exception {
		// Obtenemos el usuario
		UsuarioBean usuario = (UsuarioBean) formulario.getRegistroActivo();

		// Actualizamos la pestaña activa
		switch (formulario.getPestañaActiva()) {
		case 0:
			if (!usuario.isPerfilesCargados()) {
				usuario.setLstPerfiles(ServicioPerfilesUsuarios
						.consultar(usuario.getIdUsuario()));
				usuario.setPerfilesCargados(true);
				formulario.getFormularioPestañaActiva().setRegistros(
						usuario.getLstPerfiles());
			}

			request.setAttribute("lstPerfilesDisponibles", formulario
					.obtenerListaPerfilesDisponibles());

			break;

		case 1:
			if (!usuario.isAlmacenesCargados()) {
				usuario.setLstAlmacenes(ServicioAlmacenesUsuarios
						.consultar(usuario.getIdUsuario(), datosSesion));
				usuario.setAlmacenesCargados(true);
				formulario.getFormularioPestañaActiva().setRegistros(
						usuario.getLstAlmacenes());
			}

			request.setAttribute("lstAlmacenesDisponibles", formulario.obtenerListaAlmacenesDisponibles(datosSesion));

			break;
		}
	}
}
