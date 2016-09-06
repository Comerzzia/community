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
import com.comerzzia.persistencia.tesoreria.cobros.tratamiento.TratamientoCobrosBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.tesoreria.cobros.ui.FormularioDocumentoCobroBean;

/*
 * Clase para agregar documentos a la lista de documentos por los que se agruparán
 * los vencimentos de los documentos seleccionados.
 *
 */
public class AgregarDocumentoAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("tesoreria/cobros/mantenimiento/jsp/agruparVencimientos.jsp", Vista.INTERNA);
	
	public String getNombre() {
		return "agregarDocumento";
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
    		TratamientoCobrosBean tratamientoCobros = (TratamientoCobrosBean)formulario.getRegistroActivo();
    		
    		DocumentoCobroBean documento = new DocumentoCobroBean();
    		documento.setCodCliente(request.getParameter("codCliente"));
    		documento.setFechaVencimiento(Fechas.getFecha(request.getParameter("fechaVencimiento")));
    		documento.setCodSerie(request.getParameter("codSerie"));
    		documento.setDocumento(request.getParameter("documento"));
    		double importe = Numero.desformatea(request.getParameter("importe"), 0D);
    		documento.setImporte(importe);
    		documento.setCodTipoEfecto(request.getParameter("codTipoEfecto"));
    		documento.setDesTipoEfecto(request.getParameter("desTipoEfecto"));
    		documento.setObservaciones(request.getParameter("observaciones"));
    		documento.setFechaEntradaDocumento(Fechas.getFecha(request.getParameter("fechaEntradaDocumento")));
    		documento.setRemesable(request.getParameter("remesable"));
    		
    		tratamientoCobros.setDocumento(documento);
    		
    		//antes de añadir un nuevo documento comprobamos que la suma de los importes no supere el importe de los documentos marcados.
    		if (tratamientoCobros.getImporteMarcado() < tratamientoCobros.getImporteAgrupado() + importe){
    			String mensaje = "El importe de los nuevos vencimientos no puede superar el importe de los vencimientos marcados.";
    			setMensajeError(request, mensaje);
    		}else{
        		tratamientoCobros.addAgrupado(documento);
        		
        		formulario.inicializaDocumento();
    		}
    		
    		return NEXT_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
	}

}
