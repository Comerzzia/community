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

import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.actualizaciones.ParametrosBuscarActualizacionesTarifaBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.tarifas.ServicioTarifas;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.tarifas.actualizaciones.iu.FormularioActualizacionBean;

public class EjecutarAccion extends Accion {

	public String getNombre() {
		return "ejecutar";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);

			// Comprobamos los permisos de la acción
			PermisosEfectivosAccionBean permisos = datosSesion.getPermisos(this.getAccionMenu());
			if (!permisos.isPuedeEjecutar()) {
				return SIN_PERMISO;
			}

			ParametrosBuscarActualizacionesTarifaBean param = (ParametrosBuscarActualizacionesTarifaBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_ACTUALIZACIONES_TARIFAS);
			if (param == null) {
				param = new ParametrosBuscarActualizacionesTarifaBean();
				sesion.setAttribute(WebKeys.PARAM_BUSCAR_ACTUALIZACIONES_TARIFAS, param);
			}

			param.setNumPagina(0);

    		// Inicializamos el formulario
    		FormularioActualizacionBean formulario = (FormularioActualizacionBean) sesion.getAttribute(WebKeys.FORMULARIO_ACTUALIZACION_TARIFA);
    		//consultamos la tarifa
			TarifaBean tarifa = ServicioTarifas.consultar(request.getParameter("codTar"), datosSesion);
			
    		if (formulario == null) {
    			formulario = new FormularioActualizacionBean();
    			sesion.setAttribute(WebKeys.FORMULARIO_ACTUALIZACION_TARIFA, formulario);
    		}
    		
    		formulario.setTarifa(tarifa);
			
			return getControlador().getAccion("buscar").ejecutar(request);
		} 
		catch (Exception e) {
			e.printStackTrace();
			setError(request, e);
			return ERROR_PAGE;
		}
	}

}
