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
import com.comerzzia.portlets.base.Accion;
import com.comerzzia.portlets.base.Vista;
import com.comerzzia.portlets.base.WebKeys;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;
import com.comerzzia.servicios.ventas.albaranes.AlbaranVentaNotFoundException;
import com.comerzzia.servicios.ventas.albaranes.ServicioAlbaranesVentas;
import com.comerzzia.servicios.ventas.pedidos.PedidoVenta;
import com.comerzzia.servicios.ventas.pedidos.PedidoVentaException;
import com.comerzzia.servicios.ventas.pedidos.PedidoVentaNotFoundException;
import com.comerzzia.servicios.ventas.pedidos.ServicioPedidosVentas;

public class VerPedidoAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("/tienda_virtual/misPedidos/jsp/pedido.jsp");

	public String getNombre() {
		return "verPedido";
	}

	public Vista ejecutar(ActionRequest request) {
		try {
			PortletSession session = request.getPortletSession();
			DatosSesionTiendaVirtualBean datosSesion = (DatosSesionTiendaVirtualBean) session.getAttribute(WebKeys.DATOS_SESION);
			ClienteBean cliente = (ClienteBean) session.getAttribute(WebKeys.CLIENTE_TV);

			if (!datosSesion.isUsuarioLogado()){
				setMensajeError(request, "Para consultar un pedido antes deber hacer login en el sistema.");
				return getPortlet().getAccion("buscar").ejecutar(request);
			}
			
			//Obtenemos el id del pedido
			Long idPedido = Long.parseLong(request.getParameter("idPedido"));
			
			// consultamos pedido
			PedidoVenta pedido = ServicioPedidosVentas.consultar(idPedido, datosSesion.getDatosSesionEmpresa());
			String tracking = null;
			try{
				//Consultamos albarán del pedido
				tracking = ServicioAlbaranesVentas.consultarAlbaranPedido(idPedido, datosSesion.getDatosSesionEmpresa()).getTrackingPorte();		
			}
			catch (AlbaranVentaNotFoundException e) {;}
			
			request.setAttribute("pagina", request.getParameter("pagina"));
			request.setAttribute("pedido", pedido);
			request.setAttribute("datosCliente", cliente);
			request.setAttribute("tracking", tracking);

			return NEXT_PAGE;
		} 
		catch (PedidoVentaNotFoundException e) {
			setMensajeError(request, "No se ha encontrado el pedido indicado. " + e.getMessage());
			return getPortlet().getAccion("verMisPedidos").ejecutar(request);
		}
		catch (PedidoVentaException e) {
			setMensajeError(request, "Ha ocurrido un error al intentar consultar el pedido indicado. " + e.getMessage());
			return getPortlet().getAccion("verMisPedidos").ejecutar(request);
		}
		catch (Exception e) {  
			e.printStackTrace();
			return ERROR_GENERAL;
		}
 	}
}
