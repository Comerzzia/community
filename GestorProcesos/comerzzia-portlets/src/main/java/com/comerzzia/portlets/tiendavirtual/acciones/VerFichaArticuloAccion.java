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
import com.comerzzia.persistencia.tiendavirtual.articulos.ArticuloTiendaVirtualBean;
import com.comerzzia.portlets.base.Accion;
import com.comerzzia.portlets.base.Vista;
import com.comerzzia.portlets.base.WebKeys;
import com.comerzzia.portlets.tiendavirtual.iu.FormularioTienda;
import com.comerzzia.servicios.tiendavirtual.articulos.ArticuloTiendaVirtualException;
import com.comerzzia.servicios.tiendavirtual.articulos.ArticuloTiendaVirtualNotFoundException;
import com.comerzzia.servicios.tiendavirtual.articulos.ServicioArticulosTiendaVirtual;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;

public class VerFichaArticuloAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("/tienda_virtual/busqueda/jsp/busqueda.jsp");

	public String getNombre() {
		return "verFichaArticulo";
	}

	public Vista ejecutar(ActionRequest request) {

		try {
			PortletSession session = request.getPortletSession();
			DatosSesionTiendaVirtualBean datosSesion = (DatosSesionTiendaVirtualBean) session.getAttribute(WebKeys.DATOS_SESION);
			ClienteBean cliente = (ClienteBean) session.getAttribute(WebKeys.CLIENTE_TV);
			FormularioTienda formulario = (FormularioTienda) session.getAttribute(WebKeys.FORMULARIO_TV);

			String codArticulo = request.getParameter("codArticulo");
			ArticuloTiendaVirtualBean articulo = ServicioArticulosTiendaVirtual.consultar(codArticulo, cliente, datosSesion);

			formulario.setVistaArticulo();
			request.setAttribute(WebKeys.ARTICULO_TV, articulo);
			request.setAttribute(WebKeys.FORMULARIO_TV, formulario);
			return NEXT_PAGE;
		} 
		catch (ArticuloTiendaVirtualNotFoundException e) {
			// Si no se encuentra el registro volvemos al buscador y enviamos en
			// mensaje de error
			e.printStackTrace();
			setMensajeError(request, "No se ha encontrado el registro del artículo.");
			return getPortlet().getAccion("buscar").ejecutar(request);
		} 
		catch (ArticuloTiendaVirtualException e) {
			setMensajeError(request,"Se ha producido un error inesperado al intentar consultar los datos del artículo.");
			return getPortlet().getAccion("buscar").ejecutar(request);
		} 
		catch (Exception e) {
			e.printStackTrace();
			setMensajeError(request,"Se ha producido un error inesperado al intentar consultar los datos del artículo.");
			return getPortlet().getAccion("buscar").ejecutar(request);
		}
	}
}
