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

package com.comerzzia.servicios.general.articulos.unidadesmedidas;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.general.articulos.unidadesmedidas.UnidadMedidaArticuloBean;
import com.comerzzia.persistencia.general.articulos.unidadesmedidas.UnidadesMedidasArticulosDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioUnidadesMedidasArticulos {
	
	protected static Logger log = Logger.getMLogger(ServicioUnidadesMedidasArticulos.class);

	
	public static List<UnidadMedidaArticuloBean> consultarUnidadesMedidas (String codArticulo, DatosSesionBean datosSesion) throws UnidadMedidaArticuloException{
		Connection conn = new Connection();
		
		try {
			log.debug("consultarUnidadesMedidas() - Consultando unidades de medidas para el artículo " + codArticulo);
			conn.abrirConexion(Database.getConnection());
			return UnidadesMedidasArticulosDao.consultar(conn, datosSesion.getConfigEmpresa(), codArticulo);
			
		}
		catch(SQLException e){
			String msg = "Error consultando unidades de medidas: " + e.getMessage();
    		log.error("consultarUnidadesMedidas() - " + msg);
    		
    		throw new UnidadMedidaArticuloException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void salvar(UnidadMedidaArticuloBean unidadMedida, DatosSesionBean datosSesion, Connection conn) 
		throws UnidadMedidaArticuloException, UnidadMedidaArticuloConstraintViolationException {

		switch (unidadMedida.getEstadoBean()) {
			case Estado.NUEVO:
				crear(unidadMedida, datosSesion, conn);
				break;
		  
			case Estado.MODIFICADO:
				modificar(unidadMedida, datosSesion, conn);
				break;
		  
			case Estado.BORRADO:
				eliminar(unidadMedida, datosSesion, conn);
		}
	}


	public static void crear(UnidadMedidaArticuloBean unidadMedida, DatosSesionBean datosSesion, Connection conn) 
			throws UnidadMedidaArticuloException, UnidadMedidaArticuloConstraintViolationException {
		try {
			log.debug("crear() - Creando nueva unidad de medida " + unidadMedida.getUnidadMedida() 
					+ " para el artículo " + unidadMedida.getCodArticulo());
			
			UnidadesMedidasArticulosDao.insert(conn, datosSesion.getConfigEmpresa(), unidadMedida);
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear la unidad de medida: " + e.getMessage());
			throw new UnidadMedidaArticuloConstraintViolationException("Error creando unidad de medida: " 
					+ "La unidad de medida " + unidadMedida.getUnidadMedida() + " ya está registrada en el sistema");
		}
		catch (SQLException e) {
			String msg = "Error creando nueva unidad de medida: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new UnidadMedidaArticuloException(msg, e);
		}
	}
	
	
	public static void modificar(UnidadMedidaArticuloBean unidadMedida, DatosSesionBean datosSesion, Connection conn) 
			throws UnidadMedidaArticuloException {
		try {
			log.debug("modificar() - Modificando unidad de medida " + unidadMedida.getUnidadMedida() 
					+ " del artículo " + unidadMedida.getCodArticulo());
			
			UnidadesMedidasArticulosDao.update(conn, datosSesion.getConfigEmpresa(), unidadMedida);
		}
		catch (SQLException e) {
			String msg = "Error modificando unidad de medida: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new UnidadMedidaArticuloException(msg, e);
		}
	}
	
	
	public static void eliminar(UnidadMedidaArticuloBean unidadMedida, DatosSesionBean datosSesion, Connection conn) 
			throws UnidadMedidaArticuloException, UnidadMedidaArticuloConstraintViolationException {
		try {
			log.debug("eliminar() - Eliminando unidad de medida " + unidadMedida.getUnidadMedida() 
					+ " del artículo " + unidadMedida.getCodArticulo());
			
			UnidadesMedidasArticulosDao.delete(conn, datosSesion.getConfigEmpresa(), unidadMedida);
		}
		catch (ForeingKeyConstraintViolationException e) {
			log.info("eliminar() - No se ha podido eliminar la unidad de medida: " + e.getMessage());
			throw new UnidadMedidaArticuloConstraintViolationException("Error eliminando unidad de medida: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando unidad de medida: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new UnidadMedidaArticuloException(msg, e);
		}
	}
}
