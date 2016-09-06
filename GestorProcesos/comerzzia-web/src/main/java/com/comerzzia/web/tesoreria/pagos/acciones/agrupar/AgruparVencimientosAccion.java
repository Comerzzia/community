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

package com.comerzzia.web.tesoreria.pagos.acciones.agrupar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.tesoreria.pagos.DocumentoPagoBean;
import com.comerzzia.persistencia.tesoreria.pagos.ParametrosBuscarDocumentosPagosBean;
import com.comerzzia.persistencia.tesoreria.pagos.tratamiento.TratamientoPagosBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.tesoreria.pagos.PagoException;
import com.comerzzia.servicios.tesoreria.pagos.PagoNotFoundException;
import com.comerzzia.servicios.tesoreria.pagos.ServicioPagos;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.tesoreria.pagos.ui.FormularioDocumentoPagoBean;

/*
 * Clase para agrupar los vencimientos de los documentos seleccionados.
 */
public class AgruparVencimientosAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("tesoreria/pagos/mantenimiento/jsp/agruparVencimientos.jsp", Vista.INTERNA);
	
	public String getNombre() {
		return "agruparVencimientos";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		try {
    		HttpSession sesion = request.getSession();
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeEjecutar()) {
    			return SIN_PERMISO;
    		}
    		
    		FormularioDocumentoPagoBean formulario = (FormularioDocumentoPagoBean)sesion.getAttribute(WebKeys.FORMULARIO_DOCUMENTO_PAGO);
    		ParametrosBuscarDocumentosPagosBean param = (ParametrosBuscarDocumentosPagosBean)sesion.getAttribute(WebKeys.PARAM_BUSCAR_DOCUMENTOS_PAGOS);
    		formulario.setModoInsercion(new TratamientoPagosBean());
    		
    		TratamientoPagosBean tratamientoPagos = (TratamientoPagosBean)formulario.getRegistroActivo();
    		tratamientoPagos.setCodProveedor(param.getCodProveedor());
    		
    		// Recogemos los documentos seleccionados
    		String[] checks = request.getParameterValues("chk");
    		if(checks != null){
    			
    			
	    		for (String idDocumento : checks){
	    			DocumentoPagoBean documento = ServicioPagos.consultar(Long.parseLong(idDocumento), datosSesion);
	    			tratamientoPagos.addMarcado(documento);
	    		}
	    		
    		}else{
    			setMensajeError(request, "Debe seleccionar al menos un documento para poder agrupar.");
    			return getControlador().getAccion("buscar").ejecutar(request);
    		}
    		
    		return NEXT_PAGE;
    	}
		catch (PagoException e) {
            setMensajeError(request, e.getMessage());
            return getControlador().getAccion("buscar").ejecutar(request);
    	}
		catch (PagoNotFoundException e) {
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
