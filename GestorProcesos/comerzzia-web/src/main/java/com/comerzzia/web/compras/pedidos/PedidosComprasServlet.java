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

package com.comerzzia.web.compras.pedidos;

import com.comerzzia.web.base.ControladorServlet;
import com.comerzzia.web.compras.pedidos.acciones.AceptarMultiplesPedidosAccion;
import com.comerzzia.web.compras.pedidos.acciones.AceptarPedidoAccion;
import com.comerzzia.web.compras.pedidos.acciones.AltaAccion;
import com.comerzzia.web.compras.pedidos.acciones.BuscarAccion;
import com.comerzzia.web.compras.pedidos.acciones.ConfirmarSolicitudPedidoAccion;
import com.comerzzia.web.compras.pedidos.acciones.EditarAccion;
import com.comerzzia.web.compras.pedidos.acciones.EjecutarAccion;
import com.comerzzia.web.compras.pedidos.acciones.EliminarAccion;
import com.comerzzia.web.compras.pedidos.acciones.FormularioRecepcionarPedidosAccion;
import com.comerzzia.web.compras.pedidos.acciones.ImprimirAccion;
import com.comerzzia.web.compras.pedidos.acciones.ImprimirListadoPedidosAccion;
import com.comerzzia.web.compras.pedidos.acciones.LeerFormularioAccion;
import com.comerzzia.web.compras.pedidos.acciones.RecepcionarMultiplesPedidosAccion;
import com.comerzzia.web.compras.pedidos.acciones.RecepcionarPedidoAccion;
import com.comerzzia.web.compras.pedidos.acciones.SalvarAccion;
import com.comerzzia.web.compras.pedidos.acciones.VerAccion;
import com.comerzzia.web.compras.pedidos.acciones.VerFormularioAccion;

public class PedidosComprasServlet extends ControladorServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1346552798744269868L;

	protected void loadAcciones() {
		añadirAccionDefault(new EjecutarAccion());
		añadirAccion(new BuscarAccion());
		añadirAccion(new VerAccion());
		añadirAccion(new VerFormularioAccion());
		añadirAccion(new EditarAccion());
		añadirAccion(new LeerFormularioAccion());
		añadirAccion(new AltaAccion());
		añadirAccion(new EliminarAccion());
		añadirAccion(new SalvarAccion());
		añadirAccion(new ConfirmarSolicitudPedidoAccion());
		añadirAccion(new AceptarMultiplesPedidosAccion());
		añadirAccion(new AceptarPedidoAccion());
		añadirAccion(new FormularioRecepcionarPedidosAccion());
		añadirAccion(new RecepcionarMultiplesPedidosAccion());
		añadirAccion(new RecepcionarPedidoAccion());
		añadirAccion(new ImprimirAccion());
		añadirAccion(new ImprimirListadoPedidosAccion());
	}
}
