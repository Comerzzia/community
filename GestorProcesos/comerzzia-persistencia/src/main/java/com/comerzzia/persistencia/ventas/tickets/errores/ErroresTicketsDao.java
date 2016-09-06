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

package com.comerzzia.persistencia.ventas.tickets.errores;

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
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.util.xml.XMLDocumentException;


public class ErroresTicketsDao extends MantenimientoDao {
	
	private static String TABLA = "D_TICKETS_ERR_TBL";
	private static String VISTA = "D_TICKETS_ERR";
	
	private static Logger log = Logger.getMLogger(ErroresTicketsDao.class);
	
	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, ParametrosBuscarErrorTicketsBean param) throws SQLException, XMLDocumentException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<ErrorTicketBean> resultados = new ArrayList<ErrorTicketBean>(param.getTamañoPagina());
    	PaginaResultados paginaResultados = new PaginaResultados(param, resultados);
    	
    	// Consultas
    	String sql = obtenerConsulta(config, param);
    	String sqlCount = obtenerConsultaCount(config, param);
        
    	try {
    		pstmt = new PreparedStatement(conn, sqlCount);
    		if (param.getFecha() != null) {
    			pstmt.setDate(1, Fechas.toSqlDate(param.getFecha()));
    		}
    		
    		// Obtenemos número de resultados
        	log.debug("consultar() - " + pstmt);
        	rs = pstmt.executeQuery();
        	if (rs.next()){
        		paginaResultados.setTotalResultados(rs.getInt(1));
        	}
        	rs.close();
        	pstmt.close();
        	
        	// Si tenemos resultados, obtenemos la página requerida
            if (paginaResultados.getTotalResultados() > 0) {
            	pstmt = new PreparedStatement(conn, sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        		if (param.getFecha() != null) {
        			pstmt.setDate(1, Fechas.toSqlDate(param.getFecha()));
        		}

        		log.debug("consultar() - " + pstmt);
                rs = pstmt.executeQuery();
                
                int contador = 0;
                if (rs.absolute(paginaResultados.getInicio())) {
                    do {
                    	ErrorTicketBean ticket = new ErrorTicketBean();
                    	ticket.setUidTicket(rs.getString("UID_TICKET"));
                		ticket.setCodAlmacen(rs.getString("CODALM"));
                		ticket.setDesAlmacen(rs.getString("DESALM"));
                		ticket.setIdTicket(rs.getLong("ID_TICKET"));
                		ticket.setFecha(rs.getDate("FECHA"));
                		Blob blob = rs.getBlob("TICKET");
                		ticket.setTicket(blob.getBytes(1, (int)blob.length()));
                		ticket.setFechaProceso(rs.getDate("FECHA_PROCESO"));
                		ticket.setMensajeError(rs.getString("MENSAJE_ERROR"));
                		
                		resultados.add(ticket);
                        contador++;
                    } while (rs.next() && contador < paginaResultados.getTamañoPagina());                   
                }        		
        	}
            
            return paginaResultados;
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
	
	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarErrorTicketsBean param) {
		String sql = null;
		
		sql = "SELECT UID_TICKET, CODALM, DESALM, ID_TICKET, FECHA, TICKET, FECHA_PROCESO, MENSAJE_ERROR " +
		      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }
        
        // Clausula ORDER BY
        if (!param.getOrden().isEmpty()) {
        	sql += "ORDER BY " + param.getOrden();
        }
        
		return sql;
	}
	
	public static String obtenerConsultaCount(ConfigEmpresaBean config, ParametrosBuscarErrorTicketsBean param) {
		String sql = null;
		
		sql = "SELECT COUNT(*) " +
		      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }
        
		return sql;
	}
	
	private static String getClausulaWhere(ParametrosBuscarErrorTicketsBean param) {
		String where = "";
		
		// CODALMACEN
		if (!param.getCodAlmacen().isEmpty()) {
			where = "CODALM = '" + param.getCodAlmacen() + "' ";
		}
		
		// FECHA
		if (param.getFecha() != null) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "FECHA = ? ";
		}

		return where;
	}

	public static List<ErrorTicketBean> consultarTicketsErroneos(Connection conn, ConfigEmpresaBean config, ParametrosBuscarErrorTicketsBean param) throws SQLException, XMLDocumentException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<ErrorTicketBean> resultados = new ArrayList<ErrorTicketBean>();
    	
    	// Consultas
    	String sql = obtenerConsulta(config, param);
        
    	try {
           	pstmt = new PreparedStatement(conn, sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    		if (param.getFecha() != null) {
    			pstmt.setDate(1, Fechas.toSqlDate(param.getFecha()));
    		}

    		log.debug("consultar() - " + pstmt);
            rs = pstmt.executeQuery();
                
            while(rs.next()){
    			ErrorTicketBean ticket = new ErrorTicketBean();
    			ticket.setUidTicket(rs.getString("UID_TICKET"));
        		ticket.setCodAlmacen(rs.getString("CODALM"));
        		ticket.setDesAlmacen(rs.getString("DESALM"));
        		ticket.setIdTicket(rs.getLong("ID_TICKET"));
        		ticket.setFecha(rs.getDate("FECHA"));
        		Blob blob = rs.getBlob("TICKET");
        		ticket.setTicket(blob.getBytes(1, (int)blob.length()));
        		ticket.setFechaProceso(rs.getDate("FECHA_PROCESO"));
        		ticket.setMensajeError(rs.getString("MENSAJE_ERROR"));

        		resultados.add(ticket);
            }
                		
            return resultados;
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
	
    public static ErrorTicketBean consultar(Connection conn, String uidTicket, ConfigEmpresaBean config) throws SQLException, XMLDocumentException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	ErrorTicketBean ticket = null;
    	
    	sql = "SELECT UID_TICKET, CODALM, ID_TICKET, FECHA, TICKET, FECHA_PROCESO, MENSAJE_ERROR " +
                "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
               "WHERE UID_TICKET = ?";

    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, uidTicket);

    		log.debug("consultar() - " + pstmt);
        	
        	rs = pstmt.executeQuery();
        	
        	if(rs.next()){
        		ticket = new ErrorTicketBean();
        		ticket.setUidTicket(rs.getString("UID_TICKET"));
        		ticket.setCodAlmacen(rs.getString("CODALM"));
        		ticket.setIdTicket(rs.getLong("ID_TICKET"));
        		ticket.setFecha(rs.getDate("FECHA"));
        		Blob blob = rs.getBlob("TICKET");
        		ticket.setTicket(blob.getBytes(1, (int)blob.length()));
        		ticket.setFechaProceso(rs.getDate("FECHA_PROCESO"));
        		ticket.setMensajeError(rs.getString("MENSAJE_ERROR"));
        		
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

    public static void insert(Connection conn, ConfigEmpresaBean config, ErrorTicketBean ticket) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(UID_TICKET, CODALM, ID_TICKET, FECHA, TICKET, FECHA_PROCESO, MENSAJE_ERROR) " +
		      "VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1,ticket.getUidTicket());
        	pstmt.setString(2, ticket.getCodAlmacen());
        	pstmt.setLong(3, ticket.getIdTicket());
        	pstmt.setDate(4, Fechas.toSqlDate(ticket.getFecha()));
        	pstmt.setBytes(5, ticket.getTicket());
        	pstmt.setDate(6, Fechas.toSqlDate(ticket.getFechaProceso()));
        	pstmt.setString(7, ticket.getMensajeError());
        	
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

    public static void updateError(Connection conn, ConfigEmpresaBean config, ErrorTicketBean ticket) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "SET FECHA_PROCESO = ?, MENSAJE_ERROR = ? " +
		      "WHERE UID_TICKET = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
	       	pstmt.setDate(1, Fechas.toSqlDate(ticket.getFechaProceso()));
	       	pstmt.setString(2, ticket.getMensajeError());
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

    public static void updateXML(Connection conn, ConfigEmpresaBean config, String xml, String uidTicket) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "SET TICKET = ? " +
		      "WHERE UID_TICKET = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
	       	pstmt.setBytes(1, xml.getBytes());
	       	pstmt.setString(2, uidTicket);
	       	
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

    public static void delete(Connection conn, ConfigEmpresaBean config, ErrorTicketBean ticket) throws SQLException {
		delete(conn, config, ticket.getUidTicket());
	}

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
