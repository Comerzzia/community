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

package com.comerzzia.persistencia.compras.pedidos.pagos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class PagosPedidosComprasDao extends MantenimientoDao {
	
	private static String TABLA = "D_PROV_PEDIDOS_PAG_TBL";
	private static String VISTA = "D_PROV_PEDIDOS_PAG";
	
	private static Logger log = Logger.getMLogger(PagosPedidosComprasDao.class);
	
	public static List<PagoPedidoCompraBean> consultar(Connection conn, ConfigEmpresaBean config, Long idPedido) throws SQLException {
		String sql = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<PagoPedidoCompraBean> pagos = null;
		
		sql = "SELECT ID_PROV_PEDIDO, " +
		 			 "LINEA, " +
		 			 "ID_MEDPAG_VEN, " +
		 			 "DESMEDPAG_VEN, " +
		 			 "IMPORTE " +
		 		"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		 	   "WHERE ID_PROV_PEDIDO = ? " +
		 	"ORDER BY LINEA";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idPedido);
			
        	log.debug("consultar() - " + pstmt);
        	rs = pstmt.executeQuery();
        	
        	pagos = new ArrayList<PagoPedidoCompraBean>();
        	while (rs.next()) {
        		PagoPedidoCompraBean pago = new PagoPedidoCompraBean();
        		pago.setIdPedido(rs.getLong("ID_PROV_PEDIDO"));
        		pago.setLinea(rs.getInt("LINEA"));
        		pago.setIdMedioPagoVencimiento(rs.getLong("ID_MEDPAG_VEN"));
        		pago.setDesMedioPagoVencimiento(rs.getString("DESMEDPAG_VEN"));
        		pago.setImporte(rs.getDouble("IMPORTE"));
        		
        		pagos.add(pago);
        	}
        	
        	return pagos;
		}
		catch (SQLException e) {
			throw getDaoException(e);
		}
		finally {
    		try {
    			rs.close();
    		}
    		catch(Exception ignore) {;}
			
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
	
	public static void insert(Connection conn, PagoPedidoCompraBean pago, ConfigEmpresaBean config) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +  
				"(" +
				"ID_PROV_PEDIDO, " +
				"LINEA, " +
				"ID_MEDPAG_VEN, " +
				"IMPORTE " +
				") " +
			  "VALUES (?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, pago.getIdPedido());
			pstmt.setInt(2, pago.getLinea());
			pstmt.setLong(3, pago.getIdMedioPagoVencimiento());
			pstmt.setDouble(4, pago.getImporte());
			
        	log.debug("insert() - " + pstmt);
        	pstmt.execute();
		}
		catch (SQLException e) {
			throw getDaoException(e);
		}
		finally {
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}

	public static void update(Connection conn, ConfigEmpresaBean config, PagoPedidoCompraBean pago) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		     	 "SET ID_MEDPAG_VEN = ?, " +
		     	 	 "IMPORTE = ? " +
		       "WHERE ID_PROV_PEDIDO = ? " +
		         "AND LINEA = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, pago.getIdMedioPagoVencimiento());
			pstmt.setDouble(2, pago.getImporte());
			pstmt.setLong(3, pago.getIdPedido());
			pstmt.setInt(4, pago.getLinea());
			
			log.debug("update() - " + pstmt);
	    	pstmt.execute();
		}
		catch (SQLException e) {
			throw getDaoException(e);
		}
		finally {
			try {
				pstmt.close();
			}
			catch(Exception ignore) {;}
		}
	}

	public static void delete(Connection conn, ConfigEmpresaBean config, PagoPedidoCompraBean pago) throws SQLException {
		delete(conn, config, pago.getIdPedido(), pago.getLinea());
	}
	
	public static void delete(Connection conn, ConfigEmpresaBean config, Long idPedido, Integer linea) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
			   "WHERE ID_PROV_PEDIDO = ? " +
			     "AND LINEA = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idPedido);
        	pstmt.setInt(2, linea);
        	
        	log.debug("delete() - " + pstmt);
        	pstmt.execute();
		}
		catch (SQLException e) {
			throw getDaoException(e);
		}
		finally {
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
	
	public static void delete(Connection conn, ConfigEmpresaBean config, Long idPedido) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
			   "WHERE ID_PROV_PEDIDO = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idPedido);
        	
        	log.debug("delete() - " + pstmt);
        	pstmt.execute();
		}
		catch (SQLException e) {
			throw getDaoException(e);
		}
		finally {
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
}
