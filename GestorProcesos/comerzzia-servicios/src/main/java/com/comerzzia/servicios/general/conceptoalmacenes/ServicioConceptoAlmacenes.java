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

package com.comerzzia.servicios.general.conceptoalmacenes;

import java.sql.SQLException;

import com.comerzzia.persistencia.general.conceptoalmacenes.ConceptoAlmacenBean;
import com.comerzzia.persistencia.general.conceptoalmacenes.ConceptoAlmacenesDao;
import com.comerzzia.persistencia.general.conceptoalmacenes.ParametrosBuscarConceptoAlmacenBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;


public class ServicioConceptoAlmacenes {

	protected static Logger log = Logger.getMLogger(ServicioConceptoAlmacenes.class);
	
	
	public static PaginaResultados consultar(ParametrosBuscarConceptoAlmacenBean param, DatosSesionBean datosSesion) throws ConceptoAlmacenException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando Concepto de Almacenes");
			conn.abrirConexion(Database.getConnection());
			return ConceptoAlmacenesDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar Concepto de Almacenes: " +  e.getMessage();
			
            throw new ConceptoAlmacenException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static ConceptoAlmacenBean consultar(String codAplicacion, String codConAlm, DatosSesionBean datosSesion) 
			throws ConceptoAlmacenException, ConceptoAlmacenNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos del Concepto de almacén: " + codConAlm);
						
			conn.abrirConexion(Database.getConnection());
			ConceptoAlmacenBean cAlmacen = ConceptoAlmacenesDao.consultar(conn, datosSesion.getConfigEmpresa(), codAplicacion, codConAlm);
			
			if (cAlmacen == null) {
				String msg = "No se ha encontrado el Concepto de almacén con identificador: " + codConAlm;
				log.info("consultar() - " + msg);
				throw new ConceptoAlmacenNotFoundException(msg);
			}
			
			return cAlmacen;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un Concepto de almacén: " +  e.getMessage();
			
		    throw new ConceptoAlmacenException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}
	
	
	public static ConceptoAlmacenBean consultarParaTienda(String codAplicacion, String codConAlm, boolean visibleTiendas, DatosSesionBean datosSesion) 
		throws ConceptoAlmacenException, ConceptoAlmacenNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos del Concepto de almacén: " + codConAlm);
						
			conn.abrirConexion(Database.getConnection());
			ConceptoAlmacenBean cAlmacen = ConceptoAlmacenesDao.consultarParaTienda(conn, datosSesion.getConfigEmpresa(), codAplicacion, codConAlm, visibleTiendas);
			
			if (cAlmacen == null) {
				String msg = "No se ha encontrado el Concepto de almacén con identificador: " + codConAlm;
				log.info("consultar() - " + msg);
				throw new ConceptoAlmacenNotFoundException(msg);
			}
			
			return cAlmacen;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un Concepto de almacén: " +  e.getMessage();
			
		    throw new ConceptoAlmacenException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}	
	
	
	public static void salvar(ConceptoAlmacenBean cAlmacen, DatosSesionBean datosSesion) 
			throws ConceptoAlmacenException, ConceptoAlmacenConstraintViolationException {

		switch (cAlmacen.getEstadoBean()) {
			case Estado.NUEVO:
				crear(cAlmacen, datosSesion);
				break;
	      
			case Estado.MODIFICADO:
				modificar(cAlmacen, datosSesion);
				break;
	      
			case Estado.BORRADO:
				eliminar(cAlmacen.getCodAplicacion(), cAlmacen.getCodConAlm(), datosSesion);
		}
	}
	
	
	public static void crear(ConceptoAlmacenBean cAlmacen, DatosSesionBean datosSesion) 
			throws ConceptoAlmacenException, ConceptoAlmacenConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nuevo Concepto de almacén");
			
			conn.abrirConexion(Database.getConnection());
			ConceptoAlmacenesDao.insert(conn, datosSesion.getConfigEmpresa(), cAlmacen);
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear el Concepto de almacén: " + e.getMessage());
			throw new ConceptoAlmacenConstraintViolationException("Error creando nuevo Concepto de almacén: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error creando nuevo Concepto de almacén: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new ConceptoAlmacenException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void modificar(ConceptoAlmacenBean cAlmacen, DatosSesionBean datosSesion) throws ConceptoAlmacenException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando Concepto de almacén con identificador: " + cAlmacen.getCodConAlm());
			conn.abrirConexion(Database.getConnection());
			ConceptoAlmacenesDao.update(conn, datosSesion.getConfigEmpresa(), cAlmacen);
		}
		catch (SQLException e) {
			String msg = "Error modificando Codigo de almacén: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new ConceptoAlmacenException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	
	
	public static void eliminar(String codAplicacion, String codConAlm, DatosSesionBean datosSesion) 
			throws ConceptoAlmacenException, ConceptoAlmacenConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando Concepto de almacén: " + codConAlm);
			conn.abrirConexion(Database.getConnection());
			ConceptoAlmacenesDao.delete(conn, datosSesion.getConfigEmpresa(),codAplicacion, codConAlm);
		}
		catch(ForeingKeyConstraintViolationException e){
			log.info("eliminar() - No se ha podido eliminar el Concepto de almacén: "+ e.getMessage());
			throw new ConceptoAlmacenConstraintViolationException("Error eliminando Concepto de almacén: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando Concepto de almacén: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new ConceptoAlmacenException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
