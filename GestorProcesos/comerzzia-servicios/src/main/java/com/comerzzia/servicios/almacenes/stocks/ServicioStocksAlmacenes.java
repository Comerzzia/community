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

package com.comerzzia.servicios.almacenes.stocks;

import java.sql.SQLException;

import com.comerzzia.persistencia.almacenes.stocks.IArticuloStock;
import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.general.almacenes.articulos.AlmacenArticuloBean;
import com.comerzzia.persistencia.general.almacenes.articulos.AlmacenesArticulosDao;
import com.comerzzia.persistencia.general.articulos.ArticuloBean;
import com.comerzzia.persistencia.general.articulos.ArticulosDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioStocksAlmacenes {

	private static Logger log = Logger.getMLogger(ServicioStocksAlmacenes.class);
	
	private static final byte SUMAR = 0;
	private static final byte RESTAR = 1;
	
	
	/**
	 * Actualiza el stock del artículo en el almacén sumando la cantidad indicada
	 * @param conn
	 * @param codAlmacen
	 * @param articulo
	 * @param config
	 * @throws StockAlmacenException
	 */
	public static void sumarStock(Connection conn, String codAlmacen, 
			IArticuloStock articulo, DatosSesionBean datosSesion)throws StockAlmacenException {
		
		log.debug("sumarStock() - Sumando stock del artículo " + articulo.getCodArticulo()
				+ " en almacen " + codAlmacen);

		actualizarStock(conn, codAlmacen, articulo, SUMAR, datosSesion);
	}
	
	
	/**
	 * Actualiza el stock del artículo en el almacén restando la cantidad indicada
	 * @param conn
	 * @param codAlmacen
	 * @param articulo
	 * @param config
	 * @throws StockAlmacenException
	 */
	public static void restarStock(Connection conn, String codAlmacen, 
			IArticuloStock articulo, DatosSesionBean datosSesion)throws StockAlmacenException {

		log.debug("restarStock() - Restando stock del artículo " + articulo.getCodArticulo()
				+ " en almacen " + codAlmacen);
			
		actualizarStock(conn, codAlmacen, articulo, RESTAR, datosSesion); 
	}
	
	
	/**
	 * Actualiza el stock del artículo en el almacén según el movimiento indicado
	 * @param conn
	 * @param codAlmacen
	 * @param articulo
	 * @param movimiento
	 * @param datosSesion
	 * @throws StockAlmacenException
	 */
	private static synchronized void actualizarStock(Connection conn, String codAlmacen, IArticuloStock articulo,
			byte movimiento, DatosSesionBean datosSesion) throws StockAlmacenException {
		try {
			// Obtenemos el detalle de almacén para el artículo
			AlmacenArticuloBean almacenArticulo = obtenerDetalleAlmacen(conn, codAlmacen, articulo, datosSesion.getConfigEmpresa());
			
			// Establecemos nuevo stock
			if (movimiento == SUMAR) {
				almacenArticulo.sumarStock(articulo.getCantidad());
			}
			else if (movimiento == RESTAR) {
				almacenArticulo.restarStock(articulo.getCantidad());
			}
			
			// Si el artículo tiene Unidad Medida Alternativa, establecemos también el stock de la UMA
			if (articuloTieneUnidadMedidaAlt(conn, articulo.getCodArticulo(), datosSesion.getConfigEmpresa())) {
				if (movimiento == SUMAR) {
					almacenArticulo.sumarStockUMA(articulo.getCantidadMedida());
				}
				else if (movimiento == RESTAR) {
					almacenArticulo.restarStockUMA(articulo.getCantidadMedida());
				}
			}
			
			// Actualizamos el stock del almacen
			AlmacenesArticulosDao.updateStock(conn, datosSesion.getConfigEmpresa(), almacenArticulo);
		}
		catch (SQLException e) {
			String msg = "Error actualizando stock: " + e.getMessage();
			log.error("actualizarStock() - " + msg);

			throw new StockAlmacenException(msg, e);
		} 
	}
	
	
	/**
	 * Actualiza el stock pendiente de servir del artículo en el almacén sumando la cantidad indicada
	 * @param conn
	 * @param codAlmacen
	 * @param articulo
	 * @param datosSesion
	 * @throws StockAlmacenException
	 */
	public static void sumarStockPendienteServir(Connection conn, String codAlmacen, 
			IArticuloStock articulo, DatosSesionBean datosSesion)throws StockAlmacenException {
		
		log.debug("sumarStockPendienteServir() - Sumando stock pendiente de servir del artículo " 
				+ articulo.getCodArticulo() + " en almacen " + codAlmacen);
			
		actualizarStockPendienteServir(conn, codAlmacen, articulo, SUMAR, datosSesion);
	}
	
	
	/**
	 * Actualiza el stock pendiente de servir del artículo en el almacén restando la cantidad indicada
	 * @param conn
	 * @param codAlmacen
	 * @param articulo
	 * @param datosSesion
	 * @throws StockAlmacenException
	 */
	public static void restarStockPendienteServir(Connection conn, String codAlmacen, 
			IArticuloStock articulo, DatosSesionBean datosSesion)throws StockAlmacenException {
		
		log.debug("restarStockPendienteServir() - Restando stock pendiente de servir del artículo " 
				+ articulo.getCodArticulo() + " en almacen " + codAlmacen);
			
		actualizarStockPendienteServir(conn, codAlmacen, articulo, RESTAR, datosSesion);
	}
	
	
	/**
	 * Actualiza el stock pendiente de servir del artículo en el almacén según el movimiento indicado
	 * @param conn
	 * @param codAlmacen
	 * @param articulo
	 * @param movimiento
	 * @param datosSesion
	 * @throws StockAlmacenException
	 */
	private static synchronized void actualizarStockPendienteServir(Connection conn, String codAlmacen, IArticuloStock articulo,
			byte movimiento, DatosSesionBean datosSesion)throws StockAlmacenException {
		try {
			// Obtenemos el detalle de almacén para el artículo
			AlmacenArticuloBean almacenArticulo = obtenerDetalleAlmacen(conn, codAlmacen, articulo, datosSesion.getConfigEmpresa());
			
			// Si el artículo tiene UMA actualizamos el stock pendiente de servir con la nueva cantidad de medida
			if (articuloTieneUnidadMedidaAlt(conn, articulo.getCodArticulo(), datosSesion.getConfigEmpresa())) {
				if (movimiento == SUMAR) {
					almacenArticulo.sumarStockPendienteServir(articulo.getCantidadMedida());
				}
				else if (movimiento == RESTAR) {
					almacenArticulo.restarStockPendienteServir(articulo.getCantidadMedida());
				}
			}
			else {  // Si no lo actualizamos con la nueva cantidad
				if (movimiento == SUMAR) {
					almacenArticulo.sumarStockPendienteServir(articulo.getCantidad());
				}
				else if (movimiento == RESTAR) {
					almacenArticulo.restarStockPendienteServir(articulo.getCantidad());
				}
			}
			
			// Actualizamos el stock pendiente de servir del almacén
			AlmacenesArticulosDao.updateStockPendServir(conn, datosSesion.getConfigEmpresa(), almacenArticulo);
		}
		catch (SQLException e) {
			String msg = "Error actualizando stock pendiente de servir: " + e.getMessage();
			log.error("actualizarStockPendienteServir() - " + msg);

			throw new StockAlmacenException(msg, e);
		} 
	}
	
	
	/**
	 * Actualiza el stock pendiente de recibir del artículo en el almacén sumándo la cantidad indicada
	 * @param conn
	 * @param codAlmacen
	 * @param articulo
	 * @param datosSesion
	 * @throws StockAlmacenException
	 */
	public static void sumarStockPendienteRecibir(Connection conn, String codAlmacen, 
			IArticuloStock articulo, DatosSesionBean datosSesion)throws StockAlmacenException {
		
		log.debug("sumarStockPendienteRecibir() - Sumando stock pendiente de recibir del artículo " 
				+ articulo.getCodArticulo() + " en almacen " + codAlmacen);
		
		actualizarStockPendienteRecibir(conn, codAlmacen, articulo, SUMAR, datosSesion);
	}
	
	
	/**
	 * Actualiza el stock pendiente de recibir del artículo en el almacén sumándo la cantidad indicada
	 * @param conn
	 * @param codAlmacen
	 * @param articulo
	 * @param datosSesion
	 * @throws StockAlmacenException
	 */
	public static void restarStockPendienteRecibir(Connection conn, String codAlmacen, 
			IArticuloStock articulo, DatosSesionBean datosSesion)throws StockAlmacenException {

		log.debug("sumarStockPendienteRecibir() - Sumando stock pendiente de recibir del artículo " 
				+ articulo.getCodArticulo() + " en almacen " + codAlmacen);
		
		actualizarStockPendienteRecibir(conn, codAlmacen, articulo, RESTAR, datosSesion);
	}
	
	
	/**
	 * Actualiza el stock pendiente de recibir del artículo en el almacén según el movimiento indicado
	 * @param conn
	 * @param codAlmacen
	 * @param articulo
	 * @param movimiento
	 * @param datosSesion
	 * @throws StockAlmacenException
	 */
	private static synchronized void actualizarStockPendienteRecibir(Connection conn, String codAlmacen, IArticuloStock articulo,
			byte movimiento, DatosSesionBean datosSesion)throws StockAlmacenException {
		try {
			// Obtenemos el detalle de almacén para el artículo
			AlmacenArticuloBean almacenArticulo = obtenerDetalleAlmacen(conn, codAlmacen, articulo, datosSesion.getConfigEmpresa());
			
			// Si el artículo tiene UMA actualizamos el stock pendiente de recibir con la nueva cantidad de medida
			if (articuloTieneUnidadMedidaAlt(conn, articulo.getCodArticulo(), datosSesion.getConfigEmpresa())) {
				if (movimiento == SUMAR) {
					almacenArticulo.sumarStockPendienteRecibir(articulo.getCantidadMedida());
				}
				else if (movimiento == RESTAR) {
					almacenArticulo.restarStockPendienteRecibir(articulo.getCantidadMedida());
				}
			}
			else {  // Si no lo actualizamos con la nueva cantidad
				if (movimiento == SUMAR) {
					almacenArticulo.sumarStockPendienteRecibir(articulo.getCantidad());
				}
				else if (movimiento == RESTAR) {
					almacenArticulo.restarStockPendienteRecibir(articulo.getCantidad());
				}
			}
			
			// Actualizamos el stock pendiente de recibir del almacén
			AlmacenesArticulosDao.updateStockPendRecibir(conn, datosSesion.getConfigEmpresa(), almacenArticulo);
		}
		catch (SQLException e) {
			String msg = "Error actualizando stock pendiente de recibir: " + e.getMessage();
			log.error("actualizarStockPendienteRecibir() - " + msg);

			throw new StockAlmacenException(msg, e);
		} 
	}
	
	/**
	 * Obtiene el detalle de stock del artículo en el almacén
	 * @param codAlmacen
	 * @param articulo
	 * @param datosSesion
	 * @return
	 * @throws StockAlmacenException
	 */
	public static AlmacenArticuloBean obtenerDetalleAlmacen (String codAlmacen, 
			IArticuloStock articulo, DatosSesionBean datosSesion) throws StockAlmacenException{
		
		Connection conn = new Connection();
		try {
			log.debug("consultar() - Consultando detalle del almacen" + codAlmacen);
			conn.abrirConexion(Database.getConnection());
			return AlmacenesArticulosDao.consultar(conn, datosSesion.getConfigEmpresa(), articulo.getCodArticulo(), 
						codAlmacen, articulo.getDesglose1(), articulo.getDesglose2());
		} catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar detalle del almacen: " + e.getMessage();

			throw new StockAlmacenException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}
	
	
	/**
	 * Obtiene el detalle de stock del artículo en el almacén
	 * @param conn
	 * @param codAlmacen
	 * @param articulo
	 * @param config
	 * @return
	 * @throws SQLException
	 */
	private static AlmacenArticuloBean obtenerDetalleAlmacen(Connection conn, String codAlmacen,
			IArticuloStock articulo, ConfigEmpresaBean config) throws SQLException {
		// Obtenemos el detalle de almacén para el artículo
		AlmacenArticuloBean almacenArticulo = 
			AlmacenesArticulosDao.consultar(conn, config, articulo.getCodArticulo(), 
					codAlmacen, articulo.getDesglose1(), articulo.getDesglose2());
		
		// Si no existe lo creamos
		if(almacenArticulo == null){
			almacenArticulo = new AlmacenArticuloBean(codAlmacen, articulo);
			AlmacenesArticulosDao.insert(conn, config, almacenArticulo);
		}
		
		return almacenArticulo;
	}
	
	
	/**
	 * Comprueba si el artículo tiene unidad de medida alternativa
	 * @param conn
	 * @param codArticulo
	 * @param config
	 * @return true si el artículo tiene Unidad de Medida Alternativa, false en caso contrario
	 * @throws SQLException
	 */
	private static Boolean articuloTieneUnidadMedidaAlt(Connection conn, String codArticulo, ConfigEmpresaBean config) throws SQLException{
		// Obtenemos el artículo para ver si tiene Unidad Medida Alternativa
		ArticuloBean articulo = ArticulosDao.consultar(conn, config, codArticulo);
		
		if(articulo.getUnidadMedAlt() != null && !articulo.getUnidadMedAlt().isEmpty()){
			return true;
		}
		
		return false;
	}
}
