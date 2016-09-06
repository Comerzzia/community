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

import com.comerzzia.persistencia.general.almacenes.ParametrosBuscarAlmacenesBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.almacenes.AlmacenException;
import com.comerzzia.servicios.general.almacenes.ServicioAlmacenes;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class BuscarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista(
			"general/almacenes/buscar/jsp/buscar.jsp", Vista.INTERNA);

	public String getNombre() {
		return "buscar";
	}

	public Vista ejecutar(HttpServletRequest request) {

		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion
					.getAttribute(WebKeys.DATOS_SESION);

			// Liberamos recursos
			sesion.removeAttribute(WebKeys.ALMACEN_BEAN);

			// Obtenemos parámetros de búsqueda
			ParametrosBuscarAlmacenesBean param = (ParametrosBuscarAlmacenesBean) sesion
					.getAttribute(WebKeys.PARAM_BUSCAR_ALMACENES);

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
				PaginaResultados paginaResultados = ServicioAlmacenes
						.consultar(param, datosSesion);
				request.setAttribute(WebKeys.PAGINA_RESULTADOS,
						paginaResultados);
			}

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

	private void setParametrosBuscar(ParametrosBuscarAlmacenesBean param,
			HttpServletRequest request) {
		param.setCodAlm(request.getParameter("codAlm"));
		param.setDesAlm(request.getParameter("desAlm"));
		param.setActivo(request.getParameter("activo"));

		param.setNumPagina(1);

		// Actualizar el número de resultados por página
		try {
			param.setTamañoPagina(Integer.parseInt(request
					.getParameter("tamanoPagina")));
		} catch (Exception ignore) {
			// Si no se recibe el tamaño de página, se mantiene el que se tenía
		}
	}

	private void setPaginaBuscar(ParametrosBuscarAlmacenesBean param,
			HttpServletRequest request) {
		try {
			// Obtenemos la pagina solicitada
			int pagina = Integer.parseInt(request.getParameter("pagina"));
			param.setNumPagina(pagina);
		} catch (Exception ignore) {
			// Si no tenemos pagina, se mostrará la que teníamos
		}
	}

	private void setOrdenBuscar(ParametrosBuscarAlmacenesBean param,
			HttpServletRequest request) {
		try {
			// Establecemos primera pagina
			param.setNumPagina(1);

			// Obtenemos la columna por la que ordenar
			int columna = Integer.parseInt(request.getParameter("columna"));

			// Establecemos la columna de orden
			switch (columna) {
			case 1: // CODALM
				if (param.getOrden().equals("CODALM")) {
					param.setOrden("CODALM DESC");
				} else {
					param.setOrden("CODALM");
				}
				break;
			case 2: // DESALM
				if (param.getOrden().equals("DESALM")) {
					param.setOrden("DESALM DESC");
				} else {
					param.setOrden("DESALM");
				}
				break;
			// TODO Falta determinar el resto de columnas.
			default:
				param.setOrden("DESALM");
			}
		} catch (Exception e) {
			// Si no tenemos orden, se dejar el que se tenía
		}
	}
}
