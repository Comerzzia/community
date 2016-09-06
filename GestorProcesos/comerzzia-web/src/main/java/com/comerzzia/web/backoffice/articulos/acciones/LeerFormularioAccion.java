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

package com.comerzzia.web.backoffice.articulos.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.backoffice.articulos.ParametrosBuscarConsultaArticulosBean;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.log.Logger;
import com.comerzzia.web.backoffice.articulos.ui.FormularioConsultaArticulosBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

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
			FormularioConsultaArticulosBean formulario = (FormularioConsultaArticulosBean) sesion
					.getAttribute(WebKeys.FORMULARIO_CONSULTA_ARTICULOS);

			if (operacion != null) {
				// Consulta artículos
				if (operacion.equals("consultar")) {
					leerParametrosBusqueda(formulario, request);
					return getControlador().getAccion("buscar").ejecutar(
							request);
				}
				// Cambiar pestaña activa
				else if (operacion.equals("pestaña")) {
					formulario.setPestañaActiva(Integer.parseInt(indice));
				}
				// Cambiar modo visualización del formulario
				else if (operacion.equals("vistaTablaFormulario")) {
					formulario.setModoVisualizacionTabla();
				}
				// Ver un registro del formulario
				else if (operacion.equals("verRegistroFormulario")) {
					formulario.seleccionaRegistroActivo(Integer.parseInt(indice));
					formulario.setModoVisualizacionFicha();
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
	 * Lee los parámetros de búsqueda de artículos
	 * 
	 * @param formulario
	 * @param request
	 * @throws FechaException
	 */
	private void leerParametrosBusqueda(
			FormularioConsultaArticulosBean formulario,
			HttpServletRequest request) {
		ParametrosBuscarConsultaArticulosBean param = (ParametrosBuscarConsultaArticulosBean) formulario.getParam();

		param.setCodArticulo(request.getParameter("codArt"));
		param.setDesArticulo(request.getParameter("desArt"));
		param.setCodFamilia(request.getParameter("codFam"));
		param.setDesFamilia(request.getParameter("desFam"));
		param.setCodProveedor(request.getParameter("codPro"));
		param.setDesProveedor(request.getParameter("desPro"));
		param.setActivo(request.getParameter("activo"));

		// Actualizar el número de resultados por página
		try {
			param.setTamañoPagina(Integer.parseInt(request
					.getParameter("tamanoPagina")));
		} catch (Exception ignore) {
			// Si no se recibe el tamaño de página, se mantiene el que se tenía
		}
	}
}
