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

package com.comerzzia.web.ventas.albaranes.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.ventas.albaranes.ParametrosBuscarAlbaranesVentasBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.albaranes.AlbaranVentaException;
import com.comerzzia.servicios.ventas.albaranes.ServicioAlbaranesVentas;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.albaranes.ui.FormularioAlbaranVentaBean;


public class BuscarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("ventas/albaranes/buscar/jsp/buscar.jsp", Vista.INTERNA);
	
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
    		FormularioAlbaranVentaBean formulario = (FormularioAlbaranVentaBean) sesion.getAttribute(WebKeys.FORMULARIO_ALBARAN_VENTA);
    		formulario.inicializar();
    		
    		// Obtenemos parámetros de búsqueda
    		ParametrosBuscarAlbaranesVentasBean param = (ParametrosBuscarAlbaranesVentasBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_ALBARANES_VENTAS);
    		
    		// Comprobamos la operación a realizar
    		String operacion = request.getParameter("operacion");
            if (operacion != null) {
                // Consultar
                if (operacion.equals("consultar")) {
                    // Establecemos parámetros de busqueda
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
            	PaginaResultados paginaResultados = ServicioAlbaranesVentas.consultar(param, datosSesion);
            	request.setAttribute(WebKeys.PAGINA_RESULTADOS, paginaResultados);
            }
            
    		return NEXT_PAGE;
    	}
    	catch (AlbaranVentaException e) {
            setError(request, e);
            return ERROR_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
	}
    private void setParametrosBuscar(ParametrosBuscarAlbaranesVentasBean param, HttpServletRequest request) throws FechaException {
    	param.setCodSerie(request.getParameter("codSerie"));
    	param.setDesSerie(request.getParameter("desSerie"));
    	try {
    		param.setNumAlbaran(Long.parseLong(request.getParameter("numAlbaran")));
    	} catch (Exception ignore) {
    		param.setNumAlbaran(null);
    	}
    	param.setCodCliente(request.getParameter("codCliente"));
    	param.setDesCliente(request.getParameter("desCliente"));
    	param.setCodConceptoAlmacen(request.getParameter("codConceptoAlmacen"));
    	param.setDesConceptoAlmacen(request.getParameter("desConceptoAlmacen"));
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
    	try {
    		param.setPeriodo(Long.parseLong(request.getParameter("periodo")));
    	} catch (Exception ignore) {
    		param.setPeriodo(null);
    	}
    	
        param.setNumPagina(1);
        
        // Actualizar el número de resultados por página
        try {
        	param.setTamañoPagina(Integer.parseInt(request.getParameter("tamanoPagina")));
        } catch(Exception ignore) {
        	// Si no se recibe el tamaño de página, se mantiene el que se tenía
        }
    }
    
    
    private void setPaginaBuscar(ParametrosBuscarAlbaranesVentasBean param, HttpServletRequest request) {
        try {
            // Obtenemos la pagina solicitada
            int pagina = Integer.parseInt(request.getParameter("pagina"));
            param.setNumPagina(pagina);
        }
        catch (Exception ignore) {
            // Si no tenemos pagina, se mostrará la que teníamos
        }
    }
    
    
    private void setOrdenBuscar(ParametrosBuscarAlbaranesVentasBean param, HttpServletRequest request) {
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
	            case 2:  // CODSERIE
	                if (param.getOrden().equals("CODSERIE")) {
	                    param.setOrden("CODSERIE DESC");
	                }
	                else {
	                    param.setOrden("CODSERIE");
	                }
	                break;
                case 3:  // NUMALB
                    if (param.getOrden().equals("NUMALB")) {
                        param.setOrden("NUMALB DESC");
                    }
                    else {
                        param.setOrden("NUMALB");
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
                case 5:  // FECHA_SUMINISTRO
                    if (param.getOrden().equals("FECHA_SUMINISTRO")) {
                        param.setOrden("FECHA_SUMINISTRO DESC");
                    }
                    else {
                        param.setOrden("FECHA_SUMINISTRO");
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
                case 7:  // DESCONALM
                    if (param.getOrden().equals("DESCONALM")) {
                        param.setOrden("DESCONALM DESC");
                    }
                    else {
                        param.setOrden("DESCONALM");
                    }
                    break;
                case 8:  // PERSONA_CONTACTO
                    if (param.getOrden().equals("PERSONA_CONTACTO")) {
                        param.setOrden("PERSONA_CONTACTO DESC");
                    }
                    else {
                        param.setOrden("PERSONA_CONTACTO");
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
        	// Si no tenemos orden, se dejar el que se tenía
        }
    }



}
