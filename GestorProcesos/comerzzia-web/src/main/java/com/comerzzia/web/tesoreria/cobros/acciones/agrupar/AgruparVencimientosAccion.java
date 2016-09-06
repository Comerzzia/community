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

package com.comerzzia.web.tesoreria.cobros.acciones.agrupar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.tesoreria.cobros.DocumentoCobroBean;
import com.comerzzia.persistencia.tesoreria.cobros.ParametrosBuscarDocumentosCobrosBean;
import com.comerzzia.persistencia.tesoreria.cobros.tratamiento.TratamientoCobrosBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.tesoreria.cobros.CobroException;
import com.comerzzia.servicios.tesoreria.cobros.CobroNotFoundException;
import com.comerzzia.servicios.tesoreria.cobros.ServicioCobros;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.tesoreria.cobros.ui.FormularioDocumentoCobroBean;

/*
 * Clase para agrupar los vencimientos de los documentos seleccionados.
 */
public class AgruparVencimientosAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("tesoreria/cobros/mantenimiento/jsp/agruparVencimientos.jsp", Vista.INTERNA);
	
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
    		
    		FormularioDocumentoCobroBean formulario = (FormularioDocumentoCobroBean)sesion.getAttribute(WebKeys.FORMULARIO_DOCUMENTO_COBRO);
    		ParametrosBuscarDocumentosCobrosBean param = (ParametrosBuscarDocumentosCobrosBean)sesion.getAttribute(WebKeys.PARAM_BUSCAR_DOCUMENTOS_COBROS);
    		formulario.setModoInsercion(new TratamientoCobrosBean());
    		
    		TratamientoCobrosBean documentosCobrosAgrupados = (TratamientoCobrosBean)formulario.getRegistroActivo();
    		documentosCobrosAgrupados.setCodCliente(param.getCodCliente());
    		
    		// Recogemos los documentos seleccionados
    		String[] checks = request.getParameterValues("chk");
    		if(checks != null){
    			
    			
	    		for (String idDocumento : checks){
	    			DocumentoCobroBean documento = ServicioCobros.consultar(Long.parseLong(idDocumento), datosSesion);
	    			documentosCobrosAgrupados.addMarcado(documento);
	    		}
	    		
    		}else{
    			setMensajeError(request, "Debe seleccionar al menos un documento para poder agrupar.");
    			return getControlador().getAccion("buscar").ejecutar(request);
    		}
    		
    		return NEXT_PAGE;
    	}
		catch (CobroException e) {
            setMensajeError(request, e.getMessage());
            return getControlador().getAccion("buscar").ejecutar(request);
    	}
		catch (CobroNotFoundException e) {
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
