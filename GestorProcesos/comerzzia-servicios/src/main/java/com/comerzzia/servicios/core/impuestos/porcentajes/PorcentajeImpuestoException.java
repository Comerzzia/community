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

package com.comerzzia.servicios.core.impuestos.porcentajes;

import com.comerzzia.util.base.Exception;

public class PorcentajeImpuestoException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8059419011850026405L;

	public PorcentajeImpuestoException() {
		super();
	}

	public PorcentajeImpuestoException(String msg, String msgKey, Throwable e) {
		super(msg, msgKey, e);
	}

	public PorcentajeImpuestoException(String msg, String msgKey) {
		super(msg, msgKey);
	}

	public PorcentajeImpuestoException(String msg, Throwable e) {
		super(msg, e);
	}

	public PorcentajeImpuestoException(String msg) {
		super(msg);
	}
	
	

}
