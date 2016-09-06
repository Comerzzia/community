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

package com.comerzzia.web.ventas.pedidos.acciones;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.ventas.pedidos.ParametrosBuscarPedidosVentasBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.pedidos.PedidoVentaConstraintViolationException;
import com.comerzzia.servicios.ventas.pedidos.PedidoVentaException;
import com.comerzzia.servicios.ventas.pedidos.ServicioPedidosVentas;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;


public class ServirMultiplesPedidosAccion extends Accion {

	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "servirMultiplesPedidos";
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
    		
    		// Recuperar el objeto en el que se almacenaron los ids de pedidos seleccionados
    		ParametrosBuscarPedidosVentasBean param = (ParametrosBuscarPedidosVentasBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_PEDIDOS_VENTAS);
    		
    		Date fechaSuministro = Fechas.getFecha(request.getParameter("fechaSuministro"));
    		ServicioPedidosVentas.servirMultiplesPedidos(datosSesion, param.getPedidosSeleccionados(), fechaSuministro);
    		
    		setMensaje(request, "Los pedidos de venta seleccionados han sido servidos correctamente");
    		
    		// Limpiar la lista de pedidos seleccionados
    		param.setPedidosSeleccionados(null);
    		
    		// Volver al buscador
    		return getControlador().getAccion("buscar").ejecutar(request);
    	}
    	catch (PedidoVentaConstraintViolationException e) {
    		setMensajeError(request, "El proceso de servido no ha podido completarse: " + e.getMessage());
    		
    		return getControlador().getAccion("buscar").ejecutar(request);
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
}