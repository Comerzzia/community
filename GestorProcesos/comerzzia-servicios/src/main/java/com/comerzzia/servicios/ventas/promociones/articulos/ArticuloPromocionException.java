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

package com.comerzzia.servicios.ventas.promociones.articulos;

import com.comerzzia.servicios.ventas.promociones.PromocionException;

public class ArticuloPromocionException extends PromocionException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1361444842464077882L;

	public ArticuloPromocionException() {
		super();
	}
	public ArticuloPromocionException(String msg) {
		super(msg);
	}
	
	public ArticuloPromocionException(String msg, Throwable e) {
        super(msg, e);
    }

	public ArticuloPromocionException(String msg, String msgKey, Throwable e) {
		super(msg, msgKey, e);
	}

	public ArticuloPromocionException(String msg, String msgKey) {
		super(msg, msgKey);
	}
}
