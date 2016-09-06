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

package com.comerzzia.servicios.ventas.pedidos.impuestos;

import java.sql.SQLException;

import com.comerzzia.persistencia.core.impuestos.ImpuestoBean;
import com.comerzzia.persistencia.core.impuestos.ImpuestosBean;
import com.comerzzia.persistencia.ventas.pedidos.impuestos.ImpuestosPedidosVentasDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioImpuestosPedidosVentas {

	protected static Logger log = Logger.getMLogger(ServicioImpuestosPedidosVentas.class);
	
	
	public static ImpuestosBean consultar(Long idPedido, DatosSesionBean datosSesion) throws ImpuestoPedidoVentaException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			
			return consultar(conn, idPedido, datosSesion);
		}
		catch(SQLException e){
			String msg = "Error consultando impuestos de un pedido de venta: " + e.getMessage();
    		log.error("consultar() - " + msg);
    		
    		throw new ImpuestoPedidoVentaException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static ImpuestosBean consultar(Connection conn, Long idPedido, DatosSesionBean datosSesion) throws ImpuestoPedidoVentaException {
		try {
			log.debug("consultar() - Consultando impuestos del pedido de venta " + idPedido);
			
			return new ImpuestosBean(ImpuestosPedidosVentasDao.consultar(conn, datosSesion.getConfigEmpresa(), idPedido));
		}
		catch(SQLException e){
			String msg = "Error consultando impuestos de un pedido de venta: " + e.getMessage();
    		log.error("consultar() - " + msg);
    		
    		throw new ImpuestoPedidoVentaException(msg, e);
		}
	}
	
	public static void crear(ImpuestoBean impuesto, DatosSesionBean datosSesion, Connection conn)throws ImpuestoPedidoVentaException {
		try {
			log.debug("crear() - Añadiendo impuesto " + impuesto.getCodImpuesto()
					+ " al pedido de venta " + impuesto.getIdDocumento()); 
			
			ImpuestosPedidosVentasDao.insert(conn, datosSesion.getConfigEmpresa(), impuesto);
		}
		catch (SQLException e) {
			String msg = "Error añadiendo impuesto a pedido de venta: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new ImpuestoPedidoVentaException(msg, e);
		}
	}
	
	public static void eliminar(Long idPedido, DatosSesionBean datosSesion, Connection conn)throws ImpuestoPedidoVentaException {
		try {
			log.debug("eliminar() - Eliminando impuestos del pedido de venta " + idPedido); 
			
			ImpuestosPedidosVentasDao.delete(conn, datosSesion.getConfigEmpresa(), idPedido);
		}
		catch (SQLException e) {
			String msg = "Error eliminando impuestos de un pedido de venta: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new ImpuestoPedidoVentaException(msg, e);
		}
	}
}
