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

package com.comerzzia.web.backoffice.regularizaciones.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.servicios.almacenes.regularizaciones.Regularizacion;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.web.backoffice.regularizaciones.ui.FormularioRegularizacionBackofficeBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class AltaAccion extends Accion {

	private static final String CODALMACEN_SELECCIONADO = "CODALMACEN_SELECCIONADO";
	private static final String DESALMACEN_SELECCIONADO = "DESALMACEN_SELECCIONADO";

	/**
	 * Devuelve el nombre de la acción
	 * 
	 * @return String con el nombre de la acción
	 */
	public String getNombre() {
		return "alta";
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
			PermisosEfectivosAccionBean permisos = datosSesion
					.getPermisosCache(this.getAccionMenu());
			if (!permisos.isPuedeAñadir()) {
				return SIN_PERMISO;
			}

			Regularizacion regularizacion = new Regularizacion();
			regularizacion
					.setIdUsuario(datosSesion.getUsuario().getIdUsuario());

			regularizacion.setCodAlmacen((String) datosSesion.getAtributos()
					.get(CODALMACEN_SELECCIONADO));
			regularizacion.setDesAlmacen((String) datosSesion.getAtributos()
					.get(DESALMACEN_SELECCIONADO));
			regularizacion.setCodConceptoAlmacen(request
					.getParameter("codConceptoAlmacen"));
			regularizacion.setDesConceptoAlmacen(request
					.getParameter("desConceptoAlmacen"));
			regularizacion.setFecha(Fechas.getFecha(request
					.getParameter("fecha")));

			// Actualizamos el formulario con la nueva regularización
			FormularioRegularizacionBackofficeBean formulario = (FormularioRegularizacionBackofficeBean) sesion
					.getAttribute(WebKeys.FORMULARIO_REGULARIZACION_BACKOFFICE);
			formulario.setModoInsercion(regularizacion);

			// Mostramos el formulario
			return getControlador().getAccion("verFormulario")
					.ejecutar(request);
		} catch (Exception e) {
			e.printStackTrace();
			setError(request, e);

			return ERROR_PAGE;
		}
	}
}
