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

package com.comerzzia.servicios.sincronizacion.sincronizadores;

import com.comerzzia.servicios.core.database.CreacionDatabaseException;
import com.comerzzia.servicios.core.database.DatabaseTpvOracle;
import com.comerzzia.servicios.core.database.ValidacionDatabaseException;
import com.comerzzia.servicios.sincronizacion.TrabajoSincronizadorException;
import com.comerzzia.util.log.Logger;


public class SincronizadorOracle extends SincronizadorBBDD implements ISincronizador {
	
	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(SincronizadorOracle.class);
			
			
	/**
	 * Constructor
	 */
	public SincronizadorOracle() {
		super();
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.ISincronizador#enviarConfiguracion()
	 */
	@Override
	public void enviarConfiguracion() throws TrabajoSincronizadorException {
		try {
			// Comprobamos el esquema del TPV, creandolo si no existe
			DatabaseTpvOracle database = new DatabaseTpvOracle(connTienda);
			database.validarEsquema();
			
			// Enviamos los datos de configuración
			super.enviarConfiguracion();
		} 
		catch (CreacionDatabaseException e) {
			throw new TrabajoSincronizadorException(e.getMessage(), e);
		} 
		catch (ValidacionDatabaseException e) {
			throw new TrabajoSincronizadorException(e.getMessage(), e);
		}
	}
}
