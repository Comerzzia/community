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

package com.comerzzia.util.base;

import java.sql.SQLException;

public class NotNullConstraintViolationException extends SQLException {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -4062105522859414976L;

	public NotNullConstraintViolationException() {
	}

	public NotNullConstraintViolationException(String reason) {
		super(reason);
	}

	public NotNullConstraintViolationException(Throwable cause) {
		super(cause);
	}

	public NotNullConstraintViolationException(String reason, String SQLState) {
		super(reason, SQLState);
	}

	public NotNullConstraintViolationException(String reason, Throwable cause) {
		super(reason, cause);
	}

	public NotNullConstraintViolationException(String reason, String SQLState,
			int vendorCode) {
		super(reason, SQLState, vendorCode);
	}

	public NotNullConstraintViolationException(String reason, String sqlState,
			Throwable cause) {
		super(reason, sqlState, cause);
	}

	public NotNullConstraintViolationException(String reason, String sqlState,
			int vendorCode, Throwable cause) {
		super(reason, sqlState, vendorCode, cause);
	}

	public String getDefaultMessage() {
		return "Se ha violado una restricción de campo obligatorio";
	}
}
