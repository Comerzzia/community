/**
 * 
 */
package com.comerzzia.web.tesoreria.pagos.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.tesoreria.pagos.ParametrosBuscarDocumentosPagosBean;
import com.comerzzia.persistencia.tesoreria.pagos.totales.TotalesDocumentosPagosBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.tesoreria.pagos.PagoException;
import com.comerzzia.servicios.tesoreria.pagos.ServicioPagos;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.tesoreria.pagos.ui.FormularioDocumentoPagoBean;

/**
 *
 */
public class BuscarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("tesoreria/pagos/buscar/jsp/buscar.jsp", Vista.INTERNA);
	
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
    		FormularioDocumentoPagoBean formulario = (FormularioDocumentoPagoBean) sesion.getAttribute(WebKeys.FORMULARIO_DOCUMENTO_PAGO);
    		formulario.inicializar();

    		// Obtenemos parámetros de búsqueda
    		ParametrosBuscarDocumentosPagosBean param = (ParametrosBuscarDocumentosPagosBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_DOCUMENTOS_PAGOS);
    		
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
                PaginaResultados paginaResultados = ServicioPagos.consultar(param, datosSesion);
                TotalesDocumentosPagosBean totales = ServicioPagos.consultarTotales(param, datosSesion);
                request.setAttribute(WebKeys.PAGINA_RESULTADOS, paginaResultados);
                request.setAttribute("totales", totales);
            }
            
    		return NEXT_PAGE;
    	}
    	catch (PagoException e) {
            setError(request, e);
            
            return ERROR_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
	}
	
	private void setParametrosBuscar(ParametrosBuscarDocumentosPagosBean param, HttpServletRequest request) {
    	param.setCodProveedor(request.getParameter("codProveedor"));
        param.setDesProveedor(request.getParameter("desProveedor"));
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
    	param.setCodSerieDesde(request.getParameter("codSerieDesde"));
    	param.setDesSerieDesde(request.getParameter("desSerieDesde"));
    	param.setCodSerieHasta(request.getParameter("codSerieHasta"));
    	param.setDesSerieHasta(request.getParameter("desSerieHasta"));
        
        param.setNumPagina(1);
 
        // Actualizar el número de resultados por página
        try {
        	param.setTamañoPagina(Integer.parseInt(request.getParameter("tamanoPagina")));
        } 
        catch(Exception ignore) {
        	// Si no se recibe el número de resultados, se mantiene el que se tenía
        }
    }
	
	private void setPaginaBuscar(ParametrosBuscarDocumentosPagosBean param, HttpServletRequest request) {
        try {
            // Obtenemos la pagina solicitada
            int pagina = Integer.parseInt(request.getParameter("pagina"));
            param.setNumPagina(pagina);
        }
        catch (Exception ignore) {
            // Si no tenemos pagina, se mostrará la que teníamos
        }
    }
	
	private void setOrdenBuscar(ParametrosBuscarDocumentosPagosBean param, HttpServletRequest request) {
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
                case 9:  // FECHA_EMISION
                    if (param.getOrden().equals("FECHA_EMISION")) {
                        param.setOrden("FECHA_EMISION DESC");
                    }
                    else {
                        param.setOrden("FECHA_EMISION");
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
                case 12:  // CODPRO
                    if (param.getOrden().equals("CODPRO")) {
                        param.setOrden("CODPRO DESC");
                    }
                    else {
                        param.setOrden("CODPRO");
                    }
                    break;
                case 13:  // DESPRO
                    if (param.getOrden().equals("DESPRO")) {
                        param.setOrden("DESPRO DESC");
                    }
                    else {
                        param.setOrden("DESPRO");
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
