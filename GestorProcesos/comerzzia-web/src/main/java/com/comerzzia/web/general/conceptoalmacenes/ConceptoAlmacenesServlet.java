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

package com.comerzzia.web.general.conceptoalmacenes;

import com.comerzzia.web.base.ControladorServlet;
import com.comerzzia.web.general.conceptoalmacenes.acciones.*;


public class ConceptoAlmacenesServlet extends ControladorServlet {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -1283287169115427587L;
	public String codAplicacion;

	protected void loadAcciones() {
		
		this.añadirAccionDefault(new EjecutarAccion(codAplicacion));
		this.añadirAccion(new AltaAccion(codAplicacion));
		this.añadirAccion(new BuscarAccion(codAplicacion));
		this.añadirAccion(new EditarAccion(codAplicacion));
		this.añadirAccion(new EliminarAccion(codAplicacion));
		this.añadirAccion(new SalvarAccion(codAplicacion));
		this.añadirAccion(new VerAccion(codAplicacion));
		this.añadirAccion(new ImprimirAccion(codAplicacion));
	}
	
}
