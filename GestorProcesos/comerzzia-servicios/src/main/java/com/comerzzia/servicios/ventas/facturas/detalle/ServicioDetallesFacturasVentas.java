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

package com.comerzzia.servicios.ventas.facturas.detalle;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.ventas.facturas.detalle.DetalleFacturaVentaBean;
import com.comerzzia.persistencia.ventas.facturas.detalle.DetalleFacturasVentasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioDetallesFacturasVentas {
	
	protected static Logger log = Logger.getMLogger(ServicioDetallesFacturasVentas.class);

	public static List<DetalleFacturaVentaBean> consultar(Long idFacturaRep, 
			DatosSesionBean datosSesion) throws DetalleFacturaVentaException {
		Connection conn = new Connection();
		try {
			log.debug("consultar() - Consultando detalles de la factura de venta " + idFacturaRep);
			conn.abrirConexion(Database.getConnection());
			return DetalleFacturasVentasDao.consultar(conn, datosSesion.getConfigEmpresa(), idFacturaRep);
		}
		catch(SQLException e){
			String msg = "Error consultando detalles de la factura de venta: " + e.getMessage();
    		log.error("consultar() - " + msg);
    		
    		throw new DetalleFacturaVentaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void crear(DetalleFacturaVentaBean detalleFactura, DatosSesionBean datosSesion, Connection conn) 
			throws DetalleFacturaVentaException, DetalleFacturaVentaConstraintViolationException {
		try {
			log.debug("crear() - Añadiendo base a la factura de venta " + detalleFactura.getIdFacturaRep()); 
			
			DetalleFacturasVentasDao.insert(conn, datosSesion.getConfigEmpresa(), detalleFactura);
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear el detalle de la factura de venta: " + e.getMessage());
			throw new DetalleFacturaVentaConstraintViolationException("Error creando detalle: "
					+ "El detalle " + detalleFactura.getLinea() + "de la factura" + detalleFactura.getIdFacturaRep() + " ya está registrado en el sistema");
		}
		catch (SQLException e) {
			String msg = "Error añadiendo base a la factura de venta: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new DetalleFacturaVentaException(msg, e);
		}
	}
}
