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
import com.comerzzia.servicios.tiendavirtual.cesta.CestaBean;
import com.comerzzia.servicios.tiendavirtual.mediospago.MedioPagoException;
import com.comerzzia.servicios.tiendavirtual.mediospago.ServicioMediosPago;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;

public class RealizarPedidoAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("/tienda_virtual/cesta/jsp/pedido.jsp");

	public String getNombre() {
		return "realizarPedido";
	}

	public Vista ejecutar(ActionRequest request) {
		try {
			PortletSession session = request.getPortletSession();
			DatosSesionTiendaVirtualBean datosSesion = (DatosSesionTiendaVirtualBean) session.getAttribute(WebKeys.DATOS_SESION);
			CestaBean cesta = (CestaBean) session.getAttribute(WebKeys.CESTA_TV);
			ClienteBean cliente = (ClienteBean) session.getAttribute(WebKeys.CLIENTE_TV);
			
			// calculamos los portes
			cesta.calcularPortes(datosSesion, cliente);
			
			// proporcionamos datos del cliente si está logado
			if (datosSesion.isUsuarioLogado()){
				request.setAttribute("datosCliente", cliente);
			}
			else{
				request.setAttribute("datosCliente", new ClienteBean());
			}
			
			// consultamos medios de pago disponibles
			request.setAttribute("mediosPago", ServicioMediosPago.consultar(datosSesion));
			
			request.setAttribute(WebKeys.CESTA_TV, cesta);
			return NEXT_PAGE;
		}
		catch(MedioPagoException e){
			return ERROR_GENERAL;
		}
		catch (Exception e) { 
			e.printStackTrace();
			return ERROR_GENERAL;
		}
	}
}
