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

import com.comerzzia.servicios.compras.pedidos.PedidoCompra;
import com.comerzzia.servicios.compras.pedidos.PedidoCompraConstraintViolationException;
import com.comerzzia.servicios.compras.pedidos.PedidoCompraException;
import com.comerzzia.servicios.compras.pedidos.PedidoCompraNotFoundException;
import com.comerzzia.servicios.compras.pedidos.ServicioPedidosCompras;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.compras.pedidos.ui.FormularioPedidoCompraBean;


public class EditarAccion extends Accion {

	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "editar";
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
    		if (!permisos.isPuedeEditar()) {
    			return SIN_PERMISO;
    		}
    		
    		// Obtener el Pedido de Compra
    		Long idPedido = Long.parseLong(request.getParameter(WebKeys.ID_OBJETO));
    		PedidoCompra pedido = ServicioPedidosCompras.consultar(idPedido, datosSesion);
    		
    		// Inicializamos el Formulario
    		FormularioPedidoCompraBean formulario = (FormularioPedidoCompraBean) sesion.getAttribute(WebKeys.FORMULARIO_PEDIDO_COMPRA);
    		formulario.inicializar(pedido);
    		
    		// Comprobamos que el pedido puede modificarse y ponemos el formulario en modo edición
    		try {
				pedido.checkPedidoPuedeModificarse();
				formulario.setModoEdicion();
			} 
    		catch (PedidoCompraConstraintViolationException e) {
    			setMensajeAviso(request, "No se puede editar el pedido de compra: " + e.getMessage());
			}
    		
    		// Mostramos el formulario
    		return getControlador().getAccion("verFormulario").ejecutar(request);
    	}
    	catch (PedidoCompraNotFoundException e) {
    		// Si no se encuentra el registro volvemos al buscador y enviamos en mensaje de error
            setMensajeError(request, "No se ha encontrado el registro", e);
            
            return getControlador().getAccion("buscar").ejecutar(request);
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
