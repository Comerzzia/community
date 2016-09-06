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

package com.comerzzia.web.ventas.tarifas.actualizaciones.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.ActualizacionTarifaException;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.ActualizacionesTarifaConstraintViolationException;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.ServicioActualizacionesTarifas;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.tarifas.actualizaciones.iu.FormularioActualizacionBean;

public class EliminarAccion extends Accion {

	public String getNombre() {
		return "eliminar";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		HttpSession sesion = request.getSession();

		try {
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);

			// Comprobamos los permisos de la acción
			PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
			if (!permisos.isPuedeEliminar()) {
				return SIN_PERMISO;
			}

			// Obtenemos la actualizacion
			String idActualizacion = request.getParameter(WebKeys.ID_OBJETO);
			ServicioActualizacionesTarifas.eliminar(Long.parseLong(idActualizacion), datosSesion);

			setMensaje(request, "La actualización se ha borrado correctamente");

    		return getControlador().getAccion("buscar").ejecutar(request);
		} 
		catch (ActualizacionesTarifaConstraintViolationException e) {
			setMensajeError(request,"No se ha podido borrar la actualización porque existen registros asociados");

    		FormularioActualizacionBean formulario = (FormularioActualizacionBean) sesion.getAttribute(WebKeys.FORMULARIO_ACTUALIZACION_TARIFA);
    		// Si no tenemos registro activo volvemos al buscador
    		if (formulario.isRegistroActivoVacio()) {
    			return getControlador().getAccion("buscar").ejecutar(request);
    		}
    		else { // en caso contrario volvemos al formulario
    			return getControlador().getAccion("verFormulario").ejecutar(request);
    		}
		} 
		catch (ActualizacionTarifaException e) {
			setError(request, e);
			return ERROR_PAGE;
		} 
		catch (Exception e) {
			e.printStackTrace();
			setError(request, e);
			return ERROR_PAGE;
		}
	}

}
