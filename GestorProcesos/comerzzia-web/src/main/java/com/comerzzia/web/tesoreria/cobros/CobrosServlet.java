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

package com.comerzzia.web.tesoreria.cobros;

import com.comerzzia.web.base.ControladorServlet;
import com.comerzzia.web.tesoreria.cobros.acciones.AltaAccion;
import com.comerzzia.web.tesoreria.cobros.acciones.BuscarAccion;
import com.comerzzia.web.tesoreria.cobros.acciones.EditarAccion;
import com.comerzzia.web.tesoreria.cobros.acciones.EjecutarAccion;
import com.comerzzia.web.tesoreria.cobros.acciones.EliminarAccion;
import com.comerzzia.web.tesoreria.cobros.acciones.ImprimirAccion;
import com.comerzzia.web.tesoreria.cobros.acciones.LeerFormularioAccion;
import com.comerzzia.web.tesoreria.cobros.acciones.SalvarAccion;
import com.comerzzia.web.tesoreria.cobros.acciones.VerAccion;
import com.comerzzia.web.tesoreria.cobros.acciones.VerFormularioAccion;
import com.comerzzia.web.tesoreria.cobros.acciones.agrupar.AgregarDocumentoAccion;
import com.comerzzia.web.tesoreria.cobros.acciones.agrupar.AgruparAccion;
import com.comerzzia.web.tesoreria.cobros.acciones.agrupar.AgruparVencimientosAccion;
import com.comerzzia.web.tesoreria.cobros.acciones.agrupar.EliminarDocumentoAgrupadoAccion;
import com.comerzzia.web.tesoreria.cobros.acciones.cobrar.CobrarAccion;
import com.comerzzia.web.tesoreria.cobros.acciones.cobrar.CobrarVencimientosAccion;

public class CobrosServlet extends ControladorServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1927741227582822437L;

	protected void loadAcciones() {
		this.añadirAccionDefault(new EjecutarAccion());
		this.añadirAccion(new BuscarAccion());
		this.añadirAccion(new AltaAccion());
		this.añadirAccion(new VerFormularioAccion());
		this.añadirAccion(new SalvarAccion());
		this.añadirAccion(new LeerFormularioAccion());
		this.añadirAccion(new VerAccion());
		this.añadirAccion(new EditarAccion());
		this.añadirAccion(new AgregarDocumentoAccion());
		this.añadirAccion(new AgruparVencimientosAccion());
		this.añadirAccion(new AgruparAccion());
		this.añadirAccion(new EliminarDocumentoAgrupadoAccion());
		this.añadirAccion(new EliminarAccion());
		this.añadirAccion(new CobrarVencimientosAccion());
		this.añadirAccion(new CobrarAccion());
		this.añadirAccion(new ImprimirAccion());
	}

}
