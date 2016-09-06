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

package com.comerzzia.portlets.tiendavirtual.acciones;

import javax.portlet.ActionRequest;
import javax.portlet.PortletSession;

import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.tiendavirtual.articulos.ParametrosBuscarArticulosTVBean;
import com.comerzzia.portlets.base.Accion;
import com.comerzzia.portlets.base.Vista;
import com.comerzzia.portlets.base.WebKeys;
import com.comerzzia.portlets.tiendavirtual.iu.FormularioTienda;
import com.comerzzia.servicios.tiendavirtual.articulos.ArticuloTarifaTiendaVirtualNotFoundException;
import com.comerzzia.servicios.tiendavirtual.articulos.ArticuloTiendaVirtualException;
import com.comerzzia.servicios.tiendavirtual.articulos.ServicioArticulosTiendaVirtual;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;
import com.comerzzia.util.paginacion.PaginaResultados;

public class BuscarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("/tienda_virtual/busqueda/jsp/busqueda.jsp");

	public String getNombre() {
		return "buscar";
	}

	public Vista ejecutar(ActionRequest request) {
		try {
			PortletSession session = request.getPortletSession();
			DatosSesionTiendaVirtualBean datosSesion = (DatosSesionTiendaVirtualBean) session.getAttribute(WebKeys.DATOS_SESION);
			FormularioTienda formulario = (FormularioTienda) session.getAttribute(WebKeys.FORMULARIO_TV);
			ClienteBean cliente = (ClienteBean) session.getAttribute(WebKeys.CLIENTE_TV);
			ParametrosBuscarArticulosTVBean param = formulario.getParamBuscar();

			String operacion = request.getParameter("operacion");
			if (operacion != null) {
				if (operacion.equals("paginar")) {
					setPaginaBuscar(param, request);
				} 
				else if (operacion.equals("ordenar")) {
					setOrdenBuscar(param, request);
				}
			}

			PaginaResultados paginaResultados = null;

			// Si el número de página solicitado es 0 no se consulta
			if (param.getNumPagina() > 0) {
				paginaResultados = ServicioArticulosTiendaVirtual.consultar(param, cliente, datosSesion);
			}
			
			if (formulario.isVistaArticulo()){
				formulario.setVistaListado();
			}

			request.setAttribute(WebKeys.PAGINA_RESULTADOS, paginaResultados);
			request.setAttribute(WebKeys.FORMULARIO_TV, formulario);

			return NEXT_PAGE;
		} 
		catch (ArticuloTarifaTiendaVirtualNotFoundException e) { 
			return ERROR_GENERAL;
		} 
		catch (ArticuloTiendaVirtualException e) {
			return ERROR_GENERAL;
		}
		catch (Exception e){
			e.printStackTrace();
			return ERROR_GENERAL;
		}
	}

	private void setPaginaBuscar(ParametrosBuscarArticulosTVBean param,
			ActionRequest request) {
		try {
			// Obtenemos la pagina solicitada
			int pagina = Integer.parseInt(request.getParameter("pagina"));
			param.setNumPagina(pagina);
		} catch (Exception ignore) {
			// Si no tenemos pagina, se mostrará la que teníamos
		}
	}

	private void setOrdenBuscar(ParametrosBuscarArticulosTVBean param,
			ActionRequest request) {
		try {
			// Establecemos primera pagina
			param.setNumPagina(1);

			// Obtenemos la columna por la que ordenar
			int columna = Integer.parseInt(request.getParameter("columna"));

			// Establecemos la columna de orden
			switch (columna) {
			case 1: // ARTICULO
				if (param.getOrden().equals("DESART DESC")) {
					param.setOrden("DESART");
				} else {
					param.setOrden("DESART DESC");
				}
				break;
			default:
				param.setOrden("");
			}
		} catch (Exception e) {
			param.setOrden("");
		}
	}

}
