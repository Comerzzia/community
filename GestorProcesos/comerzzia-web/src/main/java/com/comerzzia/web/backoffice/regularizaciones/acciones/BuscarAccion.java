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

import com.comerzzia.persistencia.almacenes.regularizaciones.ParametrosBuscarRegularizacionesBean;
import com.comerzzia.servicios.almacenes.regularizaciones.RegularizacionException;
import com.comerzzia.servicios.almacenes.regularizaciones.ServicioRegularizaciones;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.backoffice.regularizaciones.ui.FormularioRegularizacionBackofficeBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class BuscarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista(
			"backoffice/regularizaciones/buscar/jsp/buscar.jsp", Vista.INTERNA);

	public String getNombre() {
		return "buscar";
	}

	public Vista ejecutar(HttpServletRequest request) {

		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion
					.getAttribute(WebKeys.DATOS_SESION);

			// Comprobamos los permisos de la acción
			PermisosEfectivosAccionBean permisos = datosSesion
					.getPermisosCache(this.getAccionMenu());
			if (!permisos.isPuedeEjecutar()) {
				return SIN_PERMISO;
			}

			// Inicializamos el Formulario
			FormularioRegularizacionBackofficeBean formulario = (FormularioRegularizacionBackofficeBean) sesion
					.getAttribute(WebKeys.FORMULARIO_REGULARIZACION_BACKOFFICE);
			formulario.inicializar();

			// Obtenemos parámetros de búsqueda
			ParametrosBuscarRegularizacionesBean param = (ParametrosBuscarRegularizacionesBean) sesion
					.getAttribute(WebKeys.PARAM_BUSCAR_REGULARIZACIONES_BACKOFFICE);

			// Comprobamos la operación a realizar
			String operacion = request.getParameter("operacion");
			if (operacion != null) {
				// Consultar
				if (operacion.equals("consultar")) {
					// Establecemos parámetros de busqueda
					setParametrosBuscar(param, request);
				}
				// Ver pagina
				else if (operacion.equals("paginar")) {
					setPaginaBuscar(param, request);
				}
				// Ordenar
				else if (operacion.equals("ordenar")) {
					setOrdenBuscar(param, request);
				}
			}

			// Si tenemos página, realizamos la búsqueda
			if (param.getNumPagina() > 0) {
				PaginaResultados paginaResultados = ServicioRegularizaciones
						.consultar(param, datosSesion);
				request.setAttribute(WebKeys.PAGINA_RESULTADOS,
						paginaResultados);
			}

			return NEXT_PAGE;
		} catch (RegularizacionException e) {
			setError(request, e);
			return ERROR_PAGE;
		} catch (Exception e) {
			e.printStackTrace();
			setError(request, e);

			return ERROR_PAGE;
		}
	}

	private void setParametrosBuscar(
			ParametrosBuscarRegularizacionesBean param,
			HttpServletRequest request) throws FechaException {
		param.setFecha(Fechas.getFecha(request.getParameter("fecha")));
		param.setCodArticulo(request.getParameter("codArticulo"));
		param.setDesArticulo(request.getParameter("desArticulo"));
		param.setCodConceptoAlmacen(request.getParameter("codConceptoAlmacen"));
		param.setDesConceptoAlmacen(request.getParameter("desConceptoAlmacen"));

		param.setNumPagina(1);

		// Actualizar el número de resultados por página
		try {
			param.setTamañoPagina(Integer.parseInt(request
					.getParameter("tamanoPagina")));
		} catch (Exception ignore) {
			// Si no se recibe el tamaño de página, se mantiene el que se tenía
		}
	}

	private void setPaginaBuscar(ParametrosBuscarRegularizacionesBean param,
			HttpServletRequest request) {
		try {
			// Obtenemos la pagina solicitada
			int pagina = Integer.parseInt(request.getParameter("pagina"));
			param.setNumPagina(pagina);
		} catch (Exception ignore) {
			// Si no tenemos pagina, se mostrará la que teníamos
		}
	}

	private void setOrdenBuscar(ParametrosBuscarRegularizacionesBean param,
			HttpServletRequest request) {
		try {
			// Establecemos primera pagina
			param.setNumPagina(1);

			// Obtenemos la columna por la que ordenar
			int columna = Integer.parseInt(request.getParameter("columna"));

			// Establecemos la columna de orden
			switch (columna) {
			case 1: // CODART
				if (param.getOrden().equals("CODART")) {
					param.setOrden("CODART DESC");
				} else {
					param.setOrden("CODART");
				}
				break;
			case 2: // DESART
				if (param.getOrden().equals("DESART")) {
					param.setOrden("DESART DESC");
				} else {
					param.setOrden("DESART");
				}
				break;
			case 3: // DESGLOSE1
				if (param.getOrden().equals("DESGLOSE1")) {
					param.setOrden("DESGLOSE1 DESC");
				} else {
					param.setOrden("DESGLOSE1");
				}
				break;
			case 4: // DESGLOSE2
				if (param.getOrden().equals("DESGLOSE2")) {
					param.setOrden("DESGLOSE2 DESC");
				} else {
					param.setOrden("DESGLOSE2");
				}
				break;
			case 5: // CANTIDAD_MEDIDA
				if (param.getOrden().equals("CANTIDAD_MEDIDA")) {
					param.setOrden("CANTIDAD_MEDIDA DESC");
				} else {
					param.setOrden("CANTIDAD_MEDIDA");
				}
				break;
			case 6: // UNIDAD_MEDIDA
				if (param.getOrden().equals("UNIDAD_MEDIDA")) {
					param.setOrden("UNIDAD_MEDIDA DESC");
				} else {
					param.setOrden("UNIDAD_MEDIDA");
				}
				break;
			case 7: // CANTIDAD
				if (param.getOrden().equals("CANTIDAD")) {
					param.setOrden("CANTIDAD DESC");
				} else {
					param.setOrden("CANTIDAD");
				}
				break;
			case 8: // PRECIO
				if (param.getOrden().equals("PRECIO")) {
					param.setOrden("PRECIO DESC");
				} else {
					param.setOrden("PRECIO");
				}
				break;
			case 9: // IMPORTE
				if (param.getOrden().equals("IMPORTE")) {
					param.setOrden("IMPORTE DESC");
				} else {
					param.setOrden("IMPORTE");
				}
				break;
			case 10: // OBSERVACIONES
				if (param.getOrden().equals("OBSERVACIONES")) {
					param.setOrden("OBSERVACIONES DESC");
				} else {
					param.setOrden("OBSERVACIONES");
				}
				break;

			default:
				param.setOrden("DESART");
			}
		} catch (Exception e) {
			// Si no tenemos orden, se dejar el que se tenía
		}
	}
}
