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

package com.comerzzia.servicios.compras.albaranes;

import java.sql.SQLException;
import java.util.Date;

import com.comerzzia.persistencia.compras.albaranes.AlbaranesComprasDao;
import com.comerzzia.persistencia.compras.albaranes.ParametrosBuscarAlbaranesComprasBean;
import com.comerzzia.persistencia.compras.albaranes.articulos.ArticuloAlbaranCompraBean;
import com.comerzzia.persistencia.compras.albaranes.articulos.ArticulosAlbaranesComprasDao;
import com.comerzzia.persistencia.compras.albaranes.impuestos.ImpuestosAlbaranesComprasDao;
import com.comerzzia.persistencia.compras.albaranes.pagos.PagoAlbaranCompraBean;
import com.comerzzia.persistencia.compras.albaranes.pagos.PagosAlbaranesComprasDao;
import com.comerzzia.persistencia.core.impuestos.ImpuestoBean;
import com.comerzzia.servicios.almacenes.stocks.ServicioStocksAlmacenes;
import com.comerzzia.servicios.almacenes.stocks.StockAlmacenException;
import com.comerzzia.servicios.compras.albaranes.articulos.ArticuloAlbaranCompraException;
import com.comerzzia.servicios.compras.albaranes.articulos.ArticuloAlbaranComprasConstraintViolationException;
import com.comerzzia.servicios.compras.albaranes.articulos.ServicioArticulosAlbaranesCompras;
import com.comerzzia.servicios.compras.albaranes.impuestos.ImpuestoAlbaranCompraException;
import com.comerzzia.servicios.compras.albaranes.impuestos.ServicioImpuestosAlbaranesCompras;
import com.comerzzia.servicios.compras.albaranes.pagos.PagoAlbaranCompraConstraintViolationException;
import com.comerzzia.servicios.compras.albaranes.pagos.PagoAlbaranCompraException;
import com.comerzzia.servicios.compras.albaranes.pagos.ServicioPagosAlbaranesCompras;
import com.comerzzia.servicios.compras.facturas.FacturaCompra;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.articulos.ArticuloException;
import com.comerzzia.servicios.general.articulos.ServicioArticulos;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioAlbaranesCompras {

	protected static Logger log = Logger.getMLogger(ServicioAlbaranesCompras.class);
	
	
	public static PaginaResultados consultar(ParametrosBuscarAlbaranesComprasBean param, DatosSesionBean datosSesion) 
			throws AlbaranCompraException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando albaranes");
			conn.abrirConexion(Database.getConnection());
			
			return AlbaranesComprasDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando albaranes: " +  e.getMessage();
			
            throw new AlbaranCompraException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static AlbaranCompra consultar(Long idAlbaran, DatosSesionBean datosSesion) 
			throws AlbaranCompraException, AlbaranCompraNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando datos del albaran: " + idAlbaran);
			conn.abrirConexion(Database.getConnection());

			AlbaranCompra albaran = new AlbaranCompra(AlbaranesComprasDao.consultar(conn, datosSesion.getConfigEmpresa(), idAlbaran));
			
			if (albaran.getBean() == null) {
				String msg = "No se ha encontrado el albaran con identificador: " + idAlbaran;
				log.info("consultar() - " + msg);
				
				throw new AlbaranCompraNotFoundException(msg);
			}
			else {
				// Obtenemos la lista de artículos
				albaran.setArticulos(ServicioArticulosAlbaranesCompras.consultar(idAlbaran, datosSesion));
				
				// Obtenemos el detalle de impuestos
				albaran.setDetalleImpuestos(ServicioImpuestosAlbaranesCompras.consultar(idAlbaran, datosSesion));
				
				// Obtener la lista de pagos
				albaran.setPagos(ServicioPagosAlbaranesCompras.consultar(idAlbaran, datosSesion));
			}

			return albaran;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando datos de un albaran: " + e.getMessage();

			throw new AlbaranCompraException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void salvar(AlbaranCompra albaran, DatosSesionBean datosSesion) throws AlbaranCompraConstraintViolationException, AlbaranCompraException {
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
	
	
	public static void crear(AlbaranCompra albaran, DatosSesionBean datosSesion) 
			throws AlbaranCompraConstraintViolationException, AlbaranCompraException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nuevo albarán de compra");
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			crear(conn, albaran, datosSesion);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			log.debug("crear() - deshaciendo transacción");
			conn.deshacerTransaccion();

			String msg = "Error creando albarán de compra: " + e.getMessage();
    		log.error("crear() - " + msg);
    		
    		throw new AlbaranCompraException(msg, e);
    	}
		catch (AlbaranCompraException e) {
			log.debug("crear() - deshaciendo transacción");
			conn.deshacerTransaccion();
    		
    		throw e;
    	}
		catch (AlbaranCompraConstraintViolationException e) {
			log.debug("crear() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
    		throw e;
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void crear(Connection conn, AlbaranCompra albaran, DatosSesionBean datosSesion) 
			throws AlbaranCompraConstraintViolationException, AlbaranCompraException {
		try {
			log.debug("crear() - Creando nuevo albarán de compra");
			
			// Establacemos identificador y número de albarán
			albaran.setIdAlbaran(ContadorAlbaranesCompras.obtenerContadorId(conn));
			albaran.setNumAlbaran(ContadorAlbaranesCompras.obtenerContadorAlbaran(albaran.getCodEmpresa(), albaran.getCodSerie(), albaran.getPeriodo(), conn));
			
			AlbaranesComprasDao.insert(conn, datosSesion.getConfigEmpresa(), albaran.getBean());
			salvarArticulos(conn, datosSesion, albaran);
			salvarImpuestos(conn, datosSesion, albaran);
			salvarPagos(conn, datosSesion, albaran);
		}
		catch (ContadorException e) {
			log.debug("crear() - deshaciendo transacción");

			String msg = "Error creando albarán de compra: " + e.getMessage();
    		log.error("crear() - " + msg);
    		
    		throw new AlbaranCompraException(msg, e);
		}
		catch (SQLException e) {
			log.debug("crear() - deshaciendo transacción");

			String msg = "Error creando albarán de compra: " + e.getMessage();
    		log.error("crear() - " + msg);
    		
    		throw new AlbaranCompraException(msg, e);
    	}
	}
	
	
	public static void modificar(AlbaranCompra albaran, DatosSesionBean datosSesion) 
			throws AlbaranCompraConstraintViolationException, AlbaranCompraException {
		Connection conn = new Connection();
		
		// Comprobamos si el albarán se puede modificar
		try {
			AlbaranCompra original = ServicioAlbaranesCompras.consultar(albaran.getIdAlbaran(), datosSesion);
			original.checkAlbaranPuedeModificarse();
		}
		catch (AlbaranCompraNotFoundException e) {
			throw new AlbaranCompraException("No se ha encontrado el registro");
		}
		
		try {
			log.debug("modificar() - Modificando albarán de compra " + albaran.getIdAlbaran());
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			AlbaranesComprasDao.update(conn, datosSesion.getConfigEmpresa(), albaran.getBean());
			salvarArticulos(conn, datosSesion, albaran);
			salvarImpuestos(conn, datosSesion, albaran);
			salvarPagos(conn, datosSesion, albaran);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			log.debug("modificar() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			String msg = "Error modificando albarán de compra: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new AlbaranCompraException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void eliminar(Long idAlbaran, DatosSesionBean datosSesion) 
			throws AlbaranCompraConstraintViolationException, AlbaranCompraException {
		Connection conn = new Connection();
		
		// Comprobamos si el albarán se puede borrar
		try {
			AlbaranCompra albaran = ServicioAlbaranesCompras.consultar(idAlbaran, datosSesion);
			albaran.checkAlbaranPuedeBorrarse();
		}
		catch (AlbaranCompraNotFoundException e) {
			// El albarán ya no existe
			return;
		}
		
		try {
			log.debug("eliminar() - Eliminando albarán de compra " + idAlbaran);
			
			conn.abrirConexion(Database.getConnection());
			
			conn.iniciaTransaccion();
			
			ArticulosAlbaranesComprasDao.delete(conn, datosSesion.getConfigEmpresa(), idAlbaran);
			ImpuestosAlbaranesComprasDao.delete(conn, datosSesion.getConfigEmpresa(), idAlbaran);
			PagosAlbaranesComprasDao.delete(conn, datosSesion.getConfigEmpresa(), idAlbaran);
			AlbaranesComprasDao.delete(conn, datosSesion.getConfigEmpresa(), idAlbaran);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch(ForeingKeyConstraintViolationException e){
			log.debug("eliminar() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
			log.info("eliminar() - No se ha podido eliminar el albarán de compra: " + e.getMessage());
			throw new AlbaranCompraConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			log.debug("eliminar() - deshaciendo transacción");
			conn.deshacerTransaccion();
			
    		String msg = "Error eliminando albarán de compra: " + e.getMessage();
    		log.error("eliminar() - " + msg);
    		
    		throw new AlbaranCompraException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	private static void salvarArticulos(Connection conn, DatosSesionBean datosSesion, AlbaranCompra albaran) 
			throws ArticuloAlbaranCompraException, ArticuloAlbaranComprasConstraintViolationException {
		try{
			// Actualizamos stocks de los artículos del albarán en el almacén
			actualizarStocks(conn, datosSesion, albaran);
			
			// Obtenemos el max de las líneas del albaran recorriendolas por si no están en orden
			int linea = 0;
			for (ArticuloAlbaranCompraBean articulo : albaran.getArticulos()) {
				if (!articulo.isEstadoNuevo()) {
					if (articulo.getLinea() > linea) {
						linea = articulo.getLinea();
					}
				}
			}
			
			for (ArticuloAlbaranCompraBean articulo : albaran.getArticulos()) {
				//Si el precio del artículo y la cantidad son mayores que 0 y la fecha es igual a la actual
				//actualizamos el costo del artículo
				if((articulo.getPrecio() > 0) && (articulo.getCantidad() > 0) && Fechas.equalsDate(albaran.getFecha(), new Date())){
					ServicioArticulos.actualizarPrecioCosto(conn, datosSesion, articulo.getCodArticulo(), articulo.getPrecio());
				}
				
				// Actualizamos FK del objeto
				articulo.setIdAlbaran(albaran.getIdAlbaran());
				
				// Si el artículo es nuevo establacemos el número de la línea
				if (articulo.isEstadoNuevo()) {
					articulo.setLinea(++linea);
				}
				
				ServicioArticulosAlbaranesCompras.salvar(articulo, datosSesion, conn);
			}
		}
		catch(ArticuloException e){
			log.debug("salvarArticulos() - deshaciendo transacción.");
			conn.deshacerTransaccion();

			String msg = "Error al salvar artículo de albarán: " + e.getMessage();
    		log.error("salvarArticulos() - " + msg);
			throw new ArticuloAlbaranCompraException(msg, e);
		}
	}
	
	
	private static void actualizarStocks(Connection conn, DatosSesionBean datosSesion, AlbaranCompra albaran) 
			throws ArticuloAlbaranCompraException {
		// Actualizamos stock del almacén
		try {
			ArticuloAlbaranCompraBean original = null;
			
			for (ArticuloAlbaranCompraBean articulo : albaran.getArticulos()) {
				switch (articulo.getEstadoBean()) {
					// Si la línea es nueva sumamos la cantidad al stock del almacén
					case Estado.NUEVO:
						ServicioStocksAlmacenes.sumarStock(conn, albaran.getCodAlmacen(), 
								articulo, datosSesion);
						break;
					
					// Si la línea se ha modificado restamos la cantidad original y sumamos la nueva
					case Estado.MODIFICADO:
						original = ArticulosAlbaranesComprasDao.consultar(conn, 
								datosSesion.getConfigEmpresa(), articulo.getIdAlbaran(), articulo.getLinea());
						
						ServicioStocksAlmacenes.restarStock(conn, albaran.getCodAlmacen(), 
								original, datosSesion);
						
						ServicioStocksAlmacenes.sumarStock(conn, albaran.getCodAlmacen(), 
								articulo, datosSesion);
						break;
					
					// Si se ha borrado la línea restamos la cantidad original de la línea del albarán
					case Estado.BORRADO:
						original = ArticulosAlbaranesComprasDao.consultar(conn, 
								datosSesion.getConfigEmpresa(), articulo.getIdAlbaran(), articulo.getLinea());
						
						ServicioStocksAlmacenes.restarStock(conn, albaran.getCodAlmacen(), 
								original, datosSesion);
						break;
				}
			}
		} 
		catch (StockAlmacenException e) {
			throw new ArticuloAlbaranCompraException("Error al actualizar stock del almacen: " + e.getMessage(), e);
		} 
		catch (SQLException e) {
			throw new ArticuloAlbaranCompraException("Error al actualizar stock del almacen: " + e.getMessage(), e);
		}
	}
	
	
	private static void salvarImpuestos(Connection conn, DatosSesionBean datosSesion, AlbaranCompra albaran) 
			throws ImpuestoAlbaranCompraException {
		
		if (albaran.getEstadoBean() != Estado.NUEVO) {
			// Borramos todos los impuestos
			ServicioImpuestosAlbaranesCompras.eliminar(albaran.getIdAlbaran(), datosSesion, conn);
		}
		
		// Grabamos la lista de impuestos
		for (ImpuestoBean impuesto : albaran.getDetalleImpuestos().getListaImpuestos()) {
			// Actualizamos FK del objeto
			impuesto.setIdDocumento(albaran.getIdAlbaran());
			ServicioImpuestosAlbaranesCompras.crear(impuesto, datosSesion, conn);
		}
	}
	
	
	private static void salvarPagos(Connection conn, DatosSesionBean datosSesion, AlbaranCompra albaran)throws PagoAlbaranCompraException, PagoAlbaranCompraConstraintViolationException {
		// Obtenemos el max de las líneas del albarán recorriendolas por si no están en orden
		int linea = 0;
		for (PagoAlbaranCompraBean pago : albaran.getPagos()) {
			if (!pago.isEstadoNuevo()) {
				if (pago.getLinea() > linea) {
					linea = pago.getLinea();
				}
			}
		}
		
		// Asignar FK a las líneas y establecer número de línea a los elementos nuevos
		for (PagoAlbaranCompraBean pago : albaran.getPagos()) {
			// Actualizamos FK del objeto
			pago.setIdAlbaran(albaran.getIdAlbaran());
			
			// Si el pago es nuevo establacemos el número de la línea
			if (pago.isEstadoNuevo()) {
				pago.setLinea(++linea);
			}
			
			ServicioPagosAlbaranesCompras.salvar(pago, datosSesion, conn);
		}
	}
	
	
	public static void facturarAlbaranes (Connection conn, DatosSesionBean datosSesion, FacturaCompra factura) 
			throws AlbaranCompraException {
		
		try {
			log.debug("facturarAlbaranes() - Facturando albaranes de compra "); 
			
			for (AlbaranCompra albaran : factura.getAlbaranes()){
				albaran.setIdFacturaSoportada(factura.getIdFacturaSop());
				AlbaranesComprasDao.actualizarFactura(conn, datosSesion.getConfigEmpresa(), albaran.getBean());
			}
		}
		catch (SQLException e) {
			log.debug("facturarAlbaranes() - deshaciendo transacción.");
			conn.deshacerTransaccion();
			
			String msg = "Error facturando albaranes de compra: " + e.getMessage();
			log.error("facturarAlbaranes() - " + msg);
			
			throw new AlbaranCompraException(msg, e);
		}

	}

}
