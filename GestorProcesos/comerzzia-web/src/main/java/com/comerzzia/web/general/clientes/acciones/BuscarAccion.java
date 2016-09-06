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

package com.comerzzia.web.general.clientes.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.clientes.ParametrosBuscarClientesBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.clientes.ClienteException;
import com.comerzzia.servicios.general.clientes.ServicioClientes;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.general.clientes.ui.FormularioClienteBean;

public class BuscarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista(
			"general/clientes/buscar/jsp/buscar.jsp", Vista.INTERNA);

	public String getNombre() {
		return "buscar";
	}

	public Vista ejecutar(HttpServletRequest request) {

		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion
					.getAttribute(WebKeys.DATOS_SESION);

			// Comprobamos los permisos de la acción
			PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this
					.getAccionMenu());
			if (!permisos.isPuedeEjecutar()) {
				return SIN_PERMISO;
			}

			// Inicializamos el Formulario
			FormularioClienteBean formulario = (FormularioClienteBean) sesion
					.getAttribute(WebKeys.FORMULARIO_CLIENTE);
			formulario.inicializar();

			// Obtenemos parámetros de búsqueda
			ParametrosBuscarClientesBean param = (ParametrosBuscarClientesBean) sesion
					.getAttribute(WebKeys.PARAM_BUSCAR_CLIENTES);

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
				PaginaResultados paginaResultados = ServicioClientes.consultar(
						param, datosSesion);
				request.setAttribute(WebKeys.PAGINA_RESULTADOS,
						paginaResultados);
			}

			return NEXT_PAGE;
		} catch (ClienteException e) {
			setError(request, e);
			return ERROR_PAGE;
		} catch (Exception e) {
			e.printStackTrace();
			setError(request, e);

			return ERROR_PAGE;
		}
	}

	private void setParametrosBuscar(ParametrosBuscarClientesBean param,
			HttpServletRequest request) {
		param.setCodCli(request.getParameter("codCli"));
		param.setDesCli(request.getParameter("desCli"));
		param.setNombreComercial(request.getParameter("nombreComercial"));
		param.setCif(request.getParameter("cif"));
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

	private void setPaginaBuscar(ParametrosBuscarClientesBean param,
			HttpServletRequest request) {
		try {
			// Obtenemos la pagina solicitada
			int pagina = Integer.parseInt(request.getParameter("pagina"));
			param.setNumPagina(pagina);
		} catch (Exception ignore) {
			// Si no tenemos pagina, se mostrará la que teníamos
		}
	}

	private void setOrdenBuscar(ParametrosBuscarClientesBean param,
			HttpServletRequest request) {
		try {
			// Establecemos primera pagina
			param.setNumPagina(1);

			// Obtenemos la columna por la que ordenar
			int columna = Integer.parseInt(request.getParameter("columna"));

			// Establecemos la columna de orden
			switch (columna) {
			case 1: // CODCLI
				if (param.getOrden().equals("CODCLI")) {
					param.setOrden("CODCLI DESC");
				} else {
					param.setOrden("CODCLI");
				}
				break;
			case 2: // DESCLI
				if (param.getOrden().equals("DESCLI")) {
					param.setOrden("DESCLI DESC");
				} else {
					param.setOrden("DESCLI");
				}
				break;
			case 3: // NOMBRE_COMERCIAL
				if (param.getOrden().equals("NOMBRE_COMERCIAL")) {
					param.setOrden("NOMBRE_COMERCIAL DESC");
				} else {
					param.setOrden("NOMBRE_COMERCIAL");
				}
				break;
				
			case 4: // CIF
				if (param.getOrden().equals("CIF")) {
					param.setOrden("CIF DESC");
				} else {
					param.setOrden("CIF");
				}
				break;
			default:
				param.setOrden("CODCLI");
			}
		} catch (Exception e) {
			// Si no tenemos orden, se dejar el que se tenía
		}
	}
}
