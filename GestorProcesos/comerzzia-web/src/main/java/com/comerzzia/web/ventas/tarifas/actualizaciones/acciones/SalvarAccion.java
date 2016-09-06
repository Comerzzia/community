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

import com.comerzzia.persistencia.ventas.tarifas.actualizaciones.ActualizacionTarifaBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.ActualizacionTarifaException;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.ActualizacionesTarifaConstraintViolationException;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.ServicioActualizacionesTarifas;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.tarifas.actualizaciones.iu.FormularioActualizacionBean;

public class SalvarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("ventas/tarifas/actualizaciones/mantenimiento/jsp/actualizacion.jsp", Vista.INTERNA);
	
	public String getNombre() {
		return "salvar";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);

			// Comprobamos los permisos de la acción
			PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
			if (!permisos.isPuedeAñadir()) {
				return SIN_PERMISO;
			}

			FormularioActualizacionBean formulario = (FormularioActualizacionBean) sesion.getAttribute(WebKeys.FORMULARIO_ACTUALIZACION_TARIFA);
			ActualizacionTarifaBean actualizacion = (ActualizacionTarifaBean) formulario.getRegistroActivo();
    		ServicioActualizacionesTarifas.salvar(actualizacion, datosSesion);
    		formulario.aceptar();

    		setMensaje(request, "La actualización se ha grabado correctamente");

    		// Consultamos la actualizacion e inicializamos el formulario
    		try {
    			actualizacion = ServicioActualizacionesTarifas.consultar(actualizacion.getIdActualizacion(), datosSesion);
				formulario.inicializar(actualizacion);
			}
    		catch (Exception e) {
    			setMensajeError(request, "Se ha producido un error al acceder al registro");
    			return getControlador().getAccion("buscar").ejecutar(request);
			}
    		
    		return getControlador().getAccion("verFormulario").ejecutar(request);
		} 
		catch (ActualizacionesTarifaConstraintViolationException e) {
			setMensajeError(request, e.getMessage());
			return NEXT_PAGE;
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
