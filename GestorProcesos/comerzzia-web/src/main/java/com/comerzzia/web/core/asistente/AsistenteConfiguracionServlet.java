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

package com.comerzzia.web.core.asistente;

import com.comerzzia.web.base.ControladorServlet;
import com.comerzzia.web.core.asistente.acciones.*;

public class AsistenteConfiguracionServlet extends ControladorServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4773299292470911205L;

	protected void loadAcciones() {
		this.añadirAccionDefault(new EjecutarAccion());
		this.añadirAccion(new EjecutarAccion());
		this.añadirAccion(new VerFormularioAccion());
		this.añadirAccion(new CambiarLogoAccion());
		this.añadirAccion(new SalvarAccion());
		this.añadirAccion(new LeerDatosEmpresaAccion());
		this.añadirAccion(new LeerLogoAccion());
		this.añadirAccion(new LeerDatosAlmacenAccion());
		this.añadirAccion(new LeerDesgloseAccion());
	}
}
