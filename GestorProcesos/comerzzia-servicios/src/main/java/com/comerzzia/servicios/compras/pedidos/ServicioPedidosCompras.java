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

package com.comerzzia.servicios.compras.pedidos;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.compras.pedidos.ParametrosBuscarPedidosComprasBean;
import com.comerzzia.persistencia.compras.pedidos.PedidosComprasDao;
import com.comerzzia.persistencia.compras.pedidos.articulos.ArticuloPedidoCompraBean;
import com.comerzzia.persistencia.compras.pedidos.articulos.ArticulosPedidosComprasDao;
import com.comerzzia.persistencia.compras.pedidos.impuestos.ImpuestosPedidosComprasDao;
import com.comerzzia.persistencia.compras.pedidos.pagos.PagoPedidoCompraBean;
import com.comerzzia.persistencia.compras.pedidos.pagos.PagosPedidosComprasDao;
import com.comerzzia.persistencia.core.impuestos.ImpuestoBean;
import com.comerzzia.servicios.almacenes.stocks.ServicioStocksAlmacenes;
import com.comerzzia.servicios.almacenes.stocks.StockAlmacenException;
import com.comerzzia.servicios.compras.albaranes.AlbaranCompra;
import com.comerzzia.servicios.compras.albaranes.AlbaranCompraConstraintViolationException;
import com.comerzzia.servicios.compras.albaranes.AlbaranCompraException;
import com.comerzzia.servicios.compras.albaranes.ServicioAlbaranesCompras;
import com.comerzzia.servicios.compras.pedidos.articulos.ArticuloPedidoCompraConstraintViolationException;
import com.comerzzia.servicios.compras.pedidos.articulos.ArticuloPedidoCompraException;
import com.comerzzia.servicios.compras.pedidos.articulos.ServicioArticulosPedidosCompras;
import com.comerzzia.servicios.compras.pedidos.impuestos.ImpuestoPedidoCompraException;
import com.comerzzia.servicios.compras.pedidos.impuestos.ServicioImpuestosPedidosCompras;
import com.comerzzia.servicios.compras.pedidos.pagos.PagoPedidoCompraConstraintViolationException;
import com.comerzzia.servicios.compras.pedidos.pagos.PagoPedidoCompraException;
import com.comerzzia.servicios.compras.pedidos.pagos.ServicioPagosPedidosCompras;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioPedidosCompras {

	protected static Logger log = Logger.getMLogger(ServicioPedidosCompras.class);
	
	public static PaginaResultados consultar(ParametrosBuscarPedidosComprasBean param, DatosSesionBean datosSesion) 
			throws PedidoCompraException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando pedidos");
			conn.abrirConexion(Database.getConnection());
			
			return PedidosComprasDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando pedidos: " +  e.getMessage();
			
            throw new PedidoCompraException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static PedidoCompra consultar(Long idPedido, DatosSesionBean datosSesion) 
			throws PedidoCompraException, PedidoCompraNotFoundException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());

			return consultar(conn, idPedido, datosSesion);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando datos de un pedido: " + e.getMessage();

			throw new PedidoCompraException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static PedidoCompra consultar(Connection conn, Long idPedido, DatosSesionBean datosSesion) 
			throws PedidoCompraException, PedidoCompraNotFoundException {
		try {
			log.debug("consultar() - Consultando datos del pedido: " + idPedido);
			
			PedidoCompra pedido = new PedidoCompra(PedidosComprasDao.consultar(conn, datosSesion.getConfigEmpresa(), idPedido));
			
			if (pedido.getBean() == null) {
				String msg = "No se ha encontrado el pedido con identificador: " + idPedido;
				log.info("consultar() - " + msg);
				
				throw new PedidoCompraNotFoundException(msg);
			}
			else {
				// Obtener la lista de artículos
				pedido.setArticulos(ServicioArticulosPedidosCompras.consultar(conn, idPedido, datosSesion));
				
				// Obtenemos el detalle de impuestos
				pedido.setDetalleImpuestos(ServicioImpuestosPedidosCompras.consultar(conn, idPedido, datosSesion));
				
				// Obtener la lista de pagos
				pedido.setPagos(ServicioPagosPedidosCompras.consultar(conn, idPedido, datosSesion));
			}

			return pedido;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando datos de un pedido: " + e.getMessage();

			throw new PedidoCompraException(mensaje, e);
		}
	}
	
	public static void salvar(PedidoCompra pedido, DatosSesionBean datosSesion) throws PedidoCompraConstraintViolationException, PedidoCompraException {
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
	
	public static void crear(PedidoCompra pedido, DatosSesionBean datosSesion) throws PedidoCompraConstraintViolationException, PedidoCompraException {
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
		
			String msg = "Error creando pedido de compra: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new PedidoCompraException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void crear(Connection conn, PedidoCompra pedido, DatosSesionBean datosSesion) throws PedidoCompraConstraintViolationException, PedidoCompraException {
		try {
			log.debug("crear() - Creando nuevo pedido de compra");
			
			// Establacer identificador y número de pedido
			pedido.setIdPedido(ContadorPedidosCompras.obtenerContadorId(conn));
			pedido.setNumPedido(ContadorPedidosCompras.obtenerContadorPedido(pedido.getCodEmpresa(), pedido.getCodSerie(), pedido.getPeriodo(), conn));
			
			PedidosComprasDao.insert(conn, datosSesion.getConfigEmpresa(), pedido.getBean());
			salvarArticulos(conn, datosSesion, pedido);
			salvarImpuestos(conn, datosSesion, pedido);
			salvarPagos(conn, datosSesion, pedido);
		}
		catch (ContadorException e) {
			log.debug("crear() - deshaciendo transacción");
			conn.deshacerTransaccion();
		
			String msg = "Error creando pedido de compra: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new PedidoCompraException(msg, e);
		}
		catch (SQLException e) {
			log.debug("crear() - deshaciendo transacción");
			conn.deshacerTransaccion();
		
			String msg = "Error creando pedido de compra: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new PedidoCompraException(msg, e);
		}
	}
		
	public static void modificar(PedidoCompra pedido, DatosSesionBean datosSesion) throws PedidoCompraConstraintViolationException, PedidoCompraException {
		Connection conn = new Connection();
		
		// Comprobamos si el pedido se puede modificar
		try {
			PedidoCompra original = ServicioPedidosCompras.consultar(pedido.getIdPedido(), datosSesion);
			original.checkPedidoPuedeModificarse();
		}
		catch (PedidoCompraNotFoundException e) {
			throw new PedidoCompraException("No se ha encontrado el registro");
		}
		
		try {
			log.debug("modificar() - Modificando pedido de compra " + pedido.getIdPedido());
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			PedidosComprasDao.update(conn, datosSesion.getConfigEmpresa(), pedido.getBean());
			salvarArticulos(conn, datosSesion, pedido);
			salvarImpuestos(conn, datosSesion, pedido);
			salvarPagos(conn, datosSesion, pedido);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			log.debug("modificar() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			String msg = "Error modificando pedido de compra: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new PedidoCompraException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
		
	public static void eliminar(Long idPedido, DatosSesionBean datosSesion) throws PedidoCompraConstraintViolationException, PedidoCompraException {
		Connection conn = new Connection();
		
		// Comprobamos si el pedido se puede borrar
		try {
			PedidoCompra pedido = ServicioPedidosCompras.consultar(idPedido, datosSesion);
			pedido.checkPedidoPuedeBorrarse();
		}
		catch (PedidoCompraNotFoundException e) {
			// El pedido ya no existe
			return;
		}
		
		try {
			log.debug("eliminar() - Eliminando pedido de compra " + idPedido);
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			ArticulosPedidosComprasDao.delete(conn, datosSesion.getConfigEmpresa(), idPedido);
			ImpuestosPedidosComprasDao.delete(conn, datosSesion.getConfigEmpresa(), idPedido);
			PagosPedidosComprasDao.delete(conn, datosSesion.getConfigEmpresa(), idPedido);
			PedidosComprasDao.delete(conn, datosSesion.getConfigEmpresa(), idPedido);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch(ForeingKeyConstraintViolationException e){
			log.debug("eliminar() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			log.info("eliminar() - No se ha podido eliminar el pedido de compra: " + e.getMessage());
			throw new PedidoCompraConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			log.debug("eliminar() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			String msg = "Error eliminando pedido de compra: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new PedidoCompraException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	private static void salvarArticulos(Connection conn, DatosSesionBean datosSesion, PedidoCompra pedido)throws ArticuloPedidoCompraException, ArticuloPedidoCompraConstraintViolationException {
		// Obtenemos el max de las líneas del pedido recorriendolas por si no están en orden
		int linea = 0;
		for (ArticuloPedidoCompraBean articulo : pedido.getArticulos()) {
			if (!articulo.isEstadoNuevo()) {
				if (articulo.getLinea() > linea) {
					linea = articulo.getLinea();
				}
			}
		}
		
		// Asignar FK a las líneas y establecer número de línea a los elementos nuevos
		for (ArticuloPedidoCompraBean articulo : pedido.getArticulos()) {
			// Actualizamos FK del objeto
			articulo.setIdPedido(pedido.getIdPedido());
			
			// Si el artículo es nuevo establacemos el número de la línea
			if (articulo.isEstadoNuevo()) {
				articulo.setLinea(++linea);
			}
			
			ServicioArticulosPedidosCompras.salvar(articulo, datosSesion, conn);
		}
	}
	
	private static void cambiarEstadoArticulos(Connection conn, DatosSesionBean datosSesion, PedidoCompra pedido)throws ArticuloPedidoCompraException {
		// Asignar FK a las líneas y establecer número de línea a los elementos nuevos
		for (ArticuloPedidoCompraBean articulo : pedido.getArticulos()) {
			ServicioArticulosPedidosCompras.cambiarEstado(datosSesion, conn, articulo);
		}
	}
	
	private static void salvarImpuestos(Connection conn, DatosSesionBean datosSesion, PedidoCompra pedido)throws ImpuestoPedidoCompraException {
		if (pedido.getEstadoBean() != Estado.NUEVO) {
			// Borramos todos los impuestos
			ServicioImpuestosPedidosCompras.eliminar(pedido.getIdPedido(), datosSesion, conn);
		}
		
		// Grabamos la lista de impuestos
		for (ImpuestoBean impuesto : pedido.getDetalleImpuestos().getListaImpuestos()) {
			// Actualizamos FK del objeto
			impuesto.setIdDocumento(pedido.getIdPedido());
			ServicioImpuestosPedidosCompras.crear(impuesto, datosSesion, conn);
		}
	}
		
	private static void salvarPagos(Connection conn, DatosSesionBean datosSesion, PedidoCompra pedido)throws PagoPedidoCompraException, PagoPedidoCompraConstraintViolationException {
		// Obtenemos el max de las líneas del pedido recorriendolas por si no están en orden
		int linea = 0;
		for (PagoPedidoCompraBean pago : pedido.getPagos()) {
			if (!pago.isEstadoNuevo()) {
				if (pago.getLinea() > linea) {
					linea = pago.getLinea();
				}
			}
		}
		
		// Asignar FK a las líneas y establecer número de línea a los elementos nuevos
		for (PagoPedidoCompraBean pago : pedido.getPagos()) {
			// Actualizamos FK del objeto
			pago.setIdPedido(pedido.getIdPedido());
			
			// Si el pago es nuevo establacemos el número de la línea
			if (pago.isEstadoNuevo()) {
				pago.setLinea(++linea);
			}
			
			ServicioPagosPedidosCompras.salvar(pago, datosSesion, conn);
		}
	}
	
	public static void confirmarSolicitudPedido(DatosSesionBean datosSesion, Long idPedido) throws PedidoCompraException, PedidoCompraConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("confirmarSolicitudPedido() - Iniciando proceso de confirmación de solicitud del pedido " + idPedido);
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			// Obtener el pedido de compras e inicializar el concepto de almacén, necesario para saber cuál será el estado en el que quedará el pedido
			PedidoCompra pedido = consultar(conn, idPedido, datosSesion);
			pedido.setConceptoAlmacen(pedido.getCodConceptoAlmacen(), pedido.getCodAlmacen(), datosSesion);
			
			// Confirmamos la solicitud de pedido
			confirmarSolicitudPedido(datosSesion, conn, pedido);
			
			conn.commit();
			conn.finalizaTransaccion();
			
			log.debug("confirmarSolicitudPedido() - Finalizado proceso de confirmación de solicitud del pedido " + idPedido);
		}
		catch (SQLException e) {
			String msg = "Error confirmando solicitud de pedido de compra: " + e.getMessage();
			log.error("confirmarSolicitudPedido() - " + msg);
			
			throw new PedidoCompraException(msg, e);
		}
		catch (PedidoCompraNotFoundException e) {
			String msg = "Error confirmando solicitud de pedido de compra: " + e.getMessage();
			log.error("confirmarSolicitudPedido() - " + msg);
			
			throw new PedidoCompraException(msg, e);
		}
		catch (PedidoCompraException e) {
			String msg = "Error confirmando solicitud de pedido de compra: " + e.getMessage();
			log.error("confirmarSolicitudPedido() - " + msg);
			
			throw e;
		}
		catch (PedidoCompraConstraintViolationException e) {
			String msg = "Error confirmando solicitud de pedido de compra: " + e.getMessage();
			log.error("confirmarSolicitudPedido() - " + msg);
			
			throw e;
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	private static void confirmarSolicitudPedido(DatosSesionBean datosSesion, Connection conn, PedidoCompra pedido) 
			throws PedidoCompraException, PedidoCompraConstraintViolationException {
		try {
			log.debug("confirmarSolicitudPedido() - Cambiando el estado en función de la configuración del concepto de almacén");
			
			// Pasamos el Pedido a Pendiente de Aceptación
			pedido.setEstadoPendienteAceptacion();
			
			// Salvar los cambios que haya sufrido el pedido y sus líneas
			log.debug("confirmarSolicitudPedido() - Guardando cambios realizandos sobre el pedido");
			PedidosComprasDao.cambiarEstado(conn, datosSesion.getConfigEmpresa(), pedido.getBean());
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
			String msg = "Error confirmando solicitud de pedido de compra: " + e.getMessage();
			log.error("confirmarSolicitudPedido() - " + msg);
			
			throw new PedidoCompraException(msg, e);
		}
	}
	
	public static void aceptarMultiplesPedidos(DatosSesionBean datosSesion, List<Long> idsPedido) throws PedidoCompraException, PedidoCompraConstraintViolationException {
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
			String msg = "Error aceptando múltiples pedidos de compra: " + e.getMessage();
			log.error("aceptarMultiplesPedidos() - " + msg);
			
			throw new PedidoCompraException(msg, e);
		}
		catch (PedidoCompraException e) {
			log.debug("aceptarMultiplesPedidos() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		catch (PedidoCompraConstraintViolationException e) {
			log.debug("aceptarMultiplesPedidos() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void aceptarPedido(DatosSesionBean datosSesion, Long idPedido) throws PedidoCompraException, PedidoCompraConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			aceptarPedido(datosSesion, conn, idPedido);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			String msg = "Error aceptando pedido de compra: " + e.getMessage();
			log.error("aceptarPedido() - " + msg);
			
			throw new PedidoCompraException(msg, e);
		}
		catch (PedidoCompraException e) {
			log.debug("aceptarPedido() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		catch (PedidoCompraConstraintViolationException e) {
			log.debug("aceptarPedido() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void aceptarPedido(DatosSesionBean datosSesion, Connection conn, PedidoCompra pedido) throws PedidoCompraException, PedidoCompraConstraintViolationException {
		try {
			log.debug("aceptarPedido() - Iniciando proceso de aceptación del pedido " + pedido.getIdPedido());

			// Comprobar si el pedido es aceptable
			log.debug("aceptarPedido() - Comprobando si el pedido puede ser aceptado");
			pedido.checkPedidoPuedeAceptarse();
			
			// Cambiar el estado del pedido completo
			log.debug("aceptarPedido() - Cambiando el estado del pedido al completo");
			pedido.setEstadoPendienteRecepcion();
			
			// Actualizar el stock pendiente de servir del almacén afectado
			log.debug("aceptarPedido() - Actualizando stocks de los artículos del pedido");
			for(ArticuloPedidoCompraBean articulo : pedido.getArticulos()) {
				// Obtener únicamente la cantidad aceptada si la línea está aceptada(PDTE. RECEP)
				if(pedido.isEstaLineaPendienteRecepcion(articulo)) {
					// Actualizar el stock pendiente de recibir en el almacén afectado
					ServicioStocksAlmacenes.sumarStockPendienteRecibir(conn, pedido.getCodAlmacen(), articulo, datosSesion);
				}
			}
			
			// Salvar los cambios que haya sufrido el pedido y sus líneas
			log.debug("aceptarPedido() - Guardando cambios realizandos sobre el pedido");
			PedidosComprasDao.update(conn, datosSesion.getConfigEmpresa(), pedido.getBean());
			salvarArticulos(conn, datosSesion, pedido);
			
			log.debug("aceptarPedido() - Finalizado proceso de aceptación del pedido " + pedido.getIdPedido());
		}
		catch (PedidoCompraException e) {
			String msg = "Error aceptando pedido de compra: " + e.getMessage();
			log.error("aceptarPedido() - " + msg);
			
			throw e;
		}
		catch (PedidoCompraConstraintViolationException e) {
			String msg = "Error aceptando pedido de compra: " + e.getMessage();
			log.error("aceptarPedido() - " + msg);
			
			throw e;
		}
		catch (StockAlmacenException e) {
			String msg = "Error aceptando pedido de compra: " + e.getMessage();
			log.error("aceptarPedido() - " + msg);
			
			throw new PedidoCompraException(msg, e);
		}
		catch (SQLException e) {
			String msg = "Error aceptando pedido de compra: " + e.getMessage();
			log.error("aceptarPedido() - " + msg);
			
			throw new PedidoCompraException(msg, e);
		}
	}
	
	public static void aceptarPedido(DatosSesionBean datosSesion, Connection conn, Long idPedido) throws PedidoCompraException, PedidoCompraConstraintViolationException {
		try {
			log.debug("aceptarPedido() - Iniciando proceso de aceptación del pedido " + idPedido);
			
			// Obtener el pedido de compras
			PedidoCompra pedido = consultar(conn, idPedido, datosSesion);
			
			aceptarPedido(datosSesion, conn, pedido);
		}
		catch (PedidoCompraNotFoundException e) {
			String msg = "Error aceptando pedido de compra: " + e.getMessage();
			log.error("aceptarPedido() - " + msg);
			
			throw new PedidoCompraException(msg, e);
		}
		catch (PedidoCompraException e) {
			String msg = "Error aceptando pedido de compra: " + e.getMessage();
			log.error("aceptarPedido() - " + msg);
			
			throw e;
		}
		catch (PedidoCompraConstraintViolationException e) {
			String msg = "Error aceptando pedido de compra: " + e.getMessage();
			log.error("aceptarPedido() - " + msg);
			
			throw e;
		}
	}
	
	public static void recepcionarMultiplesPedidos(DatosSesionBean datosSesion, List<Long> idsPedido, Date fechaSuministro) throws PedidoCompraException, PedidoCompraConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			for (Long idPedido : idsPedido) {
				recepcionarPedido(datosSesion, conn, idPedido, fechaSuministro);
			}
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			String msg = "Error recepcionando múltiples pedidos de compra: " + e.getMessage();
			log.error("recepcionarMultiplesPedidos() - " + msg);
			
			throw new PedidoCompraException(msg, e);
		}
		catch (PedidoCompraException e) {
			log.debug("recepcionarMultiplesPedidos() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		catch (PedidoCompraConstraintViolationException e) {
			log.debug("recepcionarMultiplesPedidos() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void recepcionarPedido(DatosSesionBean datosSesion, Long idPedido, Date fechaSuministro) throws PedidoCompraException, PedidoCompraConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			recepcionarPedido(datosSesion, conn, idPedido, fechaSuministro);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			String msg = "Error recepcionando pedido de compra: " + e.getMessage();
			log.error("recepcionarPedido() - " + msg);
			
			throw new PedidoCompraException(msg, e);
		}
		catch (PedidoCompraException e) {
			log.debug("recepcionarPedido() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		catch (PedidoCompraConstraintViolationException e) {
			log.debug("recepcionarPedido() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void recepcionarPedido(DatosSesionBean datosSesion, Connection conn, Long idPedido, Date fechaSuministro) throws PedidoCompraException, PedidoCompraConstraintViolationException {
		try {
			log.debug("recepcionarPedido() - Iniciando proceso de recepción del pedido " + idPedido);
			
			// Obtener el pedido de compras e inicializar el concepto de almacén necesario para saber si generar pedido de faltas o no
			PedidoCompra pedido = consultar(conn, idPedido, datosSesion);
			pedido.setConceptoAlmacen(pedido.getCodConceptoAlmacen(), pedido.getCodAlmacen(), datosSesion);
			
			// Comprobar si el pedido es recepcionable
			log.debug("recepcionarPedido() - Comprobando si el pedido puede ser recepcionado");
			pedido.checkPedidoPuedeRecepcionarse();
			
			// Cambiar el estado del pedido completo
			log.debug("recepcionarPedido() - Cambiando el estado del pedido al completo");
			pedido.setEstadoRecepcionado();
			
			// Generar el albarán
			log.debug("recepcionarPedido() - Generando albarán de compras correspondiente");
			AlbaranCompra albaran = new AlbaranCompra(datosSesion, pedido, fechaSuministro);
			ServicioAlbaranesCompras.crear(conn, albaran, datosSesion);
			
			// Actualizar stocks
			log.debug("recepcionarPedido() - Actualizando stocks de los artículos del pedido");
			for (ArticuloPedidoCompraBean articulo : pedido.getArticulos()) {
				// Tener en cuenta únicamente los artículos que estén recepcionados
				if(pedido.isEstaLineaRecepcionada(articulo)) {
					// Actualizar el stock pendiente de recibir del almacén afectado
					ServicioStocksAlmacenes.restarStockPendienteRecibir(conn, pedido.getCodAlmacen(), articulo, datosSesion);
				}
			}
			
			// Generar pedido de faltas si el concepto de almacén lo indica y si el pedido no está completo
			if (pedido.getConceptoAlmacen().isSolicitudGenerarFaltas()) {
				generarPedidoFaltas(datosSesion, conn, pedido, fechaSuministro);
			}
			
			// Salvar los cambios que haya sufrido el pedido y sus líneas
			log.debug("recepcionarPedido() - Guardando cambios realizandos sobre el pedido");
			PedidosComprasDao.update(conn, datosSesion.getConfigEmpresa(), pedido.getBean());
			salvarArticulos(conn, datosSesion, pedido);
			
			log.debug("recepcionarPedido() - Finalizado proceso de recepción del pedido " + idPedido);
		}
		catch (PedidoCompraNotFoundException e) {
			String msg = "Error recepcionando pedido de compra: " + e.getMessage();
			log.error("recepcionarPedido() - " + msg);
			
			throw new PedidoCompraException(msg, e);
		}
		catch (PedidoCompraException e) {
			String msg = "Error recepcionando pedido de compra: " + e.getMessage();
			log.error("recepcionarPedido() - " + msg);
			
			throw e;
		}
		catch (PedidoCompraConstraintViolationException e) {
			String msg = "Error recepcionando pedido de compra: " + e.getMessage();
			log.error("recepcionarPedido() - " + msg);
			
			throw e;
		}
		catch (AlbaranCompraException e) {
			String msg = "Error recepcionando pedido de compra: " + e.getMessage();
			log.error("servirPedido() - " + msg);
			
			throw new PedidoCompraException(msg, e);
		}
		catch (AlbaranCompraConstraintViolationException e) {
			String msg = "Error recepcionando pedido de compra: " + e.getMessage();
			log.error("servirPedido() - " + msg);
			
			throw new PedidoCompraConstraintViolationException(e.getMessage(), e);
		}
		catch (StockAlmacenException e) {
			String msg = "Error recepcionando pedido de compra: " + e.getMessage();
			log.error("recepcionarPedido() - " + msg);
			
			throw new PedidoCompraException(msg, e);
		}
		catch (SQLException e) {
			String msg = "Error recepcionando pedido de compra: " + e.getMessage();
			log.error("recepcionarPedido() - " + msg);
			
			throw new PedidoCompraException(msg, e);
		}
	}
	
	private static void generarPedidoFaltas(DatosSesionBean datosSesion, Connection conn, PedidoCompra pedidoOrigen, Date fechaSuministro) throws PedidoCompraException, PedidoCompraConstraintViolationException {
		try {
			log.debug("generarPedidoFaltas() - Generando pedido de faltas a partir del pedido " + pedidoOrigen.getIdPedido());
			
			// Obtener el pedido de faltas
			PedidoCompra pedidoFaltas = pedidoOrigen.generarPedidoFaltas(datosSesion, pedidoOrigen, fechaSuministro);
			
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
		catch (PedidoCompraException e) {
			String msg = "Error generando pedido de faltas: " + e.getMessage();
			log.error("generarPedidoFaltas() - " + msg);
			
			throw e;
		}
		catch (PedidoCompraConstraintViolationException e) {
			String msg = "Error generando pedido de faltas: " + e.getMessage();
			log.error("generarPedidoFaltas() - " + msg);
			
			throw e;
		}
	}
}
