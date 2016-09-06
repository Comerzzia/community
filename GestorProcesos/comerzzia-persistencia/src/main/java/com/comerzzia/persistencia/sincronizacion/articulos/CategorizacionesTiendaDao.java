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

package com.comerzzia.persistencia.sincronizacion.articulos;

import java.sql.SQLException;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;


public class CategorizacionesTiendaDao extends MantenimientoDao {

protected static final String TABLA = "T_CATEGORIZACION_TBL";
	
	/** Logger */
	protected static Logger log = Logger.getMLogger(CategorizacionesTiendaDao.class);
	
	
	public static void insert(Connection conn, ConfigEmpresaBean config, 
			CategorizacionTiendaBean categorizacion) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(CODALM, CODCAT, DESCAT, ACTIVO) " +
		      "VALUES (?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, categorizacion.getCodAlmacen());
			pstmt.setString(2, categorizacion.getCodCat());
			pstmt.setString(3, categorizacion.getDesCat());
			pstmt.setString(4, categorizacion.getActivo());
			
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
			CategorizacionTiendaBean categorizacion) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
	          "SET DESCAT = ?, ACTIVO = ? " +
	          "WHERE CODALM = ? " +
	            "AND CODCAT = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, categorizacion.getDesCat());
			pstmt.setString(2, categorizacion.getActivo());
			pstmt.setString(3, categorizacion.getCodAlmacen());
			pstmt.setString(4, categorizacion.getCodCat());
			
			log.debug("update() - " + pstmt);
        	
        	return pstmt.executeUpdate();
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
