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
import java.sql.SQLIntegrityConstraintViolationException;

import com.comerzzia.util.config.AppInfo;


public abstract class MantenimientoDao {

	protected static String getNombreElemento(String esquema, String elemento) {
		return esquema + "." + elemento + " ";
	}
	
	
	protected static String getNombreElementoConfiguracion(String elemento) {
		return AppInfo.getDbInfo().getEsquemaConfiguracion() + "." + elemento + " ";
	}
	
	
	protected static SQLException getDaoException(SQLException e) {
		SQLException s = e;
		
		if (e instanceof SQLIntegrityConstraintViolationException) {
			switch (e.getErrorCode()) {
				// PK y UNQ
				case 1:     // ORACLE
				case 1062:  // MYSQL
					s = new KeyConstraintViolationException(e.getMessage(), 
							e.getSQLState(), e.getErrorCode(), e);
					break;
				
				// NOT NULL
				case 1400:  // ORACLE
				case 1048:  // MYSQL
					s = new NotNullConstraintViolationException(e.getMessage(), 
							e.getSQLState(), e.getErrorCode(), e);
					break;
					
				// FK
				case 2292:  // ORACLE
				case 1451:  // MYSQL
					s = new ForeingKeyConstraintViolationException(e.getMessage(), 
							e.getSQLState(), e.getErrorCode(), e);
					break;
					
				default:
					s = new KeyConstraintViolationException(e.getMessage(), e.getSQLState(), e.getErrorCode(), e);
			}
		}

		return s;
	}
}
