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

package com.comerzzia.web.compras.facturas.conformacion.acciones;

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
import com.comerzzia.web.compras.facturas.conformacion.ui.FormularioConformacionFacturasBean;

public class BuscarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("compras/facturas/conformacion/buscar/jsp/buscar.jsp", Vista.INTERNA);
	
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
    		FormularioConformacionFacturasBean formulario = (FormularioConformacionFacturasBean) sesion.getAttribute(WebKeys.FORMULARIO_CONFORMACION_FACTURAS);
    		formulario.inicializar();
    		
    		// Obtenemos parámetros de búsqueda
    		ParametrosBuscarAlbaranesComprasBean param = (ParametrosBuscarAlbaranesComprasBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_ALBARANES_FACTURAS);
    		String operacion = request.getParameter("operacion");
            if (operacion != null && operacion.equals("consultar")) {
            	setParametrosBuscar(param, request);
            }
    		
    		// Realizamos la búsqueda
    		// Si tenemos página, realizamos la búsqueda
            if (param.getNumPagina() > 0) {
            	PaginaResultados paginaResultados = ServicioAlbaranesCompras.consultar(param, datosSesion);
            	request.setAttribute(WebKeys.PAGINA_RESULTADOS, paginaResultados);
            	
            	if(paginaResultados.getNumeroTotalPaginas() > 1)
                	setMensajeAviso(request, "El número de registros obtenido en la consulta es mayor al " +
                			"número de resultados especificado. Sólo se muestran los " + paginaResultados.getTamañoPagina() + 
                			" primeros registros.");
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
	
	/**
	 * Lee los parámetros de búsqueda de albaranes
	 * @param formulario
	 * @param request
	 * @throws FechaException 
	 * @throws FechaException 
	 */
	private void setParametrosBuscar(ParametrosBuscarAlbaranesComprasBean param, HttpServletRequest request) throws FechaException {
		param.setCodProveedor(request.getParameter("codProveedor"));
		param.setDesProveedor(request.getParameter("desProveedor"));
		param.setCodSerie(request.getParameter("codSerieDesde"));
		param.setDesSerie(request.getParameter("desSerieDesde"));
		param.setCodSerieHasta(request.getParameter("codSerieHasta"));
		param.setDesSerieHasta(request.getParameter("desSerieHasta"));
		
		String fechaDesde = request.getParameter("fechaDesde");
		if(fechaDesde != null && !fechaDesde.equals("")){
			param.setFechaDesde(Fechas.getFecha(fechaDesde));
		}
		
		String fechaHasta = request.getParameter("fechaHasta");
		if(fechaHasta != null && !fechaHasta.equals("")){
			param.setFechaHasta(Fechas.getFecha(fechaHasta));
		}
		
        // Actualizar el número de resultados por página
        try {
        	param.setTamañoPagina(Integer.parseInt(request.getParameter("tamanoPagina")));
        } catch(Exception ignore) {
        	// Si no se recibe el tamaño de página, se mantiene el que se tenía
        }
        
        param.setNumPagina(1);
	}
}
