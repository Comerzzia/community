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
import com.comerzzia.persistencia.tiendavirtual.clientes.UsuarioClienteTiendaVirtualBean;
import com.comerzzia.portlets.base.Accion;
import com.comerzzia.portlets.base.Vista;
import com.comerzzia.portlets.base.WebKeys;
import com.comerzzia.portlets.tiendavirtual.iu.FormularioTienda;
import com.comerzzia.servicios.tiendavirtual.clientes.ClienteTiendaVirtualException;
import com.comerzzia.servicios.tiendavirtual.clientes.ClienteTiendaVirtualNotFoundException;
import com.comerzzia.servicios.tiendavirtual.clientes.ServicioClientesTiendaVirtual;
import com.comerzzia.servicios.tiendavirtual.login.InvalidLoginTiendaVirtualException;
import com.comerzzia.servicios.tiendavirtual.login.LoginTiendaVirtualException;
import com.comerzzia.servicios.tiendavirtual.login.ServicioLoginTiendaVirtual;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;
import com.comerzzia.util.base.Estado;

public class RegistrarClientePedidoAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("/tienda_virtual/cesta/jsp/login.jsp");

	public String getNombre() {
		return "registrarCliente";
	}

	public Vista ejecutar(ActionRequest request) {
		try {
			PortletSession session = request.getPortletSession();
			DatosSesionTiendaVirtualBean datosSesion = (DatosSesionTiendaVirtualBean) session.getAttribute(WebKeys.DATOS_SESION);
			FormularioTienda formulario = (FormularioTienda) session.getAttribute(WebKeys.FORMULARIO_TV);

			String usuario = "";
			String clave = request.getParameter("clave");

			if (request.getParameter("operacion").equals("login")){
				usuario = request.getParameter("usuario");
				request.setAttribute("usuarioLogin", usuario);
				UsuarioClienteTiendaVirtualBean usuarioCliente = new UsuarioClienteTiendaVirtualBean();
				usuarioCliente.setUsuario(usuario);
				usuarioCliente.setClave(clave);
				ClienteBean cliente = ServicioLoginTiendaVirtual.login(usuarioCliente, datosSesion);
				session.setAttribute(WebKeys.CLIENTE_TV, cliente);
				datosSesion.setUsuarioCliente(usuarioCliente);
				formulario.setLogin(usuarioCliente.getUsuario(),cliente.getDesCli());
			}
			else{ // operacion = registrar 
				usuario = request.getParameter("usuarioNuevo");
				request.setAttribute("usuarioNuevo", usuario);
				try{
					ServicioClientesTiendaVirtual.consultarUsuarioCliente(usuario, datosSesion);
					// si el usuario ya existe, solicitaremos que se indique un nombre de usuario diferente
					setMensajeError(request, "El nombre de usuario indicado ya existe. Por favor, indique otro en su lugar.");
					return NEXT_PAGE;
				} 
				catch(ClienteTiendaVirtualNotFoundException e){
					datosSesion.setUsuarioCliente(new UsuarioClienteTiendaVirtualBean());
					datosSesion.getUsuarioCliente().setClave(clave);
					datosSesion.getUsuarioCliente().setUsuario(usuario);
					datosSesion.getUsuarioCliente().setEstadoBean(Estado.NUEVO);
				}
			}
			return getPortlet().getAccion("realizarPedido").ejecutar(request);
		}
		catch (InvalidLoginTiendaVirtualException e) {
			setMensajeError(request, e.getMessage());
			return NEXT_PAGE;
		}
		catch(LoginTiendaVirtualException e){
			setMensajeError(request, "Ha ocurrido un error al intentar hacer login con el usuario y contraseña indicado.");
			return NEXT_PAGE;
		}
		catch(ClienteTiendaVirtualException e){
			setMensajeError(request, "Ha ocurrido un error intentando comprobar la disponibilidad del nombre de usuario indicado.");
			return NEXT_PAGE;
		}
		catch (Exception e) {
			e.printStackTrace();
			return ERROR_GENERAL;
		}
	}
}
