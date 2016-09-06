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

package com.comerzzia.servicios.ventas.tarifas.actualizaciones.articulos;

import java.sql.SQLException;

import com.comerzzia.persistencia.ventas.tarifas.actualizaciones.articulos.ArticuloActualizacionBean;
import com.comerzzia.persistencia.ventas.tarifas.actualizaciones.articulos.ArticulosActualizacionesDao;
import com.comerzzia.persistencia.ventas.tarifas.actualizaciones.articulos.ParametrosBuscarArticulosActualizacionesBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.tarifas.articulos.ArticuloTarifaException;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioArticulosActualizaciones {
	
	protected static Logger log = Logger.getMLogger(ServicioArticulosActualizaciones.class);

	public static PaginaResultados consultar(ParametrosBuscarArticulosActualizacionesBean param,
			DatosSesionBean datosSesion) throws ArticuloTarifaException {
		Connection conn = new Connection();
		try {
			log.debug("consultar() - Consultando artículos de la actualización " + param.getIdActualizacion() + " para la tarifa " + param.getCodTar());
			conn.abrirConexion(Database.getConnection());
			return ArticulosActualizacionesDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		} 
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar artículos de la actualización " + param.getIdActualizacion() + " para la tarifa " + param.getCodTar()+ ": " + e.getMessage();
			throw new ArticuloTarifaException(mensaje, e);
		} 
		finally {
			if (conn!=null){
				conn.cerrarConexion();
			}
		}
	}

	public static void salvar(Connection conn, ArticuloActualizacionBean articulo, DatosSesionBean datosSesion) throws  ArticuloActualizacionException, ArticuloActualizacionConstraintViolationException {
		
		switch (articulo.getEstadoBean()) {
		
		case Estado.NUEVO:
			crear(conn, articulo, datosSesion);
			break;

		case Estado.MODIFICADO:
			modificar(conn, articulo, datosSesion);
			break;

		case Estado.BORRADO:
			eliminar(conn, articulo, datosSesion);
			break;
	}
		
	}

	private static void crear(Connection conn,
			ArticuloActualizacionBean articulo, DatosSesionBean datosSesion) throws ArticuloActualizacionException, ArticuloActualizacionConstraintViolationException {
		try {
			log.debug("crearArticulo() - Creando nuevo artículo "
					+ articulo.getCodArt() + " para la actualizacion "
					+ articulo.getIdActualizacion());
			ArticulosActualizacionesDao.insert(conn, datosSesion.getConfigEmpresa(), articulo);
		} 
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear el artículo " + articulo.getCodArt() + " para la actualizacion "
							+ articulo.getIdActualizacion() + ": " + e.getMessage());
			throw new ArticuloActualizacionConstraintViolationException(
					"Error añadiendo artículo " + articulo.getCodArt() + " a la actualizacion " + articulo.getIdActualizacion() + ": " + e.getDefaultMessage());
		} 
		catch (SQLException e) {
			String msg = "Error creando nuevo artículo " + articulo.getCodArt() + " para la actualizacion " + articulo.getIdActualizacion() + ": " + e.getMessage();
			log.error("crear() - " + msg);
			throw new ArticuloActualizacionException(msg, e);
		}
		
	}
	
	private static void modificar(Connection conn,
			ArticuloActualizacionBean articulo, DatosSesionBean datosSesion) throws ArticuloActualizacionException {
		try { 
			log.debug("modificar() - Modificando artículo " + articulo.getCodArt() + " de la actualización " + articulo.getIdActualizacion());
			ArticulosActualizacionesDao.update(conn, datosSesion.getConfigEmpresa(),articulo);
		} 
		catch (SQLException e) {
			String msg = "Error modificando artículo: " + e.getMessage();
			log.error("modificar() - " + msg);
			throw new ArticuloActualizacionException(msg, e);
		} 
		
	}
	
	private static void eliminar(Connection conn, ArticuloActualizacionBean articulo,
			DatosSesionBean datosSesion) throws ArticuloActualizacionConstraintViolationException, ArticuloActualizacionException {
		try {
			log.debug("eliminarArticulo() - Eliminando artículo " + articulo.getCodArt() + " de la actualización: " + articulo.getIdActualizacion());
			ArticulosActualizacionesDao.delete(conn, datosSesion.getConfigEmpresa(), articulo);
		} 
		catch (ForeingKeyConstraintViolationException e) {
			log.info("eliminarArticulo() - No se ha podido eliminar el artículo " + articulo.getCodArt() + ": " + e.getMessage());
			throw new ArticuloActualizacionConstraintViolationException("Error eliminando artículo " + articulo.getCodArt() + ": " + e.getDefaultMessage());
		} 
		catch (SQLException e) {
			String msg = "Error eliminando artículo: " + e.getMessage();
			log.error("eliminarArticulo() - " + msg);
			throw new ArticuloActualizacionException(msg, e);
		} 
		
	}
	
	
}
