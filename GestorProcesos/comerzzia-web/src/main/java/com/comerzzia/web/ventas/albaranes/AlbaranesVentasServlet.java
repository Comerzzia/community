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

package com.comerzzia.web.ventas.albaranes;

import com.comerzzia.web.base.ControladorServlet;
import com.comerzzia.web.ventas.albaranes.acciones.AltaAccion;
import com.comerzzia.web.ventas.albaranes.acciones.BuscarAccion;
import com.comerzzia.web.ventas.albaranes.acciones.EditarAccion;
import com.comerzzia.web.ventas.albaranes.acciones.EjecutarAccion;
import com.comerzzia.web.ventas.albaranes.acciones.EliminarAccion;
import com.comerzzia.web.ventas.albaranes.acciones.ImprimirAccion;
import com.comerzzia.web.ventas.albaranes.acciones.ImprimirListadoAlbaranesAccion;
import com.comerzzia.web.ventas.albaranes.acciones.LeerFormularioAccion;
import com.comerzzia.web.ventas.albaranes.acciones.ModificarTrackingAccion;
import com.comerzzia.web.ventas.albaranes.acciones.SalvarAccion;
import com.comerzzia.web.ventas.albaranes.acciones.VerAccion;
import com.comerzzia.web.ventas.albaranes.acciones.VerFormularioAccion;

public class AlbaranesVentasServlet extends ControladorServlet {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 5957676880596269913L;

	@Override
	protected void loadAcciones() {
		this.añadirAccionDefault(new EjecutarAccion());
		this.añadirAccion(new BuscarAccion());
		this.añadirAccion(new VerAccion());
		this.añadirAccion(new EditarAccion());
		this.añadirAccion(new LeerFormularioAccion());
		this.añadirAccion(new VerFormularioAccion());
		this.añadirAccion(new AltaAccion());
		this.añadirAccion(new EliminarAccion());
		this.añadirAccion(new SalvarAccion());
		this.añadirAccion(new ImprimirAccion());
		this.añadirAccion(new ImprimirListadoAlbaranesAccion());
		this.añadirAccion(new ModificarTrackingAccion());
	}
}
