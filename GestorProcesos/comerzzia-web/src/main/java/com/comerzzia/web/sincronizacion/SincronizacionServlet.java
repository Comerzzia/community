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

package com.comerzzia.web.sincronizacion;

import com.comerzzia.web.base.ControladorServlet;
import com.comerzzia.web.sincronizacion.acciones.EjecutarAccion;
import com.comerzzia.web.sincronizacion.acciones.LeerFormularioAccion;
import com.comerzzia.web.sincronizacion.acciones.VerFormularioAccion;
import com.comerzzia.web.sincronizacion.acciones.SalvarAccion;

public class SincronizacionServlet extends ControladorServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4154968460774747713L;

	protected void loadAcciones() {
		añadirAccionDefault(new EjecutarAccion());
		añadirAccion(new VerFormularioAccion());
		añadirAccion(new LeerFormularioAccion());
		añadirAccion(new SalvarAccion());
	}
}
