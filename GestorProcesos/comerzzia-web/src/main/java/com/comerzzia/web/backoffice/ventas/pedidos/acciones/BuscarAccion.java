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

package com.comerzzia.web.backoffice.ventas.pedidos.acciones;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.core.estados.EstadoBean;
import com.comerzzia.persistencia.ventas.pedidos.ParametrosBuscarPedidosVentasBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.pedidos.PedidoVentaException;
import com.comerzzia.servicios.ventas.pedidos.ServicioPedidosVentas;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.backoffice.ventas.pedidos.ui.FormularioPedidoVentaBackofficeBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;


public class BuscarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("backoffice/ventas/pedidos/buscar/jsp/buscar.jsp", Vista.INTERNA);
	
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
    		FormularioPedidoVentaBackofficeBean formulario = (FormularioPedidoVentaBackofficeBean) sesion.getAttribute(WebKeys.FORMULARIO_PEDIDO_VENTA_BACKOFFICE);
    		formulario.inicializar();
    		
    		// Obtenemos parámetros de búsqueda
    		ParametrosBuscarPedidosVentasBean param = (ParametrosBuscarPedidosVentasBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_PEDIDOS_VENTAS_BACKOFFICE);
    		
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
            	PaginaResultados paginaResultados = ServicioPedidosVentas.consultar(param, datosSesion);
            	request.setAttribute(WebKeys.PAGINA_RESULTADOS, paginaResultados);
            }
            
    		return NEXT_PAGE;
    	}
    	catch (PedidoVentaException e) {
            setError(request, e);
            
            return ERROR_PAGE;
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
	}
    private void setParametrosBuscar(ParametrosBuscarPedidosVentasBean param, HttpServletRequest request) throws FechaException {
    	param.setCodSerie(request.getParameter("codSerie"));
    	param.setDesSerie(request.getParameter("desSerie"));
    	try {
    		param.setNumPedido(Long.parseLong(request.getParameter("numPedido")));
    	} catch (Exception ignore) {
    		param.setNumPedido(null);
    	}
    	param.setCodAlmacen(request.getParameter("codAlmacen"));
    	param.setDesAlmacen(request.getParameter("desAlmacen"));
    	param.setCodConceptoAlmacen(request.getParameter("codConceptoAlmacen"));
    	param.setDesConceptoAlmacen(request.getParameter("desConceptoAlmacen"));
    	param.setBuscarPorFechaDesde(request.getParameter("chkFechaDesde") != null);
    	try {
        	param.setFechaDesde(Fechas.getFecha(request.getParameter("fechaDesde")));
    	}
    	catch (Exception ignore) {
    		param.setFechaDesde(null);
    	}
    	param.setBuscarPorFechaHasta(request.getParameter("chkFechaHasta") != null);
    	try {
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
        } catch(Exception ignore) {
        	// Si no se recibe el tamaño de página, se mantiene el que se tenía
        }
    }
    
    
    private void setPaginaBuscar(ParametrosBuscarPedidosVentasBean param, HttpServletRequest request) {
        try {
            // Obtenemos la pagina solicitada
            int pagina = Integer.parseInt(request.getParameter("pagina"));
            param.setNumPagina(pagina);
        }
        catch (Exception ignore) {
            // Si no tenemos pagina, se mostrará la que teníamos
        }
    }
    
    
    private void setOrdenBuscar(ParametrosBuscarPedidosVentasBean param, HttpServletRequest request) {
    	try {
            // Establecemos primera pagina
            param.setNumPagina(1);
            
            // Obtenemos la columna por la que ordenar
            int columna = Integer.parseInt(request.getParameter("columna"));
            
            // Establecemos la columna de orden
            switch (columna) {
	            case 1:  // DESESTADO_RECEPTOR
	                if (param.getOrden().equals("ESTADO_RECEPTOR")) {
	                    param.setOrden("ESTADO_RECEPTOR DESC");
	                }
	                else {
	                    param.setOrden("ESTADO_RECEPTOR");
	                }
	                break;
	            case 2:  // PERIODO
	                if (param.getOrden().equals("PERIODO")) {
	                    param.setOrden("PERIODO DESC");
	                }
	                else {
	                    param.setOrden("PERIODO");
	                }
	                break;
	            case 3:  // CODSERIE
	                if (param.getOrden().equals("CODSERIE")) {
	                    param.setOrden("CODSERIE DESC");
	                }
	                else {
	                    param.setOrden("CODSERIE");
	                }
	                break;
                case 4:  // NUMPED
                    if (param.getOrden().equals("NUMPED")) {
                        param.setOrden("NUMPED DESC");
                    }
                    else {
                        param.setOrden("NUMPED");
                    }
                    break;
                case 5:  // FECHA
                    if (param.getOrden().equals("FECHA")) {
                        param.setOrden("FECHA DESC");
                    }
                    else {
                        param.setOrden("FECHA");
                    }
                    break;
                case 6:  // CODCONALM
                    if (param.getOrden().equals("CODCONALM")) {
                        param.setOrden("CODCONALM DESC");
                    }
                    else {
                        param.setOrden("CODCONALM");
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
                case 8:  // CODALM
                    if (param.getOrden().equals("CODALM")) {
                        param.setOrden("CODALM DESC");
                    }
                    else {
                        param.setOrden("CODALM");
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
