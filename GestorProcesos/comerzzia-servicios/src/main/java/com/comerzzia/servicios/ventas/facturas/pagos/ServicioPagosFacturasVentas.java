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

package com.comerzzia.servicios.ventas.facturas.pagos;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.ventas.facturas.pagos.PagoFacturaVentaBean;
import com.comerzzia.persistencia.ventas.facturas.pagos.PagosFacturasVentasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioPagosFacturasVentas {

	protected static Logger log = Logger.getMLogger(ServicioPagosFacturasVentas.class);
	
	public static List<PagoFacturaVentaBean> consultar(Long idFacturaRep, 
			DatosSesionBean datosSesion) throws PagoFacturaVentaException {
		Connection conn = new Connection();
		try {
			log.debug("consultar() - Consultando medios de pago de la factura de venta " + idFacturaRep);
			conn.abrirConexion(Database.getConnection());
			return PagosFacturasVentasDao.consultar(conn, datosSesion.getConfigEmpresa(), idFacturaRep);
		}
		catch(SQLException e){
			String msg = "Error consultando medios de pago de la factura de venta: " + e.getMessage();
    		log.error("consultar() - " + msg);
    		
    		throw new PagoFacturaVentaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void crear(PagoFacturaVentaBean medioPago, DatosSesionBean datosSesion, Connection conn) 
			throws PagoFacturaVentaException, PagoFacturaVentaConstraintViolationException {
		try {
			log.debug("crear() - Añadiendo medio de pago a la factura de venta " + medioPago.getIdFacturaRep()); 
			
			PagosFacturasVentasDao.insert(conn, datosSesion.getConfigEmpresa(), medioPago);
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear el medio de pago de la factura de venta: " + e.getMessage());
			throw new PagoFacturaVentaConstraintViolationException("Error creando medio de pago");
		}
		catch (SQLException e) {
			String msg = "Error añadiendo medio de pago a la factura de venta: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new PagoFacturaVentaException(msg, e);
		}
	}
}
