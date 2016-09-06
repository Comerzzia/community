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

package com.comerzzia.web.tesoreria.tiposefectos.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.tesoreria.tiposefectos.ParametrosBuscarTiposEfectosBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.tesoreria.tiposefectos.ServicioTiposEfectos;
import com.comerzzia.servicios.tesoreria.tiposefectos.TipoEfectoException;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;


public class BuscarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("tesoreria/tipos_efectos/buscar/jsp/buscar.jsp", Vista.INTERNA);
	
	public String getNombre() {
		return "buscar";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		
		try {
    		HttpSession sesion = request.getSession();
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Liberamos recursos
    		sesion.removeAttribute(WebKeys.TIPO_EFECTO_BEAN);
    		
    		// Obtenemos parámetros de búsqueda
    		ParametrosBuscarTiposEfectosBean param = (ParametrosBuscarTiposEfectosBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_TIPOS_EFECTOS);
    		
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
            	PaginaResultados paginaResultados = ServicioTiposEfectos.consultar(param, datosSesion);
            	request.setAttribute(WebKeys.PAGINA_RESULTADOS, paginaResultados);
            }
            
    		return NEXT_PAGE;
    	}
    	catch (TipoEfectoException e) {
            setError(request, e);
            return ERROR_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
	}
    private void setParametrosBuscar(ParametrosBuscarTiposEfectosBean param, HttpServletRequest request) {
    	param.setCodTipoEfecto(request.getParameter("codTipoEfecto"));
        param.setDesTipoEfecto(request.getParameter("desTipoEfecto"));
        param.setActivo(request.getParameter("activo"));
        
        
        param.setNumPagina(1);
        
        // Actualizar el número de resultados por página
        try {
        	param.setTamañoPagina(Integer.parseInt(request.getParameter("tamanoPagina")));
        } catch(Exception ignore) {
        	// Si no se recibe el tamaño de página, se mantiene el que se tenía
        }
    }
    
    
    private void setPaginaBuscar(ParametrosBuscarTiposEfectosBean param, HttpServletRequest request) {
        try {
            // Obtenemos la pagina solicitada
            int pagina = Integer.parseInt(request.getParameter("pagina"));
            param.setNumPagina(pagina);
        }
        catch (Exception ignore) {
            // Si no tenemos pagina, se mostrará la que teníamos
        }
    }
    
    
    private void setOrdenBuscar(ParametrosBuscarTiposEfectosBean param, HttpServletRequest request) {
    	try {
            // Establecemos primera pagina
            param.setNumPagina(1);
            
            // Obtenemos la columna por la que ordenar
            int columna = Integer.parseInt(request.getParameter("columna"));
            
            // Establecemos la columna de orden
            switch (columna) {
                case 1:  // CODTIPOEFEC
                    if (param.getOrden().equals("CODTIPOEFEC")) {
                        param.setOrden("CODTIPOEFEC DESC");
                    }
                    else {
                        param.setOrden("CODTIPOEFEC");
                    }
                    break;
                case 2:  // DESTIPOEFEC
                    if (param.getOrden().equals("DESTIPOEFEC")) {
                        param.setOrden("DESTIPOEFEC DESC");
                    }
                    else {
                        param.setOrden("DESTIPOEFEC");
                    }
                    break;
                default:
                    param.setOrden("DESTIPOEFEC");
            }
        }
        catch (Exception e) {
        	// Si no tenemos orden, se dejar el que se tenía
        }
    }



}
