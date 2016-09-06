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

package com.comerzzia.web.backoffice.seleccionalmacen.acciones;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenUsuarioBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.tiendas.usuarios.AlmacenUsuarioException;
import com.comerzzia.servicios.general.tiendas.usuarios.ServicioAlmacenesUsuarios;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class SeleccionarAlmacenAccion extends Accion {

	private static final Vista INICIO = new Vista("inicio.screen",
			Vista.EXTERNA);

	private static final String CODALMACEN_SELECCIONADO = "CODALMACEN_SELECCIONADO";
	private static final String DESALMACEN_SELECCIONADO = "DESALMACEN_SELECCIONADO";

	/**
	 * Devuelve el nombre de la acción
	 * 
	 * @return String con el nombre de la acción
	 */
	public String getNombre() {
		return "seleccionarAlmacen";
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

			List<AlmacenUsuarioBean> almacenes = ServicioAlmacenesUsuarios
					.consultar(datosSesion.getUsuario().getIdUsuario(), datosSesion);

			if (almacenes != null && almacenes.size() > 1) {

				String codAlmacen = request
						.getParameter("codAlmacenSeleccionado");
				String desAlmacen = request
						.getParameter("desAlmacenSeleccionado");

				boolean encontrado = false;
				for (AlmacenUsuarioBean almacen : almacenes) {
					if (codAlmacen.equals(almacen.getCodAlmacen())) {
						encontrado = true;

						datosSesion.getAtributos().put(CODALMACEN_SELECCIONADO,
								codAlmacen);
						datosSesion.getAtributos().put(DESALMACEN_SELECCIONADO,
								desAlmacen);

						break;
					}
				}

				if (encontrado) {
					return INICIO;
				} else {
					throw new AlmacenUsuarioException(
							"Error al seleccionar el almacén.");
				}

			} else if (almacenes != null && almacenes.size() == 1) {
				request.setAttribute("desAlmacen", datosSesion.getAtributos().get("DESALMACEN_SELECCIONADO"));
				return NO_ELECCION_ALMACEN;
			} else {
				return SIN_ALMACEN;
			}

		} catch (AlmacenUsuarioException e) {
			e.printStackTrace();
			setError(request, e);

			return ERROR_PAGE;
		} catch (Exception e) {
			e.printStackTrace();
			setError(request, e);

			return ERROR_PAGE;
		}
	}
}
