/**
 * 
 */
package com.comerzzia.web.tesoreria.pagos;

import com.comerzzia.web.base.ControladorServlet;
import com.comerzzia.web.tesoreria.pagos.acciones.ImprimirAccion;
import com.comerzzia.web.tesoreria.pagos.acciones.agrupar.AgregarDocumentoAccion;
import com.comerzzia.web.tesoreria.pagos.acciones.agrupar.AgruparAccion;
import com.comerzzia.web.tesoreria.pagos.acciones.agrupar.AgruparVencimientosAccion;
import com.comerzzia.web.tesoreria.pagos.acciones.agrupar.EliminarDocumentoAgrupadoAccion;
import com.comerzzia.web.tesoreria.pagos.acciones.pagar.PagarAccion;
import com.comerzzia.web.tesoreria.pagos.acciones.pagar.PagarVencimientosAccion;
import com.comerzzia.web.tesoreria.pagos.acciones.AltaAccion;
import com.comerzzia.web.tesoreria.pagos.acciones.BuscarAccion;
import com.comerzzia.web.tesoreria.pagos.acciones.EditarAccion;
import com.comerzzia.web.tesoreria.pagos.acciones.EjecutarAccion;
import com.comerzzia.web.tesoreria.pagos.acciones.EliminarAccion;
import com.comerzzia.web.tesoreria.pagos.acciones.LeerFormularioAccion;
import com.comerzzia.web.tesoreria.pagos.acciones.SalvarAccion;
import com.comerzzia.web.tesoreria.pagos.acciones.VerAccion;
import com.comerzzia.web.tesoreria.pagos.acciones.VerFormularioAccion;

/**
 *
 */
public class PagosServlet extends ControladorServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4768544226180908929L;

	protected void loadAcciones() {
		this.añadirAccionDefault(new EjecutarAccion());
		this.añadirAccion(new BuscarAccion());
		this.añadirAccion(new AltaAccion());
		this.añadirAccion(new VerFormularioAccion());
		this.añadirAccion(new SalvarAccion());
		this.añadirAccion(new LeerFormularioAccion());
		this.añadirAccion(new VerAccion());
		this.añadirAccion(new EditarAccion());
		this.añadirAccion(new EliminarAccion());
		this.añadirAccion(new AgregarDocumentoAccion());
		this.añadirAccion(new AgruparVencimientosAccion());
		this.añadirAccion(new AgruparAccion());
		this.añadirAccion(new EliminarDocumentoAgrupadoAccion());
		this.añadirAccion(new EliminarAccion());
		this.añadirAccion(new PagarVencimientosAccion());
		this.añadirAccion(new PagarAccion());
		this.añadirAccion(new ImprimirAccion());
	}

}
