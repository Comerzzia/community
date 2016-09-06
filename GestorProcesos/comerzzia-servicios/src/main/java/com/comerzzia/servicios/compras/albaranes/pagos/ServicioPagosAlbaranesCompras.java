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

package com.comerzzia.servicios.compras.albaranes.pagos;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.compras.albaranes.pagos.PagoAlbaranCompraBean;
import com.comerzzia.persistencia.compras.albaranes.pagos.PagosAlbaranesComprasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioPagosAlbaranesCompras {

	protected static Logger log = Logger.getMLogger(ServicioPagosAlbaranesCompras.class);
	
	
	public static List<PagoAlbaranCompraBean> consultar(Long idAlbaran, DatosSesionBean datosSesion) 
			throws PagoAlbaranCompraException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			
			log.debug("consultar() - Consultando pagos del albarán de compra " + idAlbaran);
			
			return PagosAlbaranesComprasDao.consultar(conn, datosSesion.getConfigEmpresa(), idAlbaran);
		}
		catch(SQLException e){
			String msg = "Error consultando pagos de un albarán de compra: " + e.getMessage();
			log.error("consultar() - " + msg);
			
			throw new PagoAlbaranCompraException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	

	public static void salvar(PagoAlbaranCompraBean pago, DatosSesionBean datosSesion, Connection conn)throws PagoAlbaranCompraException, PagoAlbaranCompraConstraintViolationException {
	
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
	
	
	public static void crear(PagoAlbaranCompraBean pago, DatosSesionBean datosSesion, Connection conn) 
			throws PagoAlbaranCompraException {
		try {
			log.debug("crear() - Añadiendo pago al albarán de compra " + pago.getIdAlbaran()); 
			
			PagosAlbaranesComprasDao.insert(conn, pago, datosSesion.getConfigEmpresa());
		}
		catch (SQLException e) {
			String msg = "Error añadiendo pago a albarán de compra: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new PagoAlbaranCompraException(msg, e);
		}
	}
	
	
	public static void modificar(PagoAlbaranCompraBean pago, DatosSesionBean datosSesion, Connection conn) 
			throws PagoAlbaranCompraException {
		try {
			log.debug("modificar() - Modificando pago del albarán de compra " + pago.getIdAlbaran()); 
			
			PagosAlbaranesComprasDao.update(conn, datosSesion.getConfigEmpresa(), pago);
		}
		catch (SQLException e) {
			String msg = "Error modificando pago de albarán de compra: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new PagoAlbaranCompraException(msg, e);
		}
	}
	
	
	public static void eliminar(com.comerzzia.persistencia.compras.albaranes.pagos.PagoAlbaranCompraBean pago, DatosSesionBean datosSesion, Connection conn) 
			throws PagoAlbaranCompraException, PagoAlbaranCompraConstraintViolationException {
		try {
			log.debug("eliminar() - Eliminando pago del albarán de compra " + pago.getIdAlbaran()); 
			
			PagosAlbaranesComprasDao.delete(conn, datosSesion.getConfigEmpresa(), pago);
		}
		catch (ForeingKeyConstraintViolationException e) {
			log.info("eliminar() - No se ha podido eliminar el pago del albarán de compra: " + e.getMessage());
			throw new PagoAlbaranCompraConstraintViolationException("Error eliminando pago con vencimiento " 
					+ pago.getIdMedioPagoVencimiento() + " del albarán de compra: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando pago de albarán de compra: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new PagoAlbaranCompraException(msg, e);
		}
	}
}
