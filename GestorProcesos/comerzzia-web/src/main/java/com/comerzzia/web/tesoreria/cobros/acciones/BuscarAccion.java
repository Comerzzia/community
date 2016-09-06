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
import com.comerzzia.persistencia.tesoreria.cobros.totales.TotalesDocumentosCobrosBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.tesoreria.cobros.CobroException;
import com.comerzzia.servicios.tesoreria.cobros.ServicioCobros;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.tesoreria.cobros.ui.FormularioDocumentoCobroBean;

public class BuscarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("tesoreria/cobros/buscar/jsp/buscar.jsp", Vista.INTERNA);
	
	public String getNombre() {
		return "buscar";
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
 
    		// Inicializamos el Formulario
    		FormularioDocumentoCobroBean formulario = (FormularioDocumentoCobroBean) sesion.getAttribute(WebKeys.FORMULARIO_DOCUMENTO_COBRO);
    		formulario.inicializar();

    		// Obtenemos parámetros de búsqueda
    		ParametrosBuscarDocumentosCobrosBean param = (ParametrosBuscarDocumentosCobrosBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_DOCUMENTOS_COBROS);
    		
    		String operacion = request.getParameter("operacion");
            if (operacion != null) {
                // Consultar
                if (operacion.equals("consultar")) {
                    setParametrosBuscar(param, request);
                }
                // Ver pagina
                else if (operacion.equals("paginar")) {
                    setPaginaBuscar(param, request);
                }
                // Ordenar
                else if (operacion.equals("ordenar")) {
                    setOrdenBuscar(param, request);
                }
            }
            
            // Si tenemos página, realizamos la búsqueda
            if (param.getNumPagina() > 0) {
                PaginaResultados paginaResultados = ServicioCobros.consultar(param, datosSesion);
                TotalesDocumentosCobrosBean totales = ServicioCobros.consultarTotales(param, datosSesion);
                request.setAttribute(WebKeys.PAGINA_RESULTADOS, paginaResultados);
                request.setAttribute("totales", totales);
            }
            
    		return NEXT_PAGE;
    	}
    	catch (CobroException e) {
            setError(request, e);
            
            return ERROR_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
	}
	
	private void setParametrosBuscar(ParametrosBuscarDocumentosCobrosBean param, HttpServletRequest request) {
    	param.setCodCliente(request.getParameter("codCliente"));
        param.setDesCliente(request.getParameter("desCliente"));
        param.setVerRemesados(request.getParameter("verRemesados") != null ? true : false);
        
        try{
    		param.setFechaVencimientoDesde(Fechas.getFecha(request.getParameter("fechaVencimientoDesde")));
    	} catch (Exception ignore) {
    		param.setFechaVencimientoDesde(null);
    	}
    	
    	try{
    		param.setFechaVencimientoHasta(Fechas.getFecha(request.getParameter("fechaVencimientoHasta")));
    	} catch (Exception ignore) {
    		param.setFechaVencimientoHasta(null);
    	}
        
        param.setCodTipoEfectoDesde(request.getParameter("codTipoEfectoDesde"));
    	param.setDesTipoEfectoDesde(request.getParameter("desTipoEfectoDesde"));
    	param.setCodTipoEfectoHasta(request.getParameter("codTipoEfectoHasta"));
    	param.setDesTipoEfectoHasta(request.getParameter("desTipoEfectoHasta"));
        
        param.setNumPagina(1);
 
        // Actualizar el número de resultados por página
        try {
        	param.setTamañoPagina(Integer.parseInt(request.getParameter("tamanoPagina")));
        } 
        catch(Exception ignore) {
        	// Si no se recibe el número de resultados, se mantiene el que se tenía
        }
    }
	
	private void setPaginaBuscar(ParametrosBuscarDocumentosCobrosBean param, HttpServletRequest request) {
        try {
            // Obtenemos la pagina solicitada
            int pagina = Integer.parseInt(request.getParameter("pagina"));
            param.setNumPagina(pagina);
        }
        catch (Exception ignore) {
            // Si no tenemos pagina, se mostrará la que teníamos
        }
    }
	
	private void setOrdenBuscar(ParametrosBuscarDocumentosCobrosBean param, HttpServletRequest request) {
    	try {
            // Establecemos primera pagina
            param.setNumPagina(1);
            
            // Obtenemos la columna por la que ordenar
            int columna = Integer.parseInt(request.getParameter("columna"));
            
            // Establecemos la columna de orden
            switch (columna) {
                case 2:  // VENCIMIENTO
                    if (param.getOrden().equals("FECHA_VENCIMIENTO")) {
                        param.setOrden("FECHA_VENCIMIENTO DESC");
                    }
                    else {
                        param.setOrden("FECHA_VENCIMIENTO");
                    }
                    break;
                case 3:  // IMPORTE
                    if (param.getOrden().equals("IMPORTE")) {
                        param.setOrden("IMPORTE DESC");
                    }
                    else {
                        param.setOrden("IMPORTE");
                    }
                    break;
                case 4:  // CODSERIE
                    if (param.getOrden().equals("CODSERIE")) {
                        param.setOrden("CODSERIE DESC");
                    }
                    else {
                        param.setOrden("CODSERIE");
                    }
                    break;
                case 5:  // DOCUMENTO
                    if (param.getOrden().equals("DOCUMENTO")) {
                        param.setOrden("DOCUMENTO DESC");
                    }
                    else {
                        param.setOrden("DOCUMENTO");
                    }
                    break;
                case 6:  // FECHA_FACTURA
                    if (param.getOrden().equals("FECHA_FACTURA")) {
                        param.setOrden("FECHA_FACTURA DESC");
                    }
                    else {
                        param.setOrden("FECHA_FACTURA");
                    }
                    break;
                case 7:  // CODTIPOEFEC
                    if (param.getOrden().equals("CODTIPOEFEC")) {
                        param.setOrden("CODTIPOEFEC DESC");
                    }
                    else {
                        param.setOrden("CODTIPOEFEC");
                    }
                    break;
                case 8:  // DESTIPOEFEC
                    if (param.getOrden().equals("DESTIPOEFEC")) {
                        param.setOrden("DESTIPOEFEC DESC");
                    }
                    else {
                        param.setOrden("DESTIPOEFEC");
                    }
                    break;
                case 9:  // FECHA_ENTRADA_DOCUMENTO
                    if (param.getOrden().equals("FECHA_ENTRADA_DOCUMENTO")) {
                        param.setOrden("FECHA_ENTRADA_DOCUMENTO DESC");
                    }
                    else {
                        param.setOrden("FECHA_ENTRADA_DOCUMENTO");
                    }
                    break;
                case 10:  // ID_REMESA
                    if (param.getOrden().equals("ID_REMESA")) {
                        param.setOrden("ID_REMESA DESC");
                    }
                    else {
                        param.setOrden("ID_REMESA");
                    }
                    break;
                case 11:  // OBSERVACIONES
                    if (param.getOrden().equals("OBSERVACIONES")) {
                        param.setOrden("OBSERVACIONES DESC");
                    }
                    else {
                        param.setOrden("OBSERVACIONES");
                    }
                    break;
                case 12:  // CODCLI
                    if (param.getOrden().equals("CODCLI")) {
                        param.setOrden("CODCLI DESC");
                    }
                    else {
                        param.setOrden("CODCLI");
                    }
                    break;
                case 13:  // DESCLIENTE
                    if (param.getOrden().equals("DESCLI")) {
                        param.setOrden("DESCLI DESC");
                    }
                    else {
                        param.setOrden("DESCLI");
                    }
                    break;
                default:
                    param.setOrden("FECHA_VENCIMIENTO");
            }
        }
        catch (Exception e) {
        	// Si no tenemos orden, se mantiene el que se tenía
        }
    }

}
