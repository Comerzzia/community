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

package com.comerzzia.servicios.ventas.promociones.articulos;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean;
import com.comerzzia.persistencia.ventas.promociones.articulos.ArticulosPromocionesDao;
import com.comerzzia.persistencia.ventas.promociones.articulos.ParametrosBuscarArticulosPromocionesBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioArticulosPromociones {
	
	protected static Logger log = Logger.getMLogger(ServicioArticulosPromociones.class);

	public static List<ArticuloPromocionBean> consultarArticulosPromocion(ParametrosBuscarArticulosPromocionesBean param, DatosSesionBean datosSesion) 
			throws ArticuloPromocionException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultarArticulosPromocion() - Consultando articulos de la promocion " + param.getIdPromocion());
			conn.abrirConexion(Database.getConnection());
			
			return ArticulosPromocionesDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			String mensaje = "Error al consultar articulos: " +  e.getMessage();
			log.error("consultarArticulosPromocion() - " + mensaje);			
			
			throw new ArticuloPromocionException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}
		
	public static void salvar(Connection conn, ArticuloPromocionBean articulo, DatosSesionBean datosSesion) 
			throws ArticuloPromocionException, ArticuloPromocionConstraintViolationException {
		
		switch (articulo.getEstadoBean()) {
			case Estado.NUEVO:
				crear(conn, articulo, datosSesion);
				break;
		  
			case Estado.MODIFICADO:
				modificar(conn, articulo, datosSesion);
				break;
		  
			case Estado.BORRADO:
				eliminar(conn, articulo, datosSesion);
		}
	}
		
		
	public static void crear(Connection conn, ArticuloPromocionBean articulo, DatosSesionBean datosSesion) 
			throws ArticuloPromocionException, ArticuloPromocionConstraintViolationException {
		
		try {
			log.debug("crear() - Creando nuevo articulo " + articulo.getCodArt() + 
					"para la promocion " + articulo.getIdPromocion());			
			ArticulosPromocionesDao.insert(conn, datosSesion.getConfigEmpresa(), articulo);
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear el articulo : " + e.getMessage());
			throw new ArticuloPromocionConstraintViolationException("Error creando nuevo articulo: " 
					+ "El articulo " + articulo.getCodArt() + " ya está registrado para la promoción " + articulo.getIdPromocion());
		}
		catch (SQLException e) {
			String msg = "Error creando nuevo articulo: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new ArticuloPromocionException(msg, e);
		}
	}
		
		
	public static void modificar(Connection conn, ArticuloPromocionBean articulo, DatosSesionBean datosSesion) 
			throws ArticuloPromocionException {
		
		try {
			log.debug("modificar() - Modificando articulo " + articulo.getCodArt()
					+ " de la promoción " + articulo.getIdPromocion());
			
			ArticulosPromocionesDao.update(conn, datosSesion.getConfigEmpresa(), articulo);
		}
		catch (SQLException e) {
			String msg = "Error modificando articulo de la promoción: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new ArticuloPromocionException(msg, e);
		}
	}	
		
	public static void eliminar(Connection conn, ArticuloPromocionBean articulo, DatosSesionBean datosSesion) 
			throws ArticuloPromocionException, ArticuloPromocionConstraintViolationException {
		
		try {
			log.debug("eliminar() - Eliminando articulo " + articulo.getCodArt()
					+ " de la promoción " + articulo.getIdPromocion());
			
			ArticulosPromocionesDao.delete(conn, datosSesion.getConfigEmpresa(), articulo.getIdPromocion(), articulo.getCodArt());
		}
		catch(ForeingKeyConstraintViolationException e){
			log.info("eliminar() - No se ha podido eliminar el articulo de la promoción: "+ e.getMessage());
			throw new ArticuloPromocionConstraintViolationException("Error eliminando articulo: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando articulo de la promoción: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new ArticuloPromocionException(msg, e);
		}
	}
	
	public static List<ArticuloPromocionBean> consultar(String codArticulo,
			DatosSesionBean datosSesion) throws ArticuloPromocionException {
		
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando promociones del articulo: " + codArticulo);
			conn.abrirConexion(Database.getConnection());
			return ArticulosPromocionesDao.consultarPromocionesArticulo(conn, datosSesion.getConfigEmpresa(), codArticulo);
		} 
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar promociones del articulo: " + codArticulo;

			throw new ArticuloPromocionException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}
}
