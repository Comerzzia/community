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

package com.comerzzia.web.general.paises.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.paises.ParametrosBuscarPaisesBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.paises.PaisException;
import com.comerzzia.servicios.general.paises.ServicioPaises;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;


public class BuscarAccion extends Accion {
	
	private static final Vista NEXT_PAGE = new Vista("general/paises/buscar/jsp/buscar.jsp", Vista.INTERNA);

	
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
    		
    		// Liberamos recursos
    		sesion.removeAttribute(WebKeys.PAIS_BEAN);

    		//Obtenemos parámetros de búsqueda
    		ParametrosBuscarPaisesBean param = (ParametrosBuscarPaisesBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_PAISES);
    		
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
                // Realizamos la búsqueda
                PaginaResultados paginaResultados = ServicioPaises.consultar(param, datosSesion);
                request.setAttribute(WebKeys.PAGINA_RESULTADOS, paginaResultados);
            }
           
    		return NEXT_PAGE;
    	}
    	catch (PaisException e) {
            setError(request, e);
            return ERROR_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
    }
    
    
    private void setParametrosBuscar(ParametrosBuscarPaisesBean param, HttpServletRequest request) {
    	param.setCodPais(request.getParameter("codPais"));
        param.setDesPais(request.getParameter("desPais"));
        param.setActivo(request.getParameter("activo"));
        
        param.setNumPagina(1);
        
        // Actualizar el número de resultados por página
        try {
        	param.setTamañoPagina(Integer.parseInt(request.getParameter("tamanoPagina")));
        } catch(Exception ignore) {
        	// Si no se recibe el número de resultados, se mantiene el que se tenía
        }
    }
    
    
    private void setPaginaBuscar(ParametrosBuscarPaisesBean param, HttpServletRequest request) {
        try {
            // Obtenemos la pagina solicitada
            int pagina = Integer.parseInt(request.getParameter("pagina"));
            param.setNumPagina(pagina);
        }
        catch (Exception ignore) {
            // Si no tenemos pagina, se mostrará la que teníamos
        }
    }
    
    
    private void setOrdenBuscar(ParametrosBuscarPaisesBean param, HttpServletRequest request) {
    	try {
            // Establecemos primera pagina
            param.setNumPagina(1);
            
            // Obtenemos la columna por la que ordenar
            int columna = Integer.parseInt(request.getParameter("columna"));
            
            // Establecemos la columna de orden
            switch (columna) {
                case 1:  // CODPAIS
                    if (param.getOrden().equals("CODPAIS")) {
                        param.setOrden("CODPAIS DESC");
                    }
                    else {
                        param.setOrden("CODPAIS");
                    }
                    break;
                case 2:  // DESPAIS
                    if (param.getOrden().equals("DESPAIS")) {
                        param.setOrden("DESPAIS DESC");
                    }
                    else {
                        param.setOrden("DESPAIS");
                    }
                    break;
                default:
                    param.setOrden("CODPAIS");
            }
        }
        catch (Exception e) {
        	// Si no tenemos orden, se dejar el que se tenía
        }
    }
}
