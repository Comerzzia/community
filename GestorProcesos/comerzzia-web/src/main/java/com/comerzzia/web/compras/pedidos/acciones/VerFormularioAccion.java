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
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.compras.pedidos.ui.FormularioPedidoCompraBean;


public class VerFormularioAccion extends Accion {
	
	private static final Vista NEXT_PAGE = new Vista("compras/pedidos/mantenimiento/jsp/pedido.jsp", Vista.INTERNA);

	
	@Override
	public String getNombre() {
		return "verFormulario";
	}
	
	@Override
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
			
			// Actualizamos el formulario
			FormularioPedidoCompraBean formulario = (FormularioPedidoCompraBean) sesion.getAttribute(WebKeys.FORMULARIO_PEDIDO_COMPRA);
			inicializaPestañaActiva(formulario, datosSesion, request);
			
			return NEXT_PAGE;
		}
		catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
		}
	}
	
	
	private void inicializaPestañaActiva(FormularioPedidoCompraBean formulario, DatosSesionBean datosSesion,HttpServletRequest request) throws Exception {
		// Obtenemos el Pedido de compra
		PedidoCompra pedido = formulario.getRegistroActivo();
		
		// Actualizamos la pestaña activa
		switch (formulario.getPestañaActiva()) {
			case 1:  // Artículos
				if(formulario.getFormularioPestañaActiva().isModoVisualizacionFicha()) {
					// Inicializar el concepto de almacen, para obtener el signo que le corresponde
					pedido.setConceptoAlmacen(pedido.getCodConceptoAlmacen(), pedido.getCodAlmacen(), datosSesion);
				}
				break;
		}
	}
}
