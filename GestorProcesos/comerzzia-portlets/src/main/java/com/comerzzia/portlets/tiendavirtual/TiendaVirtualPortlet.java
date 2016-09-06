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

package com.comerzzia.portlets.tiendavirtual;

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletSession;
import javax.portlet.RenderRequest;

import com.comerzzia.portlets.base.Portlet;
import com.comerzzia.portlets.base.Vista;
import com.comerzzia.portlets.base.WebKeys;
import com.comerzzia.portlets.tiendavirtual.acciones.AñadirArticuloCestaAccion;
import com.comerzzia.portlets.tiendavirtual.acciones.BuscarAccion;
import com.comerzzia.portlets.tiendavirtual.acciones.ConfirmarPedidoAccion;
import com.comerzzia.portlets.tiendavirtual.acciones.EliminarArticuloCestaAccion;
import com.comerzzia.portlets.tiendavirtual.acciones.FiltrarArticulosAccion;
import com.comerzzia.portlets.tiendavirtual.acciones.IdentificarClientePedidoAccion;
import com.comerzzia.portlets.tiendavirtual.acciones.LoginAccion;
import com.comerzzia.portlets.tiendavirtual.acciones.LogoutAccion;
import com.comerzzia.portlets.tiendavirtual.acciones.ModificarArticuloCestaAccion;
import com.comerzzia.portlets.tiendavirtual.acciones.RealizarPedidoAccion;
import com.comerzzia.portlets.tiendavirtual.acciones.RegistrarClientePedidoAccion;
import com.comerzzia.portlets.tiendavirtual.acciones.SeleccionarCategoriaPrimariaAccion;
import com.comerzzia.portlets.tiendavirtual.acciones.SeleccionarCategoriaSecundariaAccion;
import com.comerzzia.portlets.tiendavirtual.acciones.VerCestaAccion;
import com.comerzzia.portlets.tiendavirtual.acciones.VerFichaArticuloAccion;
import com.comerzzia.portlets.tiendavirtual.acciones.VerMisPedidosAccion;
import com.comerzzia.portlets.tiendavirtual.acciones.VerPedidoAccion;
import com.comerzzia.portlets.tiendavirtual.acciones.inicio.InicioModeViewAccion;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;

public class TiendaVirtualPortlet extends Portlet {

	@Override
	protected Vista ejecutarInicio(RenderRequest request) {
		return new InicioModeViewAccion().ejecutar(request);
	}

	@Override
	protected void loadAcciones() {
		añadirAccion(new SeleccionarCategoriaPrimariaAccion());
		añadirAccion(new SeleccionarCategoriaSecundariaAccion());
		añadirAccion(new BuscarAccion());
		añadirAccion(new FiltrarArticulosAccion());
		añadirAccion(new AñadirArticuloCestaAccion());
		añadirAccion(new ModificarArticuloCestaAccion());
		añadirAccion(new VerCestaAccion());
		añadirAccion(new EliminarArticuloCestaAccion());
		añadirAccion(new VerFichaArticuloAccion());
		añadirAccion(new LoginAccion());
		añadirAccion(new LogoutAccion());
		añadirAccion(new RealizarPedidoAccion());
		añadirAccion(new ConfirmarPedidoAccion());
		añadirAccion(new IdentificarClientePedidoAccion());
		añadirAccion(new RegistrarClientePedidoAccion());
		añadirAccion(new VerMisPedidosAccion());
		añadirAccion(new VerPedidoAccion());
	}
	
	@Override
	public void processAction(ActionRequest request, ActionResponse response)throws PortletException, IOException {
		PortletSession session = request.getPortletSession();
		DatosSesionTiendaVirtualBean datosSesion = (DatosSesionTiendaVirtualBean) session.getAttribute(WebKeys.DATOS_SESION);
		if (datosSesion != null){
			super.processAction(request, response);
		}
	}
}
