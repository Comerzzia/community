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

package com.comerzzia.web.ventas.facturas.consulta.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.ventas.facturas.ParametrosBuscarFacturasVentasBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.facturas.FacturaVentaException;
import com.comerzzia.servicios.ventas.facturas.ServicioFacturasVentas;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.facturas.consulta.ui.FormularioFacturaVentaBean;


public class BuscarAccion extends Accion {
	
	private static final Vista NEXT_PAGE = new Vista("ventas/facturas/consulta/buscar/jsp/buscar.jsp", Vista.INTERNA);

	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "buscar";
    }

    /**
     * Ejecuta la acción
     * @param request Datos de la petición
     * @return Vista con la siguiente pagina a mostrar
     */
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
    		FormularioFacturaVentaBean formulario = (FormularioFacturaVentaBean) sesion.getAttribute(WebKeys.FORMULARIO_FACTURA_VENTA);
    		formulario.inicializar();

    		// Obtenemos parámetros de búsqueda
    		ParametrosBuscarFacturasVentasBean param = (ParametrosBuscarFacturasVentasBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_FACTURAS_VENTAS);
    		
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
                PaginaResultados paginaResultados = ServicioFacturasVentas.consultar(param, datosSesion);
                request.setAttribute(WebKeys.PAGINA_RESULTADOS, paginaResultados);
            }
            
    		return NEXT_PAGE;
    	}
    	catch (FacturaVentaException e) {
            setError(request, e);
            
            return ERROR_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
    }
    
    /**
     * Establecemos los parámetros de búsqueda a partir de los datos de la petición
     * @param param
     * @param request
     * @throws FechaException 
     */
    private void setParametrosBuscar(ParametrosBuscarFacturasVentasBean param, HttpServletRequest request) throws FechaException {
    	try {
    		param.setPeriodo(Long.parseLong(request.getParameter("periodo")));
    	} catch (Exception ignore) {
    		param.setPeriodo(null);
    	}
    	
		param.setCodSerie(request.getParameter("codSerie"));
    	
		try {
    		param.setNumFac(Long.parseLong(request.getParameter("numFac")));
    	} catch (Exception ignore) {
    		param.setNumFac(null);
    	}
        
        param.setCodCli(request.getParameter("codCli"));
        param.setDesCli(request.getParameter("desCli"));
        param.setReferencia(request.getParameter("referencia"));

        param.setBuscarPorFechaDesde(request.getParameter("chkFechaDesde") != null);
    	try{
    		param.setFechaDesde(Fechas.getFecha(request.getParameter("fechaDesde")));
    	} catch (Exception ignore) {
    		param.setFechaDesde(null);
    	}
    	
    	param.setBuscarPorFechaHasta(request.getParameter("chkFechaHasta") != null);
    	try{
    		param.setFechaHasta(Fechas.getFecha(request.getParameter("fechaHasta")));
    	} catch (Exception ignore) {
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
    
    /**
     * Establecemos la página de resultados solicitada a partir de los datos de la petición
     * @param param
     * @param request
     */
    private void setPaginaBuscar(ParametrosBuscarFacturasVentasBean param, HttpServletRequest request) {
        try {
            // Obtenemos la pagina solicitada
            int pagina = Integer.parseInt(request.getParameter("pagina"));
            param.setNumPagina(pagina);
        }
        catch (Exception ignore) {
            // Si no tenemos pagina, se mostrará la que teníamos
        }
    }
    
    /**
     * Establecemos la columna de ordenación de los resultados a partir de los datos de la petición
     * @param param
     * @param request
     */
    private void setOrdenBuscar(ParametrosBuscarFacturasVentasBean param, HttpServletRequest request) {
    	try {
            // Establecemos primera pagina
            param.setNumPagina(1);
            
            // Obtenemos la columna por la que ordenar
            int columna = Integer.parseInt(request.getParameter("columna"));
            
            // Establecemos la columna de orden
            switch (columna) {
                case 1:  // PERIODO
                    if (param.getOrden().equals("PERIODO")) {
                        param.setOrden("PERIODO DESC");
                    }
                    else {
                        param.setOrden("PERIODO");
                    }
                    break;
                case 2:  // SERIE
                    if (param.getOrden().equals("CODSERIE")) {
                        param.setOrden("CODSERIE DESC");
                    }
                    else {
                        param.setOrden("CODSERIE");
                    }
                    break;
                case 3:  // NUMFAC
                    if (param.getOrden().equals("NUMFAC")) {
                        param.setOrden("NUMFAC DESC");
                    }
                    else {
                        param.setOrden("NUMFAC");
                    }
                    break;
                case 4:  // FECHA
                    if (param.getOrden().equals("FECHA")) {
                        param.setOrden("FECHA DESC");
                    }
                    else {
                        param.setOrden("FECHA");
                    }
                    break;
                case 5:  // CODCLI
                    if (param.getOrden().equals("CODCLI")) {
                        param.setOrden("CODCLI DESC");
                    }
                    else {
                        param.setOrden("CODCLI");
                    }
                    break;
                case 6:  // DESCLI
                    if (param.getOrden().equals("DESCLI")) {
                        param.setOrden("DESCLI DESC");
                    }
                    else {
                        param.setOrden("DESCLI");
                    }
                    break;
                case 7:  // BASE
                    if (param.getOrden().equals("BASE")) {
                        param.setOrden("BASE DESC");
                    }
                    else {
                        param.setOrden("BASE");
                    }
                    break;
                case 8:  // IMPUESTOS
                    if (param.getOrden().equals("IMPUESTOS")) {
                        param.setOrden("IMPUESTOS DESC");
                    }
                    else {
                        param.setOrden("IMPUESTOS");
                    }
                    break;
                case 9:  // TOTAL
                    if (param.getOrden().equals("TOTAL")) {
                        param.setOrden("TOTAL DESC");
                    }
                    else {
                        param.setOrden("TOTAL");
                    }
                    break;
                default:
                    param.setOrden("FECHA DESC");
            }
        }
        catch (Exception e) {
        	// Si no tenemos orden, se mantiene el que se tenía
        }
    }
}
