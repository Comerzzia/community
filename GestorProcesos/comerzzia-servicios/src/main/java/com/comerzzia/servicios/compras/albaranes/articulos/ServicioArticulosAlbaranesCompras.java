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

package com.comerzzia.servicios.compras.albaranes.articulos;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.compras.albaranes.articulos.ArticuloAlbaranCompraBean;
import com.comerzzia.persistencia.compras.albaranes.articulos.ArticulosAlbaranesComprasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioArticulosAlbaranesCompras {

	protected static Logger log = Logger.getMLogger(ServicioArticulosAlbaranesCompras.class);
	
	
	public static List<ArticuloAlbaranCompraBean> consultar(Long idAlbaran, 
			DatosSesionBean datosSesion) throws ArticuloAlbaranCompraException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando artículos del albarán de compra " + idAlbaran);
			
			conn.abrirConexion(Database.getConnection());
			return ArticulosAlbaranesComprasDao.consultar(conn, datosSesion.getConfigEmpresa(), idAlbaran);
		}
		catch(SQLException e){
			String msg = "Error consultando artículos de un albarán de compra: " + e.getMessage();
    		log.error("consultar() - " + msg);
    		
    		throw new ArticuloAlbaranCompraException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void salvar(ArticuloAlbaranCompraBean articulo, DatosSesionBean datosSesion, Connection conn) 
			throws ArticuloAlbaranCompraException, ArticuloAlbaranComprasConstraintViolationException {
	
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
	
	
	public static void crear(ArticuloAlbaranCompraBean articulo, DatosSesionBean datosSesion, Connection conn) 
			throws ArticuloAlbaranCompraException {
		try {
			log.debug("crear() - Añadiendo artículo " + articulo.getCodArticulo() 
					+ " al albarán de compra " + articulo.getIdAlbaran() + " línea " + articulo.getLinea()); 
			
			ArticulosAlbaranesComprasDao.insert(conn, datosSesion.getConfigEmpresa(), articulo);
		}
		catch (SQLException e) {
			String msg = "Error añadiendo artículo a albarán de compra: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new ArticuloAlbaranCompraException(msg, e);
		}
	}
	
	
	public static void modificar(ArticuloAlbaranCompraBean articulo, DatosSesionBean datosSesion, Connection conn) 
			throws ArticuloAlbaranCompraException {
		try {
			log.debug("modificar() - Modificando artículo " + articulo.getCodArticulo() 
					+ " del albarán de compra " + articulo.getIdAlbaran() + " línea " + articulo.getLinea()); 
			
			ArticulosAlbaranesComprasDao.update(conn, datosSesion.getConfigEmpresa(), articulo);
		}
		catch (SQLException e) {
			String msg = "Error modificando artículo de albarán de compra: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new ArticuloAlbaranCompraException(msg, e);
		}
	}
	
	
	public static void eliminar(ArticuloAlbaranCompraBean articulo, DatosSesionBean datosSesion, Connection conn) 
			throws ArticuloAlbaranCompraException, ArticuloAlbaranComprasConstraintViolationException {
		try {
			log.debug("eliminar() - Eliminando artículo "+ articulo.getCodArticulo() 
					+ " del albarán de compra " + articulo.getIdAlbaran() + " línea " + articulo.getLinea()); 
			
			ArticulosAlbaranesComprasDao.delete(conn, datosSesion.getConfigEmpresa(), articulo);
		}
		catch (ForeingKeyConstraintViolationException e) {
			log.info("eliminar() - No se ha podido eliminar el artículo del albarán de compra: " + e.getMessage());
			throw new ArticuloAlbaranComprasConstraintViolationException("Error eliminando artículo " 
					+ articulo.getCodArticulo() + " del albaran de compra: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando artículo de albarán de compra: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new ArticuloAlbaranCompraException(msg, e);
		}
	}
}
