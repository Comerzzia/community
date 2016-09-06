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
import com.comerzzia.servicios.tiendavirtual.cesta.CestaArticulosException;
import com.comerzzia.servicios.tiendavirtual.cesta.CestaBean;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;

public class AñadirArticuloCestaAccion extends Accion {

	public String getNombre() {
		return "anadirArticuloCesta";
	}

	public Vista ejecutar(ActionRequest request) {
		try {
			PortletSession session = request.getPortletSession();
			DatosSesionTiendaVirtualBean datosSesion = (DatosSesionTiendaVirtualBean) session.getAttribute(WebKeys.DATOS_SESION);
			CestaBean cesta = (CestaBean) session.getAttribute(WebKeys.CESTA_TV);
			ClienteBean cliente = (ClienteBean) session.getAttribute(WebKeys.CLIENTE_TV);
			FormularioTienda formulario = (FormularioTienda) session.getAttribute(WebKeys.FORMULARIO_TV);

			String codArticulo = request.getParameter("codArticulo");
			Integer cantidad = Integer.parseInt(request.getParameter("cantidad"));

			cesta.añadirArticulo(datosSesion, cliente, codArticulo, cantidad);
			formulario.setDatosCesta(cesta.getCantidadArticulos(), cesta.getImporteRedondeado());
			
			return getPortlet().getAccion("verCesta").ejecutar(request);
		} 
		catch (CestaArticulosException e) {
			setMensajeError(request, "Ha ocurrido un error al intentar añadir el artículo seleccionado a la cesta.");
			return getPortlet().getAccion("buscar").ejecutar(request);
		} 
		catch (Exception e) {
			e.printStackTrace();
			setMensajeError(request, "Se ha producido un error inesperado al intentar añadir el artículo seleccionado a la cesta.");
			return getPortlet().getAccion("buscar").ejecutar(request);
		}
	}
}
