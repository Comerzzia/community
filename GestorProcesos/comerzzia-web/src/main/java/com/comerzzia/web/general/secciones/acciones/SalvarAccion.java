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

package com.comerzzia.web.general.secciones.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.secciones.SeccionBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.secciones.SeccionConstraintViolationException;
import com.comerzzia.servicios.general.secciones.SeccionException;
import com.comerzzia.servicios.general.secciones.ServicioSecciones;
import com.comerzzia.util.base.Estado;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class SalvarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista(
			"general/secciones/mantenimiento/jsp/seccion.jsp", Vista.INTERNA);

	/**
	 * Devuelve el nombre de la acción
	 * 
	 * @return String con el nombre de la acción
	 */
	public String getNombre() {
		return "salvar";
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

			// Comprobamos los permisos de la acción
			PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this
					.getAccionMenu());
			if (!permisos.isPuedeAñadir()) {
				return SIN_PERMISO;
			}

			SeccionBean seccion = (SeccionBean) sesion
					.getAttribute(WebKeys.SECCION_BEAN);
			if (seccion.getEstadoBean() == Estado.NUEVO) {
				seccion.setCodSeccion(request.getParameter("codSeccion"));
			}

			seccion.setDesSeccion(request.getParameter("desSeccion"));
			seccion.setActivo(request.getParameter("activo") != null);

			ServicioSecciones.salvar(seccion, datosSesion);

			// Liberamos recursos
			sesion.removeAttribute(WebKeys.SECCION_BEAN);

			// Volvemos a consultar el registro
			try {
				seccion = ServicioSecciones.consultar(seccion.getCodSeccion(),
						datosSesion);

				sesion.setAttribute(WebKeys.SECCION_BEAN, seccion);
				setMensaje(request, "La sección se ha salvado correctamente");
				return NEXT_PAGE;
			} catch (Exception e) {
				setMensajeError(
						request,
						"La sección se ha salvado correctamente pero no se ha podido acceder al registro",
						e);
				return getControlador().getAccion("buscar").ejecutar(request);
			}
		} catch (SeccionConstraintViolationException e) {
			setMensajeError(request, e.getMessage());
			return NEXT_PAGE;
		} catch (SeccionException e) {
			setError(request, e);

			return ERROR_PAGE;
		} catch (Exception e) {
			e.printStackTrace();
			setError(request, e);

			return ERROR_PAGE;
		}
	}
}
