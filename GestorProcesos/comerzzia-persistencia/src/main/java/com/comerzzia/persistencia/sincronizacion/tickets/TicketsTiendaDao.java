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

package com.comerzzia.persistencia.sincronizacion.tickets;

import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;


public class TicketsTiendaDao extends MantenimientoDao {
	
	private static String TABLA = "T_TICKETS_TBL";
	
	private static Logger log = Logger.getMLogger(TicketsTiendaDao.class);
			
	
	public static List<TicketTiendaBean> consultarPendientesTienda(Connection conn, ConfigEmpresaBean config, String codAlmacen) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	List<TicketTiendaBean> resultados = new ArrayList<TicketTiendaBean>();
    	
    	sql = "SELECT UID_TICKET, CODALM, ID_TICKET, FECHA, TICKET, ENVIADO, FECHA_ENVIO " +
	          "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
	          "WHERE CODALM = ? " + 
	          "AND ENVIADO = 'N'";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, codAlmacen);
    		
    		log.debug("consultarPendientesTienda() - " + pstmt);
        	
    		rs = pstmt.executeQuery();
        	
        	while(rs.next()){
        		TicketTiendaBean ticket = new TicketTiendaBean();
        		ticket.setUidTicket(rs.getString("UID_TICKET"));
        		ticket.setCodAlmacen(rs.getString("CODALM"));
        		ticket.setIdTicket(rs.getLong("ID_TICKET"));
        		ticket.setFecha(rs.getTimestamp("FECHA"));
        		Blob blob = rs.getBlob("TICKET");
        		ticket.setTicket(blob.getBytes(1, (int)blob.length()));
        		ticket.setEnviado(rs.getString("ENVIADO"));
        		ticket.setFechaEnvio(rs.getTimestamp("FECHA_ENVIO"));
        		
        		resultados.add(ticket);
        	}
        	
        	return resultados;
    	}
    	finally {
    		try{
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try{
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
	
	
	public static void update(Connection conn, ConfigEmpresaBean config, TicketTiendaBean ticket) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "SET ENVIADO = ?, FECHA_ENVIO = ? " +
		      "WHERE UID_TICKET = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, ticket.getEnviado());
        	pstmt.setTimestamp(2, Fechas.toSqlTimestamp(ticket.getFechaEnvio()));
        	pstmt.setString(3, ticket.getUidTicket());
        	
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
}
