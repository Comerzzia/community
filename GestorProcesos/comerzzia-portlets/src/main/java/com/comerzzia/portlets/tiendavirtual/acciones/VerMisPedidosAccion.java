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
import com.comerzzia.persistencia.ventas.pedidos.EstadosPedidosVenta;
import com.comerzzia.persistencia.ventas.pedidos.ParametrosBuscarPedidosVentasBean;
import com.comerzzia.portlets.base.Accion;
import com.comerzzia.portlets.base.Vista;
import com.comerzzia.portlets.base.WebKeys;
import com.comerzzia.servicios.core.estados.ServicioEstados;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;
import com.comerzzia.servicios.ventas.pedidos.PedidoVentaException;
import com.comerzzia.servicios.ventas.pedidos.ServicioPedidosVentas;
import com.comerzzia.util.paginacion.PaginaResultados;

public class VerMisPedidosAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("/tienda_virtual/misPedidos/jsp/misPedidos.jsp");

	public String getNombre() {
		return "verMisPedidos";
	}

	public Vista ejecutar(ActionRequest request) {
		try {
			PortletSession session = request.getPortletSession();
			DatosSesionTiendaVirtualBean datosSesion = (DatosSesionTiendaVirtualBean) session.getAttribute(WebKeys.DATOS_SESION);
			ClienteBean cliente = (ClienteBean) session.getAttribute(WebKeys.CLIENTE_TV);

			if (!datosSesion.isUsuarioLogado()){
				setMensajeError(request, "Para consultar sus pedidos antes deber hacer login en el sistema.");
				return getPortlet().getAccion("buscar").ejecutar(request);
			}
			
			ParametrosBuscarPedidosVentasBean param = new ParametrosBuscarPedidosVentasBean();
			param.setCodAlmacen(datosSesion.getConfigTiendaVirtual().getCodAlmacen());
			param.setCodCliente(cliente.getCodCli());
			param.setTamañoPagina(15);
			param.setEstados(ServicioEstados.consultar(EstadosPedidosVenta.ESTADO_EMISOR_PROCESO));
			try{
				param.setNumPagina(Integer.parseInt(request.getParameter("pagina")));
			}
			catch (Exception e) {
				param.setNumPagina(1);
			}
			
			
			// consultamos los pedidos del usuario en esta tienda
			PaginaResultados pedidos = ServicioPedidosVentas.consultar(param, datosSesion.getDatosSesionEmpresa());
			
			request.setAttribute("pedidos", pedidos);
			return NEXT_PAGE;
		}
		catch (PedidoVentaException e){
			setMensajeError(request, "Ha ocurrido un error al consultar sus pedidos. Disculpe las molestias.");
			return getPortlet().getAccion("buscar").ejecutar(request);
		}
		catch (Exception e) {
			e.printStackTrace();
			return ERROR_GENERAL;
		}
	}
}
