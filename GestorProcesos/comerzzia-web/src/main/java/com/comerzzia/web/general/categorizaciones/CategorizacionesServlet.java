/**
 * 
 */
package com.comerzzia.web.general.categorizaciones;

import com.comerzzia.web.base.ControladorServlet;
import com.comerzzia.web.general.categorizaciones.acciones.AltaAccion;
import com.comerzzia.web.general.categorizaciones.acciones.BuscarAccion;
import com.comerzzia.web.general.categorizaciones.acciones.EditarAccion;
import com.comerzzia.web.general.categorizaciones.acciones.EjecutarAccion;
import com.comerzzia.web.general.categorizaciones.acciones.EliminarAccion;
import com.comerzzia.web.general.categorizaciones.acciones.ImprimirAccion;
import com.comerzzia.web.general.categorizaciones.acciones.SalvarAccion;
import com.comerzzia.web.general.categorizaciones.acciones.VerAccion;

/**
 *
 */
public class CategorizacionesServlet extends ControladorServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3023902100248484813L;

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
