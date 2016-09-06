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

package com.comerzzia.servicios.ventas.facturas.impuestos;

import java.sql.SQLException;

import com.comerzzia.persistencia.core.impuestos.ImpuestoBean;
import com.comerzzia.persistencia.ventas.facturas.impuestos.ImpuestosFacturasVentasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.log.Logger;

public class ServicioImpuestosFacturasVentas {

	protected static Logger log = Logger.getMLogger(ServicioImpuestosFacturasVentas.class);
	
	
	public static void crear(ImpuestoBean impuesto, DatosSesionBean datosSesion, Connection conn) 
			throws ImpuestoFacturaVentaException, ImpuestoFacturaVentaConstraintViolationException {
		try {
			log.debug("crear() - Añadiendo impuesto " + impuesto.getCodImpuesto()
					+ " a la factura de venta " + impuesto.getIdDocumento()); 
			
			ImpuestosFacturasVentasDao.insert(conn, datosSesion.getConfigEmpresa(), impuesto);
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear el impuesto de la factura de venta: " + e.getMessage());
			throw new ImpuestoFacturaVentaConstraintViolationException("Error creando impuesto: "
					+ "El impuesto " + impuesto.getCodImpuesto() + "de la factura" + impuesto.getIdDocumento() + " ya está registrado en el sistema");
		}
		catch (SQLException e) {
			String msg = "Error añadiendo impuesto a la factura de venta: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new ImpuestoFacturaVentaException(msg, e);
		}
	}
}
