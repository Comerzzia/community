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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.compras.pedidos.PedidoCompra;
import com.comerzzia.servicios.compras.pedidos.PedidoCompraConstraintViolationException;
import com.comerzzia.servicios.compras.pedidos.PedidoCompraException;
import com.comerzzia.servicios.compras.pedidos.ServicioPedidosCompras;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.compras.pedidos.ui.FormularioPedidoCompraBean;


public class AceptarPedidoAccion extends Accion {

	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "aceptarPedido";
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
    		
    		Long idPedido = Long.parseLong(request.getParameter(WebKeys.ID_OBJETO));
    		ServicioPedidosCompras.aceptarPedido(datosSesion, idPedido);
    		
    		setMensaje(request, "El pedido de compra ha sido aceptado correctamente");
    		
    		// Consultamos el pedido grabado e inicializamos el formulario
    		try {
    			PedidoCompra pedido = ServicioPedidosCompras.consultar(idPedido, datosSesion);
    			FormularioPedidoCompraBean formulario = (FormularioPedidoCompraBean) sesion.getAttribute(WebKeys.FORMULARIO_PEDIDO_COMPRA);
				formulario.inicializar(pedido);
			}
    		catch (Exception e) {
    			setMensajeError(request, "Se ha producido un error al acceder al registro");
    			return getControlador().getAccion("buscar").ejecutar(request);
			}
    		
    		return getControlador().getAccion("verFormulario").ejecutar(request);
    	}
    	catch (PedidoCompraConstraintViolationException e) {
    		setMensajeError(request, "El proceso de aceptación no ha podido completarse: " + e.getMessage());
    		
    		return getControlador().getAccion("verFormulario").ejecutar(request);
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
