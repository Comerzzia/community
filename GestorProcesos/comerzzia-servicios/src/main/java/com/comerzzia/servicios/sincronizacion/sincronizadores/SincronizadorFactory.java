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


public class SincronizadorFactory {
	
	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(SincronizadorFactory.class);
			

	public static ISincronizador crear(String claseSincronizacion) throws SincronizadorTiendasException {
		try {
			return (ISincronizador) Class.forName(claseSincronizacion).newInstance();
		}
		catch (ClassNotFoundException e) {
			String mensaje = "Error al instanciar el interfaz de sincronizacion " 
				+ claseSincronizacion + ": No se ha encontrado la clase";
			log.error("crear() - " + mensaje, e);
			throw new SincronizadorTiendasException(mensaje);
		}
		catch (ClassCastException e) {
			String mensaje = "Error al instanciar el interfaz de sincronizacion " 
				+ claseSincronizacion + ": La clase no implementa el interfaz ISincronizacion";
			log.error("crear() - " + mensaje, e);
			throw new SincronizadorTiendasException(mensaje);
		}
		catch (Exception e) {
			String mensaje = "Error al instanciar el interfaz de sincronización " 
				+ claseSincronizacion + ": " + e.getMessage();
			log.error("crear() - " + mensaje, e);
			throw new SincronizadorTiendasException(mensaje, e);
		} 
	}
}
