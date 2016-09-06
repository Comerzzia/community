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

package com.comerzzia.web.ventas.tarifas.actualizaciones.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.ventas.tarifas.actualizaciones.ParametrosBuscarActualizacionesTarifaBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.ActualizacionTarifaException;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.ServicioActualizacionesTarifas;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.tarifas.actualizaciones.iu.FormularioActualizacionBean;

public class BuscarActualizacionesAccion extends Accion{
	
	private static final Vista NEXT_PAGE = new Vista("ventas/tarifas/actualizaciones/buscar/jsp/buscar.jsp", Vista.INTERNA);
	
	public String getNombre() {
		return "buscar";
	}

	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);

			// Comprobamos los permisos de la acción
			PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
			if (!permisos.isPuedeEjecutar()) {
				return SIN_PERMISO;
			}

			// Inicializamos el formulario
    		FormularioActualizacionBean formulario = (FormularioActualizacionBean) sesion.getAttribute(WebKeys.FORMULARIO_ACTUALIZACION_TARIFA);
    		formulario.inicializar();
    		
			// Obtenemos parámetros de búsqueda
			ParametrosBuscarActualizacionesTarifaBean param = (ParametrosBuscarActualizacionesTarifaBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_ACTUALIZACIONES_TARIFAS);
			
			// Comprobamos la operación a realizar
			String operacion = request.getParameter("operacion");
			if (operacion != null && !operacion.isEmpty()) {
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
			}else{
				setParametrosBuscar(param, request);
			}
			
			//establecemos el codigo de la tarifa para buscar sus actualizaciones.
			param.setCodTarifa(request.getParameter("codTar"));

			// Si tenemos página, realizamos la búsqueda
			if (param.getNumPagina() > 0) {
				PaginaResultados paginaResultados = ServicioActualizacionesTarifas.consultar(param, datosSesion);
				request.setAttribute(WebKeys.PAGINA_RESULTADOS,paginaResultados);
			}
			return NEXT_PAGE;
		} 
		catch (ActualizacionTarifaException e) {
			setError(request, e);
			return ERROR_PAGE;
		} 
		catch (Exception e) {
			e.printStackTrace();
			setError(request, e);
			return ERROR_PAGE;
		}
	}
	
	private void setParametrosBuscar(ParametrosBuscarActualizacionesTarifaBean param, HttpServletRequest request) {

		param.setNumPagina(1);

		// Actualizar el número de resultados por página
		try {
			param.setTamañoPagina(Integer.parseInt(request.getParameter("tamanoPagina")));
		} 
		catch (Exception ignore) {
			// Si no se recibe el tamaño de página, se mantiene el que se tenía
		}
	}

	private void setPaginaBuscar(ParametrosBuscarActualizacionesTarifaBean param, HttpServletRequest request) {
		try {
			// Obtenemos la pagina solicitada
			int pagina = Integer.parseInt(request.getParameter("pagina"));
			param.setNumPagina(pagina);
		} 
		catch (Exception ignore) {
			// Si no tenemos pagina, se mostrará la que teníamos
		}
	}

	private void setOrdenBuscar(ParametrosBuscarActualizacionesTarifaBean param, HttpServletRequest request) {
		try {
			// Establecemos primera pagina
			param.setNumPagina(1);

			// Obtenemos la columna por la que ordenar
			int columna = Integer.parseInt(request.getParameter("columna"));

			// Establecemos la columna de orden
			switch (columna) {
			case 1: // DESTAR
				if (param.getOrden().equals("DES_ACTUALIZACION")) {
					param.setOrden("DES_ACTUALIZACION DESC");
				} else {
					param.setOrden("DES_ACTUALIZACION");
				}
				break;
			case 2: // FECHA_ACTUALIZACION_PREVISTA
				if (param.getOrden().equals("FECHA_PREVISTA_APLICACION")) {
					param.setOrden("FECHA_PREVISTA_APLICACION DESC");
				} else {
					param.setOrden("FECHA_PREVISTA_APLICACION");
				}
				break;
			default:
				param.setOrden("ID_ACTUALIZACION");
			}
		} catch (Exception e) {
			// Si no tenemos orden, se dejar el que se tenía
		}
	}

}
