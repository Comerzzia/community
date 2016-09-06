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

package com.comerzzia.servicios.general.mediospago.vencimientos;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.general.mediospago.vencimientos.VencimientoBean;
import com.comerzzia.persistencia.general.mediospago.vencimientos.VencimientosDao;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioVencimientos {

	protected static Logger log = Logger.getMLogger(ServicioVencimientos.class);
	
	public static List<VencimientoBean> consultarVencimientos(String codMedioPago, DatosSesionBean datosSesion) 
			throws VencimientoException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultarVencimientos() - Consultando vencimientos del medio de pago " + codMedioPago);
			conn.abrirConexion(Database.getConnection());
			
			return VencimientosDao.consultar(conn, datosSesion.getConfigEmpresa(), codMedioPago);
		}
		catch (SQLException e) {
			String mensaje = "Error al consultar vencimientos: " +  e.getMessage();
			log.error("consultarVencimientos() - " + mensaje);
			
			throw new VencimientoException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}

	public static VencimientoBean consultar(Long idMedioPagoVencimiento, DatosSesionBean datosSesion)throws VencimientoException, VencimientoNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando vencimiento con identificador " + idMedioPagoVencimiento);
			conn.abrirConexion(Database.getConnection());
			
			VencimientoBean vencimiento = VencimientosDao.consultar(conn, datosSesion.getConfigEmpresa(), idMedioPagoVencimiento);

			if (vencimiento == null) {
				String msg = "No se ha encontrado el vencimiento con identificador: " + idMedioPagoVencimiento;
				log.info("consultar() - " + msg);
				throw new VencimientoNotFoundException(msg);
			}
			
			return vencimiento;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de un vencimiento: " +  e.getMessage();
			
			throw new VencimientoException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}

	public static List<VencimientoBean> consultarVencimientosEfectivos(DatosSesionBean datosSesion) 
			throws VencimientoException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultarVencimientosEfectivos() - Consultando vencimientos efectivos ");
			conn.abrirConexion(Database.getConnection());
			
			return VencimientosDao.consultarVencimientosEfectivos(conn, datosSesion.getConfigEmpresa());
		}
		catch (SQLException e) {
			String mensaje = "Error al consultar vencimientos efectivos: " +  e.getMessage();
			log.error("consultarVencimientosEfectivos() - " + mensaje);
			
			throw new VencimientoException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}
	
	
	public static void salvar(Connection conn, VencimientoBean vencimiento, DatosSesionBean datosSesion) 
			throws VencimientoException, VencimientoConstraintViolationException {
	
		switch (vencimiento.getEstadoBean()) {
			case Estado.NUEVO:
				crear(conn, vencimiento, datosSesion);
				break;
		  
			case Estado.MODIFICADO:
				modificar(conn, vencimiento, datosSesion);
				break;
		  
			case Estado.BORRADO:
				eliminar(conn, vencimiento, datosSesion);
		}
	}	
	
	public static void crear(Connection conn, VencimientoBean vencimiento, DatosSesionBean datosSesion) 
			throws VencimientoException, VencimientoConstraintViolationException {
	
		try {
			log.debug("crear() - Creando nuevo vencimiento para el medio de pago " + vencimiento.getCodMedioPago());	
			
			// Obtenemos el codVencimiento a partir del contador de vencimientos
			Long codVencimiento = ContadorVencimientos.obtenerContador(conn);
			vencimiento.setIdMedioPagoVencimiento(codVencimiento);
			
			VencimientosDao.insert(conn, datosSesion.getConfigEmpresa(), vencimiento);
		}
		catch (ContadorException e) {
			String msg = "Error creando vencimiento: " + e.getMessage();
    		log.error("crear() - " + msg);
    		
			throw new VencimientoException(msg, e);
		}
		catch (SQLException e) {
			String msg = "Error creando nuevo vencimiento: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new VencimientoException(msg, e);
		}
	}
	
	
	public static void modificar(Connection conn, VencimientoBean vencimiento, DatosSesionBean datosSesion) 
			throws VencimientoException {
	
		try {
			log.debug("modificar() - Modificando vencimiento " + vencimiento.getIdMedioPagoVencimiento()
					+ " del medio de pago " + vencimiento.getCodMedioPago());
			
			VencimientosDao.update(conn, datosSesion.getConfigEmpresa(), vencimiento);
		}
		catch (SQLException e) {
			String msg = "Error modificando vencimiento: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new VencimientoException(msg, e);
		}
	}
	
	
	public static void eliminar(Connection conn, VencimientoBean vencimiento, DatosSesionBean datosSesion) 
			throws VencimientoException, VencimientoConstraintViolationException {
	
		try {
			log.debug("eliminar() - Eliminando vencimiento " + vencimiento.getIdMedioPagoVencimiento()
					+ " del medio de pago " + vencimiento.getCodMedioPago());
			
			VencimientosDao.delete(conn, datosSesion.getConfigEmpresa(), vencimiento.getIdMedioPagoVencimiento());
		}
		catch(ForeingKeyConstraintViolationException e){
			log.info("eliminar() - No se ha podido eliminar el vencimiento: "+ e.getMessage());
			throw new VencimientoConstraintViolationException("Error eliminando vencimiento: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando vencimiento: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new VencimientoException(msg, e);
		}
	}
}
