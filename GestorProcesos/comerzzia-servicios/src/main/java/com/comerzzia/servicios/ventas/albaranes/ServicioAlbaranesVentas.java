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

package com.comerzzia.servicios.ventas.albaranes;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.core.impuestos.ImpuestoBean;
import com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean;
import com.comerzzia.persistencia.ventas.albaranes.AlbaranesVentasDao;
import com.comerzzia.persistencia.ventas.albaranes.ParametrosBuscarAlbaranesVentasBean;
import com.comerzzia.persistencia.ventas.albaranes.articulos.ArticuloAlbaranVentaBean;
import com.comerzzia.persistencia.ventas.albaranes.articulos.ArticulosAlbaranesVentasDao;
import com.comerzzia.persistencia.ventas.albaranes.impuestos.ImpuestosAlbaranesVentasDao;
import com.comerzzia.persistencia.ventas.albaranes.pagos.PagoAlbaranVentaBean;
import com.comerzzia.persistencia.ventas.albaranes.pagos.PagosAlbaranesVentasDao;
import com.comerzzia.servicios.almacenes.stocks.ServicioStocksAlmacenes;
import com.comerzzia.servicios.almacenes.stocks.StockAlmacenException;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.albaranes.articulos.ArticuloAlbaranVentaConstraintViolationException;
import com.comerzzia.servicios.ventas.albaranes.articulos.ArticuloAlbaranVentaException;
import com.comerzzia.servicios.ventas.albaranes.articulos.ServicioArticulosAlbaranesVentas;
import com.comerzzia.servicios.ventas.albaranes.impuestos.ImpuestoAlbaranVentaException;
import com.comerzzia.servicios.ventas.albaranes.impuestos.ServicioImpuestosAlbaranesVentas;
import com.comerzzia.servicios.ventas.albaranes.pagos.PagoAlbaranVentaConstraintViolationException;
import com.comerzzia.servicios.ventas.albaranes.pagos.PagoAlbaranVentaException;
import com.comerzzia.servicios.ventas.albaranes.pagos.ServicioPagosAlbaranesVentas;
import com.comerzzia.servicios.ventas.facturas.FacturaVenta;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioAlbaranesVentas {

	protected static Logger log = Logger.getMLogger(ServicioAlbaranesVentas.class);
	
	public static PaginaResultados consultar(ParametrosBuscarAlbaranesVentasBean param, DatosSesionBean datosSesion)throws AlbaranVentaException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando albaranes de ventas");
			conn.abrirConexion(Database.getConnection());
			
			return AlbaranesVentasDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando albaranes de ventas: " +  e.getMessage();
			
		    throw new AlbaranVentaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static List<AlbaranVentaBean> consultarListaAlbaranes(ParametrosBuscarAlbaranesVentasBean param, DatosSesionBean datosSesion)throws AlbaranVentaException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultarListaAlbaranes() - Consultando lista de albaranes de ventas");
			conn.abrirConexion(Database.getConnection());
			
			List<AlbaranVentaBean> lstAlbaranesVentas = AlbaranesVentasDao.consultarListaAlbaranes(conn, datosSesion.getConfigEmpresa(), param); 
			
			//Para cada albarán obtenemos la lista de artículos, el detalle de impuestos y la lista de pagos
			for (AlbaranVentaBean albaran : lstAlbaranesVentas) {
				// Obtenemos la lista de artículos
				albaran.setArticulos(ServicioArticulosAlbaranesVentas.consultar(albaran.getIdAlbaran(), datosSesion));
				
				// Obtenemos el detalle de impuestos
				albaran.setDetalleImpuestos(ServicioImpuestosAlbaranesVentas.consultar(albaran.getIdAlbaran(), datosSesion));
				
				// Obtener la lista de pagos
				albaran.setPagos(ServicioPagosAlbaranesVentas.consultar(albaran.getIdAlbaran(), datosSesion));
				
			}
			
			return lstAlbaranesVentas;
		}
		catch (SQLException e) {
			log.error("consultarListaAlbaranes() - " + e.getMessage());
			String mensaje = "Error consultando lista de albaranes de ventas: " +  e.getMessage();
			
		    throw new AlbaranVentaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static PaginaResultados consultarAlbaranesVentasNoFacturados(ParametrosBuscarAlbaranesVentasBean param, DatosSesionBean datosSesion)throws AlbaranVentaException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultarAlbaranesVentasNoFacturados() - Consultando albaranes de ventas no facturados");
			conn.abrirConexion(Database.getConnection());
		
			//Si en los parámetros de búsqueda sólo viene un cliente consultamos normal
			if((param.getCodClienteDesde().equals(param.getCodClienteHasta())) || (param.getCodClienteHasta().equals(""))){
				return AlbaranesVentasDao.consultar(conn, datosSesion.getConfigEmpresa(), param);	
			}
			else{
				//Consultamos agrupando por cliente
				//además sumamos las bases y contamos el número de albaranes por agrupación
				return AlbaranesVentasDao.consultarAlbaranesNoFacturadosClientes(conn, datosSesion.getConfigEmpresa(), param);
			}

		}
		catch (SQLException e) {
			log.error("consultarAlbaranesVentasNoFacturados() - " + e.getMessage());
			String mensaje = "Error consultando albaranes de ventas no facturados: " +  e.getMessage();
			
		    throw new AlbaranVentaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static AlbaranVenta consultar(Long idAlbaran, DatosSesionBean datosSesion)throws AlbaranVentaException, AlbaranVentaNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando datos del albaran: " + idAlbaran);
			conn.abrirConexion(Database.getConnection());
		
			AlbaranVenta albaran = new AlbaranVenta(AlbaranesVentasDao.consultar(conn, datosSesion.getConfigEmpresa(), idAlbaran));
			
			if (albaran.getBean() == null) {
				String msg = "No se ha encontrado el albaran con identificador: " + idAlbaran;
				log.info("consultar() - " + msg);
				
				throw new AlbaranVentaNotFoundException(msg);
			}
			else {
				// Obtenemos la lista de artículos
				albaran.setArticulos(ServicioArticulosAlbaranesVentas.consultar(idAlbaran, datosSesion));
				
				// Obtenemos el detalle de impuestos
				albaran.setDetalleImpuestos(ServicioImpuestosAlbaranesVentas.consultar(idAlbaran, datosSesion));
				
				// Obtener la lista de pagos
				albaran.setPagos(ServicioPagosAlbaranesVentas.consultar(idAlbaran, datosSesion));
			}
		
			return albaran;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando datos de un albaran: " + e.getMessage();
		
			throw new AlbaranVentaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void salvar(AlbaranVenta albaran, DatosSesionBean datosSesion) throws AlbaranVentaConstraintViolationException, AlbaranVentaException {
		switch (albaran.getEstadoBean()) {
			case Estado.NUEVO:
				crear(albaran, datosSesion);
				break;
			      
			case Estado.MODIFICADO:
				modificar(albaran, datosSesion);
				break;
			      
			case Estado.BORRADO:
				eliminar(albaran.getIdAlbaran(), datosSesion);
		}
	}
	
	public static void crear(AlbaranVenta albaran, DatosSesionBean datosSesion)throws AlbaranVentaConstraintViolationException, AlbaranVentaException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			crear(albaran, datosSesion, conn);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			log.debug("crear() - deshaciendo transacción");
			conn.deshacerTransaccion();
		
			String msg = "Error creando albarán de venta: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new AlbaranVentaException(msg, e);
		}
		catch (AlbaranVentaException e) {
			log.debug("crear() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		catch (AlbaranVentaConstraintViolationException e) {
			log.debug("crear() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			throw e;
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void crear(AlbaranVenta albaran, DatosSesionBean datosSesion, Connection conn)throws AlbaranVentaConstraintViolationException, AlbaranVentaException {
		try {
			log.debug("crear() - Creando nuevo albarán de venta");
			
			// Establacemos identificador y número de albarán
			albaran.setIdAlbaran(ContadorAlbaranesVentas.obtenerContadorId(conn));
			albaran.setNumAlbaran(ContadorAlbaranesVentas.obtenerContadorAlbaran(albaran.getCodEmpresa(), albaran.getCodSerie(), albaran.getPeriodo(), conn));
			
			AlbaranesVentasDao.insert(conn, datosSesion.getConfigEmpresa(), albaran.getBean());
			salvarArticulos(conn, datosSesion, albaran);
			salvarImpuestos(conn, datosSesion, albaran);
			salvarPagos(conn, datosSesion, albaran);
		}
		catch (ContadorException e) {
			String msg = "Error creando albarán de venta: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new AlbaranVentaException(msg, e);
		}
		catch (SQLException e) {
			String msg = "Error creando albarán de venta: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new AlbaranVentaException(msg, e);
		}
	}
		
	public static void modificar(AlbaranVenta albaran, DatosSesionBean datosSesion)throws AlbaranVentaConstraintViolationException, AlbaranVentaException {
		Connection conn = new Connection();
		
		// Comprobamos si el albarán se puede modificar
		try {
			AlbaranVenta original = ServicioAlbaranesVentas.consultar(albaran.getIdAlbaran(), datosSesion);
			original.checkAlbaranPuedeModificarse();
		}
		catch (AlbaranVentaNotFoundException e) {
			throw new AlbaranVentaException("No se ha encontrado el registro");
		}
		
		try {
			log.debug("modificar() - Modificando albarán de venta " + albaran.getIdAlbaran());
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			AlbaranesVentasDao.update(conn, datosSesion.getConfigEmpresa(), albaran.getBean());
			salvarArticulos(conn, datosSesion, albaran);
			salvarImpuestos(conn, datosSesion, albaran);
			salvarPagos(conn, datosSesion, albaran);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			log.debug("modificar() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			String msg = "Error modificando albarán de venta: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new AlbaranVentaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
		
	public static void eliminar(Long idAlbaran, DatosSesionBean datosSesion)throws AlbaranVentaConstraintViolationException, AlbaranVentaException {
		Connection conn = new Connection();
		
		// Comprobamos si el albarán se puede borrar
		try {
			AlbaranVenta albaran = ServicioAlbaranesVentas.consultar(idAlbaran, datosSesion);
			albaran.checkAlbaranPuedeBorrarse();
		}
		catch (AlbaranVentaNotFoundException e) {
			// El albarán ya no existe
			return;
		}
		
		try {
			log.debug("eliminar() - Eliminando albarán de venta " + idAlbaran);
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			ArticulosAlbaranesVentasDao.delete(conn, datosSesion.getConfigEmpresa(), idAlbaran);
			ImpuestosAlbaranesVentasDao.delete(conn, datosSesion.getConfigEmpresa(), idAlbaran);
			PagosAlbaranesVentasDao.delete(conn, datosSesion.getConfigEmpresa(), idAlbaran);
			AlbaranesVentasDao.delete(conn, datosSesion.getConfigEmpresa(), idAlbaran);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch(ForeingKeyConstraintViolationException e){
			log.debug("eliminar() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			log.info("eliminar() - No se ha podido eliminar el albarán de venta: " + e.getMessage());
			throw new AlbaranVentaConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			log.debug("eliminar() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			String msg = "Error eliminando albarán de venta: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new AlbaranVentaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
		
	private static void salvarArticulos(Connection conn, DatosSesionBean datosSesion, AlbaranVenta albaran)throws ArticuloAlbaranVentaException, ArticuloAlbaranVentaConstraintViolationException {
		
		// Actualizamos stocks de los artículos del albarán en el almacén
		actualizarStocks(conn, datosSesion, albaran);
		
		// Obtenemos el max de las líneas del albaran recorriendolas por si no están en orden
		int linea = 0;
		for (ArticuloAlbaranVentaBean articulo : albaran.getArticulos()) {
			if (!articulo.isEstadoNuevo()) {
				if (articulo.getLinea() > linea) {
					linea = articulo.getLinea();
				}
			}
		}
		
		for (ArticuloAlbaranVentaBean articulo : albaran.getArticulos()) {
			// Actualizamos FK del objeto
			articulo.setIdAlbaran(albaran.getIdAlbaran());
			
			// Si el artículo es nuevo establacemos el número de la línea
			if (articulo.isEstadoNuevo()) {
				articulo.setLinea(++linea);
			}
			
			ServicioArticulosAlbaranesVentas.salvar(articulo, datosSesion, conn);
		}
	}
		
	private static void actualizarStocks(Connection conn, DatosSesionBean datosSesion, AlbaranVenta albaran)throws ArticuloAlbaranVentaException {
		// Actualizamos stock del almacén
		try {
			// Establecer el cliente para asegurar que está inicializado, ya que es necesario para actualizar los stocks
			albaran.setCliente(albaran.getCodCliente(), datosSesion);
			ArticuloAlbaranVentaBean original = null;
			
			for (ArticuloAlbaranVentaBean articulo : albaran.getArticulos()) {
				switch (articulo.getEstadoBean()) {
					// Si la línea es nueva restamos la cantidad al stock del almacén
					case Estado.NUEVO:
						ServicioStocksAlmacenes.restarStock(conn, albaran.getCodAlmacen(), articulo, datosSesion);
						
						// Si el cliente es una tienda y no es la del propio albarán sumar la cantidad al stock de su almacén
						if(albaran.getCliente().isEsTienda() && !albaran.getCliente().getCodAlmacenTienda().equals(albaran.getCodAlmacen())) {
							ServicioStocksAlmacenes.sumarStock(conn, albaran.getCliente().getCodAlmacenTienda(), articulo, datosSesion);
						}
						break;
					
					// Si la línea se ha modificado sumamos la cantidad original y restamos la nueva
					case Estado.MODIFICADO:
						original = ArticulosAlbaranesVentasDao.consultar(conn,datosSesion.getConfigEmpresa(), articulo.getIdAlbaran(), articulo.getLinea());
						
						ServicioStocksAlmacenes.sumarStock(conn, albaran.getCodAlmacen(), original, datosSesion);
						ServicioStocksAlmacenes.restarStock(conn, albaran.getCodAlmacen(), articulo, datosSesion);
						
						// Si el cliente es una tienda y no es la del propio albarán actualizar sus stocks de la misma manera que al almacén afectado
						if(albaran.getCliente().isEsTienda() && !albaran.getCliente().getCodAlmacenTienda().equals(albaran.getCodAlmacen())) {
							ServicioStocksAlmacenes.restarStock(conn, albaran.getCliente().getCodAlmacenTienda(), original, datosSesion);
							ServicioStocksAlmacenes.sumarStock(conn, albaran.getCliente().getCodAlmacenTienda(), articulo, datosSesion);
						}
						
						break;
					
					// Si se ha borrado la línea sumamos la cantidad original de la línea del albarán
					case Estado.BORRADO:
						original = ArticulosAlbaranesVentasDao.consultar(conn, 
								datosSesion.getConfigEmpresa(), articulo.getIdAlbaran(), articulo.getLinea());
						
						ServicioStocksAlmacenes.sumarStock(conn, albaran.getCodAlmacen(), articulo, datosSesion);
						
						// Si el cliente es una tienda y no es la del propio albarán restar la cantidad original al stock de su almacén
						if(albaran.getCliente().isEsTienda() && !albaran.getCliente().getCodAlmacenTienda().equals(albaran.getCodAlmacen())) {
							ServicioStocksAlmacenes.restarStock(conn, albaran.getCliente().getCodAlmacenTienda(), original, datosSesion);
						}
						
						break;
				}
			}
		}
		catch (AlbaranVentaException e) {
			throw new ArticuloAlbaranVentaException("Error al actualizar stock del almacen: " + e.getMessage(), e);
		}
		catch (StockAlmacenException e) {
			throw new ArticuloAlbaranVentaException("Error al actualizar stock del almacen: " + e.getMessage(), e);
		} 
		catch (SQLException e) {
			throw new ArticuloAlbaranVentaException("Error al actualizar stock del almacen: " + e.getMessage(), e);
		}
	}
		
	private static void salvarImpuestos(Connection conn, DatosSesionBean datosSesion, AlbaranVenta albaran)throws ImpuestoAlbaranVentaException {
		if (albaran.getEstadoBean() != Estado.NUEVO) {
			// Borramos todos los impuestos
			ServicioImpuestosAlbaranesVentas.eliminar(albaran.getIdAlbaran(), datosSesion, conn);
		}
		
		// Grabamos la lista de impuestos
		for (ImpuestoBean impuesto : albaran.getDetalleImpuestos().getListaImpuestos()) {
			// Actualizamos FK del objeto
			impuesto.setIdDocumento(albaran.getIdAlbaran());
			ServicioImpuestosAlbaranesVentas.crear(impuesto, datosSesion, conn);
		}
	}
		
	private static void salvarPagos(Connection conn, DatosSesionBean datosSesion, AlbaranVenta albaran)throws PagoAlbaranVentaException, PagoAlbaranVentaConstraintViolationException {
		// Obtenemos el max de las líneas del albarán recorriendolas por si no están en orden
		int linea = 0;
		for (PagoAlbaranVentaBean pago : albaran.getPagos()) {
			if (!pago.isEstadoNuevo()) {
				if (pago.getLinea() > linea) {
					linea = pago.getLinea();
				}
			}
		}
		
		// Asignar FK a las líneas y establecer número de línea a los elementos nuevos
		for (PagoAlbaranVentaBean pago : albaran.getPagos()) {
			// Actualizamos FK del objeto
			pago.setIdAlbaran(albaran.getIdAlbaran());
			
			// Si el pago es nuevo establacemos el número de la línea
			if (pago.isEstadoNuevo()) {
				pago.setLinea(++linea);
			}
			
			ServicioPagosAlbaranesVentas.salvar(pago, datosSesion, conn);
		}
	}

	public static void facturarAlbaranes(Connection conn, DatosSesionBean datosSesion, FacturaVenta factura)throws AlbaranVentaException {
		
		try {
			log.debug("facturarAlbaranes() - Facturando albaranes de venta "); 
			
			for (AlbaranVenta albaran : factura.getAlbaranes()){
				albaran.setIdFacturaRepercutida(factura.getIdFacturaRep());
				AlbaranesVentasDao.actualizarFactura(conn, datosSesion.getConfigEmpresa(), albaran.getBean());
			}
		}
		catch (SQLException e) {
			log.debug("facturarAlbaranes() - deshaciendo transacción.");
			conn.deshacerTransaccion();
			
			String msg = "Error facturando albaranes de venta: " + e.getMessage();
			log.error("facturarAlbaranes() - " + msg);
			
			throw new AlbaranVentaException(msg, e);
		}
		
	}

	public static AlbaranVenta consultarAlbaranPedido(Long idPedido, DatosSesionBean datosSesion) throws AlbaranVentaException, AlbaranVentaNotFoundException{
		Long idAlbaran = null;
		
		log.debug("consultarAlbaranPedido() - Consultando datos albarán de pedido: " + idPedido);
		
		//Primero obtenemos el id del albarán mediante los detalles de este
		List<ArticuloAlbaranVentaBean> lstDetalles = ServicioArticulosAlbaranesVentas.consultarDetallesPedido(idPedido, datosSesion);
		if(lstDetalles.size() > 0){
			idAlbaran = lstDetalles.get(0).getIdAlbaran();
		}
		
		return consultar(idAlbaran, datosSesion);
	}

	public static void modificarTracking(AlbaranVenta albaran, DatosSesionBean datosSesion)throws AlbaranVentaConstraintViolationException, AlbaranVentaException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificarTracking() - Modificando tracking de albarán de venta " + albaran.getIdAlbaran());
			conn.abrirConexion(Database.getConnection());
			
			//Modificamos el tracking
			AlbaranesVentasDao.modificarTracking(conn, datosSesion.getConfigEmpresa(), albaran.getBean());

		}
		catch (SQLException e) {
			String msg = "Error modificando tracking de albarán de venta: " + e.getMessage();
			log.error("modificarTracking() - " + msg);
			
			throw new AlbaranVentaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

}
