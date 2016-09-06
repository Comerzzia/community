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

package com.comerzzia.web.tesoreria.remesas.cobros.acciones;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.tesoreria.cobros.ParametrosBuscarDocumentosCobrosBean;
import com.comerzzia.persistencia.tesoreria.remesas.cobros.EstadosRemesasCobro;
import com.comerzzia.persistencia.tesoreria.remesas.cobros.ParametrosBuscarRemesasCobrosBean;
import com.comerzzia.servicios.core.estados.ServicioEstados;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.tesoreria.remesas.cobros.ui.FormularioRemesaCobroBean;

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
			ParametrosBuscarRemesasCobrosBean param = (ParametrosBuscarRemesasCobrosBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_REMESAS_COBROS);
			if (param == null) {
				param = new ParametrosBuscarRemesasCobrosBean();
    			param.setFechaDesde(Fechas.sumaDias(new Date(), -30));
    			param.setFechaHasta(new Date());
    			param.setEstados(ServicioEstados.consultar(EstadosRemesasCobro.ESTADO_PROCESO));
				
				sesion.setAttribute(WebKeys.PARAM_BUSCAR_REMESAS_COBROS, param);
			}
			else {
				param.setNumPagina(0);
			}

			//inicializamos los parámetros de búsqueda para la página de cobros
    		ParametrosBuscarDocumentosCobrosBean paramBuscarDocumentosCobros = (ParametrosBuscarDocumentosCobrosBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_DOCUMENTOS_COBROS_REMESA);
			if (paramBuscarDocumentosCobros == null) {
				paramBuscarDocumentosCobros = new ParametrosBuscarDocumentosCobrosBean();
				paramBuscarDocumentosCobros.setFechaDesde(Fechas.sumaDias(new Date(), -30));
				paramBuscarDocumentosCobros.setFechaHasta(new Date());
				paramBuscarDocumentosCobros.setVerRemesados(false);
				
				sesion.setAttribute(WebKeys.PARAM_BUSCAR_DOCUMENTOS_COBROS_REMESA, paramBuscarDocumentosCobros);
			}
			else{
				paramBuscarDocumentosCobros.setNumPagina(0);
			}

			// Inicializamos el formulario
			FormularioRemesaCobroBean formulario = (FormularioRemesaCobroBean) sesion.getAttribute(WebKeys.FORMULARIO_REMESA_COBRO);
			if (formulario == null) {
				formulario = new FormularioRemesaCobroBean();
				
				sesion.setAttribute(WebKeys.FORMULARIO_REMESA_COBRO, formulario);
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
