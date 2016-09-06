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

package com.comerzzia.servicios.ventas.albaranes.pagos;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.ventas.albaranes.pagos.PagoAlbaranVentaBean;
import com.comerzzia.persistencia.ventas.albaranes.pagos.PagosAlbaranesVentasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioPagosAlbaranesVentas {

	protected static Logger log = Logger.getMLogger(ServicioPagosAlbaranesVentas.class);
	
	
	public static List<PagoAlbaranVentaBean> consultar(Long idAlbaran, DatosSesionBean datosSesion) 
			throws PagoAlbaranVentaException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			
			log.debug("consultar() - Consultando pagos del albarán de venta " + idAlbaran);
			
			return PagosAlbaranesVentasDao.consultar(conn, datosSesion.getConfigEmpresa(), idAlbaran);
		}
		catch(SQLException e){
			String msg = "Error consultando pagos de un albarán de venta: " + e.getMessage();
			log.error("consultar() - " + msg);
			
			throw new PagoAlbaranVentaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	

	public static void salvar(PagoAlbaranVentaBean pago, DatosSesionBean datosSesion, Connection conn)throws PagoAlbaranVentaException, PagoAlbaranVentaConstraintViolationException {
	
		switch (pago.getEstadoBean()) {
			case Estado.NUEVO:
				crear(pago, datosSesion, conn);
				break;
		  
			case Estado.MODIFICADO:
				modificar(pago, datosSesion, conn);
				break;
		  
			case Estado.BORRADO:
				eliminar(pago, datosSesion, conn);
		}
	}
	
	
	public static void crear(PagoAlbaranVentaBean pago, DatosSesionBean datosSesion, Connection conn) 
			throws PagoAlbaranVentaException {
		try {
			log.debug("crear() - Añadiendo pago al albarán de venta " + pago.getIdAlbaran()); 
			
			PagosAlbaranesVentasDao.insert(conn, pago, datosSesion.getConfigEmpresa());
		}
		catch (SQLException e) {
			String msg = "Error añadiendo pago a albarán de venta: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new PagoAlbaranVentaException(msg, e);
		}
	}
	
	
	public static void modificar(PagoAlbaranVentaBean pago, DatosSesionBean datosSesion, Connection conn) 
			throws PagoAlbaranVentaException {
		try {
			log.debug("modificar() - Modificando pago del albarán de venta " + pago.getIdAlbaran()); 
			
			PagosAlbaranesVentasDao.update(conn, datosSesion.getConfigEmpresa(), pago);
		}
		catch (SQLException e) {
			String msg = "Error modificando pago de albarán de venta: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new PagoAlbaranVentaException(msg, e);
		}
	}
	
	
	public static void eliminar(PagoAlbaranVentaBean pago, DatosSesionBean datosSesion, Connection conn) 
			throws PagoAlbaranVentaException, PagoAlbaranVentaConstraintViolationException {
		try {
			log.debug("eliminar() - Eliminando pago del albarán de venta " + pago.getIdAlbaran()); 
			
			PagosAlbaranesVentasDao.delete(conn, datosSesion.getConfigEmpresa(), pago);
		}
		catch (ForeingKeyConstraintViolationException e) {
			log.info("eliminar() - No se ha podido eliminar el pago del albarán de venta: " + e.getMessage());
			throw new PagoAlbaranVentaConstraintViolationException("Error eliminando pago con vencimiento " 
					+ pago.getIdMedioPagoVencimiento() + " del albarán de venta: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando pago de albarán de venta: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new PagoAlbaranVentaException(msg, e);
		}
	}
}
