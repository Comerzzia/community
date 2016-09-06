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

package com.comerzzia.servicios.tiendavirtual.pedidos;

import java.sql.SQLException;

import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.tiendavirtual.clientes.UsuarioClienteTiendaVirtualBean;
import com.comerzzia.servicios.tiendavirtual.cesta.CestaBean;
import com.comerzzia.servicios.tiendavirtual.clientes.ClienteTiendaVirtualException;
import com.comerzzia.servicios.tiendavirtual.clientes.ClienteTiendaVirtualRegistroException;
import com.comerzzia.servicios.tiendavirtual.clientes.ServicioClientesTiendaVirtual;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioPedidosTiendaVirtual {

	protected static Logger log = Logger.getMLogger(ServicioPedidosTiendaVirtual.class);
	
	public static Long realizarPedido(DatosSesionTiendaVirtualBean datosSesion, UsuarioClienteTiendaVirtualBean usuario, 
			ClienteBean cliente, CestaBean cesta, String codMedioPago) 
			throws PedidoVentaTiendaVirtualException, ClienteTiendaVirtualException, ClienteTiendaVirtualRegistroException{
		Connection conn = new Connection();
		try {
			log.debug("realizarPedido() - Realizando pedido de la tienda virtual.");
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();

			ServicioClientesTiendaVirtual.salvarCliente(conn, datosSesion, cliente, usuario);
			
			PedidoVentaTiendaVirtual pedidoVentaTienda = new PedidoVentaTiendaVirtual();
			pedidoVentaTienda.crearCabeceraPedido(datosSesion, cliente);
			pedidoVentaTienda.setLineasPedido(datosSesion, cesta);
			pedidoVentaTienda.setMedioPago(datosSesion, codMedioPago);
			pedidoVentaTienda.generarPedidoVenta(datosSesion, conn);

			conn.commit();
			conn.finalizaTransaccion();
			
			return pedidoVentaTienda.getIdPedido();
		} 
		catch (SQLException e) {
			conn.deshacerTransaccion();
			log.error("realizarPedido() - " + e.getMessage());
			String mensaje = "Error al realizar el pedido en la tienda virtual: " + e.getMessage();
			throw new PedidoVentaTiendaVirtualException(mensaje, e);
		} 
		catch (PedidoVentaTiendaVirtualException e) {
			conn.deshacerTransaccion();
			String mensaje = "Error al realizar el pedido en la tienda virtual: " + e.getMessage();
			log.error("realizarPedido() - " + mensaje);
			throw new PedidoVentaTiendaVirtualException(mensaje, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}


}
