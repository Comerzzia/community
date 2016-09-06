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

package com.comerzzia.servicios.compras.facturas.detalle;

import com.comerzzia.servicios.compras.facturas.FacturaCompraConstraintViolationException;

public class DetalleFacturaCompraConstraintViolationException extends FacturaCompraConstraintViolationException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3195625381467379564L;

	public DetalleFacturaCompraConstraintViolationException() {
	}

	public DetalleFacturaCompraConstraintViolationException(String msg) {
		super(msg);
	}

	public DetalleFacturaCompraConstraintViolationException(String msg, Throwable e) {
		super(msg, e);
	}

	public DetalleFacturaCompraConstraintViolationException(String msg, String msgKey) {
		super(msg, msgKey);
	}

	public DetalleFacturaCompraConstraintViolationException(String msg, String msgKey,
			Throwable e) {
		super(msg, msgKey, e);
	}
}
