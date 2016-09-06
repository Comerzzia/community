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

package com.comerzzia.servicios.general.unidadesmedida.etiquetas;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.general.unidadesmedida.etiquetas.ParametrosBuscarUnidadesMedidaEtiquetasBean;
import com.comerzzia.persistencia.general.unidadesmedida.etiquetas.UnidadesMedidaEtiquetasBean;
import com.comerzzia.persistencia.general.unidadesmedida.etiquetas.UnidadesMedidaEtiquetasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;


public class ServicioUnidadesMedidaEtiquetas {

	protected static Logger log = Logger.getMLogger(ServicioUnidadesMedidaEtiquetas.class);
	
	
	public static PaginaResultados consultar(ParametrosBuscarUnidadesMedidaEtiquetasBean param, DatosSesionBean datosSesion) throws UnidadesMedidaEtiquetaException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando unidad de medida de etiquetas");
			conn.abrirConexion(Database.getConnection());
			return UnidadesMedidaEtiquetasDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar unidad de medida de etiquetas: " +  e.getMessage();
			
            throw new UnidadesMedidaEtiquetaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static List<UnidadesMedidaEtiquetasBean> consultarTodas( DatosSesionBean datosSesion) throws UnidadesMedidaEtiquetaException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultarTodas() - Consultando todas las unidades de medida de etiquetas");
			conn.abrirConexion(Database.getConnection());
			return UnidadesMedidaEtiquetasDao.consultarTodas(conn, datosSesion.getConfigEmpresa());
		}
		catch (SQLException e) {
			log.error("consultarTodas() - " + e.getMessage());
			String mensaje = "Error al consultar unidades de medida de etiquetas: " +  e.getMessage();
			
            throw new UnidadesMedidaEtiquetaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static UnidadesMedidaEtiquetasBean consultar(String cod_UM_Etiqueta, DatosSesionBean datosSesion) 
			throws UnidadesMedidaEtiquetaException, UnidadesMedidaEtiquetaNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos de la unidad de medida: " + cod_UM_Etiqueta);
			conn.abrirConexion(Database.getConnection());
			UnidadesMedidaEtiquetasBean umEtiqueta = UnidadesMedidaEtiquetasDao.consultar(conn, datosSesion.getConfigEmpresa(), cod_UM_Etiqueta);
			
			if (umEtiqueta == null) {
				String msg = "No se ha encontrado la unidad de medida con identificador: " + cod_UM_Etiqueta;
				log.info("consultar() - " + msg);
				throw new UnidadesMedidaEtiquetaNotFoundException(msg);
			}
			
			return umEtiqueta;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de una unidad de medida: " +  e.getMessage();
			
		    throw new UnidadesMedidaEtiquetaException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}	
	
	
	public static void salvar(UnidadesMedidaEtiquetasBean umEtiqueta, DatosSesionBean datosSesion) 
			throws UnidadesMedidaEtiquetaException, UnidadesMedidaEtiquetaConstraintViolationException {

		switch (umEtiqueta.getEstadoBean()) {
			case Estado.NUEVO:
				crear(umEtiqueta, datosSesion);
				break;
	      
			case Estado.MODIFICADO:
				modificar(umEtiqueta, datosSesion);
				break;
	      
			case Estado.BORRADO:
				eliminar(umEtiqueta.getCod_UM_Etiqueta(), datosSesion);
		}
	}
	
	
	public static void crear(UnidadesMedidaEtiquetasBean umEtiqueta, DatosSesionBean datosSesion) 
			throws UnidadesMedidaEtiquetaException, UnidadesMedidaEtiquetaConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nueva unidad de medida de etiqueta");
			
			conn.abrirConexion(Database.getConnection());
			UnidadesMedidaEtiquetasDao.insert(conn, datosSesion.getConfigEmpresa(), umEtiqueta);
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear la unidad de medida de etiqueta: " + e.getMessage());
			throw new UnidadesMedidaEtiquetaConstraintViolationException("Error creando nueva unidad de medida de etiqueta: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error creando nueva unidad de medida de etiqueta: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new UnidadesMedidaEtiquetaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void modificar(UnidadesMedidaEtiquetasBean umEtiqueta, DatosSesionBean datosSesion) throws UnidadesMedidaEtiquetaException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando unidad de medida de etiqueta " + umEtiqueta.getCod_UM_Etiqueta());
			conn.abrirConexion(Database.getConnection());
			UnidadesMedidaEtiquetasDao.update(conn, datosSesion.getConfigEmpresa(), umEtiqueta);
		}
		catch (SQLException e) {
			String msg = "Error modificando unidad de medida de etiqueta: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new UnidadesMedidaEtiquetaException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void eliminar(String cod_UM_Etiqueta, DatosSesionBean datosSesion) 
			throws UnidadesMedidaEtiquetaException, UnidadesMedidaEtiquetaConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando Unidad de medida de etiqueta " + cod_UM_Etiqueta);
			conn.abrirConexion(Database.getConnection());
			UnidadesMedidaEtiquetasDao.delete(conn, datosSesion.getConfigEmpresa(),cod_UM_Etiqueta);
		}
		catch(ForeingKeyConstraintViolationException e){
			log.info("eliminar() - No se ha podido eliminar la unidad de medida de etiqueta: "+ e.getMessage());
			throw new UnidadesMedidaEtiquetaConstraintViolationException("Error eliminando unidad de medida de etiqueta: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando unidad de medida de etiqueta: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new UnidadesMedidaEtiquetaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
