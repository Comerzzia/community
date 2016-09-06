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
import com.comerzzia.persistencia.core.impuestos.tratamientosimpuestos.TratamientoImpuestoBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;


public class TratamientosImpuestosTiendaDao extends MantenimientoDao {

	private static String TABLA = "CONFIG_IMP_TRATAMIENTO_TBL";
	
	private static Logger log = Logger.getMLogger(TratamientosImpuestosTiendaDao.class);
	
	
    public static void insert(Connection conn, ConfigEmpresaBean config, 
    		TratamientoImpuestoBean tratImpuesto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(ID_TRAT_IMPUESTOS, CODTRATIMP, DESTRATIMP, APLICA_RECARGO) " +
		      "VALUES (?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, tratImpuesto.getIdTratImpuestos());
        	pstmt.setString(2, tratImpuesto.getCodTratImp());
        	pstmt.setString(3, tratImpuesto.getDesTratImp());
        	pstmt.setString(4, tratImpuesto.getAplicaRecargo());
        	
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
    		TratamientoImpuestoBean tratImpuesto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "SET CODTRATIMP = ?, DESTRATIMP = ?, APLICA_RECARGO = ? " +
		      "WHERE ID_TRAT_IMPUESTOS = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			
        	pstmt.setString(1, tratImpuesto.getCodTratImp());
        	pstmt.setString(2, tratImpuesto.getDesTratImp());
        	pstmt.setString(3, tratImpuesto.getAplicaRecargo());
        	pstmt.setLong(4, tratImpuesto.getIdTratImpuestos());
        	
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
