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
import com.comerzzia.persistencia.core.usuarios.perfiles.PerfilUsuarioBean;
import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenUsuarioBean;
import com.comerzzia.servicios.core.usuarios.ServicioUsuarios;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.log.Logger;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.core.usuarios.ui.FormularioUsuarioBean;

public class LeerFormularioAccion extends Accion {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(LeerFormularioAccion.class);

	/**
	 * Devuelve el nombre de la acción
	 * 
	 * @return String con el nombre de la acción
	 */
	public String getNombre() {
		return "leerFormulario";
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

			// Obtenemos la operación solicitada
			String operacion = request.getParameter("operacion");
			String indice = request.getParameter("indice");
			log.debug("ejecutar() - operacion=" + operacion + " indice="
					+ indice);

			// Actualizamos el formulario
			FormularioUsuarioBean formulario = (FormularioUsuarioBean) sesion
					.getAttribute(WebKeys.FORMULARIO_USUARIO);
			if (operacion == null || !operacion.equals("cancelar")) {
				leerFormulario(formulario, request);
			}

			if (operacion != null) {
				// Cambiar pestaña activa
				if (operacion.equals("pestaña")) {
					formulario.setPestañaActiva(Integer.parseInt(indice));
				}
				// Añadir un nuevo registro de perfil a la pestaña activa
				else if (operacion.equals("nuevoPerfil")) {
					request.setAttribute("modoFicha", true);
				}
				// Añadir un nuevo registro de perfil a la pestaña activa
				else if (operacion.equals("nuevoAlmacen")) {
					request.setAttribute("modoFicha", true);
				}
				// Eliminar un registro de la pesaña activa
				else if (operacion.equals("eliminarRegistroPestaña")) {
					formulario.getFormularioPestañaActiva().eliminar(
							Integer.parseInt(indice));
				}
				// Aceptar cambios del formulario de la pestaña activa de perfil
				else if (operacion.equals("aceptarPerfil")) {
					leerFormularioRegistroPerfil(formulario, request);
				}
				// Aceptar cambios del formulario de la pestaña activa de perfil
				else if (operacion.equals("aceptarAlmacen")) {
					leerFormularioRegistroAlmacen(formulario, request);
				}
				// Aceptar cambios del formulario
				else if (operacion.equals("aceptar")) {
					return getControlador().getAccion("salvar").ejecutar(
							request);
				}
				// Cancelar cambios en el formulario
				else if (operacion.equals("cancelar")) {
					formulario.cancelar();

					// Si no tenemos registro activo volvemos al buscador
					if (formulario.isRegistroActivoVacio()) {
						return getControlador().getAccion("buscar").ejecutar(
								request);
					} else {
						// Obtenemos el usuario y lo actualizamos en el
						// formulario
						UsuarioBean usuario = (UsuarioBean) formulario
								.getRegistroActivo();
						usuario = ServicioUsuarios.consultar(usuario
								.getIdUsuario());
						formulario.inicializar(usuario);
					}
				}
			}

			// Mostramos el formulario
			return getControlador().getAccion("verFormulario")
					.ejecutar(request);
		} catch (Exception e) {
			e.printStackTrace();
			setError(request, e);

			return ERROR_PAGE;
		}
	}

	/**
	 * Lee los campos del formulario principal y del formulario de la pestaña
	 * activa actualizando los atributos del registro activo
	 * 
	 * @param formulario
	 * @param request
	 */
	private void leerFormulario(FormularioUsuarioBean formulario,
			HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) formulario.getRegistroActivo();

		if (formulario.isEnInsercion()) {
			usuario.setUsuario(request.getParameter("usuario"));
		}

		if (formulario.isEditable()) {
			usuario.setDesUsuario(request.getParameter("desUsuario"));
			usuario.setActivo(request.getParameter("activo") != null);

			// Datos Generales
			usuario.setAplicacion(request.getParameter("codAplicacion"));
			usuario.setPuedeCambiarAplicacion(request.getParameter("cambiarAplicacion") != null);
			usuario.setClave(request.getParameter("clave"));

		}
	}

	@SuppressWarnings("unchecked")
	private void leerFormularioRegistroPerfil(FormularioUsuarioBean formulario,
			HttpServletRequest request) {
		String[] idsPerfiles = request.getParameter("idPerfiles").split(",");
		String[] desPerfiles = request.getParameter("desPerfiles").split(",");
		UsuarioBean usuario = (UsuarioBean) formulario.getRegistroActivo();

		for (int i = 0; i < idsPerfiles.length; i++) {
			PerfilUsuarioBean perfilUsuario = new PerfilUsuarioBean();
			perfilUsuario.setEstadoBean(Estado.NUEVO);
			perfilUsuario.setIdPerfil(Long.parseLong(idsPerfiles[i]));
			perfilUsuario.setDesPerfil(desPerfiles[i]);
			perfilUsuario.setIdUsuario(usuario.getIdUsuario());
			// Los voy añadiendo a la lista de registros
			formulario.getFormularioPestañaActiva().getRegistros().add(
					perfilUsuario);
		}

	}

	@SuppressWarnings("unchecked")
	private void leerFormularioRegistroAlmacen(
			FormularioUsuarioBean formulario, HttpServletRequest request) {
		String[] codsAlmacenes = request.getParameter("codAlmacenes")
				.split(",");
		String[] desAlmacenes = request.getParameter("desAlmacenes").split(",");
		UsuarioBean usuario = (UsuarioBean) formulario.getRegistroActivo();

		for (int i = 0; i < codsAlmacenes.length; i++) {
			AlmacenUsuarioBean almacenUsuario = new AlmacenUsuarioBean();
			almacenUsuario.setEstadoBean(Estado.NUEVO);
			almacenUsuario.setCodAlmacen(codsAlmacenes[i]);
			almacenUsuario.setDesAlmacen(desAlmacenes[i]);
			almacenUsuario.setIdUsuario(usuario.getIdUsuario());
			// Los voy añadiendo a la lista de registros
			formulario.getFormularioPestañaActiva().getRegistros().add(
					almacenUsuario);
		}
	}
}
