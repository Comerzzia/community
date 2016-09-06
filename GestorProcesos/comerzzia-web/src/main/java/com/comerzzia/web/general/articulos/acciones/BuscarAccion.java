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

package com.comerzzia.web.general.articulos.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.articulos.ParametrosBuscarArticulosBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.articulos.ArticuloException;
import com.comerzzia.servicios.general.articulos.ServicioArticulos;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.general.articulos.ui.FormularioArticuloBean;


public class BuscarAccion extends Accion {
	
	private static final Vista NEXT_PAGE = new Vista("general/articulos/buscar/jsp/buscar.jsp", Vista.INTERNA);

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
    		FormularioArticuloBean formulario = (FormularioArticuloBean) sesion.getAttribute(WebKeys.FORMULARIO_ARTICULO);
    		formulario.inicializar();

    		// Obtenemos parámetros de búsqueda
    		ParametrosBuscarArticulosBean param = (ParametrosBuscarArticulosBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_ARTICULOS);
    		
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
                PaginaResultados paginaResultados = ServicioArticulos.consultar(param, datosSesion);
                request.setAttribute(WebKeys.PAGINA_RESULTADOS, paginaResultados);
            }
            
    		return NEXT_PAGE;
    	}
    	catch (ArticuloException e) {
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
     */
    private void setParametrosBuscar(ParametrosBuscarArticulosBean param, HttpServletRequest request) {
    	param.setCodArticulo(request.getParameter("codArticulo"));
        param.setDesArticulo(request.getParameter("desArticulo"));
        param.setCodFamilia(request.getParameter("codFamilia"));
        param.setDesFamilia(request.getParameter("desFamilia"));
        param.setCodProveedor(request.getParameter("codProveedor"));
        param.setDesProveedor(request.getParameter("desProveedor"));
        param.setActivo(request.getParameter("activo"));
        
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
    private void setPaginaBuscar(ParametrosBuscarArticulosBean param, HttpServletRequest request) {
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
    private void setOrdenBuscar(ParametrosBuscarArticulosBean param, HttpServletRequest request) {
    	try {
            // Establecemos primera pagina
            param.setNumPagina(1);
            
            // Obtenemos la columna por la que ordenar
            int columna = Integer.parseInt(request.getParameter("columna"));
            
            // Establecemos la columna de orden
            switch (columna) {
                case 1:  // CODART
                    if (param.getOrden().equals("CODART")) {
                        param.setOrden("CODART DESC");
                    }
                    else {
                        param.setOrden("CODART");
                    }
                    break;
                case 2:  // DESART
                    if (param.getOrden().equals("DESART")) {
                        param.setOrden("DESART DESC");
                    }
                    else {
                        param.setOrden("DESART");
                    }
                    break;
                case 3:  // DESFAM
                    if (param.getOrden().equals("DESFAM")) {
                        param.setOrden("DESFAM DESC");
                    }
                    else {
                        param.setOrden("DESFAM");
                    }
                    break;
                case 4:  // DESPRO
                    if (param.getOrden().equals("DESPRO")) {
                        param.setOrden("DESPRO DESC");
                    }
                    else {
                        param.setOrden("DESPRO");
                    }
                    break;
                default:
                    param.setOrden("CODART");
            }
        }
        catch (Exception e) {
        	// Si no tenemos orden, se mantiene el que se tenía
        }
    }
}
