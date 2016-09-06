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

package com.comerzzia.persistencia.ventas.tickets.historico;

import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.ventas.tickets.ResumenTicketsPendientesBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.util.xml.XMLDocumentException;


public class HistoricoTicketsDao extends MantenimientoDao {
	
	private static String TABLA = "D_TICKETS_HIST_TBL";
	private static String VISTA = "D_TICKETS_HIST";
	
	private static Logger log = Logger.getMLogger(HistoricoTicketsDao.class);
	
	
	public static PaginaResultados consultarResumen(Connection conn, ConfigEmpresaBean config, ParametrosBuscarHistoricoTicketsBean param) throws SQLException, XMLDocumentException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<ResumenTicketsPendientesBean> resultados = new ArrayList<ResumenTicketsPendientesBean>(param.getTamañoPagina());
    	PaginaResultados paginaResultados = new PaginaResultados(param, resultados);
    	
    	// Consultas
    	String sql = obtenerConsultaResumen(config, param);
    	String sqlCount = obtenerConsultaResumenCount(config, param);
        
    	try {
    		pstmt = new PreparedStatement(conn, sqlCount);
    		insertarParametros(pstmt, param);
    		
    		// Obtenemos número de resultados
        	log.debug("consultar() - " + pstmt);
        	rs = pstmt.executeQuery();
        	if (rs.next()){
        		paginaResultados.setTotalResultados(rs.getInt(1));
        	}
        	rs.close();
        	pstmt.close();
        	
        	// Si tenemos resultados, obtenemos la pagina requerida
            if (paginaResultados.getTotalResultados() > 0) {
        		pstmt = new PreparedStatement(conn, sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        		insertarParametros(pstmt, param);
            	log.debug("consultar() - " + pstmt);
                rs = pstmt.executeQuery();
                
                int contador = 0;
                if (rs.absolute(paginaResultados.getInicio())) {
                    do {
                    	ResumenTicketsPendientesBean ticket = new ResumenTicketsPendientesBean();
                		ticket.setCodAlmacen(rs.getString("CODALM"));
                		ticket.setDesAlmacen(rs.getString("DESALM"));
                		ticket.setFecha(rs.getDate("DIA"));
                		ticket.setNumTickets(rs.getLong("TICKETS"));
                		
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
	
	public static String obtenerConsultaResumen(ConfigEmpresaBean config, ParametrosBuscarHistoricoTicketsBean param) {
		String sql = null;
		
		sql = "SELECT CODALM, DESALM, CAST(CAST(CAST(FECHA AS DATE) AS CHAR(10)) AS DATE) AS DIA, COUNT(*) AS TICKETS " +
		      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }
        
        sql += "GROUP BY CODALM, DESALM, CAST(CAST(CAST(FECHA AS DATE) AS CHAR(10)) AS DATE) ";

        // Clausula ORDER BY
        if (!param.getOrden().isEmpty()) {
        	sql += "ORDER BY " + param.getOrden();
        }

		return sql;
	}
	
	public static String obtenerConsultaResumenCount(ConfigEmpresaBean config, ParametrosBuscarHistoricoTicketsBean param) {
		String sql = null;
		
		sql = "SELECT COUNT(*) FROM (" +
			  "SELECT COUNT(*) " +
		      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }
        
        sql += "GROUP BY CODALM, DESALM, CAST(CAST(CAST(FECHA AS DATE) AS CHAR(10)) AS DATE)) RESUMEN";
        
		return sql;
	}
	
	private static String getClausulaWhere(ParametrosBuscarHistoricoTicketsBean param) {
		String where = "";
		
		// CODALMACEN
		if (!param.getCodAlmacen().isEmpty()) {
			where = "CODALM = '" + param.getCodAlmacen() + "' ";
		}
		
		// FECHA_DESDE
		if (param.getFechaDesde() != null) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "FECHA >= ? ";
		}
		
		// FECHA_HASTA
		if (param.getFechaHasta() != null) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "FECHA <= ? ";
		}

		return where;
	}

	private static void insertarParametros(PreparedStatement pstmt, ParametrosBuscarHistoricoTicketsBean param) throws SQLException {
		Integer indice = 1;
		// FECHA_DESDE
		if (param.getFechaDesde() != null) {
			pstmt.setTimestamp(indice, Fechas.toSqlTimestamp(param.getFechaDesde()));
			indice++;
		}
		
		// FECHA_HASTA
		if (param.getFechaHasta() != null) {
			pstmt.setTimestamp(indice, Fechas.toSqlTimestamp(param.getFechaHasta()));
			indice++;
		}

	}
	
    public static HistoricoTicketBean consultar(Connection conn, Long idTicket, String codAlm, ConfigEmpresaBean config) throws SQLException, XMLDocumentException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	HistoricoTicketBean ticket = null;
    	
    	sql = "SELECT UID_TICKET, CODALM, ID_TICKET, FECHA, TICKET, FECHA_PROCESO " +
	            "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
	           "WHERE UID_TICKET = ? ";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idTicket);
    		pstmt.setString(2, codAlm);

    		log.debug("consultar() - " + pstmt);
        	
        	rs = pstmt.executeQuery();
        	
        	if(rs.next()){
        		ticket = new HistoricoTicketBean();
        		ticket.setUidTicket(rs.getString("UID_TICKET"));
        		ticket.setCodAlmacen(rs.getString("CODALM"));
        		ticket.setIdTicket(rs.getLong("ID_TICKET"));
        		ticket.setFecha(rs.getDate("FECHA"));
        		Blob blob = rs.getBlob("TICKET");
        		ticket.setTicket(blob.getBytes(1, (int)blob.length()));
        		ticket.setFechaProceso(rs.getTimestamp("FECHA_PROCESO"));
        		
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

    public static void insert(Connection conn, ConfigEmpresaBean config, HistoricoTicketBean ticket) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(UID_TICKET, CODALM, ID_TICKET, FECHA, TICKET, FECHA_PROCESO) " +
		      "VALUES (?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, ticket.getUidTicket());
        	pstmt.setString(2, ticket.getCodAlmacen());
        	pstmt.setLong(3, ticket.getIdTicket());
        	pstmt.setTimestamp(4, Fechas.toSqlTimestamp(ticket.getFecha()));
        	pstmt.setBytes(5, ticket.getTicket());
        	pstmt.setTimestamp(6, Fechas.toSqlTimestamp(ticket.getFechaProceso()));
        	
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

	public static void delete(Connection conn, ConfigEmpresaBean config, HistoricoTicketBean ticket) throws SQLException {
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
			} catch (Exception ignore) {
				;
			}
		}
	}
}
