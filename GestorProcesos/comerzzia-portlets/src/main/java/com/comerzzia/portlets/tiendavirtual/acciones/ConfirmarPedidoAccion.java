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
import com.comerzzia.portlets.tiendavirtual.iu.FormularioTienda;
import com.comerzzia.servicios.tiendavirtual.cesta.CestaBean;
import com.comerzzia.servicios.tiendavirtual.clientes.ClienteTiendaVirtualException;
import com.comerzzia.servicios.tiendavirtual.clientes.ClienteTiendaVirtualRegistroException;
import com.comerzzia.servicios.tiendavirtual.login.InvalidLoginTiendaVirtualException;
import com.comerzzia.servicios.tiendavirtual.login.LoginTiendaVirtualException;
import com.comerzzia.servicios.tiendavirtual.login.ServicioLoginTiendaVirtual;
import com.comerzzia.servicios.tiendavirtual.pedidos.PedidoVentaTiendaVirtualException;
import com.comerzzia.servicios.tiendavirtual.pedidos.ServicioPedidosTiendaVirtual;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;
import com.comerzzia.servicios.ventas.pedidos.PedidoVenta;
import com.comerzzia.servicios.ventas.pedidos.ServicioPedidosVentas;
import com.comerzzia.util.base.Estado;

public class ConfirmarPedidoAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("/tienda_virtual/cesta/jsp/confirmacion.jsp");

	public String getNombre() {
		return "confirmarPedido";
	}

	public Vista ejecutar(ActionRequest request) {
		try {
			PortletSession session = request.getPortletSession();
			DatosSesionTiendaVirtualBean datosSesion = (DatosSesionTiendaVirtualBean) session.getAttribute(WebKeys.DATOS_SESION);
			CestaBean cesta = (CestaBean) session.getAttribute(WebKeys.CESTA_TV);
			FormularioTienda formulario = (FormularioTienda) session.getAttribute(WebKeys.FORMULARIO_TV);
			
			
			// recogemos los datos del cliente
			ClienteBean cliente = new ClienteBean();
			cliente.setCif(request.getParameter("cif").toUpperCase());
			cliente.setDesCli(request.getParameter("desCli"));
			cliente.setDomicilio(request.getParameter("domicilio"));
			cliente.setCp(request.getParameter("cp"));
			cliente.setPoblacion(request.getParameter("poblacion"));
			cliente.setProvincia(request.getParameter("provincia"));
			cliente.setTelefono1(request.getParameter("telefono1"));
			cliente.setTelefono2(request.getParameter("telefono2"));
			cliente.setEmail(request.getParameter("email"));
			cliente.setObservaciones(request.getParameter("observaciones"));
			cliente.setIdTratImp(((ClienteBean) session.getAttribute(WebKeys.CLIENTE_TV)).getIdTratImp());
			cliente.setCodTar(((ClienteBean) session.getAttribute(WebKeys.CLIENTE_TV)).getCodTar());
			request.setAttribute("datosCliente", cliente);
			request.setAttribute("desMedioPago", request.getParameter("desMedioPago")); // TODO:
			
			String codMedioPago = request.getParameter("medioPago");
			
			Long idPedido = ServicioPedidosTiendaVirtual.realizarPedido(datosSesion, datosSesion.getUsuarioCliente(), cliente, cesta, codMedioPago);
			
			// si el usuario es nuevo, le autenticamos automáticamente
			if (!datosSesion.isUsuarioLogado()){
				try{
					cliente = ServicioLoginTiendaVirtual.login(datosSesion.getUsuarioCliente(), datosSesion);
					datosSesion.getUsuarioCliente().setEstadoBean(Estado.SIN_MODIFICAR);
					session.setAttribute(WebKeys.CLIENTE_TV, cliente);
					formulario.setLogin(datosSesion.getUsuarioCliente().getUsuario(),cliente.getDesCli());
				}
				catch (LoginTiendaVirtualException ignore) {} // si se produce algún problema en el auto-login, lo ignoramos 
				catch (InvalidLoginTiendaVirtualException ignore) {}
			}

			// borramos todo el contenido de la cesta
			cesta.vaciarCesta();
			formulario.borrarDatosCesta();
			
			// consultamos pedido
			PedidoVenta pedido = ServicioPedidosVentas.consultar(idPedido, datosSesion.getDatosSesionEmpresa());
			request.setAttribute("pedido", pedido);
			request.setAttribute("datosCliente", cliente);

			// devolvemos página de confirmación
			setMensajeInfo(request, "Su pedido ha sido realizado satisfactoriamente.");
			return NEXT_PAGE;
		}
		catch (ClienteTiendaVirtualRegistroException e){
			setMensajeError(request, "No se ha podido completar el pedido. " + e.getMessage());
			return getPortlet().getAccion("realizarPedido").ejecutar(request);
		}
		catch (ClienteTiendaVirtualException e) {
			setMensajeError(request, "No se ha podido completar el pedido. Se ha producido un error al intentar registrar o actualizar los datos del cliente. ");
			return getPortlet().getAccion("realizarPedido").ejecutar(request);
		} 
		catch (PedidoVentaTiendaVirtualException e) {
			setMensajeError(request, "Se ha producido un error al intentar enviar el pedido. Vuelva a intentarlo o contacte con el administrador. Disculpe las molestias.");
			return getPortlet().getAccion("realizarPedido").ejecutar(request);
		}
		catch (Exception e) {  
			e.printStackTrace();
			return ERROR_GENERAL;
		}
 	}
}
