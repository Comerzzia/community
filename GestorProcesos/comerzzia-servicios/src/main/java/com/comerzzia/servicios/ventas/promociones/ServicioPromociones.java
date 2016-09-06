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

package com.comerzzia.servicios.ventas.promociones;

import java.sql.SQLException;
import java.util.Date;

import com.comerzzia.persistencia.ventas.promociones.ParametrosBuscarPromocionesBean;
import com.comerzzia.persistencia.ventas.promociones.PromocionBean;
import com.comerzzia.persistencia.ventas.promociones.PromocionesDao;
import com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean;
import com.comerzzia.persistencia.ventas.promociones.articulos.ArticulosPromocionesDao;
import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.TarifasDao;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.promociones.articulos.ArticuloPromocionConstraintViolationException;
import com.comerzzia.servicios.ventas.promociones.articulos.ServicioArticulosPromociones;
import com.comerzzia.servicios.ventas.tarifas.ContadorTarifas;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.formateo.Formateo;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioPromociones {

	protected static Logger log = Logger.getMLogger(ServicioPromociones.class);	
	
	public static PaginaResultados consultar(ParametrosBuscarPromocionesBean param, DatosSesionBean datosSesion) 
			throws PromocionException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando promociones");
			conn.abrirConexion(Database.getConnection());
			return PromocionesDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar promociones: " +  e.getMessage();
			
            throw new PromocionException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static PromocionBean consultar(Long idPromocion, DatosSesionBean datosSesion) 
			throws PromocionException, PromocionNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos de la promocion: " + idPromocion);
			conn.abrirConexion(Database.getConnection());
			PromocionBean promocion = PromocionesDao.consultar(conn, datosSesion.getConfigEmpresa(), idPromocion);
			
			if (promocion == null) {
				String msg = "No se ha encontrado la promocion con identificador: " + idPromocion;
				log.info("consultar() - " + msg);
				throw new PromocionNotFoundException(msg);
			}
			
			return promocion;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de una promocion: " +  e.getMessage();
			
		    throw new PromocionException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}	
	
	
	public static void salvar(PromocionBean promocion, DatosSesionBean datosSesion) 
			throws PromocionException, PromocionConstraintViolationException {

		switch (promocion.getEstadoBean()) {
			case Estado.NUEVO:
				crear(promocion, datosSesion);
				break;
	      
			case Estado.MODIFICADO:
				modificar(promocion, datosSesion);
				break;
	      
			case Estado.BORRADO:
				eliminar(promocion.getIdPromocion(), datosSesion);
		}
	}
	
	
	public static void crear(PromocionBean promocion, DatosSesionBean datosSesion) 
			throws PromocionException, PromocionConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nueva promocion " + promocion.getDescripcion());
			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			// Obtenemos el idPromocion a partir del contador de promociones
			Long idPromocion = ContadorPromociones.obtenerContador(conn);
			promocion.setIdPromocion(idPromocion);
			
			PromocionesDao.insert(conn, datosSesion.getConfigEmpresa(), promocion);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (ContadorException e) {
			conn.deshacerTransaccion();
			
			String msg = "Error creando promociones: " + e.getMessage();
    		log.error("crear() - " + msg);
    		
    		throw new PromocionException(msg, e);
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			
			String msg = "Error creando nueva promocion: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new PromocionException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void modificar(PromocionBean promocion, DatosSesionBean datosSesion) 
			throws PromocionException, PromocionConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando promocion " + promocion.getIdPromocion());
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			PromocionesDao.update(conn, datosSesion.getConfigEmpresa(), promocion);
			salvarArticulosPromocion(conn, promocion, datosSesion);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			
			String msg = "Error modificando promocion: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new PromocionException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void eliminar(Long idPromocion, DatosSesionBean datosSesion) 
			throws PromocionException, PromocionConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando promocion " + idPromocion);
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			ArticulosPromocionesDao.delete(conn, datosSesion.getConfigEmpresa(), idPromocion);
			PromocionesDao.delete(conn, datosSesion.getConfigEmpresa(), idPromocion);
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch(ForeingKeyConstraintViolationException e){
			conn.deshacerTransaccion();
			
			log.info("eliminar() - No se ha podido eliminar la promocion: "+ e.getMessage());
			throw new PromocionConstraintViolationException("Error eliminando promocion: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			conn.deshacerTransaccion();
			
			String msg = "Error eliminando promocion: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new PromocionException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void salvarArticulosPromocion(Connection conn, PromocionBean promocion, DatosSesionBean datosSesion) 
			throws ArticuloPromocionConstraintViolationException, PromocionException{
		
		try{
			Date fechaFin = null;
			Long idPromocion = promocion.getIdPromocion();
			// Articulos
			if (promocion.isArticulosCargados()) {
				// Si la promocion esta activa, versionamos
				if(promocion.isActiva()){
					versionar(promocion, datosSesion, conn);
				}
				for (ArticuloPromocionBean articuloPromocion : promocion.getArticulos()) {
			    	// Actualizamos las fk
			    	articuloPromocion.setIdPromocion(idPromocion);
			    	articuloPromocion.setVersionTarifa(promocion.getVersionTarifa());
			    	ServicioArticulosPromociones.salvar(conn, articuloPromocion, datosSesion);
			    	// Comprobamos si la fecha de fin del articulo es mayor a la de la cabecera de la promocion
			    	// Si lo es, la guardamos para posteriormente modificar la fecha de fin de la cabecera de la promoción
			    	if(promocion.isActiva()){
			    		try{
			    			String fechaFinPromocion = Formateo.formateaFecha(promocion.getFechaFin(), "dd/MM/yyyy");
				        	String fechaFinArticulo = Formateo.formateaFecha(articuloPromocion.getFechaFin(), "dd/MM/yyyy");
				        	if(Fechas.getFecha(fechaFinPromocion).compareTo(Fechas.getFecha(fechaFinArticulo)) < 0){
				    			fechaFin = articuloPromocion.getFechaFin();
				    		}
			    		}
			    		catch(FechaException ignore){;}
			    	}
			    }
				if(fechaFin != null)
					promocion.setFechaFin(fechaFin);
					PromocionesDao.actualizarFechaFin(conn, datosSesion.getConfigEmpresa(), promocion);
			}
		}
		catch (SQLException e) {
			String msg = "Error salvando articulos de la promocion: " + e.getMessage();
			log.error("salvarArticulosPromocion() - " + msg);
			
			throw new PromocionException(msg, e);
		}
	}
	
	public static void versionar(PromocionBean promocion, DatosSesionBean datosSesion, Connection conn) 
			throws PromocionException{
		try{
			log.debug("versionar() - Versionando promocion " + promocion.getIdPromocion());
			
			// Obtenemos la nueva version de la tarifa y la versionamos
			Long version = ContadorTarifas.obtenerContador(conn);
			TarifaBean tarifa = TarifasDao.consultar(conn, datosSesion.getConfigEmpresa(), promocion.getCodTar());
			tarifa.setFechaVersion(new Date());
			tarifa.setVersion(version);
			TarifasDao.actualizarVersion(conn, datosSesion.getConfigEmpresa(), tarifa);		
			// Versionamos la cabecera de la promocion
			promocion.setVersionTarifa(version);
			PromocionesDao.actualizarVersion(conn, datosSesion.getConfigEmpresa(), promocion);
			
		} 
		catch (ContadorException e) {
			String msg = "Error obteniendo contador de versión de tarifa: "+ e.getMessage();
			log.error("versionar() - " + msg);
			throw new PromocionException(msg, e);
		} 
		catch (SQLException e) {
			String msg = "Error versionando promocion: " + e.getMessage();
			log.error("versionar() - " + msg);
			
			throw new PromocionException(msg, e);
		}
	}
	
	public static void activar(PromocionBean promocion, DatosSesionBean datosSesion) 
			throws PromocionException{
		
		Connection conn = new Connection();
		try{
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			// Se versiona la promocion
			versionar(promocion, datosSesion, conn);
			// Fijamos la fecha de inicio 
			ArticulosPromocionesDao.actualizarFechaInicio(conn, datosSesion.getConfigEmpresa(), promocion);
			// Versionamos todos los articulos de la promocion
			ArticulosPromocionesDao.actualizarVersion(conn, datosSesion.getConfigEmpresa(), promocion);
			
			conn.commit();
			conn.finalizaTransaccion();
		} 
		catch (SQLException e) {
			conn.deshacerTransaccion();
			
			String msg = "Error activando promocion: " + e.getMessage();
			log.error("activar() - " + msg);
			
			throw new PromocionException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void anular(PromocionBean promocion, DatosSesionBean datosSesion) 
			throws PromocionException{
		
		Connection conn = new Connection();
		try{
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			// Se versiona la promocion
			versionar(promocion, datosSesion, conn);
			// Actualizamos la fecha de fin de la promocion
			PromocionesDao.actualizarFechaFin(conn, datosSesion.getConfigEmpresa(), promocion);
			// Versionamos todos los articulos de la promocion
			ArticulosPromocionesDao.actualizarVersion(conn, datosSesion.getConfigEmpresa(), promocion);
			
			conn.commit();
			conn.finalizaTransaccion();
		} 
		catch (SQLException e) {
			conn.deshacerTransaccion();
			
			String msg = "Error anulando promocion: " + e.getMessage();
			log.error("anular() - " + msg);
			
			throw new PromocionException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
