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

package com.comerzzia.servicios.compras.facturas.vencimientos;

import java.sql.SQLException;

import com.comerzzia.persistencia.compras.facturas.vencimientos.VencimientoFacturaCompraBean;
import com.comerzzia.persistencia.compras.facturas.vencimientos.VencimientosFacturasComprasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.log.Logger;

public class ServicioVencimientosFacturasCompras {

	protected static Logger log = Logger.getMLogger(ServicioVencimientosFacturasCompras.class);
	
	public static void crear(VencimientoFacturaCompraBean vencimiento, DatosSesionBean datosSesion, Connection conn) 
			throws VencimientoFacturaCompraException, VencimientoFacturaCompraConstraintViolationException {
		try {
			log.debug("crear() - Añadiendo vencimiento con identificador " + vencimiento.getIdVencimiento()); 
			VencimientosFacturasComprasDao.insertarPago(conn, datosSesion.getConfigEmpresa(), vencimiento);
			
			log.debug("crear() - Añadiendo documento del vencimiento");
			VencimientosFacturasComprasDao.insertarDocumento(conn, datosSesion.getConfigEmpresa(), vencimiento);
		
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear el vencimiento de la factura de compra: " + e.getMessage());
			throw new VencimientoFacturaCompraConstraintViolationException("Error creando vencimiento");
		}
		catch (SQLException e) {
			String msg = "Error añadiendo vencimiento a la factura de compra: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new VencimientoFacturaCompraException(msg, e);
		}
	}
}
