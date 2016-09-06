/**
 * 
 */
package com.comerzzia.web.backoffice.cambiosArticulosTarifas;

import com.comerzzia.web.backoffice.cambiosArticulosTarifas.acciones.ActualizarTiendaAccion;
import com.comerzzia.web.backoffice.cambiosArticulosTarifas.acciones.BuscarCambiosArticulosTarifasAccion;
import com.comerzzia.web.backoffice.cambiosArticulosTarifas.acciones.articulos.ImprimirAccion;
import com.comerzzia.web.base.ControladorServlet;

/**
 *
 */
public class CambiosArticulosTarifasServlet extends ControladorServlet {


	/**
	 * 
	 */
	private static final long serialVersionUID = 6625060348259806009L;

	protected void loadAcciones() {
		this.añadirAccionDefault(new BuscarCambiosArticulosTarifasAccion());
		this.añadirAccion(new ActualizarTiendaAccion());
		this.añadirAccion(new ImprimirAccion());
		this.añadirAccion(new com.comerzzia.web.backoffice.cambiosArticulosTarifas.acciones.tarifas.ImprimirAccion());
	}

}
