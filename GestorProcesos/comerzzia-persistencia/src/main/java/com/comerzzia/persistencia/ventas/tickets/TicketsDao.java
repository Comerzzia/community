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

package com.comerzzia.persistencia.ventas.tickets;

import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.xml.XMLDocumentException;


public class TicketsDao extends MantenimientoDao {
	
	private static String TABLA = "D_TICKETS_TBL";
	private static String VISTA = "D_TICKETS";
	
	private static Logger log = Logger.getMLogger(TicketsDao.class);

	
	/**
	 * Obtiene el número de tickets pendientes de procesar agrupados por almacén y fecha
	 * @param conn
	 * @param config
	 * @return
	 * @throws SQLException
	 */
	public static List<ResumenTicketsPendientesBean> consultarResumenPendientes(Connection conn, ConfigEmpresaBean config) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	
    	List<ResumenTicketsPendientesBean> resultados = new ArrayList<ResumenTicketsPendientesBean>();
    	
    	sql = "SELECT CODALM, DESALM, CAST(CAST(CAST(FECHA AS DATE) AS CHAR(10)) AS DATE) AS DIA, COUNT(*) AS TICKETS " +
    		  "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
    		  "GROUP BY CODALM, DESALM, CAST(CAST(CAST(FECHA AS DATE) AS CHAR(10)) AS DATE)";
    	
    	try {
    		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

    		log.debug("consultarResumenPendientes() - " + sql);
        	
        	rs = stmt.executeQuery(sql);
        	
        	while(rs.next()){
        		ResumenTicketsPendientesBean resumen = new ResumenTicketsPendientesBean();
        		resumen.setCodAlmacen(rs.getString("CODALM"));
        		resumen.setDesAlmacen(rs.getString("DESALM"));
        		resumen.setFecha(rs.getDate("DIA"));
        		resumen.setNumTickets(rs.getLong("TICKETS"));
        		
        		resultados.add(resumen);
        	}
        	
        	return resultados;
    	}
    	finally {
    		try{
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try{
    			stmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
	
	
	/**
	 * Obtiene la lista de tickets pendientes de procesar
	 * @param conn
	 * @param config
	 * @return
	 * @throws SQLException
	 */
	public static List<TicketBean> consultarPendientes(Connection conn, ConfigEmpresaBean config) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	List<TicketBean> resultados = new ArrayList<TicketBean>();
    	
    	sql = "SELECT UID_TICKET, CODALM, ID_TICKET, FECHA, TICKET " +
    		    "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
    		    "ORDER BY CODALM, ID_TICKET";
    	
    	try {
    		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

    		log.debug("consultarPendientes() - " + sql);
        	
        	rs = stmt.executeQuery(sql);
        	
        	while(rs.next()){
        		TicketBean ticket = new TicketBean();
        		ticket.setUidTicket(rs.getString("UID_TICKET"));
        		ticket.setCodAlmacen(rs.getString("CODALM"));
        		ticket.setIdTicket(rs.getLong("ID_TICKET"));
        		ticket.setFecha(rs.getDate("FECHA"));
        		Blob blob = rs.getBlob("TICKET");
        		ticket.setTicket(blob.getBytes(1, (int)blob.length()));
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
    			stmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}

	
	/**
	 * Obtiene un ticket pendiente de procesar de un almacén determinado
	 * @param conn
	 * @param idTicket
	 * @param codAlm
	 * @param config
	 * @return
	 * @throws SQLException
	 * @throws XMLDocumentException
	 */
	public static TicketBean consultar(Connection conn, String uidTicket, ConfigEmpresaBean config) throws SQLException, XMLDocumentException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	TicketBean ticket = null;
    	
    	sql = "SELECT UID_TICKET, CODALM, ID_TICKET, FECHA, TICKET " +
    		  "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
    		  "WHERE UID_TICKET = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, uidTicket);

    		log.debug("consultar() - " + pstmt);
        	
        	rs = pstmt.executeQuery();
        	
        	if(rs.next()){
        		ticket = new TicketBean();
        		ticket.setUidTicket(rs.getString("UID_TICKET"));
        		ticket.setCodAlmacen(rs.getString("CODALM"));
        		ticket.setIdTicket(rs.getLong("ID_TICKET"));
        		ticket.setFecha(rs.getDate("FECHA"));
        		ticket.setTicket(rs.getBytes("TICKET"));
        	}
        	
        	return ticket;
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

	
    /**
     * Inserta un nuevo ticket pendiente de procesar
     * @param conn
     * @param config
     * @param ticket
     * @throws SQLException
     */
    public static void insert(Connection conn, ConfigEmpresaBean config, TicketBean ticket) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(UID_TICKET, CODALM, ID_TICKET, FECHA, TICKET) " +
		      "VALUES (?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, ticket.getUidTicket());
        	pstmt.setString(2, ticket.getCodAlmacen());
        	pstmt.setLong(3, ticket.getIdTicket());
        	pstmt.setTimestamp(4, Fechas.toSqlTimestamp(ticket.getFecha()));
        	pstmt.setBytes(5, ticket.getTicket());
        	
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

    
	/**
	 * Borra un ticket para que ya no este pendiente de procesar
	 * @param conn
	 * @param config
	 * @param ticket
	 * @throws SQLException
	 */
	public static void delete(Connection conn, ConfigEmpresaBean config, TicketBean ticket) throws SQLException {
		delete(conn, config, ticket.getUidTicket());
	}

	
	/**
	 * Borra un ticket para que ya no este pendiente de procesar
	 * @param conn
	 * @param config
	 * @param codAlm
	 * @param idTicket
	 * @throws SQLException
	 */
	public static void delete(Connection conn, ConfigEmpresaBean config, String uidTicket) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "DELETE FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE UID_TICKET = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, uidTicket);
			
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
			catch (Exception ignore) {
				;
			}
		}
	}
}
