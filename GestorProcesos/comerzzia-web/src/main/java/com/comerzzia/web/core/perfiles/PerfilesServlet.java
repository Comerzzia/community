/**
 * 
 */
package com.comerzzia.web.core.perfiles;

import com.comerzzia.web.base.ControladorServlet;
import com.comerzzia.web.core.perfiles.acciones.AltaAccion;
import com.comerzzia.web.core.perfiles.acciones.BuscarAccion;
import com.comerzzia.web.core.perfiles.acciones.EditarAccion;
import com.comerzzia.web.core.perfiles.acciones.EjecutarAccion;
import com.comerzzia.web.core.perfiles.acciones.EliminarAccion;
import com.comerzzia.web.core.perfiles.acciones.SalvarAccion;
import com.comerzzia.web.core.perfiles.acciones.VerAccion;

/**
 *
 */
public class PerfilesServlet extends ControladorServlet{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6678370961773959994L;

	protected void loadAcciones() {
		this.añadirAccionDefault(new EjecutarAccion());
		this.añadirAccion(new BuscarAccion());
		this.añadirAccion(new AltaAccion());
		this.añadirAccion(new VerAccion());
		this.añadirAccion(new EditarAccion());
		this.añadirAccion(new EliminarAccion());
		this.añadirAccion(new SalvarAccion());
		
	}

}
