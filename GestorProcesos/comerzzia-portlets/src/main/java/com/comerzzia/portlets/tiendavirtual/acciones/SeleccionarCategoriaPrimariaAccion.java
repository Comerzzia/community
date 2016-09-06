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

import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.PortletSession;

import com.comerzzia.persistencia.general.categorizaciones.CategorizacionBean;
import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.portlets.base.Accion;
import com.comerzzia.portlets.base.Vista;
import com.comerzzia.portlets.base.WebKeys;
import com.comerzzia.portlets.tiendavirtual.iu.FormularioTienda;
import com.comerzzia.servicios.tiendavirtual.articulos.ServicioArticulosTiendaVirtual;
import com.comerzzia.servicios.tiendavirtual.categorizaciones.CategorizacionTiendaVirtualException;
import com.comerzzia.servicios.tiendavirtual.categorizaciones.ServicioCategorizacionesTiendaVirtual;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;

public class SeleccionarCategoriaPrimariaAccion extends Accion {

	public String getNombre() {
		return "seleccionarCategoriaPrimaria";
	}

	public Vista ejecutar(ActionRequest request) {
		try {
			PortletSession session = request.getPortletSession();
			DatosSesionTiendaVirtualBean datosSesion = (DatosSesionTiendaVirtualBean) session.getAttribute(WebKeys.DATOS_SESION);
			FormularioTienda formulario = (FormularioTienda) session.getAttribute(WebKeys.FORMULARIO_TV);
			ClienteBean cliente = (ClienteBean) session.getAttribute(WebKeys.CLIENTE_TV);

			String codCatPrimaria = request.getParameter("codCatPrimaria");
			List<CategorizacionBean> categoriasSecundarias = ServicioCategorizacionesTiendaVirtual.consultarSecundarias(datosSesion, codCatPrimaria);
			formulario.seleccionarCategoriaPrimaria(codCatPrimaria,categoriasSecundarias);
			formulario.setEscaparate(ServicioArticulosTiendaVirtual.consultarEscaparate(datosSesion, cliente, codCatPrimaria));
			formulario.getParamBuscar().setOrden("ARTICULOS.DESART");

			request.setAttribute(WebKeys.FORMULARIO_TV, formulario);
			return getPortlet().getAccion("buscar").ejecutar(request);
		} 
		catch (CategorizacionTiendaVirtualException e) {
			setMensajeError(request,"Se ha producido un error al intentar consultar las subcategorías de artículos seleccionadas.");
			return ERROR_GENERAL;
		} 
		catch (Exception e) {
			e.printStackTrace();
			return ERROR_GENERAL;
		}
	}
}
