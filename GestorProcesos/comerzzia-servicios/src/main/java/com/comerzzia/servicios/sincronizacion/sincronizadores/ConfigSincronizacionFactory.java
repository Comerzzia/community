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

import com.comerzzia.servicios.sincronizacion.SincronizadorTiendasException;
import com.comerzzia.util.log.Logger;


public class ConfigSincronizacionFactory {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ConfigSincronizacionFactory.class);
			

	public static IConfigSincronizacion crear(String claseConfiguracion) throws SincronizadorTiendasException {
		try {
			return (IConfigSincronizacion) Class.forName(claseConfiguracion).newInstance();
		}
		catch (ClassNotFoundException e) {
			String mensaje = "Error al instanciar el interfaz de configuración de sincronización " 
				+ claseConfiguracion + ": No se ha encontrado la clase";
			log.error("crear() - " + mensaje, e);
			throw new SincronizadorTiendasException(mensaje);
		}
		catch (ClassCastException e) {
			String mensaje = "Error al instanciar el interfaz de configuración de sincronización " 
				+ claseConfiguracion + ": La clase no implementa el interfaz IConfigSincronizacion";
			log.error("crear() - " + mensaje, e);
			throw new SincronizadorTiendasException(mensaje);
		}
		catch (Exception e) {
			String mensaje = "Error al instanciar el interfaz de configuración de sincronización " 
				+ claseConfiguracion + ": " + e.getMessage();
			log.error("crear() - " + mensaje, e);
			throw new SincronizadorTiendasException(mensaje, e);
		} 
	}
}
