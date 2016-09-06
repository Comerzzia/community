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

package com.comerzzia.servicios.core.sesion;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import com.comerzzia.persistencia.core.acciones.AccionBean;
import com.comerzzia.servicios.core.permisos.PermisoException;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.permisos.ServicioPermisos;


/**
 * Cache de Permisos de Acciones asociados al usuario de la sesión
 *
 */
public class PermisosAccionesSesion implements Serializable {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 3378450854572336727L;
	
	
	private DatosSesionBean datosSesion;
	private Map<AccionBean, PermisosEfectivosAccionBean> cache;
	
	
	public PermisosAccionesSesion(DatosSesionBean datosSesion) {
		this.datosSesion = datosSesion;
		cache = new HashMap<AccionBean, PermisosEfectivosAccionBean>();
	}
	
	
	public PermisosEfectivosAccionBean getPermisosCache(AccionBean accion) {
		if (cache.containsKey(accion)) {
			return cache.get(accion);
		}
		else {
			return getPermisos(accion);
		}
	}
	
	public PermisosEfectivosAccionBean getPermisos(AccionBean accion) {
		PermisosEfectivosAccionBean permisos = null;
		
		try {
			permisos = ServicioPermisos.obtenerPermisosEfectivos(accion, 
					datosSesion.getUsuario().getIdUsuario());
		} 
		catch (PermisoException e) {
			// Si tenemos un error al obtener los permisos consideramos
			// que el usuario no tiene ningún permiso sobre la acción
			permisos = new PermisosEfectivosAccionBean(accion, 
					datosSesion.getUsuario().getIdUsuario());
		}
		cache.put(accion, permisos);
		
		return permisos;
	}
}
