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

package com.comerzzia.web.general.paises;

import com.comerzzia.web.base.ControladorServlet;
import com.comerzzia.web.general.paises.acciones.AltaAccion;
import com.comerzzia.web.general.paises.acciones.BuscarAccion;
import com.comerzzia.web.general.paises.acciones.EditarAccion;
import com.comerzzia.web.general.paises.acciones.EliminarAccion;
import com.comerzzia.web.general.paises.acciones.ImprimirAccion;
import com.comerzzia.web.general.paises.acciones.SalvarAccion;
import com.comerzzia.web.general.paises.acciones.VerAccion;
import com.comerzzia.web.general.paises.acciones.EjecutarAccion;

public class PaisesServlet extends ControladorServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3079156179046384496L;

	
	protected void loadAcciones() {
		this.añadirAccionDefault(new EjecutarAccion());
		this.añadirAccion(new BuscarAccion());
		this.añadirAccion(new AltaAccion());
		this.añadirAccion(new VerAccion());
		this.añadirAccion(new EditarAccion());
		this.añadirAccion(new EliminarAccion());
		this.añadirAccion(new SalvarAccion());
		this.añadirAccion(new ImprimirAccion());
	}

}
