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

package com.comerzzia.web.backoffice.ventas.pedidos;

import com.comerzzia.web.backoffice.ventas.pedidos.acciones.AltaAccion;
import com.comerzzia.web.backoffice.ventas.pedidos.acciones.BuscarAccion;
import com.comerzzia.web.backoffice.ventas.pedidos.acciones.ConfirmarSolicitudPedidoAccion;
import com.comerzzia.web.backoffice.ventas.pedidos.acciones.EditarAccion;
import com.comerzzia.web.backoffice.ventas.pedidos.acciones.EjecutarAccion;
import com.comerzzia.web.backoffice.ventas.pedidos.acciones.EliminarAccion;
import com.comerzzia.web.backoffice.ventas.pedidos.acciones.LeerFormularioAccion;
import com.comerzzia.web.backoffice.ventas.pedidos.acciones.SalvarAccion;
import com.comerzzia.web.backoffice.ventas.pedidos.acciones.VerAccion;
import com.comerzzia.web.backoffice.ventas.pedidos.acciones.VerFormularioAccion;
import com.comerzzia.web.backoffice.ventas.pedidos.acciones.ImprimirListadoPedidosAccion;
import com.comerzzia.web.backoffice.ventas.pedidos.acciones.ImprimirAccion;
import com.comerzzia.web.base.ControladorServlet;

public class PedidosVentasBackofficeServlet extends ControladorServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3318729387590026052L;

	protected void loadAcciones() {
		añadirAccionDefault(new EjecutarAccion());
		añadirAccion(new BuscarAccion());
		añadirAccion(new AltaAccion());
		añadirAccion(new VerFormularioAccion());
		añadirAccion(new LeerFormularioAccion());
		añadirAccion(new SalvarAccion());
		añadirAccion(new VerAccion());
		añadirAccion(new EditarAccion());
		añadirAccion(new EliminarAccion());
		añadirAccion(new ConfirmarSolicitudPedidoAccion());
		añadirAccion(new ImprimirListadoPedidosAccion());
		añadirAccion(new ImprimirAccion());
	}
}
