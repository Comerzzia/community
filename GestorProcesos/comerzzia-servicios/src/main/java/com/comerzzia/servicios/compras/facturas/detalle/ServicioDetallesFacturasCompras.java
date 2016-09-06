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

package com.comerzzia.servicios.compras.facturas.detalle;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.compras.facturas.detalle.DetalleFacturaCompraBean;
import com.comerzzia.persistencia.compras.facturas.detalle.DetalleFacturasComprasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;

public class ServicioDetallesFacturasCompras {

	protected static Logger log = Logger.getMLogger(ServicioDetallesFacturasCompras.class);
	
	public static List<DetalleFacturaCompraBean> consultar(Long idFacturaSop, 
			DatosSesionBean datosSesion) throws DetalleFacturaCompraException {
		Connection conn = new Connection();
		try {
			log.debug("consultar() - Consultando detalles de la factura de compra " + idFacturaSop);
			conn.abrirConexion(Database.getConnection());
			return DetalleFacturasComprasDao.consultar(conn, datosSesion.getConfigEmpresa(), idFacturaSop);
		}
		catch(SQLException e){
			String msg = "Error consultando detalles de la factura de compra: " + e.getMessage();
    		log.error("consultar() - " + msg);
    		
    		throw new DetalleFacturaCompraException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void crear(DetalleFacturaCompraBean detalleFactura, DatosSesionBean datosSesion, Connection conn) 
			throws DetalleFacturaCompraException, DetalleFacturaCompraConstraintViolationException {
		try {
			log.debug("crear() - Añadiendo detalle a la factura de compra " + detalleFactura.getIdFacturaSop()); 
			
			DetalleFacturasComprasDao.insert(conn, datosSesion.getConfigEmpresa(), detalleFactura);
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear el detalle de la factura de compra: " + e.getMessage());
			throw new DetalleFacturaCompraConstraintViolationException("Error creando detalle: "
					+ "El detalle " + detalleFactura.getLinea() + "de la factura" + detalleFactura.getIdFacturaSop() + " ya está registrado en el sistema");
		}
		catch (SQLException e) {
			String msg = "Error añadiendo detalle a la factura de compra: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new DetalleFacturaCompraException(msg, e);
		}
	}
}
