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

package com.comerzzia.servicios.backoffice.ventas.pedidos;

import com.comerzzia.persistencia.ventas.pedidos.EstadosPedidosVenta;
import com.comerzzia.persistencia.ventas.pedidos.PedidoVentaBean;
import com.comerzzia.servicios.ventas.pedidos.PedidoVentaConstraintViolationException;

public class PedidoVenta extends com.comerzzia.servicios.ventas.pedidos.PedidoVenta {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3841819712107270179L;
	
	
	public PedidoVenta() {
		super();
	}
	public PedidoVenta(PedidoVentaBean pedido) {
		super(pedido);
	}
	
	
	protected PedidoVentaBean getBean() {
		return super.getBean();
	}
	
	@Override
	public void checkPedidoPuedeModificarse() throws PedidoVentaConstraintViolationException {
		if (getEstado() == EstadosPedidosVenta.ESTADO_RECEPTOR_PDTE_ACEPT ||
				getEstado() == EstadosPedidosVenta.ESTADO_RECEPTOR_ACEPTADO ||
				getEstado() == EstadosPedidosVenta.ESTADO_RECEPTOR_PDTE_RECEP ||
				getEstado() == EstadosPedidosVenta.ESTADO_RECEPTOR_RECEPCIONADO ||
				getEstado() == EstadosPedidosVenta.ESTADO_RECEPTOR_RECHAZADO) {
			String mensaje = null;
			
			switch (getEstado()) {
				case EstadosPedidosVenta.ESTADO_RECEPTOR_PDTE_ACEPT:
					mensaje = "La solicitud de aprovisionamiento ya está confirmada";
					break;
				
				case EstadosPedidosVenta.ESTADO_RECEPTOR_ACEPTADO:
					mensaje = "El aprovisionamiento ya está aceptado";
					break;
					
				case EstadosPedidosVenta.ESTADO_RECEPTOR_PDTE_RECEP:
					mensaje = "El aprovisionamiento ya está enviado";
					break;
				
				case EstadosPedidosVenta.ESTADO_RECEPTOR_RECEPCIONADO:
					mensaje = "El aprovisionamiento ya está recepcionado";
					break;
				
				case EstadosPedidosVenta.ESTADO_RECEPTOR_RECHAZADO:
					mensaje = "El aprovisionamiento está rechazado";
					break;
			}
			
			throw new PedidoVentaConstraintViolationException(mensaje);
		}
	}
	
	@Override
	public void checkPedidoPuedeBorrarse() throws PedidoVentaConstraintViolationException {
		this.checkPedidoPuedeModificarse();
	}
}
