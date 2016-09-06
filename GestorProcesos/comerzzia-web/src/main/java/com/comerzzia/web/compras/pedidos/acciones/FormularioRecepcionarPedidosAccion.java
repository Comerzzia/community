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

package com.comerzzia.web.compras.pedidos.acciones;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.compras.pedidos.ParametrosBuscarPedidosComprasBean;
import com.comerzzia.servicios.compras.pedidos.PedidoCompra;
import com.comerzzia.servicios.compras.pedidos.PedidoCompraException;
import com.comerzzia.servicios.compras.pedidos.ServicioPedidosCompras;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;


public class FormularioRecepcionarPedidosAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("compras/pedidos/buscar/jsp/recepcionar.jsp", Vista.INTERNA);
	
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "formularioRecepcionarPedido";
    }
    
    /**
     * Ejecuta la acción
     * @param request Datos de la petición
     * @return Vista con la siguiente pagina a mostrar
     */
	@SuppressWarnings("unchecked")
	public Vista ejecutar(HttpServletRequest request) {
    	try {
    		HttpSession sesion = request.getSession();
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeEjecutar()) {
    			return SIN_PERMISO;
    		}
    		
    		// Obtener los IDs de los pedidos seleccionados
    		String patron = "chkIdPedido_";
    		List<Long> pedidosSeleccionados = new ArrayList<Long>();
    		Enumeration<String> parametersNames = request.getParameterNames(); 
    		while(parametersNames.hasMoreElements()) {
    			String name = parametersNames.nextElement();
    			
    			if(name.startsWith(patron)) {
    				String idPedido = name.substring(patron.length());
    				pedidosSeleccionados.add(Long.parseLong(idPedido));
    			}
    		}
    		
    		// Lista de pedidos seleccionados que se mostrará como resumen al usuario
    		List<PedidoCompra> resumenPedidosSeleccionados = new ArrayList<PedidoCompra>();
    		
    		// Si la lista de pedidos seleccionados está vacía es que se va a servir un único pedido
    		if(pedidosSeleccionados.isEmpty()) {
    			request.setAttribute("multiplesPedidos", "false");
    			
    			// Obtener el id del pedido y añadirlo a la lista de pedidos seleccionados
    			Long idPedido = Long.parseLong(request.getParameter("idObjeto"));
    			pedidosSeleccionados.add(idPedido);
    			
    			resumenPedidosSeleccionados.add(ServicioPedidosCompras.consultar(idPedido, datosSesion));
    		}
    		// Se van a servir múltiples pedidos
    		else {
    			request.setAttribute("multiplesPedidos", "true");
    			
    			for(Long idPedido : pedidosSeleccionados) {
    				resumenPedidosSeleccionados.add(ServicioPedidosCompras.consultar(idPedido, datosSesion));
    			}
    		}
    		
    		// Recuperar los parámetros de búsqueda para almacenar los pedidos seleccionados
    		ParametrosBuscarPedidosComprasBean param = (ParametrosBuscarPedidosComprasBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_PEDIDOS_COMPRAS);
    		param.setPedidosSeleccionados(pedidosSeleccionados);
    		
    		request.setAttribute("resumenPedidosSeleccionados", resumenPedidosSeleccionados);
    		
    		return NEXT_PAGE;
    	}
    	catch (PedidoCompraException e) {
            setError(request, e);
            
            return ERROR_PAGE;
        }
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
    }
}
