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

package com.comerzzia.persistencia.core.impuestos.grupos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;

public class GruposImpuestosDao extends MantenimientoDao {

	private static String TABLA = "CONFIG_IMP_GRUPOS_TBL";
	
	private static Logger log = Logger.getMLogger(GruposImpuestosDao.class);
	
	public static GrupoImpuestosBean consultar(Connection conn, Long idGrupoImpuestos) 
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		
		GrupoImpuestosBean grupoImpuestos = null;

		sql = "SELECT ID_GRUPO_IMPUESTOS, " +
					 "VIGENCIA_DESDE " +
				"FROM " + getNombreElementoConfiguracion(TABLA) +
			   "WHERE ID_GRUPO_IMPUESTOS = ? ";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idGrupoImpuestos);

			log.debug("consultar() - " + pstmt);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				grupoImpuestos = new GrupoImpuestosBean();
				grupoImpuestos.setIdGrupoImpuestos(rs.getLong("ID_GRUPO_IMPUESTOS"));
				grupoImpuestos.setVigenciaDesde(rs.getDate("VIGENCIA_DESDE"));
			}

			return grupoImpuestos;
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
	
	/**
	 * Obtiene el grupo de impuestos cuya fecha de inicio de vigencia es la más actual a partir
	 * de una fecha dada que se encuentra dentro de las fechas de vigencia de inicio y fin.
	 * 
	 * @param conn
	 * @param config
	 * @param fecha
	 * @return
	 * @throws SQLException
	 */
	public static GrupoImpuestosBean consultar(Connection conn, Date fecha)
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;

		GrupoImpuestosBean grupoImpuestos = null;

		sql = "SELECT ID_GRUPO_IMPUESTOS, " + 
					 "VIGENCIA_DESDE " +
				"FROM " + getNombreElementoConfiguracion(TABLA) +
			   "WHERE VIGENCIA_DESDE <= ? " +
			"ORDER BY VIGENCIA_DESDE DESC";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setDate(1, Fechas.toSqlDate(fecha));

			log.debug("consultar() - " + pstmt);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				grupoImpuestos = new GrupoImpuestosBean();
				grupoImpuestos.setIdGrupoImpuestos(rs.getLong("ID_GRUPO_IMPUESTOS"));
				grupoImpuestos.setVigenciaDesde(rs.getDate("VIGENCIA_DESDE"));
			}

			return grupoImpuestos;
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
	
	public static void insert(Connection conn, GrupoImpuestosBean grupo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElementoConfiguracion(TABLA) + 
		      "(ID_GRUPO_IMPUESTOS, VIGENCIA_DESDE) " +
		      "VALUES (?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, grupo.getIdGrupoImpuestos());
        	pstmt.setDate(2, Fechas.toSqlDate(grupo.getVigenciaDesde()));
        	
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
}
