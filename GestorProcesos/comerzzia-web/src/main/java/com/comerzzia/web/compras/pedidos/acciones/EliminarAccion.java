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
import com.comerzzia.servicios.compras.pedidos.PedidoCompraConstraintViolationException;
import com.comerzzia.servicios.compras.pedidos.PedidoCompraException;
import com.comerzzia.servicios.compras.pedidos.ServicioPedidosCompras;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.compras.pedidos.ui.FormularioPedidoCompraBean;


public class EliminarAccion extends Accion {

	@Override
	public String getNombre() {
		return "eliminar";
	}
	
	@Override
	public Vista ejecutar(HttpServletRequest request) {
		HttpSession sesion = request.getSession();

		try {
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisos(this.getAccionMenu());
    		if (!permisos.isPuedeEliminar()) {
    			return SIN_PERMISO;
    		}
    		
    		// Eliminamos el pedido
    		Long idPedido = Long.parseLong(request.getParameter(WebKeys.ID_OBJETO));
			ServicioPedidosCompras.eliminar(idPedido, datosSesion);

    		setMensaje(request, "El pedido de compra se ha eliminado correctamente");
    		
    		return getControlador().getAccion("buscar").ejecutar(request);
    	}
    	catch (PedidoCompraConstraintViolationException e) {
    		setMensajeAviso(request, "No se ha podido eliminar el pedido de compra: " + e.getMessage());
    		
    		FormularioPedidoCompraBean formulario = (FormularioPedidoCompraBean) sesion.getAttribute(WebKeys.FORMULARIO_PEDIDO_COMPRA);
    		// Si no tenemos registro activo volvemos al buscador
    		if (formulario.isRegistroActivoVacio()) {
    			return getControlador().getAccion("buscar").ejecutar(request);
    		}
    		else { // en caso contrario volvemos al formulario
    			return getControlador().getAccion("verFormulario").ejecutar(request);
    		}
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
