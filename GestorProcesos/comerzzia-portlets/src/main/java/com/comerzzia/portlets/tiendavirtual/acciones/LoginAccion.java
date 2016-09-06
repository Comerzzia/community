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
import com.comerzzia.servicios.tiendavirtual.login.InvalidLoginTiendaVirtualException;
import com.comerzzia.servicios.tiendavirtual.login.LoginTiendaVirtualException;
import com.comerzzia.servicios.tiendavirtual.login.ServicioLoginTiendaVirtual;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;

public class LoginAccion extends Accion {

	public String getNombre() {
		return "login";
	}

	public Vista ejecutar(ActionRequest request) {
		try {
			PortletSession session = request.getPortletSession();

			DatosSesionTiendaVirtualBean datosSesion = (DatosSesionTiendaVirtualBean) session.getAttribute(WebKeys.DATOS_SESION);
			FormularioTienda formulario = (FormularioTienda) session.getAttribute(WebKeys.FORMULARIO_TV);

			UsuarioClienteTiendaVirtualBean usuarioCliente = new UsuarioClienteTiendaVirtualBean();
			usuarioCliente.setUsuario(request.getParameter("usuario"));
			usuarioCliente.setClave(request.getParameter("clave"));

			// hacemos login con los datos de usuario
			ClienteBean cliente = ServicioLoginTiendaVirtual.login(usuarioCliente, datosSesion);

			// guardamos en sesión el cliente y el usuario
			session.setAttribute(WebKeys.CLIENTE_TV, cliente);
			datosSesion.setUsuarioCliente(usuarioCliente);
			
			// establecemos en el formulario los datos del login
			formulario.setLogin(usuarioCliente.getUsuario(),cliente.getDesCli());
			
			return getPortlet().getAccion("buscar").ejecutar(request);
		} 
		catch (InvalidLoginTiendaVirtualException e) {
			setMensajeError(request, e.getMessage());
			return getPortlet().getAccion("buscar").ejecutar(request);
		} 
		catch (LoginTiendaVirtualException e) {
			setMensajeError(request,"Ha ocurrido un error al intentar realizar el login de usuario en la tienda virtual.");
			return getPortlet().getAccion("buscar").ejecutar(request);
		} 
		catch (Exception e) {
			e.printStackTrace();
			return ERROR_GENERAL;
		}
	}
}
