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

package com.comerzzia.persistencia.core.impuestos.porcentajes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;


public class PorcentajesImpuestosDao extends MantenimientoDao {

	private static String TABLA 		= "CONFIG_IMP_PORCENTAJES_TBL";
	private static String TABLA_TIPOS 	= "CONFIG_IMP_TIPOS_TBL";
	private static String TABLA_GRUPOS 	= "CONFIG_IMP_GRUPOS_TBL";
	private static String TABLA_TRAT 	= "CONFIG_IMP_TRATAMIENTO_TBL";
	private static String VISTA 		= "CONFIG_IMP_PORCENTAJES";
	
	private static Logger log = Logger.getMLogger(PorcentajesImpuestosDao.class);
	
	public static PaginaResultados consultar(Connection conn, 
			ParametrosBuscarPorcentajesImpuestosBean param) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<PorcentajeImpuestoBean> resultados = new ArrayList<PorcentajeImpuestoBean>(param.getTamañoPagina());
    	PaginaResultados paginaResultados = new PaginaResultados(param, resultados);
    	
    	// Consultas
    	String sql = obtenerConsulta(param);
    	String sqlCount = obtenerConsultaCount(param);
    	
        try {
    		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    		
    		// Obtenemos número de resultados
        	log.debug("consultar() - " + sqlCount);
        	rs = stmt.executeQuery(sqlCount);
        	if (rs.next()){
        		paginaResultados.setTotalResultados(rs.getInt(1));
        	}
        	rs.close();
        	
        	// Si tenemos resultados, obtenemos la pagina requerida
            if (paginaResultados.getTotalResultados() > 0) {
            	log.debug("consultar() - " + sql);
                rs = stmt.executeQuery(sql);
                
                int contador = 0;
                if (rs.absolute(paginaResultados.getInicio())) {
                    do {
                    	PorcentajeImpuestoBean porcentaje = new PorcentajeImpuestoBean();
                    	porcentaje.setIdGrupoImpuestos(rs.getLong("ID_GRUPO_IMPUESTOS"));
                    	porcentaje.setVigenciaDesde(rs.getDate("VIGENCIA_DESDE"));
                    	porcentaje.setIdTratImpuestos(rs.getLong("ID_TRAT_IMPUESTOS"));
                    	porcentaje.setDesTratamientoImpuesto(rs.getString("DESTRATIMP"));
                    	porcentaje.setCodImp(rs.getString("CODIMP"));
                    	porcentaje.setDesImpuesto(rs.getString("DESIMP"));
                    	porcentaje.setAplicaRecargo(rs.getString("APLICA_RECARGO"));
                    	porcentaje.setPorcentaje(rs.getDouble("PORCENTAJE"));
                    	porcentaje.setPorcentajeRecargo(rs.getDouble("PORCENTAJE_RECARGO"));
                		resultados.add(porcentaje);
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
        			stmt.close();
        		}
        		catch(Exception ignore) {;}
        	}
	} 
	
	public static String obtenerConsulta(ParametrosBuscarPorcentajesImpuestosBean param) {
		String sql = null;
		
		sql = "SELECT ID_GRUPO_IMPUESTOS, VIGENCIA_DESDE, ID_TRAT_IMPUESTOS, DESTRATIMP, CODIMP, DESIMP, APLICA_RECARGO, PORCENTAJE, PORCENTAJE_RECARGO " +
		      "FROM " + getNombreElementoConfiguracion(VISTA);
		
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
	
	
	public static String obtenerConsultaCount(ParametrosBuscarPorcentajesImpuestosBean param) {
		String sql = null;
		
		sql = "SELECT COUNT(*) " +
		      "FROM " + getNombreElementoConfiguracion(VISTA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }
        
		return sql;
	}

	
	private static String getClausulaWhere(ParametrosBuscarPorcentajesImpuestosBean param) {
		String where = "";
		
		// ID_GRUPO_IMPUESTOS
		if (param.getIdGrupoImpuestos() != null) {
			where = "ID_GRUPO_IMPUESTOS = " + param.getIdGrupoImpuestos() + " ";
		}
		
		// ID_TRAT_IMPUESTOS
		if (param.getIdTratamientoImpuestos() != null) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "ID_TRAT_IMPUESTOS = " + param.getIdTratamientoImpuestos() + " ";
		}
		
		return where;
	} 
	
	public static PorcentajeImpuestoBean consultar(Connection conn, Long idGrupoImpuestos, Long idTratImpuestos, String codImp) 
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		
		PorcentajeImpuestoBean porcentajeImpuesto = null;

		sql = "SELECT ID_GRUPO_IMPUESTOS, " +
					 "VIGENCIA_DESDE, " +
					 "ID_TRAT_IMPUESTOS, " +
					 "DESTRATIMP, " +
					 "CODIMP, " +
					 "DESIMP, " +
					 "APLICA_RECARGO, " +
					 "PORCENTAJE, " +
					 "PORCENTAJE_RECARGO " +
				"FROM " + getNombreElementoConfiguracion(VISTA) +
			   "WHERE ID_GRUPO_IMPUESTOS = ? " +
			     "AND ID_TRAT_IMPUESTOS = ? " +
			     "AND CODIMP = ? ";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idGrupoImpuestos);
			pstmt.setLong(2, idTratImpuestos);
			pstmt.setString(3, codImp);

