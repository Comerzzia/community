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

import com.comerzzia.portlets.base.Accion;
import com.comerzzia.portlets.base.Vista;
import com.comerzzia.portlets.base.WebKeys;
import com.comerzzia.portlets.tiendavirtual.iu.FormularioTienda;
import com.comerzzia.servicios.tiendavirtual.cesta.CestaBean;

public class ModificarArticuloCestaAccion extends Accion {

	public String getNombre() {
		return "modificarArticuloCesta";
	}

	public Vista ejecutar(ActionRequest request) {
		try {
			PortletSession session = request.getPortletSession();
			CestaBean cesta = (CestaBean) session.getAttribute(WebKeys.CESTA_TV);
			FormularioTienda formulario = (FormularioTienda) session.getAttribute(WebKeys.FORMULARIO_TV);

			String codArticulo = request.getParameter("codArticulo");
			Integer cantidad = Integer.parseInt(request.getParameter("cantidad"));
			
			cesta.modificarArticulo(codArticulo, cantidad);
			formulario.setDatosCesta(cesta.getCantidadArticulos(), cesta.getImporteRedondeado());
			
			return getPortlet().getAccion("verCesta").ejecutar(request);
		} 
		catch (Exception e) {
			e.printStackTrace();
			setMensajeError(request, "Se ha producido un error inesperado al intentar modificar el artículo seleccionado de la cesta.");
			return getPortlet().getAccion("buscar").ejecutar(request);
		}
	}
}
