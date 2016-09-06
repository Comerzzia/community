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

package com.comerzzia.web.general.almacenes.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.almacenes.AlmacenBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.almacenes.AlmacenConstraintViolationException;
import com.comerzzia.servicios.general.almacenes.AlmacenException;
import com.comerzzia.servicios.general.almacenes.ServicioAlmacenes;
import com.comerzzia.util.base.Estado;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class SalvarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista(
			"general/almacenes/mantenimiento/jsp/almacen.jsp", Vista.INTERNA);

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

			AlmacenBean almacen = (AlmacenBean) sesion
					.getAttribute(WebKeys.ALMACEN_BEAN);
			if (almacen.getEstadoBean() == Estado.NUEVO) {
				almacen.setCodAlm(request.getParameter("codAlm"));
			}

			almacen.setDesAlm(request.getParameter("desAlm"));
			almacen.setDomicilio(request.getParameter("domicilio"));
			almacen.setPoblacion(request.getParameter("poblacion"));
			almacen.setProvincia(request.getParameter("provincia"));
			almacen.setCp(request.getParameter("cp"));
			almacen.setTelefono1(request.getParameter("telefono1"));
			almacen.setTelefono2(request.getParameter("telefono2"));
			almacen.setFax(request.getParameter("fax"));
			almacen.setPersonaContacto(request.getParameter("personaContacto"));
			almacen.setCodCliente(request.getParameter("codCliente"));
			almacen.setDesCliente(request.getParameter("desCliente"));
			almacen.setActivo(request.getParameter("activo") != null);

			ServicioAlmacenes.salvar(almacen, datosSesion);

			// Liberamos recursos
			sesion.removeAttribute(WebKeys.ALMACEN_BEAN);

			// Volvemos a consultar el registro
			try {
				almacen = ServicioAlmacenes.consultar(almacen.getCodAlm(),
						datosSesion);

				sesion.setAttribute(WebKeys.ALMACEN_BEAN, almacen);
				setMensaje(request, "El almacén se ha salvado correctamente");
				return NEXT_PAGE;
			} catch (Exception e) {
				setMensajeError(
						request,
						"El almacén se ha salvado correctamente pero no se ha podido acceder al registro",
						e);
				return getControlador().getAccion("buscar").ejecutar(request);
			}
		} catch (AlmacenConstraintViolationException e) {
			setMensajeError(request, e.getMessage());
			return NEXT_PAGE;
		} catch (AlmacenException e) {
			setError(request, e);

			return ERROR_PAGE;
		} catch (Exception e) {
			e.printStackTrace();
			setError(request, e);

			return ERROR_PAGE;
		}
	}
}
