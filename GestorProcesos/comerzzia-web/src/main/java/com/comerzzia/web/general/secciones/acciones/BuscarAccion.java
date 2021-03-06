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

package com.comerzzia.web.general.secciones.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.secciones.ParametrosBuscarSeccionesBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.secciones.SeccionException;
import com.comerzzia.servicios.general.secciones.ServicioSecciones;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;


public class BuscarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("general/secciones/buscar/jsp/buscar.jsp", Vista.INTERNA);
	
	public String getNombre() {
		return "buscar";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		
		try {
    		HttpSession sesion = request.getSession();
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Liberamos recursos
    		sesion.removeAttribute(WebKeys.SECCION_BEAN);
    		
    		// Obtenemos parámetros de búsqueda
    		ParametrosBuscarSeccionesBean param = (ParametrosBuscarSeccionesBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_SECCIONES);
    		
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
            	PaginaResultados paginaResultados = ServicioSecciones.consultar(param, datosSesion);
            	request.setAttribute(WebKeys.PAGINA_RESULTADOS, paginaResultados);
            }
            
    		return NEXT_PAGE;
    	}
    	catch (SeccionException e) {
            setError(request, e);
            return ERROR_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
	}
    private void setParametrosBuscar(ParametrosBuscarSeccionesBean param, HttpServletRequest request) {
    	param.setCodSeccion(request.getParameter("codSeccion"));
        param.setDesSeccion(request.getParameter("desSeccion"));
        param.setActivo(request.getParameter("activo"));
        
        
        param.setNumPagina(1);
        
        // Actualizar el número de resultados por página
        try {
        	param.setTamañoPagina(Integer.parseInt(request.getParameter("tamanoPagina")));
        } catch(Exception ignore) {
        	// Si no se recibe el tamaño de página, se mantiene el que se tenía
        }
    }
    
    
    private void setPaginaBuscar(ParametrosBuscarSeccionesBean param, HttpServletRequest request) {
        try {
            // Obtenemos la pagina solicitada
            int pagina = Integer.parseInt(request.getParameter("pagina"));
            param.setNumPagina(pagina);
        }
        catch (Exception ignore) {
            // Si no tenemos pagina, se mostrará la que teníamos
        }
    }
    
    
    private void setOrdenBuscar(ParametrosBuscarSeccionesBean param, HttpServletRequest request) {
    	try {
            // Establecemos primera pagina
            param.setNumPagina(1);
            
            // Obtenemos la columna por la que ordenar
            int columna = Integer.parseInt(request.getParameter("columna"));
            
            // Establecemos la columna de orden
            switch (columna) {
                case 1:  // CODSECCION
                    if (param.getOrden().equals("CODSECCION")) {
                        param.setOrden("CODSECCION DESC");
                    }
                    else {
                        param.setOrden("CODSECCION");
                    }
                    break;
                case 2:  // DESSECCION
                    if (param.getOrden().equals("DESSECCION")) {
                        param.setOrden("DESSECCION DESC");
                    }
                    else {
                        param.setOrden("DESSECCION");
                    }
                    break;
                default:
                    param.setOrden("DESSECCION");
            }
        }
        catch (Exception e) {
        	// Si no tenemos orden, se dejar el que se tenía
        }
    }



}
