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

package com.comerzzia.web.tesoreria.cobros.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.tesoreria.cobros.ParametrosBuscarDocumentosCobrosBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.tesoreria.cobros.ui.FormularioDocumentoCobroBean;

public class EjecutarAccion extends Accion {

	public String getNombre() {
		return "ejecutar";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		try{
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
			
			// Comprobamos los permisos de la acción
			PermisosEfectivosAccionBean permisos = datosSesion.getPermisos(this.getAccionMenu());
			if (!permisos.isPuedeEjecutar()) {
				return SIN_PERMISO;
			}
			
			//inicializamos los parámetros de búsqueda
			ParametrosBuscarDocumentosCobrosBean param = (ParametrosBuscarDocumentosCobrosBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_DOCUMENTOS_COBROS);
			if (param == null) {
				param = new ParametrosBuscarDocumentosCobrosBean();
				
				sesion.setAttribute(WebKeys.PARAM_BUSCAR_DOCUMENTOS_COBROS, param);
			}
			else {
				param.setNumPagina(0);
			}
			
			// Inicializamos el formulario
			FormularioDocumentoCobroBean formulario = (FormularioDocumentoCobroBean) sesion.getAttribute(WebKeys.FORMULARIO_DOCUMENTO_COBRO);
			if (formulario == null) {
				formulario = new FormularioDocumentoCobroBean();
				
				sesion.setAttribute(WebKeys.FORMULARIO_DOCUMENTO_COBRO, formulario);
			}
        
			return getControlador().getAccion("buscar").ejecutar(request);
		}
		catch (Exception e) {
	        e.printStackTrace();
	        setError(request, e);
	        
	        return ERROR_PAGE;
		}
	}
}
