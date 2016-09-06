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

package com.comerzzia.web.ventas.facturas.facturacion.acciones;

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
import com.comerzzia.web.ventas.facturas.facturacion.ui.FormularioFacturacionAlbaranesVentasBean;

public class BuscarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("ventas/facturas/facturacion/buscar/jsp/buscar.jsp", Vista.INTERNA);
	
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
    		FormularioFacturacionAlbaranesVentasBean formulario = (FormularioFacturacionAlbaranesVentasBean) sesion.getAttribute(WebKeys.FORMULARIO_FACTURACION_ALBARANES_VENTAS);
    		formulario.inicializar();
    		
    		// Obtenemos parámetros de búsqueda
    		ParametrosBuscarAlbaranesVentasBean param = (ParametrosBuscarAlbaranesVentasBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_ALBARANES_VENTAS_NO_FACTURADOS);
    		String operacion = request.getParameter("operacion");
            if (operacion != null && operacion.equals("consultar")) {
            	setParametrosBuscar(param, request);
            }
    		
    		// Si tenemos página, realizamos la búsqueda
            if (param.getNumPagina() > 0) {
            	PaginaResultados paginaResultados = ServicioAlbaranesVentas.consultarAlbaranesVentasNoFacturados(param, datosSesion);
            	request.setAttribute(WebKeys.PAGINA_RESULTADOS, paginaResultados);
            	
            	if(paginaResultados.getTotalResultados() > paginaResultados.getTamañoPagina()){
            		String mensajeAviso = "El número de registros obtenido en la consulta es mayor al " +
        								  "número de resultados especificado.";
            		if(paginaResultados.getTamañoPagina() == 1){
            			mensajeAviso += " Sólo se muestra un registro.";
            		}
            		else{
            			mensajeAviso += " Sólo se muestran los " + paginaResultados.getTamañoPagina() + 
                    			" primeros registros.";
            		}

            		setMensajeAviso(request, mensajeAviso);
            	}
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
	
	/**
	 * Lee los parámetros de búsqueda de albaranes
	 * @param formulario
	 * @param request
	 * @throws FechaException 
	 * @throws FechaException 
	 */
	private void setParametrosBuscar(ParametrosBuscarAlbaranesVentasBean param, HttpServletRequest request) throws FechaException {
		param.setCodClienteDesde(request.getParameter("codClienteDesde"));
		param.setDesClienteDesde(request.getParameter("desClienteDesde"));
		param.setCodClienteHasta(request.getParameter("codClienteHasta"));
		param.setDesClienteHasta(request.getParameter("desClienteHasta"));
		param.setCodSerieDesde(request.getParameter("codSerieDesde"));
		param.setDesSerieDesde(request.getParameter("desSerieDesde"));
		param.setCodSerieHasta(request.getParameter("codSerieHasta"));
		param.setDesSerieHasta(request.getParameter("desSerieHasta"));
		param.setCodAlmacen(request.getParameter("codAlmacen"));
		param.setDesAlmacen(request.getParameter("desAlmacen"));
		param.setCodConceptoAlmacen(request.getParameter("codConceptoAlmacen"));
		param.setDesConceptoAlmacen(request.getParameter("desConceptoAlmacen"));
		
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
