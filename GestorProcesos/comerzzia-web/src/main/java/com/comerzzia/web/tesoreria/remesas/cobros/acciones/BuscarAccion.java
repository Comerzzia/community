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

package com.comerzzia.web.tesoreria.remesas.cobros.acciones;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.core.estados.EstadoBean;
import com.comerzzia.persistencia.tesoreria.remesas.cobros.ParametrosBuscarRemesasCobrosBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.tesoreria.remesas.cobros.RemesaCobroException;
import com.comerzzia.servicios.tesoreria.remesas.cobros.ServicioRemesasCobros;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.tesoreria.remesas.cobros.ui.FormularioRemesaCobroBean;

public class BuscarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("tesoreria/remesas/cobros/buscar/jsp/buscar.jsp", Vista.INTERNA);
	
	public String getNombre() {
		return "buscar";
	}
	
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
    		FormularioRemesaCobroBean formulario = (FormularioRemesaCobroBean) sesion.getAttribute(WebKeys.FORMULARIO_REMESA_COBRO);
    		formulario.inicializar();

    		// Obtenemos parámetros de búsqueda
    		ParametrosBuscarRemesasCobrosBean param = (ParametrosBuscarRemesasCobrosBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_REMESAS_COBROS);
    		
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
                PaginaResultados paginaResultados = ServicioRemesasCobros.consultar(param, datosSesion);
                request.setAttribute(WebKeys.PAGINA_RESULTADOS, paginaResultados);
            }
            
    		return NEXT_PAGE;
    	}
    	catch (RemesaCobroException e) {
            setError(request, e);
            
            return ERROR_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
	}
	
	private void setParametrosBuscar(ParametrosBuscarRemesasCobrosBean param, HttpServletRequest request) {
    	param.setCodBanco(request.getParameter("codBanco"));
        param.setDesBanco(request.getParameter("desBanco"));
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

    	// Obtener los estados seleccionados
    	List<EstadoBean> listaEstados = param.getEstados().getListaEstados();
        for (int i = 0; i < listaEstados.size(); i ++) {
            EstadoBean estado = listaEstados.get(i);
            String idCheck = "_chkEstado_" + estado.getEstado();
            estado.setChecked(request.getParameter(idCheck) != null);
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
	
	private void setPaginaBuscar(ParametrosBuscarRemesasCobrosBean param, HttpServletRequest request) {
        try {
            // Obtenemos la pagina solicitada
            int pagina = Integer.parseInt(request.getParameter("pagina"));
            param.setNumPagina(pagina);
        }
        catch (Exception ignore) {
            // Si no tenemos pagina, se mostrará la que teníamos
        }
    }
	
	private void setOrdenBuscar(ParametrosBuscarRemesasCobrosBean param, HttpServletRequest request) {
    	try {
            // Establecemos primera pagina
            param.setNumPagina(1);
            
            // Obtenemos la columna por la que ordenar
            int columna = Integer.parseInt(request.getParameter("columna"));
            
            // Establecemos la columna de orden
            switch (columna) {
                case 1:  // ID_REMESA
                    if (param.getOrden().equals("ID_REMESA")) {
                        param.setOrden("ID_REMESA DESC");
                    }
                    else {
                        param.setOrden("ID_REMESA");
                    }
                    break;
                case 2:  // FECHA_REMESA
                    if (param.getOrden().equals("FECHA_REMESA")) {
                        param.setOrden("FECHA_REMESA DESC");
                    }
                    else {
                        param.setOrden("FECHA_REMESA");
                    }
                    break;
                case 3:  // CODBAN
                    if (param.getOrden().equals("CODBAN")) {
                        param.setOrden("CODBAN DESC");
                    }
                    else {
                        param.setOrden("CODBAN");
                    }
                    break;
                default:
                    param.setOrden("ID_REMESA");
            }
        }
        catch (Exception e) {
        	// Si no tenemos orden, se mantiene el que se tenía
        }
    }

}
