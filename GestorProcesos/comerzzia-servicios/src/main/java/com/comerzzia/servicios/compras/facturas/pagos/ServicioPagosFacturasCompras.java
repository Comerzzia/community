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

package com.comerzzia.servicios.compras.facturas.pagos;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.compras.facturas.pagos.PagoFacturaCompraBean;
import com.comerzzia.persistencia.compras.facturas.pagos.PagosFacturasComprasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioPagosFacturasCompras {

	protected static Logger log = Logger.getMLogger(ServicioPagosFacturasCompras.class);
	
	public static List<PagoFacturaCompraBean> consultar(Long idFacturaSop, 
			DatosSesionBean datosSesion) throws PagoFacturaCompraException {
		Connection conn = new Connection();
		try {
			log.debug("consultar() - Consultando medios de pago de la factura de compra " + idFacturaSop);
			conn.abrirConexion(Database.getConnection());
			return PagosFacturasComprasDao.consultar(conn, datosSesion.getConfigEmpresa(), idFacturaSop);
		}
		catch(SQLException e){
			String msg = "Error consultando medios de pago de la factura de compra: " + e.getMessage();
    		log.error("consultar() - " + msg);
    		
    		throw new PagoFacturaCompraException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void crear(PagoFacturaCompraBean medioPago, DatosSesionBean datosSesion, Connection conn) 
			throws PagoFacturaCompraException, PagoFacturaCompraConstraintViolationException {
		try {
			log.debug("crear() - Añadiendo medio de pago a la factura de compra " + medioPago.getIdFacturaSop()); 
			
			PagosFacturasComprasDao.insert(conn, datosSesion.getConfigEmpresa(), medioPago);
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear el medio de pago de la factura de compra: " + e.getMessage());
			throw new PagoFacturaCompraConstraintViolationException("Error creando medio de pago");
		}
		catch (SQLException e) {
			String msg = "Error añadiendo medio de pago a la factura de compra: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new PagoFacturaCompraException(msg, e);
		}
	}
}
