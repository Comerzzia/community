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

package com.comerzzia.persistencia.sincronizacion;

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

public class TrabajosSincronizadorDao extends MantenimientoDao {

	private static String TABLA = "D_SINCRONIZADOR_TRABAJOS_TBL";
	private static String VISTA = "D_SINCRONIZADOR_TRABAJOS";
	
	private static Logger log = Logger.getMLogger(TrabajosSincronizadorDao.class);
	
	public static List<ListaTrabajos> consultarTrabajos(Connection conn, ConfigEmpresaBean config)
			throws SQLException {
		Statement stmt = null;
		String sql = null;
		ResultSet rs = null;
		List<ListaTrabajos> listaTrabajos = null;
		
		sql = "SELECT ID_TRABAJO, " +
					 "TRABAJO, " +
					 "CLASE, " +
					 "CODALM, " +
					 "DESALM, " +
					 "ESTADO, " +
					 "FECHA_INICIO, " +
					 "INTERVALO, " +
					 "FECHA_PROXIMA_EJEC, " +
					 "FECHA_ULTIMA_EJEC, " +
					 "RESULTADO, " +
					 "OBSERVACIONES " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
			"ORDER BY TRABAJO, CODALM";
		
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
			log.debug("consultarTrabajos() - " + sql);
			rs = stmt.executeQuery(sql);
			
			listaTrabajos = new ArrayList<ListaTrabajos>();
			while (rs.next()) {
				ListaTrabajos contenedorTrabajos = new ListaTrabajos();
				contenedorTrabajos.setTitulo(rs.getString("TRABAJO"));
				
				List<TrabajoSincronizadorBean> trabajos = new ArrayList<TrabajoSincronizadorBean>();
				TrabajoSincronizadorBean trabajo = obtenerTrabajo(rs);
				trabajos.add(trabajo);
				while (rs.next() && rs.getString("TRABAJO").equals(contenedorTrabajos.getTitulo())) {
					trabajo = obtenerTrabajo(rs);
					trabajos.add(trabajo);
				}
				
				contenedorTrabajos.setListaTrabajos(trabajos);
				
				listaTrabajos.add(contenedorTrabajos);
				
				rs.previous();
			}
			
			return listaTrabajos;
		}
		finally {
			try {
				rs.close();
			} catch (Exception ignore) {}
			
			try {
				stmt.close();
			} catch (Exception ignore) {}
		}
	}
	
	private static TrabajoSincronizadorBean obtenerTrabajo(ResultSet rs) throws SQLException {
		TrabajoSincronizadorBean trabajo = new TrabajoSincronizadorBean();
		trabajo.setIdTrabajo(rs.getLong("ID_TRABAJO"));
		trabajo.setTrabajo(rs.getString("TRABAJO"));
		trabajo.setClase(rs.getString("CLASE"));
		trabajo.setCodAlmacen(rs.getString("CODALM"));
		trabajo.setDesAlmacen(rs.getString("DESALM"));
		trabajo.setEstado(rs.getByte("ESTADO"));
		trabajo.setFechaInicio(rs.getTimestamp("FECHA_INICIO"));
		trabajo.setIntervalo(rs.getString("INTERVALO"));
		trabajo.setFechaProximaEjecucion(rs.getTimestamp("FECHA_PROXIMA_EJEC"));
		trabajo.setFechaUltimaEjecucion(rs.getTimestamp("FECHA_ULTIMA_EJEC"));
		trabajo.setResultado(rs.getString("RESULTADO") != null ? rs.getByte("RESULTADO") : null);
		trabajo.setObservaciones(rs.getString("OBSERVACIONES"));
		
		return trabajo;
	}
	
	public static List<ListaTrabajos> consultarTrabajosTiendas(Connection conn, ConfigEmpresaBean config)
			throws SQLException {
		Statement stmt = null;
		String sql = null;
		ResultSet rs = null;
		List<ListaTrabajos> listaTrabajos = null;
		
		sql = "SELECT ID_TRABAJO, " +
				  "TRABAJO, " +
				  "CLASE, " +
				  "CODALM, " +
				  "DESALM, " +
				  "ESTADO, " +
				  "FECHA_INICIO, " +
				  "INTERVALO, " +
				  "FECHA_PROXIMA_EJEC, " +
				  "FECHA_ULTIMA_EJEC, " +
				  "RESULTADO, " +
				  "OBSERVACIONES " +
			   "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
			   "ORDER BY CODALM, TRABAJO";
		
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
			log.debug("consultarTrabajosTiendas() - " + sql);
			rs = stmt.executeQuery(sql);
			
			listaTrabajos = new ArrayList<ListaTrabajos>();
			while (rs.next()) {
				ListaTrabajos contenedorTrabajos = new ListaTrabajos();
				String titulo = rs.getString("CODALM") + " - " + rs.getString("DESALM");
				contenedorTrabajos.setTitulo(titulo);
				
				List<TrabajoSincronizadorBean> trabajos = new ArrayList<TrabajoSincronizadorBean>();
				TrabajoSincronizadorBean trabajo = obtenerTrabajo(rs);
				trabajos.add(trabajo);
				while (rs.next()) {
					titulo = rs.getString("CODALM") + " - " + rs.getString("DESALM");
					
					if(titulo.equals(contenedorTrabajos.getTitulo())) {
						trabajo = obtenerTrabajo(rs);
						trabajos.add(trabajo);
					}
					else {
						break;
					}
				}
				
				contenedorTrabajos.setListaTrabajos(trabajos);
				
				listaTrabajos.add(contenedorTrabajos);
				
				rs.previous();
			}
			
			return listaTrabajos;
		}
		finally {
			try {
				rs.close();
			} catch (Exception ignore) {}
			
			try {
				stmt.close();
			} catch (Exception ignore) {}
		}
	}
	
	
	/**
	 * Obtiene la lista de las distintas clases de trabajo registradas en el sistema
	 * @param conn
	 * @param config
	 * @return
	 * @throws SQLException
	 */
	public static List<ClaseTrabajoBean> consultarClasesTrabajos(Connection conn, ConfigEmpresaBean config)
			throws SQLException {
		Statement stmt = null;
		String sql = null;
		ResultSet rs = null;
		
		List<ClaseTrabajoBean> listaTrabajos = new ArrayList<ClaseTrabajoBean>();
		
		sql = "SELECT TRABAJO, CLASE " +
			  "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
			  "GROUP BY TRABAJO, CLASE";
		
		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			
			log.debug("consultarClasesTrabajos() - " + sql);
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				ClaseTrabajoBean claseTrabajo = new ClaseTrabajoBean();
				claseTrabajo.setTrabajo(rs.getString("TRABAJO"));
				claseTrabajo.setClase(rs.getString("CLASE"));
				
				listaTrabajos.add(claseTrabajo);
			}
			
			return listaTrabajos;
		}
		finally {
			try {
				rs.close();
			} 
			catch (Exception ignore) {}
			try {
				stmt.close();
			} 
			catch (Exception ignore) {}
		}
	}
	
	
	public static TrabajoSincronizadorBean consultar(Connection conn, ConfigEmpresaBean config, Long idTrabajo) 
			throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	TrabajoSincronizadorBean trabajo = null;
    	
    	sql = "SELECT ID_TRABAJO, " +
		    	  "TRABAJO, " +
				  "CLASE, " +
				  "CODALM, " +
				  "DESALM, " +
				  "ESTADO, " +
				  "FECHA_INICIO, " +
				  "INTERVALO, " +
				  "FECHA_PROXIMA_EJEC, " +
				  "FECHA_ULTIMA_EJEC, " +
				  "RESULTADO, " +
				  "OBSERVACIONES " +
		      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		      "WHERE ID_TRABAJO = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idTrabajo);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		trabajo = obtenerTrabajo(rs);
        	}
        	
        	return trabajo;
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
	
	
	public static void update(Connection conn, ConfigEmpresaBean config, TrabajoSincronizadorBean trabajo) 
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET ESTADO = ?, FECHA_INICIO = ?, INTERVALO = ?, FECHA_PROXIMA_EJEC = ?, " + 
		      "FECHA_ULTIMA_EJEC = ?, RESULTADO = ?, OBSERVACIONES = ? " +
		      "WHERE ID_TRABAJO = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setByte(1, trabajo.getEstado());
			pstmt.setTimestamp(2, Fechas.toSqlTimestamp(trabajo.getFechaInicio()));
			pstmt.setString(3, trabajo.getIntervalo());
			pstmt.setTimestamp(4, Fechas.toSqlTimestamp(trabajo.getFechaProximaEjecucion()));
			pstmt.setTimestamp(5, Fechas.toSqlTimestamp(trabajo.getFechaUltimaEjecucion()));
			pstmt.setByte(6, trabajo.getResultado());
			pstmt.setString(7, trabajo.getObservaciones());
			pstmt.setLong(8, trabajo.getIdTrabajo());
			
			log.debug("update() - " + pstmt);
        	
        	pstmt.execute();
		}
		finally {
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
	
	public static void insert(Connection conn, ConfigEmpresaBean config, TrabajoSincronizadorBean trabajo) 
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(ID_TRABAJO, TRABAJO, CLASE, CODALM, ESTADO, FECHA_INICIO, " + 
		      "INTERVALO, FECHA_PROXIMA_EJEC, FECHA_ULTIMA_EJEC, RESULTADO, OBSERVACIONES) " +
		      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, trabajo.getIdTrabajo());
        	pstmt.setString(2, trabajo.getTrabajo());
        	pstmt.setString(3, trabajo.getClase());
        	pstmt.setString(4, trabajo.getCodAlmacen());
        	pstmt.setByte(5, trabajo.getEstado());
        	pstmt.setTimestamp(6, Fechas.toSqlTimestamp(trabajo.getFechaInicio()));
        	pstmt.setString(7, trabajo.getIntervalo());
        	pstmt.setTimestamp(8, Fechas.toSqlTimestamp(trabajo.getFechaProximaEjecucion()));
        	pstmt.setTimestamp(9, Fechas.toSqlTimestamp(trabajo.getFechaUltimaEjecucion()));
        	pstmt.setByte(10, trabajo.getResultado());
        	pstmt.setString(11, trabajo.getObservaciones());
        	
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
	
	public static void delete(Connection conn, ConfigEmpresaBean config,
			String codAlmacen) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "DELETE FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE CODALM = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codAlmacen);

			log.debug("delete() - " + pstmt);

			pstmt.execute();
		} catch (SQLException e) {
			throw getDaoException(e);
		} finally {
			try {
				pstmt.close();
			} catch (Exception ignore) {
				;
			}
		}
	}
}
