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

public class BuscarDocumentosAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("tesoreria/remesas/cobros/buscar/jsp/buscarDocumentosCobros.jsp", Vista.INTERNA);
	
	public String getNombre() {
		return "buscarDocumentos";
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
 
    		// Obtenemos parámetros de búsqueda
    		ParametrosBuscarDocumentosCobrosBean param = (ParametrosBuscarDocumentosCobrosBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_DOCUMENTOS_COBROS_REMESA);

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
                PaginaResultados paginaResultados = ServicioCobros.consultarDocumentosSinRemesar(param, datosSesion);
                TotalesDocumentosCobrosBean totales = ServicioCobros.consultarTotalesDocumentosSinRemesar(param, datosSesion);
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
    	param.setCodTipoEfectoDesde(request.getParameter("codTipoEfectoDesde"));
        param.setDesTipoEfectoDesde(request.getParameter("desTipoEfectoDesde"));
    	param.setCodTipoEfectoHasta(request.getParameter("codTipoEfectoHasta"));
        param.setDesTipoEfectoHasta(request.getParameter("desTipoEfectoHasta"));
    	
        param.setBuscarPorFechaDesde(request.getParameter("chkFechaDesde") != null);
    	try{
        	param.setFechaDesde(Fechas.getFecha(request.getParameter("fechaDesde")));
    	}
    	catch (Exception ignore) {
    		param.setFechaDesde(null);
    	}
    	param.setBuscarPorFechaHasta(request.getParameter("chkFechaHasta") != null);
    	try{
        	param.setFechaHasta(Fechas.getFecha(request.getParameter("fechaHasta")));
    	}
    	catch (Exception ignore) {
    		param.setFechaHasta(null);
    	}

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
            case 1:  // VENCIMIENTO
                if (param.getOrden().equals("FECHA_VENCIMIENTO")) {
                    param.setOrden("FECHA_VENCIMIENTO DESC");
                }
                else {
                    param.setOrden("FECHA_VENCIMIENTO");
                }
                break;
            case 2:  // CODCLI
                if (param.getOrden().equals("CODCLI")) {
                    param.setOrden("CODCLI DESC");
                }
                else {
                    param.setOrden("CODCLI");
                }
                break;
            case 3:  // DESCLI
                if (param.getOrden().equals("DESCLI")) {
                    param.setOrden("DESCLI DESC");
                }
                else {
                    param.setOrden("DESCLI");
                }
                break;
            case 4:  // IMPORTE
                if (param.getOrden().equals("IMPORTE")) {
                    param.setOrden("IMPORTE DESC");
                }
                else {
                    param.setOrden("IMPORTE");
                }
                break;
            case 5:  // CODSERIE
                if (param.getOrden().equals("CODSERIE")) {
                    param.setOrden("CODSERIE DESC");
                }
                else {
                    param.setOrden("CODSERIE");
                }
                break;
            case 6:  // DOCUMENTO
                if (param.getOrden().equals("DOCUMENTO")) {
                    param.setOrden("DOCUMENTO DESC");
                }
                else {
                    param.setOrden("DOCUMENTO");
                }
                break;
            case 7:  // FECHA_FACTURA
                if (param.getOrden().equals("FECHA_FACTURA")) {
                    param.setOrden("FECHA_FACTURA DESC");
                }
                else {
                    param.setOrden("FECHA_FACTURA");
                }
                break;
            case 8:  // CODTIPOEFEC
                if (param.getOrden().equals("CODTIPOEFEC")) {
                    param.setOrden("CODTIPOEFEC DESC");
                }
                else {
                    param.setOrden("CODTIPOEFEC");
                }
                break;
            case 9:  // DESTIPOEFEC
                if (param.getOrden().equals("DESTIPOEFEC")) {
                    param.setOrden("DESTIPOEFEC DESC");
                }
                else {
                    param.setOrden("DESTIPOEFEC");
                }
                break;
            case 10:  // DESTIPOEFEC
                if (param.getOrden().equals("FECHA_ENTRADA_DOCUMENTO")) {
                    param.setOrden("FECHA_ENTRADA_DOCUMENTO DESC");
                }
                else {
                    param.setOrden("FECHA_ENTRADA_DOCUMENTO");
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
