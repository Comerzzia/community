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
import com.comerzzia.persistencia.core.impuestos.porcentajes.PorcentajeImpuestoBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;


public class PorcentajesImpuestosTiendaDao extends MantenimientoDao {

	private static String TABLA = "CONFIG_IMP_PORCENTAJES_TBL";
	
	private static Logger log = Logger.getMLogger(PorcentajesImpuestosTiendaDao.class);
	
	
	public static void insert(Connection conn, ConfigEmpresaBean config, 
			PorcentajeImpuestoBean porcentaje) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(ID_GRUPO_IMPUESTOS, ID_TRAT_IMPUESTOS, CODIMP, PORCENTAJE, PORCENTAJE_RECARGO) " +
		      "VALUES (?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, porcentaje.getIdGrupoImpuestos());
        	pstmt.setLong(2, porcentaje.getIdTratImpuestos());
        	pstmt.setString(3, porcentaje.getCodImp());
			pstmt.setDouble(4, porcentaje.getPorcentaje());
        	pstmt.setDouble(5, porcentaje.getPorcentajeRecargo());
        	
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
	
	public static void update(Connection conn, ConfigEmpresaBean config, 
			PorcentajeImpuestoBean porcentaje) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " +  getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
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
}
