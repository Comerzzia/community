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

package com.comerzzia.web.tesoreria.remesas.pagos.acciones;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.tesoreria.pagos.ParametrosBuscarDocumentosPagosBean;
import com.comerzzia.persistencia.tesoreria.remesas.pagos.EstadosRemesasPago;
import com.comerzzia.persistencia.tesoreria.remesas.pagos.ParametrosBuscarRemesasPagosBean;
import com.comerzzia.servicios.core.estados.ServicioEstados;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.tesoreria.remesas.pagos.ui.FormularioRemesaPagoBean;

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
			ParametrosBuscarRemesasPagosBean param = (ParametrosBuscarRemesasPagosBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_REMESAS_PAGOS);
			if (param == null) {
				param = new ParametrosBuscarRemesasPagosBean();
    			param.setFechaDesde(Fechas.sumaDias(new Date(), -30));
    			param.setFechaHasta(new Date());
    			param.setEstados(ServicioEstados.consultar(EstadosRemesasPago.ESTADO_PROCESO));
    			
				sesion.setAttribute(WebKeys.PARAM_BUSCAR_REMESAS_PAGOS, param);
			}
			else {
				param.setNumPagina(0);
			}

			//inicializamos los parámetros de búsqueda para la página de documentos de pagos
    		ParametrosBuscarDocumentosPagosBean paramBuscarDocumentosPagos = (ParametrosBuscarDocumentosPagosBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_DOCUMENTOS_PAGOS_REMESA);
			if (paramBuscarDocumentosPagos == null) {
				paramBuscarDocumentosPagos = new ParametrosBuscarDocumentosPagosBean();
				paramBuscarDocumentosPagos.setFechaDesde(Fechas.sumaDias(new Date(), -30));
				paramBuscarDocumentosPagos.setFechaHasta(new Date());
				paramBuscarDocumentosPagos.setVerRemesados(false);
				
				sesion.setAttribute(WebKeys.PARAM_BUSCAR_DOCUMENTOS_PAGOS_REMESA, paramBuscarDocumentosPagos);
			}
			else{
				paramBuscarDocumentosPagos.setNumPagina(0);
			}

			// Inicializamos el formulario
			FormularioRemesaPagoBean formulario = (FormularioRemesaPagoBean) sesion.getAttribute(WebKeys.FORMULARIO_REMESA_PAGO);
			if (formulario == null) {
				formulario = new FormularioRemesaPagoBean();
				
				sesion.setAttribute(WebKeys.FORMULARIO_REMESA_PAGO, formulario);
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
