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

package com.comerzzia.servicios.compras.albaranes.impuestos;

import java.sql.SQLException;

import com.comerzzia.persistencia.compras.albaranes.impuestos.ImpuestosAlbaranesComprasDao;
import com.comerzzia.persistencia.core.impuestos.ImpuestoBean;
import com.comerzzia.persistencia.core.impuestos.ImpuestosBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioImpuestosAlbaranesCompras {

	protected static Logger log = Logger.getMLogger(ServicioImpuestosAlbaranesCompras.class);
	
	
	public static ImpuestosBean consultar(Long idAlbaran, 
			DatosSesionBean datosSesion) throws ImpuestoAlbaranCompraException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando impuestos del albarán de compra " + idAlbaran);
			
			conn.abrirConexion(Database.getConnection());
			
			return new ImpuestosBean(ImpuestosAlbaranesComprasDao.consultar(conn, datosSesion.getConfigEmpresa(), idAlbaran));
		}
		catch(SQLException e){
			String msg = "Error consultando impuestos de un albarán de compra: " + e.getMessage();
    		log.error("consultar() - " + msg);
    		
    		throw new ImpuestoAlbaranCompraException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void crear(ImpuestoBean impuesto, DatosSesionBean datosSesion, Connection conn) 
			throws ImpuestoAlbaranCompraException {
		try {
			log.debug("crear() - Añadiendo impuesto " + impuesto.getCodImpuesto()
					+ " al albarán de compra " + impuesto.getIdDocumento()); 
			
			ImpuestosAlbaranesComprasDao.insert(conn, datosSesion.getConfigEmpresa(), impuesto);
		}
		catch (SQLException e) {
			String msg = "Error añadiendo impuesto a albarán de compra: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new ImpuestoAlbaranCompraException(msg, e);
		}
	}
	
	
	public static void eliminar(Long idAlbaran, DatosSesionBean datosSesion, Connection conn) 
			throws ImpuestoAlbaranCompraException {
		try {
			log.debug("eliminar() - Eliminando impuestos del albarán de compra " + idAlbaran); 
			
			ImpuestosAlbaranesComprasDao.delete(conn, datosSesion.getConfigEmpresa(), idAlbaran);
		}
		catch (SQLException e) {
			String msg = "Error eliminando impuestos de un albarán de compra: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new ImpuestoAlbaranCompraException(msg, e);
		}
	}
}
