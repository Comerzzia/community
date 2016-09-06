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

package com.comerzzia.web.ventas.tarifas;

import com.comerzzia.web.base.ControladorServlet;
import com.comerzzia.web.ventas.tarifas.acciones.*;

public class TarifasServlet extends ControladorServlet {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -3075933767656334024L;

	protected void loadAcciones() {
		this.añadirAccionDefault(new EjecutarAccion());
		this.añadirAccion(new AltaAccion());
		this.añadirAccion(new BuscarAccion());
		this.añadirAccion(new EditarAccion());
		this.añadirAccion(new EliminarAccion());
		this.añadirAccion(new SalvarAccion());
		this.añadirAccion(new VerAccion());
		this.añadirAccion(new AsistenteInsercionAccion());
		this.añadirAccion(new AsistenteActualizacionAccion());
		this.añadirAccion(new LeerFormularioAccion());		
		this.añadirAccion(new VerFormularioAccion());	
		this.añadirAccion(new ImprimirAccion());
	}
	
	
}
