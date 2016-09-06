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

package com.comerzzia.web.ventas.tarifas.actualizaciones;

import com.comerzzia.web.base.ControladorServlet;
import com.comerzzia.web.ventas.tarifas.actualizaciones.acciones.AltaAccion;
import com.comerzzia.web.ventas.tarifas.actualizaciones.acciones.AsistenteActualizacionAccion;
import com.comerzzia.web.ventas.tarifas.actualizaciones.acciones.AsistenteInserccionAccion;
import com.comerzzia.web.ventas.tarifas.actualizaciones.acciones.BuscarActualizacionesAccion;
import com.comerzzia.web.ventas.tarifas.actualizaciones.acciones.EditarAccion;
import com.comerzzia.web.ventas.tarifas.actualizaciones.acciones.EjecutarAccion;
import com.comerzzia.web.ventas.tarifas.actualizaciones.acciones.EliminarAccion;
import com.comerzzia.web.ventas.tarifas.actualizaciones.acciones.LeerFormularioAccion;
import com.comerzzia.web.ventas.tarifas.actualizaciones.acciones.SalvarAccion;
import com.comerzzia.web.ventas.tarifas.actualizaciones.acciones.VerAccion;
import com.comerzzia.web.ventas.tarifas.actualizaciones.acciones.VerFormularioAccion;

public class ActualizacionesTarifasServlet extends ControladorServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2431265430247161772L;

	protected void loadAcciones() {
		this.añadirAccionDefault(new EjecutarAccion());
		this.añadirAccion(new EjecutarAccion());
		this.añadirAccion(new BuscarActualizacionesAccion());
		this.añadirAccion(new VerAccion());
		this.añadirAccion(new VerFormularioAccion());
		this.añadirAccion(new LeerFormularioAccion());
		this.añadirAccion(new AltaAccion());
		this.añadirAccion(new SalvarAccion());
		this.añadirAccion(new EliminarAccion());
		this.añadirAccion(new EditarAccion());
		this.añadirAccion(new AsistenteInserccionAccion());
		this.añadirAccion(new AsistenteActualizacionAccion());
		
	}

}
