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

package com.comerzzia.persistencia.sincronizacion.impuestos;

import java.sql.SQLException;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.core.impuestos.grupos.GrupoImpuestosBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;


public class GruposImpuestosTiendaDao extends MantenimientoDao {

	private static String TABLA = "CONFIG_IMP_GRUPOS_TBL";
	
	private static Logger log = Logger.getMLogger(GruposImpuestosTiendaDao.class);
	
	
	public static void insert(Connection conn, ConfigEmpresaBean config, 
			GrupoImpuestosBean grupo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
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
	
	
	public static int update(Connection conn, ConfigEmpresaBean config, 
			GrupoImpuestosBean grupo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "SET VIGENCIA_DESDE = ? " +
		      "WHERE ID_GRUPO_IMPUESTOS = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setDate(1, Fechas.toSqlDate(grupo.getVigenciaDesde()));
        	pstmt.setLong(2, grupo.getIdGrupoImpuestos());
        	
        	log.debug("update() - " + pstmt);
        	
        	return pstmt.executeUpdate();
		}
		finally {
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
}
