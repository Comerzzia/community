/**
 * 
 */
package com.comerzzia.web.general.categorizaciones.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.categorizaciones.ParametrosBuscarCategorizacionesBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.categorizaciones.CategorizacionException;
import com.comerzzia.servicios.general.categorizaciones.ServicioCategorizaciones;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

/**
 *
 */
public class BuscarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("general/categorizaciones/buscar/jsp/buscar.jsp", Vista.INTERNA);
	
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
    		sesion.removeAttribute(WebKeys.CATEGORIZACION_BEAN);

    		//Obtenemos parámetros de búsqueda
    		ParametrosBuscarCategorizacionesBean param = (ParametrosBuscarCategorizacionesBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_CATEGORIZACIONES);
    		
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
                PaginaResultados paginaResultados = ServicioCategorizaciones.consultar(param, datosSesion);
                request.setAttribute(WebKeys.PAGINA_RESULTADOS, paginaResultados);
            }
           
    		return NEXT_PAGE;
    	}
    	catch (CategorizacionException e) {
            setError(request, e);
            return ERROR_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
    }
    
    
    private void setParametrosBuscar(ParametrosBuscarCategorizacionesBean param, HttpServletRequest request) {
    	param.setCodCat(request.getParameter("codCat"));
        param.setDesCat(request.getParameter("desCat"));
        param.setActivo(request.getParameter("activo"));
        
        param.setNumPagina(1);
        
        // Actualizar el número de resultados por página
        try {
        	param.setTamañoPagina(Integer.parseInt(request.getParameter("tamanoPagina")));
        } catch(Exception ignore) {
        	// Si no se recibe el número de resultados, se mantiene el que se tenía
        }
    }
    
    
    private void setPaginaBuscar(ParametrosBuscarCategorizacionesBean param, HttpServletRequest request) {
        try {
            // Obtenemos la pagina solicitada
            int pagina = Integer.parseInt(request.getParameter("pagina"));
            param.setNumPagina(pagina);
        }
        catch (Exception ignore) {
            // Si no tenemos pagina, se mostrará la que teníamos
        }
    }
    
    
    private void setOrdenBuscar(ParametrosBuscarCategorizacionesBean param, HttpServletRequest request) {
    	try {
            // Establecemos primera pagina
            param.setNumPagina(1);
            
            // Obtenemos la columna por la que ordenar
            int columna = Integer.parseInt(request.getParameter("columna"));
            
            // Establecemos la columna de orden
            switch (columna) {
                case 1:  // CODCAT
                    if (param.getOrden().equals("CODCAT")) {
                        param.setOrden("CODCAT DESC");
                    }
                    else {
                        param.setOrden("CODCAT");
                    }
                    break;
                case 2:  // DESCAT
                    if (param.getOrden().equals("DESCAT")) {
                        param.setOrden("DESCAT DESC");
                    }
                    else {
                        param.setOrden("DESCAT");
                    }
                    break;
                default:
                    param.setOrden("CODCAT");
            }
        }
        catch (Exception e) {
        	// Si no tenemos orden, se dejar el que se tenía
        }
    }

}
