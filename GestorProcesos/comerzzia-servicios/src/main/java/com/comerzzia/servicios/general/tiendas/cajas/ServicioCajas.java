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

package com.comerzzia.servicios.general.tiendas.cajas;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.general.tiendas.cajas.CajaBean;
import com.comerzzia.persistencia.general.tiendas.cajas.CajasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.tiendas.Tienda;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioCajas{

	protected static Logger log = Logger.getMLogger(ServicioCajas.class);
	
	public static List<CajaBean> consultarCaja(String codAlm, DatosSesionBean datosSesion) 
	throws CajaException {
		Connection conn = new Connection();

		try {
			log.debug("consultarCajas() - Consultando cajas " + codAlm);
			conn.abrirConexion(Database.getConnection());
			
			return CajasDao.consultar(conn, datosSesion.getConfigEmpresa(), codAlm);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar caja: " +  e.getMessage();
			
			throw new CajaException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}	
	
	public static void actualizarCajas(Connection conn, Tienda tienda, DatosSesionBean datosSesion) 
	throws CajaException, CajaConstraintViolationException{
            
    // Cajas
    if (tienda.isCajasCargadas()) {
        for (int i = 0; i < tienda.getNumCajas(); i++) {
        	salvar(conn, tienda.getCaja(i), datosSesion);
        }
    }
}

public static void salvar(Connection conn, CajaBean caja, DatosSesionBean datosSesion) 
		throws CajaException, CajaConstraintViolationException {

	switch (caja.getEstadoBean()) {
		case Estado.NUEVO:
			crear(conn, caja, datosSesion);
			break;
	  
		case Estado.MODIFICADO:
			modificar(conn, caja, datosSesion);
			break;
	  
		case Estado.BORRADO:
			eliminar(conn, caja.getCodAlm(), caja.getCodCaja(), datosSesion);
	}
}


public static void crear(Connection conn, CajaBean caja, DatosSesionBean datosSesion) 
		throws CajaException, CajaConstraintViolationException {
	
	try {
		log.debug("crearCaja() - Creando nueva caja");			
		CajasDao.insert(conn, datosSesion.getConfigEmpresa(), caja);
	}
	catch (KeyConstraintViolationException e) {
		log.info("crearCaja() - No se ha podido crear la caja: " + e.getMessage());
		throw new CajaConstraintViolationException("Error creando nueva caja: " + e.getDefaultMessage());
	}
	catch (SQLException e) {
		String msg = "Error creando nueva caja: " + e.getMessage();
		log.error("crearCaja() - " + msg);
		
		throw new CajaException(msg, e);
	}
}


public static void modificar(Connection conn, CajaBean caja, DatosSesionBean datosSesion) 
		throws CajaException {
	
	try {
		log.debug("modificarCaja() - Modificando caja " + caja.getCodCaja());
		CajasDao.update(conn, datosSesion.getConfigEmpresa(), caja);
	}
	catch (SQLException e) {
		String msg = "Error modificando caja: " + e.getMessage();
		log.error("modificarCaja() - " + msg);
		
		throw new CajaException(msg, e);
	}
}


public static void eliminar(Connection conn, String codAlm, String codCaja, DatosSesionBean datosSesion) 
		throws CajaException, CajaConstraintViolationException {
	
	try {
		log.debug("eliminarCaja() - Eliminando caja " + codCaja);
		CajasDao.delete(conn, datosSesion.getConfigEmpresa(),codAlm,codCaja);
	}
	catch(ForeingKeyConstraintViolationException e){
		log.info("eliminarCaja() - No se ha podido eliminar la caja: "+ e.getMessage());
		throw new CajaConstraintViolationException("Error eliminando caja: " + e.getDefaultMessage());
	}
	catch (SQLException e) {
		String msg = "Error eliminando caja: " + e.getMessage();
		log.error("eliminarCaja() - " + msg);
		
		throw new CajaException(msg, e);
	}
}
}