			log.debug("consultar() - " + pstmt);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				porcentajeImpuesto = new PorcentajeImpuestoBean();
				porcentajeImpuesto.setIdGrupoImpuestos(rs.getLong("ID_GRUPO_IMPUESTOS"));
				porcentajeImpuesto.setVigenciaDesde(rs.getDate("VIGENCIA_DESDE"));
				porcentajeImpuesto.setIdTratImpuestos(rs.getLong("ID_TRAT_IMPUESTOS"));
				porcentajeImpuesto.setDesTratamientoImpuesto(rs.getString("DESTRATIMP"));
				porcentajeImpuesto.setCodImp(rs.getString("CODIMP"));
				porcentajeImpuesto.setAplicaRecargo(rs.getString("APLICA_RECARGO"));
				porcentajeImpuesto.setDesImpuesto(rs.getString("DESIMP"));
				porcentajeImpuesto.setPorcentaje(rs.getDouble("PORCENTAJE"));
				porcentajeImpuesto.setPorcentajeRecargo(rs.getDouble("PORCENTAJE_RECARGO"));
			}

			return porcentajeImpuesto;
		}
		finally {
			try {
				rs.close();
			} catch (Exception ignore) {}

			try {
				pstmt.close();
			} catch (Exception ignore) {}
		}
	}
	
	
	public static List<PorcentajeImpuestoBean> consultar(Connection conn, Long idGrupoImpuestos, Long idTratImpuestos)
			throws SQLException {
		
		Map<String, PorcentajeImpuestoBean> porcentajes = consultarMapa(conn, idGrupoImpuestos, idTratImpuestos);
		return new ArrayList<PorcentajeImpuestoBean>(porcentajes.values());
	}
	
	
	public static Map<String, PorcentajeImpuestoBean> consultarMapa(Connection conn, Long idGrupoImpuestos, Long idTratImpuestos) 
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		
		Map<String, PorcentajeImpuestoBean> porcentajes = new HashMap<String, PorcentajeImpuestoBean>();
		
		sql = "SELECT ID_GRUPO_IMPUESTOS, " +
		      "ID_TRAT_IMPUESTOS, " +
		      "CODIMP, " +
		      "DESIMP, " +
		      "PORCENTAJE, " +
		      "PORCENTAJE_RECARGO " +
	          "FROM " + getNombreElementoConfiguracion(VISTA) +
              "WHERE ID_GRUPO_IMPUESTOS = ? " +
              "AND ID_TRAT_IMPUESTOS = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idGrupoImpuestos);
			pstmt.setLong(2, idTratImpuestos);

			log.debug("consultar() - " + pstmt);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PorcentajeImpuestoBean porcentajeImpuesto = new PorcentajeImpuestoBean();
				porcentajeImpuesto.setIdGrupoImpuestos(rs.getLong("ID_GRUPO_IMPUESTOS"));
				porcentajeImpuesto.setIdGrupoImpuestos(rs.getLong("ID_TRAT_IMPUESTOS"));
				porcentajeImpuesto.setCodImp(rs.getString("CODIMP"));
				porcentajeImpuesto.setDesImpuesto(rs.getString("DESIMP"));
				porcentajeImpuesto.setPorcentaje(rs.getDouble("PORCENTAJE"));
				porcentajeImpuesto.setPorcentajeRecargo(rs.getDouble("PORCENTAJE_RECARGO"));
				
				porcentajes.put(porcentajeImpuesto.getCodImp(), porcentajeImpuesto);
			}

			return porcentajes;
		}
		finally {
			try {
				rs.close();
			} 
			catch (Exception ignore) {}
			try {
				pstmt.close();
			} 
			catch (Exception ignore) {}
		}
	}
	
	public static void update(Connection conn, PorcentajeImpuestoBean porcentaje) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElementoConfiguracion(TABLA) +
		      "SET PORCENTAJE = ?, " +
		      "PORCENTAJE_RECARGO = ? " +
		      "WHERE ID_GRUPO_IMPUESTOS = ? " +
			     "AND ID_TRAT_IMPUESTOS = ? " +
			     "AND CODIMP = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);		
        	pstmt.setDouble(1, porcentaje.getPorcentaje());
        	pstmt.setDouble(2, porcentaje.getPorcentajeRecargo());
        	pstmt.setLong(3, porcentaje.getIdGrupoImpuestos());
        	pstmt.setLong(4, porcentaje.getIdTratImpuestos());
        	pstmt.setString(5, porcentaje.getCodImp());
        	
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
	
	public static void inicializarPorcentajesImpuestos (Connection conn, PorcentajeImpuestoBean porcentaje) throws SQLException{
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElementoConfiguracion(TABLA) +
		      "(ID_GRUPO_IMPUESTOS, ID_TRAT_IMPUESTOS, CODIMP, PORCENTAJE, PORCENTAJE_RECARGO) " +
		      "SELECT ?, ?, CODIMP, 0, 0 FROM " + getNombreElementoConfiguracion(TABLA_TIPOS);
		
		try {
			pstmt = new PreparedStatement(conn, sql);		
        	pstmt.setLong(1, porcentaje.getIdGrupoImpuestos());
        	pstmt.setLong(2, porcentaje.getIdTratImpuestos());
        	
        	log.debug("inicializarPorcentajesImpuestos() - " + pstmt);
        	
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

	public static void inicializarPorcentajesImpuestosParaTratamiento (Connection conn, Long idTratImpuesto) throws SQLException{
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElementoConfiguracion(TABLA) +
		      "(ID_GRUPO_IMPUESTOS, ID_TRAT_IMPUESTOS, CODIMP, PORCENTAJE, PORCENTAJE_RECARGO) " +
		      "SELECT GRUPOS.ID_GRUPO_IMPUESTOS, ?, TIPOS.CODIMP, 0, 0 " +
		      "FROM " + getNombreElementoConfiguracion(TABLA_GRUPOS) + " GRUPOS, " +
		      			getNombreElementoConfiguracion(TABLA_TIPOS) + " TIPOS";
		
		try {
			pstmt = new PreparedStatement(conn, sql);		
        	pstmt.setLong(1, idTratImpuesto);
        	
        	log.debug("inicializarPorcentajesImpuestosParaTratamiento() - " + pstmt);
        	
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

	public static void inicializarPorcentajesImpuestosParaTipo (Connection conn, String codImpuesto) throws SQLException{
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElementoConfiguracion(TABLA) +
		      "(ID_GRUPO_IMPUESTOS, ID_TRAT_IMPUESTOS, CODIMP, PORCENTAJE, PORCENTAJE_RECARGO) " +
		      "SELECT GRUPOS.ID_GRUPO_IMPUESTOS, TRAT.ID_TRAT_IMPUESTOS, ?, 0, 0 " +
		      "FROM " + getNombreElementoConfiguracion(TABLA_GRUPOS) + " GRUPOS, " +
		      			getNombreElementoConfiguracion(TABLA_TRAT) + " TRAT";
		
		try {
			pstmt = new PreparedStatement(conn, sql);		
        	pstmt.setString(1, codImpuesto);
        	
        	log.debug("inicializarPorcentajesImpuestosParaTipo() - " + pstmt);
        	
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

	public static void inicializarPorcentajesImpuestosParaGrupo (Connection conn, Long idGrupoImpuestos) throws SQLException{
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElementoConfiguracion(TABLA) +
		      "(ID_GRUPO_IMPUESTOS, ID_TRAT_IMPUESTOS, CODIMP, PORCENTAJE, PORCENTAJE_RECARGO) " +
		      "SELECT ?, TRAT.ID_TRAT_IMPUESTOS, TIPOS.CODIMP, 0, 0 " +
		      "FROM " + getNombreElementoConfiguracion(TABLA_TRAT) + " TRAT, " +
		      			getNombreElementoConfiguracion(TABLA_TIPOS) + " TIPOS";
		
		try {
			pstmt = new PreparedStatement(conn, sql);		
        	pstmt.setLong(1, idGrupoImpuestos);
        	
        	log.debug("inicializarPorcentajesImpuestosParaGrupo() - " + pstmt);
        	
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
	
	public static void borrarPorcentajesTipo(Connection conn, String codImpuesto) throws SQLException{
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElementoConfiguracion(TABLA) +
				" WHERE CODIMP = ? ";
		try {
			pstmt = new PreparedStatement(conn, sql);		
        	pstmt.setString(1, codImpuesto);
        	
        	log.debug("borrarPorcentajesTipo() - " + pstmt);
        	
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

	public static void borrarPorcentajesTratamiento(Connection conn, Long idTratImpuesto) throws SQLException{
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElementoConfiguracion(TABLA) +
				" WHERE ID_TRAT_IMPUESTOS = ? ";
		try {
			pstmt = new PreparedStatement(conn, sql);		
        	pstmt.setLong(1, idTratImpuesto);
        	
        	log.debug("borrarPorcentajesTratamiento() - " + pstmt);
        	
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
