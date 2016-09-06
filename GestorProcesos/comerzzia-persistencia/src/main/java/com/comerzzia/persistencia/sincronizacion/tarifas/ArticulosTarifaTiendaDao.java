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

package com.comerzzia.persistencia.sincronizacion.tarifas;

import java.sql.SQLException;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;


public class ArticulosTarifaTiendaDao extends MantenimientoDao {
	
	private static String TABLA = "T_TARIFAS_DET_TBL";
	
	private static Logger log = Logger.getMLogger(ArticulosTarifaTiendaDao.class);
	
	
	public static void insert(Connection conn, ConfigEmpresaBean config, 
			ArticuloTarifaTiendaBean articulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(CODALM, CODTAR, CODART, PRECIO_COSTO, FACTOR_MARCAJE, PRECIO_VENTA, " + 
		      "PRECIO_TOTAL, VERSION) " +
		      "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, articulo.getCodAlmacen());
			pstmt.setString(2, articulo.getCodTar());
			pstmt.setString(3, articulo.getCodArt());
			pstmt.setDouble(4, articulo.getPrecioCosto());
			pstmt.setDouble(5, articulo.getFactorMarcaje());
			pstmt.setDouble(6, articulo.getPrecioVenta());
			pstmt.setDouble(7, articulo.getPrecioTotal());
			pstmt.setLong(8, articulo.getVersion());
			
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
			ArticuloTarifaTiendaBean articulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
			  "SET PRECIO_COSTO = ?, FACTOR_MARCAJE = ?, PRECIO_VENTA = ?, " + 
			  "PRECIO_TOTAL = ?, VERSION = ? " +
			  "WHERE CODALM = ? " +
			    "AND CODTAR = ? " + 
			    "AND CODART = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setDouble(1, articulo.getPrecioCosto());
			pstmt.setDouble(2, articulo.getFactorMarcaje());
			pstmt.setDouble(3, articulo.getPrecioVenta());
			pstmt.setDouble(4, articulo.getPrecioTotal());
			pstmt.setLong(5, articulo.getVersion());
			pstmt.setString(6, articulo.getCodAlmacen());
			pstmt.setString(7, articulo.getCodTar());
			pstmt.setString(8, articulo.getCodArt());
			
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
	
	
	public static void delete(Connection conn, ConfigEmpresaBean config, 
			ArticuloTarifaTiendaBean articulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODALM = ? " +
		        "AND CODTAR = ? " +
		        "AND CODART = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, articulo.getCodAlmacen());
        	pstmt.setString(2, articulo.getCodTar());
        	pstmt.setString(3, articulo.getCodArt());
        	
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
    		catch(Exception ignore) {;}
    	}
	}
}
