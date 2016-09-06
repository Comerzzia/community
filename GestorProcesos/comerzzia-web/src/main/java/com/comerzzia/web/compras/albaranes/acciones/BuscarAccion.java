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

package com.comerzzia.web.compras.albaranes.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.compras.albaranes.ParametrosBuscarAlbaranesComprasBean;
import com.comerzzia.servicios.compras.albaranes.AlbaranCompraException;
import com.comerzzia.servicios.compras.albaranes.ServicioAlbaranesCompras;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.compras.albaranes.ui.FormularioAlbaranCompraBean;


public class BuscarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("compras/albaranes/buscar/jsp/buscar.jsp", Vista.INTERNA);
	
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
    		FormularioAlbaranCompraBean formulario = (FormularioAlbaranCompraBean) sesion.getAttribute(WebKeys.FORMULARIO_ALBARAN_COMPRA);
    		formulario.inicializar();
    		
    		// Obtenemos parámetros de búsqueda
    		ParametrosBuscarAlbaranesComprasBean param = (ParametrosBuscarAlbaranesComprasBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_ALBARANES_COMPRAS);
    		
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
            	PaginaResultados paginaResultados = ServicioAlbaranesCompras.consultar(param, datosSesion);
            	request.setAttribute(WebKeys.PAGINA_RESULTADOS, paginaResultados);
            }
            
    		return NEXT_PAGE;
    	}
    	catch (AlbaranCompraException e) {
            setError(request, e);
            return ERROR_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
	}
    private void setParametrosBuscar(ParametrosBuscarAlbaranesComprasBean param, HttpServletRequest request) throws FechaException {
    	param.setCodSerie(request.getParameter("codSerie"));
    	param.setDesSerie(request.getParameter("desSerie"));
    	try {
    		param.setNumAlbaran(Long.parseLong(request.getParameter("numAlbaran")));
    	} catch (Exception ignore) {
    		param.setNumAlbaran(null);
    	}
    	param.setCodProveedor(request.getParameter("codProveedor"));
    	param.setDesProveedor(request.getParameter("desProveedor"));
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
    
    
    private void setPaginaBuscar(ParametrosBuscarAlbaranesComprasBean param, HttpServletRequest request) {
        try {
            // Obtenemos la pagina solicitada
            int pagina = Integer.parseInt(request.getParameter("pagina"));
            param.setNumPagina(pagina);
        }
        catch (Exception ignore) {
            // Si no tenemos pagina, se mostrará la que teníamos
        }
    }
    
    
    private void setOrdenBuscar(ParametrosBuscarAlbaranesComprasBean param, HttpServletRequest request) {
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
                case 6:  // CODSERIE_FACTURA
                    if (param.getOrden().equals("CODSERIE_FACTURA")) {
                        param.setOrden("CODSERIE_FACTURA DESC");
                    }
                    else {
                        param.setOrden("CODSERIE_FACTURA");
                    }
                    break;
                case 7:  // NUMFAC
                    if (param.getOrden().equals("NUMFAC")) {
                        param.setOrden("NUMFAC DESC");
                    }
                    else {
                        param.setOrden("NUMFAC");
                    }
                    break;
                case 8:  // DESPRO
                    if (param.getOrden().equals("DESPRO")) {
                        param.setOrden("DESPRO DESC");
                    }
                    else {
                        param.setOrden("DESPRO");
                    }
                    break;
                case 9:  // DESCONALM
                    if (param.getOrden().equals("DESCONALM")) {
                        param.setOrden("DESCONALM DESC");
                    }
                    else {
                        param.setOrden("DESCONALM");
                    }
                    break;
                case 10:  // PERSONA_CONTACTO
                    if (param.getOrden().equals("PERSONA_CONTACTO")) {
                        param.setOrden("PERSONA_CONTACTO DESC");
                    }
                    else {
                        param.setOrden("PERSONA_CONTACTO");
                    }
                    break;
                case 11:  // TOTAL
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
