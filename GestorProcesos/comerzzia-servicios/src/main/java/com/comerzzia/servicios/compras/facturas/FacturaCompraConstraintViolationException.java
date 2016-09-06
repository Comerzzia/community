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

package com.comerzzia.servicios.compras.facturas;

import com.comerzzia.util.base.Exception;

public class FacturaCompraConstraintViolationException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1583884383563626277L;

	public FacturaCompraConstraintViolationException() {
	}

	public FacturaCompraConstraintViolationException(String msg) {
		super(msg);
	}

	public FacturaCompraConstraintViolationException(String msg, Throwable e) {
		super(msg, e);
	}

	public FacturaCompraConstraintViolationException(String msg, String msgKey) {
		super(msg, msgKey);
	}

	public FacturaCompraConstraintViolationException(String msg, String msgKey,
			Throwable e) {
		super(msg, msgKey, e);
	}
}
