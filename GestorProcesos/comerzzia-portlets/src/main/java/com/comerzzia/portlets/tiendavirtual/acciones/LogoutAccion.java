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
import com.comerzzia.persistencia.tiendavirtual.tiendas.TiendaVirtualBean;
import com.comerzzia.portlets.base.Accion;
import com.comerzzia.portlets.base.Vista;
import com.comerzzia.portlets.base.WebKeys;
import com.comerzzia.portlets.tiendavirtual.iu.FormularioTienda;
import com.comerzzia.servicios.tiendavirtual.clientes.ClienteTiendaVirtualException;
import com.comerzzia.servicios.tiendavirtual.clientes.ClienteTiendaVirtualNotFoundException;
import com.comerzzia.servicios.tiendavirtual.clientes.ServicioClientesTiendaVirtual;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;

public class LogoutAccion extends Accion {

	public String getNombre() {
		return "logout";
	}

	public Vista ejecutar(ActionRequest request) {
		try {
			PortletSession session = request.getPortletSession();
			DatosSesionTiendaVirtualBean datosSesion = (DatosSesionTiendaVirtualBean) session.getAttribute(WebKeys.DATOS_SESION);
			FormularioTienda formulario = (FormularioTienda) session.getAttribute(WebKeys.FORMULARIO_TV);

			// consultamos cliente genéricos
			TiendaVirtualBean tienda = datosSesion.getTienda();
			ClienteBean cliente = ServicioClientesTiendaVirtual.consultar(tienda.getClientePorDefecto(), datosSesion);

			// guardamos cliente en sesión
			session.setAttribute(WebKeys.CLIENTE_TV, cliente);
			datosSesion.logoutUsuario();

			// establecemos en el formulario que se ha hecho logout
			formulario.setLogout();  
			
			session.setAttribute(WebKeys.DATOS_SESION, datosSesion);
			return getPortlet().getAccion("buscar").ejecutar(request);
		} 
		catch (ClienteTiendaVirtualNotFoundException e) { 
			return ERROR_GENERAL;
		} 
		catch (ClienteTiendaVirtualException e) {
			return ERROR_GENERAL;
		}
		catch (Exception e){
			e.printStackTrace();
			return ERROR_GENERAL;
		}
	}

}
