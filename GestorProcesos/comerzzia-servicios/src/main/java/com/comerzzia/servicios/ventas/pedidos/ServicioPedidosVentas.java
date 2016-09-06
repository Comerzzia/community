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

package com.comerzzia.servicios.ventas.pedidos;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.core.impuestos.ImpuestoBean;
import com.comerzzia.persistencia.ventas.pedidos.ParametrosBuscarPedidosVentasBean;
import com.comerzzia.persistencia.ventas.pedidos.PedidosVentasDao;
import com.comerzzia.persistencia.ventas.pedidos.articulos.ArticuloPedidoVentaBean;
import com.comerzzia.persistencia.ventas.pedidos.articulos.ArticulosPedidosVentasDao;
import com.comerzzia.persistencia.ventas.pedidos.impuestos.ImpuestosPedidosVentasDao;
import com.comerzzia.persistencia.ventas.pedidos.pagos.PagoPedidoVentaBean;
import com.comerzzia.persistencia.ventas.pedidos.pagos.PagosPedidosVentasDao;
import com.comerzzia.servicios.almacenes.stocks.ServicioStocksAlmacenes;
import com.comerzzia.servicios.almacenes.stocks.StockAlmacenException;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.albaranes.AlbaranVenta;
import com.comerzzia.servicios.ventas.albaranes.AlbaranVentaConstraintViolationException;
import com.comerzzia.servicios.ventas.albaranes.AlbaranVentaException;
import com.comerzzia.servicios.ventas.albaranes.ServicioAlbaranesVentas;
import com.comerzzia.servicios.ventas.pedidos.articulos.ArticuloPedidoVentaConstraintViolationException;
import com.comerzzia.servicios.ventas.pedidos.articulos.ArticuloPedidoVentaException;
import com.comerzzia.servicios.ventas.pedidos.articulos.ServicioArticulosPedidosVentas;
import com.comerzzia.servicios.ventas.pedidos.impuestos.ImpuestoPedidoVentaException;
import com.comerzzia.servicios.ventas.pedidos.impuestos.ServicioImpuestosPedidosVentas;
import com.comerzzia.servicios.ventas.pedidos.pagos.PagoPedidoVentaConstraintViolationException;
import com.comerzzia.servicios.ventas.pedidos.pagos.PagoPedidoVentaException;
import com.comerzzia.servicios.ventas.pedidos.pagos.ServicioPagosPedidosVentas;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioPedidosVentas {

	protected static Logger log = Logger.getMLogger(ServicioPedidosVentas.class);
	
	
	public static PaginaResultados consultar(ParametrosBuscarPedidosVentasBean param, DatosSesionBean datosSesion) 
			throws PedidoVentaException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando pedidos");
			conn.abrirConexion(Database.getConnection());
			
			return PedidosVentasDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando pedidos: " +  e.getMessage();
			
            throw new PedidoVentaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static PedidoVenta consultar(Long idPedido, DatosSesionBean datosSesion) 
			throws PedidoVentaException, PedidoVentaNotFoundException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());

			return consultar(conn, idPedido, datosSesion);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando datos de un pedido: " + e.getMessage();

			throw new PedidoVentaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static PedidoVenta consultar(Connection conn, Long idPedido, DatosSesionBean datosSesion) 
			throws PedidoVentaException, PedidoVentaNotFoundException {
		try {
			log.debug("consultar() - Consultando datos del pedido: " + idPedido);
			
			PedidoVenta pedido = new PedidoVenta(PedidosVentasDao.consultar(conn, datosSesion.getConfigEmpresa(), idPedido));
			
			if (pedido.getBean() == null) {
				String msg = "No se ha encontrado el pedido con identificador: " + idPedido;
				log.info("consultar() - " + msg);
				
				throw new PedidoVentaNotFoundException(msg);
			}
			else {
				// Obtener la lista de artículos
				pedido.setArticulos(ServicioArticulosPedidosVentas.consultar(conn, idPedido, datosSesion));
				
				// Obtenemos el detalle de impuestos
				pedido.setDetalleImpuestos(ServicioImpuestosPedidosVentas.consultar(conn, idPedido, datosSesion));
				
				// Obtener la lista de pagos
				pedido.setPagos(ServicioPagosPedidosVentas.consultar(conn, idPedido, datosSesion));
			}

			return pedido;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando datos de un pedido: " + e.getMessage();

			throw new PedidoVentaException(mensaje, e);
		}
	}
	
	public static void salvar(PedidoVenta pedido, DatosSesionBean datosSesion) throws PedidoVentaConstraintViolationException, PedidoVentaException {
		switch (pedido.getEstadoBean()) {
			case Estado.NUEVO:
				crear(pedido, datosSesion);
			    break;
			case Estado.MODIFICADO:
				modificar(pedido, datosSesion);
				break;
			    
			case Estado.BORRADO:
				eliminar(pedido.getIdPedido(), datosSesion);
		}
	}
	
	public static void crear(PedidoVenta pedido, DatosSesionBean datosSesion) throws PedidoVentaConstraintViolationException, PedidoVentaException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			crear(conn, pedido, datosSesion);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			log.debug("crear() - deshaciendo transacción");
			conn.deshacerTransaccion();
		
			String msg = "Error creando pedido de venta: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void crear(Connection conn, PedidoVenta pedido, DatosSesionBean datosSesion) throws PedidoVentaConstraintViolationException, PedidoVentaException {
		try {
			log.debug("crear() - Creando nuevo pedido de venta");
			
			// Establacer identificador y número de albarán
			pedido.setIdPedido(ContadorPedidosVentas.obtenerContadorId(conn));
			pedido.setNumPedido(ContadorPedidosVentas.obtenerContadorPedido(pedido.getCodEmpresa(), pedido.getCodSerie(), pedido.getPeriodo(), conn));
			
			PedidosVentasDao.insert(conn, datosSesion.getConfigEmpresa(), pedido.getBean());
			salvarArticulos(conn, datosSesion, pedido);
			salvarImpuestos(conn, datosSesion, pedido);
			salvarPagos(conn, datosSesion, pedido);
		}
		catch (ContadorException e) {
			log.debug("crear() - deshaciendo transacción");
			conn.deshacerTransaccion();
		
			String msg = "Error creando pedido de venta: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
		catch (SQLException e) {
			log.debug("crear() - deshaciendo transacción");
			conn.deshacerTransaccion();
		
			String msg = "Error creando pedido de venta: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
	}
		
	public static void modificar(PedidoVenta pedido, DatosSesionBean datosSesion) throws PedidoVentaConstraintViolationException, PedidoVentaException {
		Connection conn = new Connection();
		
		// Comprobamos si el pedido se puede modificar
		try {
			PedidoVenta original = ServicioPedidosVentas.consultar(pedido.getIdPedido(), datosSesion);
			original.checkPedidoPuedeModificarse();
		}
		catch (PedidoVentaNotFoundException e) {
			throw new PedidoVentaException("No se ha encontrado el registro");
		}
		
		try {
			log.debug("modificar() - Modificando pedido de venta " + pedido.getIdPedido());
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			PedidosVentasDao.update(conn, datosSesion.getConfigEmpresa(), pedido.getBean());
			salvarArticulos(conn, datosSesion, pedido);
			salvarImpuestos(conn, datosSesion, pedido);
			salvarPagos(conn, datosSesion, pedido);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			log.debug("modificar() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			String msg = "Error modificando pedido de venta: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
		
	public static void eliminar(Long idPedido, DatosSesionBean datosSesion) throws PedidoVentaConstraintViolationException, PedidoVentaException {
		Connection conn = new Connection();
		
		// Comprobamos si el pedido se puede borrar
		try {
			PedidoVenta pedido = ServicioPedidosVentas.consultar(idPedido, datosSesion);
			pedido.checkPedidoPuedeBorrarse();
		}
		catch (PedidoVentaNotFoundException e) {
			// El albarán ya no existe
			return;
		}
		
		try {
			log.debug("eliminar() - Eliminando pedido de venta " + idPedido);
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			ArticulosPedidosVentasDao.delete(conn, datosSesion.getConfigEmpresa(), idPedido);
			ImpuestosPedidosVentasDao.delete(conn, datosSesion.getConfigEmpresa(), idPedido);
			PagosPedidosVentasDao.delete(conn, datosSesion.getConfigEmpresa(), idPedido);
			PedidosVentasDao.delete(conn, datosSesion.getConfigEmpresa(), idPedido);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch(ForeingKeyConstraintViolationException e){
			log.debug("eliminar() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			log.info("eliminar() - No se ha podido eliminar el pedido de venta: " + e.getMessage());
			throw new PedidoVentaConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			log.debug("eliminar() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			String msg = "Error eliminando pedido de venta: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	private static void salvarArticulos(Connection conn, DatosSesionBean datosSesion, PedidoVenta pedido)throws ArticuloPedidoVentaException, ArticuloPedidoVentaConstraintViolationException {
		// Obtenemos el max de las líneas del pedido recorriendolas por si no están en orden
		int linea = 0;
		for (ArticuloPedidoVentaBean articulo : pedido.getArticulos()) {
			if (!articulo.isEstadoNuevo()) {
				if (articulo.getLinea() > linea) {
					linea = articulo.getLinea();
				}
			}
		}
		
		// Asignar FK a las líneas y establecer número de línea a los elementos nuevos
		for (ArticuloPedidoVentaBean articulo : pedido.getArticulos()) {
			// Actualizamos FK del objeto
			articulo.setIdPedido(pedido.getIdPedido());
			
			// Si el artículo es nuevo establacemos el número de la línea
			if (articulo.isEstadoNuevo()) {
				articulo.setLinea(++linea);
			}
			
			ServicioArticulosPedidosVentas.salvar(articulo, datosSesion, conn);
		}
	}
	
	private static void cambiarEstadoArticulos(Connection conn, DatosSesionBean datosSesion, PedidoVenta pedido)throws ArticuloPedidoVentaException {
		// Asignar FK a las líneas y establecer número de línea a los elementos nuevos
		for (ArticuloPedidoVentaBean articulo : pedido.getArticulos()) {
			ServicioArticulosPedidosVentas.cambiarEstado(datosSesion, conn, articulo);
		}
	}
	
	private static void salvarImpuestos(Connection conn, DatosSesionBean datosSesion, PedidoVenta pedido)throws ImpuestoPedidoVentaException {
		if (pedido.getEstadoBean() != Estado.NUEVO) {
			// Borramos todos los impuestos
			ServicioImpuestosPedidosVentas.eliminar(pedido.getIdPedido(), datosSesion, conn);
		}
		
		// Grabamos la lista de impuestos
		for (ImpuestoBean impuesto : pedido.getDetalleImpuestos().getListaImpuestos()) {
			// Actualizamos FK del objeto
			impuesto.setIdDocumento(pedido.getIdPedido());
			ServicioImpuestosPedidosVentas.crear(impuesto, datosSesion, conn);
		}
	}
		
	private static void salvarPagos(Connection conn, DatosSesionBean datosSesion, PedidoVenta pedido)throws PagoPedidoVentaException, PagoPedidoVentaConstraintViolationException {
		// Obtenemos el max de las líneas del pedido recorriendolas por si no están en orden
		int linea = 0;
		for (PagoPedidoVentaBean pago : pedido.getPagos()) {
			if (!pago.isEstadoNuevo()) {
				if (pago.getLinea() > linea) {
					linea = pago.getLinea();
				}
			}
		}
		
		// Asignar FK a las líneas y establecer número de línea a los elementos nuevos
		for (PagoPedidoVentaBean pago : pedido.getPagos()) {
			// Actualizamos FK del objeto
			pago.setIdPedido(pedido.getIdPedido());
			
			// Si el pago es nuevo establacemos el número de la línea
			if (pago.isEstadoNuevo()) {
				pago.setLinea(++linea);
			}
			
			ServicioPagosPedidosVentas.salvar(pago, datosSesion, conn);
		}
	}
	
	
	public static void confirmarSolicitudPedido(DatosSesionBean datosSesion, Long idPedido) throws PedidoVentaException, PedidoVentaConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("confirmarSolicitudPedido() - Iniciando proceso de confirmación de solicitud del pedido " + idPedido);
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			// Obtener el pedido de ventas e inicializar el concepto de almacén, necesario para saber cuál será el estado en el que quedará el pedido
			PedidoVenta pedido = consultar(conn, idPedido, datosSesion);
			pedido.setCliente(pedido.getCodCliente(), datosSesion);
			pedido.setConceptoAlmacen(pedido.getCodConceptoAlmacen(), pedido.getCodAlmacen(), datosSesion);
			
			// Confirmamos la solicitud de pedido
			confirmarSolicitudPedido(datosSesion, conn, pedido);
			
			conn.commit();
			conn.finalizaTransaccion();
			
			log.debug("confirmarSolicitudPedido() - Finalizado proceso de confirmación de solicitud del pedido " + idPedido);
		}
		catch (SQLException e) {
			String msg = "Error confirmando solicitud de pedido de venta: " + e.getMessage();
			log.error("confirmarSolicitudPedido() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
		catch (PedidoVentaNotFoundException e) {
			String msg = "Error confirmando solicitud de pedido de venta: " + e.getMessage();
			log.error("confirmarSolicitudPedido() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
		catch (PedidoVentaException e) {
			String msg = "Error confirmando solicitud de pedido de venta: " + e.getMessage();
			log.error("confirmarSolicitudPedido() - " + msg);
			
			throw e;
		}
		catch (PedidoVentaConstraintViolationException e) {
			String msg = "Error confirmando solicitud de pedido de venta: " + e.getMessage();
			log.error("confirmarSolicitudPedido() - " + msg);
			
			throw e;
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	private static void confirmarSolicitudPedido(DatosSesionBean datosSesion, Connection conn, PedidoVenta pedido) 
			throws PedidoVentaException, PedidoVentaConstraintViolationException {
		try {
			log.debug("confirmarSolicitudPedido() - Cambiando el estado en función de la configuración del concepto de almacén");
			
			// Pasamos el Pedido a Pendiente de Aceptación
			pedido.setEstadoPendienteAceptacion();
			
			// Salvar los cambios que haya sufrido el pedido y sus líneas
			log.debug("confirmarSolicitudPedido() - Guardando cambios realizandos sobre el pedido");
			PedidosVentasDao.cambiarEstado(conn, datosSesion.getConfigEmpresa(), pedido.getBean());
			cambiarEstadoArticulos(conn, datosSesion, pedido);
			
			// Aceptamos el pedido completo si el concepto de almacén dice que se acepta automáticamente
			if(pedido.getConceptoAlmacen().isSolicitudAceptacionAutomatico()) {
				log.debug("confirmarSolicitudPedido() - El pedido será directamente aceptado...");
				
				// Aceptamos todas las cantidades solicitadas del pedido
				pedido.aceptarLineasCompleto();
				
				aceptarPedido(datosSesion, conn, pedido);
			}
		} 
		catch (SQLException e) {
			String msg = "Error confirmando solicitud de pedido de venta: " + e.getMessage();
			log.error("confirmarSolicitudPedido() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
	}
	
	
	public static void aceptarMultiplesPedidos(DatosSesionBean datosSesion, List<Long> idsPedido) throws PedidoVentaException, PedidoVentaConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			for (Long idPedido : idsPedido) {
				aceptarPedido(datosSesion, conn, idPedido);
			}
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			String msg = "Error aceptando múltiples pedidos de venta: " + e.getMessage();
			log.error("aceptarMultiplesPedidos() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
		catch (PedidoVentaException e) {
			log.debug("aceptarMultiplesPedidos() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		catch (PedidoVentaConstraintViolationException e) {
			log.debug("aceptarMultiplesPedidos() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void aceptarPedido(DatosSesionBean datosSesion, Long idPedido) throws PedidoVentaException, PedidoVentaConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			aceptarPedido(datosSesion, conn, idPedido);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			String msg = "Error aceptando pedido de venta: " + e.getMessage();
			log.error("aceptarPedido() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
		catch (PedidoVentaException e) {
			log.debug("aceptarPedido() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		catch (PedidoVentaConstraintViolationException e) {
			log.debug("aceptarPedido() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void aceptarPedido(DatosSesionBean datosSesion, Connection conn, PedidoVenta pedido) throws PedidoVentaException, PedidoVentaConstraintViolationException {
		try {
			log.debug("aceptarPedido() - Iniciando proceso de aceptación del pedido " + pedido.getIdPedido());

			// Comprobar si el pedido es aceptable
			log.debug("aceptarPedido() - Comprobando si el pedido puede ser aceptado");
			pedido.checkPedidoPuedeAceptarse();
			
			// Cambiar el estado del pedido completo
			log.debug("aceptarPedido() - Cambiando el estado del pedido al completo");
			pedido.setEstadoPendientePreparacion();
			
			// Actualizar el stock pendiente de servir del almacén afectado
			log.debug("aceptarPedido() - Actualizando stocks de los artículos del pedido");
			for(ArticuloPedidoVentaBean articulo : pedido.getArticulos()) {
				// Obtener únicamente la cantidad aceptada si la línea está aceptada(PDTE. PREPARACION)
				if(pedido.isEstaLineaPendientePreparacion(articulo)) {
					// Actualizar el stock pendiente de servir en el almacén afectado
					ServicioStocksAlmacenes.sumarStockPendienteServir(conn, pedido.getCodAlmacen(), articulo, datosSesion);
					
					// Si el cliente destino es tienda, actualizar el stock pendiente de recibir en su almacén
					if(pedido.getCliente().isEsTienda()) {
						ServicioStocksAlmacenes.sumarStockPendienteRecibir(conn, pedido.getCliente().getCodAlmacenTienda(), articulo, datosSesion);
					}
				}
			}
			
			// Salvar los cambios que haya sufrido el pedido y sus líneas
			log.debug("aceptarPedido() - Guardando cambios realizandos sobre el pedido");
			PedidosVentasDao.update(conn, datosSesion.getConfigEmpresa(), pedido.getBean());
			salvarArticulos(conn, datosSesion, pedido);
			
			log.debug("aceptarPedido() - Finalizado proceso de aceptación del pedido " + pedido.getIdPedido());
		}
		catch (PedidoVentaException e) {
			String msg = "Error aceptando pedido de venta: " + e.getMessage();
			log.error("aceptarPedido() - " + msg);
			
			throw e;
		}
		catch (PedidoVentaConstraintViolationException e) {
			String msg = "Error aceptando pedido de venta: " + e.getMessage();
			log.error("aceptarPedido() - " + msg);
			
			throw e;
		}
		catch (StockAlmacenException e) {
			String msg = "Error aceptando pedido de venta: " + e.getMessage();
			log.error("aceptarPedido() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
		catch (SQLException e) {
			String msg = "Error aceptando pedido de venta: " + e.getMessage();
			log.error("aceptarPedido() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
	}
	
	
	
	public static void aceptarPedido(DatosSesionBean datosSesion, Connection conn, Long idPedido) throws PedidoVentaException, PedidoVentaConstraintViolationException {
		try {
			log.debug("aceptarPedido() - Iniciando proceso de aceptación del pedido " + idPedido);
			
			// Obtener el pedido de ventas e inicializar el cliente, necesario para saber si éste es una tienda
			PedidoVenta pedido = consultar(conn, idPedido, datosSesion);
			pedido.setCliente(pedido.getCodCliente(), datosSesion);
			
			aceptarPedido(datosSesion, conn, pedido);
		}
		catch (PedidoVentaNotFoundException e) {
			String msg = "Error aceptando pedido de venta: " + e.getMessage();
			log.error("aceptarPedido() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
		catch (PedidoVentaException e) {
			String msg = "Error aceptando pedido de venta: " + e.getMessage();
			log.error("aceptarPedido() - " + msg);
			
			throw e;
		}
		catch (PedidoVentaConstraintViolationException e) {
			String msg = "Error aceptando pedido de venta: " + e.getMessage();
			log.error("aceptarPedido() - " + msg);
			
			throw e;
		}
	}
	
	
	public static void prepararMultiplesPedidos(DatosSesionBean datosSesion, List<Long> idsPedido) throws PedidoVentaException, PedidoVentaConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			for (Long idPedido : idsPedido) {
				prepararPedido(datosSesion, conn, idPedido);
			}
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			String msg = "Error preparando múltiples pedidos de venta: " + e.getMessage();
			log.error("prepararMultiplesPedidos() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
		catch (PedidoVentaException e) {
			log.debug("prepararMultiplesPedidos() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		catch (PedidoVentaConstraintViolationException e) {
			log.debug("prepararMultiplesPedidos() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void prepararPedido(DatosSesionBean datosSesion, Long idPedido) throws PedidoVentaException, PedidoVentaConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			prepararPedido(datosSesion, conn, idPedido);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			String msg = "Error preparando pedido de venta: " + e.getMessage();
			log.error("prepararPedido() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
		catch (PedidoVentaException e) {
			log.debug("prepararPedido() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		catch (PedidoVentaConstraintViolationException e) {
			log.debug("prepararPedido() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void prepararPedido(DatosSesionBean datosSesion, Connection conn, Long idPedido) throws PedidoVentaException, PedidoVentaConstraintViolationException {
		try {
			log.debug("prepararPedido() - Iniciando proceso de preparación del pedido " + idPedido);
			
			// Obtener el pedido de ventas e inicializar el cliente, necesario para saber si éste es una tienda
			PedidoVenta pedido = consultar(conn, idPedido, datosSesion);
			pedido.setCliente(pedido.getCodCliente(), datosSesion);
			
			// Comprobar si el pedido es preparable
			log.debug("prepararPedido() - Comprobando si el pedido puede ser preparado");
			pedido.checkPedidoPuedePrepararse();
			
			// Cambiar el estado del pedido completo
			log.debug("prepararPedido() - Cambiando el estado del pedido al completo");
			pedido.setEstadoPreparado();
			
			// Salvar los cambios que haya sufrido el pedido y sus líneas
			log.debug("prepararPedido() - Guardando cambios realizandos sobre el pedido");
			PedidosVentasDao.update(conn, datosSesion.getConfigEmpresa(), pedido.getBean());
			salvarArticulos(conn, datosSesion, pedido);
			
			log.debug("prepararPedido() - Finalizado proceso de preparación del pedido " + idPedido);
		}
		catch (PedidoVentaNotFoundException e) {
			String msg = "Error preparando pedido de venta: " + e.getMessage();
			log.error("prepararPedido() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
		catch (PedidoVentaException e) {
			String msg = "Error preparando pedido de venta: " + e.getMessage();
			log.error("prepararPedido() - " + msg);
			
			throw e;
		}
		catch (PedidoVentaConstraintViolationException e) {
			String msg = "Error preparando pedido de venta: " + e.getMessage();
			log.error("prepararPedido() - " + msg);
			
			throw e;
		}
		catch (SQLException e) {
			String msg = "Error preparando pedido de venta: " + e.getMessage();
			log.error("prepararPedido() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
	}
	
	
	public static void servirMultiplesPedidos(DatosSesionBean datosSesion, List<Long> idsPedido, Date fechaSuministro) throws PedidoVentaException, PedidoVentaConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			for (Long idPedido : idsPedido) {
				servirPedido(datosSesion, conn, idPedido, fechaSuministro);
			}
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			String msg = "Error sirviendo múltiples pedidos de venta: " + e.getMessage();
			log.error("servirMultiplesPedidos() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
		catch (PedidoVentaException e) {
			log.debug("servirMultiplesPedidos() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		catch (PedidoVentaConstraintViolationException e) {
			log.debug("servirMultiplesPedidos() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void servirPedido(DatosSesionBean datosSesion, Long idPedido, Date fechaSuministro) throws PedidoVentaException, PedidoVentaConstraintViolationException, PedidoVentaNotFoundException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			servirPedido(datosSesion, conn, idPedido, fechaSuministro);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			String msg = "Error sirviendo pedido de venta: " + e.getMessage();
			log.error("servirPedido() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
		catch (PedidoVentaException e) {
			log.debug("servirPedido() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		catch (PedidoVentaConstraintViolationException e) {
			log.debug("servirPedido() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void servirPedido(DatosSesionBean datosSesion, Connection conn, Long idPedido, Date fechaSuministro) throws PedidoVentaException, PedidoVentaConstraintViolationException {
		try {
			log.debug("servirPedido() - Iniciando proceso de servido del pedido " + idPedido);
			
			// Obtener el pedido de ventas e inicializar el cliente y el concepto de almacén, necesarios en procesos posteriores
			PedidoVenta pedido = consultar(conn, idPedido, datosSesion);
			pedido.setCliente(pedido.getCodCliente(), datosSesion);
			pedido.setConceptoAlmacen(pedido.getCodConceptoAlmacen(), pedido.getCodAlmacen(), datosSesion);
			
			// Comprobar si el pedido puede ser servido
			log.debug("servirPedido() - Comprobando si el pedido puede ser servido");
			pedido.checkPedidoPuedeServirse();
			
			// Cambiar el estado del pedido completo
			log.debug("servirPedido() - Cambiando el estado del pedido al completo");
			pedido.setEstadoServido();
			
			// Generar el albarán
			log.debug("servirPedido() - Generando albarán de ventas correspondiente");
			AlbaranVenta albaran = new AlbaranVenta(datosSesion, pedido, fechaSuministro);
			ServicioAlbaranesVentas.crear(albaran, datosSesion, conn);
			
			// Actualizar stocks
			log.debug("servirPedido() - Actualizando stocks de los artículos del pedido");
			for (ArticuloPedidoVentaBean articulo : pedido.getArticulos()) {
				// Tener en cuenta únicamente los artículos que estén servidos
				if(pedido.isEstaLineaServida(articulo)) {
					// Actualizar el stock pendiente de servir del almacén afectado
					ServicioStocksAlmacenes.restarStockPendienteServir(conn, pedido.getCodAlmacen(), articulo, datosSesion);
					
					// Si el cliente es tienda, actualizar el stock pendiente de recibir de su almacén
					if(pedido.getCliente().isEsTienda()) {
						ServicioStocksAlmacenes.restarStockPendienteRecibir(conn, pedido.getCliente().getCodAlmacenTienda(), articulo, datosSesion);
					}
				}
			}
			
			// Generar pedido de faltas si el concepto de almacén lo indica y si el pedido no está completo
			if (pedido.getConceptoAlmacen().isSolicitudGenerarFaltas()) {
				generarPedidoFaltas(datosSesion, conn, pedido, fechaSuministro);
			}
			
			// Salvar el estado del pedido y sus líneas
			log.debug("servirPedido() - Guardando cambios realizandos sobre los estados del pedido");
			PedidosVentasDao.cambiarEstado(conn, datosSesion.getConfigEmpresa(), pedido.getBean());
			salvarArticulos(conn, datosSesion, pedido);
			
			log.debug("servirPedido() - Finalizado proceso de servido del pedido " + idPedido);
		}
		catch (PedidoVentaNotFoundException e) {
			String msg = "Error sirviendo pedido de venta: " + e.getMessage();
			log.error("servirPedido() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
		catch (PedidoVentaException e) {
			String msg = "Error sirviendo pedido de venta: " + e.getMessage();
			log.error("servirPedido() - " + msg);
			
			throw e;
		}
		catch (PedidoVentaConstraintViolationException e) {
			String msg = "Error sirviendo pedido de venta: " + e.getMessage();
			log.error("servirPedido() - " + msg);
			
			throw e;
		}
		catch (AlbaranVentaException e) {
			String msg = "Error sirviendo pedido de venta: " + e.getMessage();
			log.error("servirPedido() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
		catch (AlbaranVentaConstraintViolationException e) {
			String msg = "Error sirviendo pedido de venta: " + e.getMessage();
			log.error("servirPedido() - " + msg);
			
			throw new PedidoVentaConstraintViolationException(e.getMessage(), e);
		}
		catch (StockAlmacenException e) {
			String msg = "Error sirviendo pedido de venta: " + e.getMessage();
			log.error("servirPedido() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
		catch (SQLException e) {
			String msg = "Error sirviendo pedido de venta: " + e.getMessage();
			log.error("servirPedido() - " + msg);
			
			throw new PedidoVentaException(msg, e);
		}
	}
	
	private static void generarPedidoFaltas(DatosSesionBean datosSesion, Connection conn, PedidoVenta pedidoOrigen, Date fechaSuministro) throws PedidoVentaException, PedidoVentaConstraintViolationException {
		try {
			log.debug("generarPedidoFaltas() - Generando pedido de faltas a partir del pedido " + pedidoOrigen.getIdPedido());
			
			// Obtener el pedido de faltas
			PedidoVenta pedidoFaltas = pedidoOrigen.generarPedidoFaltas(datosSesion, pedidoOrigen, fechaSuministro);
			
			// Sólo grabar el pedido de faltas si éste tiene líneas
			if (pedidoFaltas != null && pedidoFaltas.getArticulos().size() > 0) {
				// Creamos la solicitud de pedido de falta
				crear(conn, pedidoFaltas, datosSesion);
				
				// Confirmamos automáticamente la solicitud
				confirmarSolicitudPedido(datosSesion, conn, pedidoFaltas);
				
				log.debug("generarPedidoFaltas() - Pedido de faltas generado con ID " + pedidoFaltas.getIdPedido());
			}
			else {
				log.debug("generarPedidoFaltas() - El pedido de faltas ha sido generado pero no será grabado porque no tiene líneas");
			}
		}
		catch (PedidoVentaException e) {
			String msg = "Error generando pedido de faltas: " + e.getMessage();
			log.error("generarPedidoFaltas() - " + msg);
			
			throw e;
		}
		catch (PedidoVentaConstraintViolationException e) {
			String msg = "Error generando pedido de faltas: " + e.getMessage();
			log.error("generarPedidoFaltas() - " + msg);
			
			throw e;
		}
	}
}
