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

package com.comerzzia.servicios.almacenes.inventarios;

import java.sql.SQLException;

import com.comerzzia.persistencia.almacenes.regularizaciones.RegularizacionBean;
import com.comerzzia.persistencia.general.almacenes.articulos.AlmacenArticuloBean;
import com.comerzzia.persistencia.general.almacenes.articulos.AlmacenesArticulosDao;
import com.comerzzia.servicios.almacenes.regularizaciones.Regularizacion;
import com.comerzzia.servicios.almacenes.regularizaciones.RegularizacionConstraintViolationException;
import com.comerzzia.servicios.almacenes.regularizaciones.RegularizacionException;
import com.comerzzia.servicios.almacenes.regularizaciones.ServicioRegularizaciones;
import com.comerzzia.servicios.almacenes.stocks.ServicioStocksAlmacenes;
import com.comerzzia.servicios.almacenes.stocks.StockAlmacenException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;

public class ServicioInventarios {

	protected static Logger log = Logger.getMLogger(ServicioInventarios.class);

	public static void crear(RegularizacionBean regularizacion,	DatosSesionBean datosSesion) 
			throws InventarioException, InventarioConstraintViolationException, StockAlmacenException {
		Connection conn = new Connection();

		try {
			log.debug("crear() - Creando inventario");
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();

			// Comprobamos si existe el detalle de stock en el almacen
			AlmacenArticuloBean almacenArticulo = ServicioStocksAlmacenes
					.obtenerDetalleAlmacen(regularizacion.getCodAlmacen(), regularizacion, datosSesion);
			
			// Si no existe lo creamos
			if(almacenArticulo == null){
				almacenArticulo = new AlmacenArticuloBean(regularizacion.getCodAlmacen(), regularizacion);
				AlmacenesArticulosDao.insert(conn, datosSesion.getConfigEmpresa(), almacenArticulo);
			}
			
			if(!Numero.equals(regularizacion.getStockActual(), almacenArticulo.getStock())){
				throw new StockAlmacenException("El stock del artículo ha cambiado mientras se visualizaba la pantalla");
			}if(!Numero.equals(regularizacion.getStockUMAlt(), almacenArticulo.getStockUMA())){
				throw new StockAlmacenException("El stock de unidad de medida alternativo del artículo ha cambiado mientras se visualizaba la pantalla");
			}
			// Creamos las observaciones de la regularizacion
			String observaciones = "Stock: " + almacenArticulo.getStock();
			if(regularizacion.getUnidadMedida() != null && !regularizacion.getUnidadMedida().equals("")){
				observaciones += "\nStock alternativo: " + almacenArticulo.getStockUMA();
			}
			regularizacion.setObservaciones(observaciones);
			
			// Calculamos la cantidad a regularizar con respecto al stock
			regularizacion.setCantidad(regularizacion.getCantidad() - regularizacion.getStockActual());
			if(regularizacion.getUnidadMedida() != null && !regularizacion.getUnidadMedida().equals("")){
				regularizacion.setCantidadMedida(regularizacion.getCantidadMedida() - regularizacion.getStockUMAlt());
			}
			// Creamos la regularizacion
			ServicioRegularizaciones.crear(new Regularizacion(regularizacion), datosSesion, conn);

			conn.commit();
			conn.finalizaTransaccion();
		
		} catch (RegularizacionConstraintViolationException e) {
			conn.deshacerTransaccion();

			String msg = "Error creando inventario: " + e.getMessage();
			log.error("crear() - " + msg);

			throw new InventarioException(msg, e);
		} catch (RegularizacionException e) {
			conn.deshacerTransaccion();

			String msg = "Error creando inventario: " + e.getMessage();
			log.error("crear() - " + msg);

			throw new InventarioException(msg, e);
		} catch (SQLException e) {

			String msg = "Error creando inventario: " + e.getMessage();
			log.error("crear() - " + msg);

			throw new InventarioException(msg, e);
		} finally {
			conn.cerrarConexion();
		}
	}
}
