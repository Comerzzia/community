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

package com.comerzzia.servicios.core.ayudas;

import java.util.HashMap;
import java.util.Map;

import com.comerzzia.persistencia.core.ayudas.AyudaBean;


public class Ayudas {

	private static Ayudas ayudas = null;
	
	private static Map<String, AyudaBean> cache;
	
	private Ayudas() {
		cache = new HashMap<String, AyudaBean>();
	}
	
	
	public static Ayudas getInstance() {
		if (ayudas == null) {
			ayudas = new Ayudas();
		}
		
		return ayudas;
	}
	
	
	public AyudaBean getAyuda(String nombre) throws AyudaException {
		if (cache.containsKey(nombre)) {
			return cache.get(nombre);
		}
		else {
			AyudaBean ayuda = ServicioAyudas.obtenerDefinicion(nombre);
			cache.put(nombre, ayuda);
			
			return ayuda;
		}
	}
	
	
	public void borrarCache() {
		cache.clear();
	}
}
