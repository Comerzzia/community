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

package com.comerzzia.servicios.ventas.albaranes.articulos;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.ventas.albaranes.articulos.ArticuloAlbaranVentaBean;
import com.comerzzia.persistencia.ventas.albaranes.articulos.ArticulosAlbaranesVentasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioArticulosAlbaranesVentas {

	protected static Logger log = Logger.getMLogger(ServicioArticulosAlbaranesVentas.class);
	
	
	public static List<ArticuloAlbaranVentaBean> consultar(Long idAlbaran, DatosSesionBean datosSesion) throws ArticuloAlbaranVentaException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando artículos del albarán de venta " + idAlbaran);
			
			conn.abrirConexion(Database.getConnection());
			return ArticulosAlbaranesVentasDao.consultar(conn, datosSesion.getConfigEmpresa(), idAlbaran);
		}
		catch(SQLException e){
			String msg = "Error consultando artículos de un albarán de venta: " + e.getMessage();
    		log.error("consultar() - " + msg);
    		
    		throw new ArticuloAlbaranVentaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void salvar(ArticuloAlbaranVentaBean articulo, DatosSesionBean datosSesion, Connection conn) 
			throws ArticuloAlbaranVentaException, ArticuloAlbaranVentaConstraintViolationException {
	
		switch (articulo.getEstadoBean()) {
			case Estado.NUEVO:
				crear(articulo, datosSesion, conn);
				break;
		  
			case Estado.MODIFICADO:
				modificar(articulo, datosSesion, conn);
				break;
		  
			case Estado.BORRADO:
				eliminar(articulo, datosSesion, conn);
		}
	}
	
	
	public static void crear(ArticuloAlbaranVentaBean articulo, DatosSesionBean datosSesion, Connection conn) 
			throws ArticuloAlbaranVentaException {
		try {
			log.debug("crear() - Añadiendo artículo " + articulo.getCodArticulo() 
					+ " al albarán de venta " + articulo.getIdAlbaran() + " línea " + articulo.getLinea()); 
			
			ArticulosAlbaranesVentasDao.insert(conn, articulo, datosSesion.getConfigEmpresa());
		}
		catch (SQLException e) {
			String msg = "Error añadiendo artículo a albarán de venta: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new ArticuloAlbaranVentaException(msg, e);
		}
	}
	
	
	public static void modificar(ArticuloAlbaranVentaBean articulo, DatosSesionBean datosSesion, Connection conn) 
			throws ArticuloAlbaranVentaException {
		try {
			log.debug("modificar() - Modificando artículo " + articulo.getCodArticulo() 
					+ " del albarán de venta " + articulo.getIdAlbaran() + " línea " + articulo.getLinea()); 
			
			ArticulosAlbaranesVentasDao.update(conn, datosSesion.getConfigEmpresa(), articulo);
		}
		catch (SQLException e) {
			String msg = "Error modificando artículo de albarán de venta: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new ArticuloAlbaranVentaException(msg, e);
		}
	}
	
	
	public static void eliminar(ArticuloAlbaranVentaBean articulo, DatosSesionBean datosSesion, Connection conn) 
			throws ArticuloAlbaranVentaException, ArticuloAlbaranVentaConstraintViolationException {
		try {
			log.debug("eliminar() - Eliminando artículo "+ articulo.getCodArticulo() 
					+ " del albarán de venta " + articulo.getIdAlbaran() + " línea " + articulo.getLinea()); 
			
			ArticulosAlbaranesVentasDao.delete(conn, datosSesion.getConfigEmpresa(), articulo);
		}
		catch (ForeingKeyConstraintViolationException e) {
			log.info("eliminar() - No se ha podido eliminar el artículo del albarán de venta: " + e.getMessage());
			throw new ArticuloAlbaranVentaConstraintViolationException("Error eliminando artículo " 
					+ articulo.getCodArticulo() + " del albaran de venta: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando artículo de albarán de venta: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new ArticuloAlbaranVentaException(msg, e);
		}
	}


	public static List<ArticuloAlbaranVentaBean> consultarDetallesPedido(Long idPedido, DatosSesionBean datosSesion) throws ArticuloAlbaranVentaException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultarDetallePedido() - Consultando artículos del pedido de venta " + idPedido);
			
			conn.abrirConexion(Database.getConnection());
			return ArticulosAlbaranesVentasDao.consultarDetallePedido(conn, datosSesion.getConfigEmpresa(), idPedido);
		}
		catch(SQLException e){
			String msg = "Error consultando artículos de un pedido de venta: " + e.getMessage();
    		log.error("consultarDetallePedido() - " + msg);
    		
    		throw new ArticuloAlbaranVentaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

}
