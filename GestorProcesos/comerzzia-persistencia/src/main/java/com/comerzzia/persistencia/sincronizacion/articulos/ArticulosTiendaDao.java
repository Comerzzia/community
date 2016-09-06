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
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;


public class ArticulosTiendaDao extends MantenimientoDao {

	private static String TABLA = "T_ARTICULOS_TBL";
	
	private static Logger log = Logger.getMLogger(ArticulosTiendaDao.class);
	
	
	public static void insert(Connection conn, ConfigEmpresaBean config, ArticuloTiendaBean articulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(CODALM, CODART, DESART, FORMATO, CODIMP, OBSERVACIONES, ACTIVO, " + 
		       "NUMEROS_SERIE, DESGLOSE1, DESGLOSE2, GENERICO, VERSION, CODCAT, " + 
		       "ESCAPARATE, FECHA_ALTA) " +
		      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, articulo.getCodAlmacen());
			pstmt.setString(2, articulo.getCodArticulo());
			pstmt.setString(3, articulo.getDesArticulo());
        	pstmt.setString(4, articulo.getFormato());
        	pstmt.setString(5, articulo.getCodImpuesto());
        	pstmt.setString(6, articulo.getObservaciones());
        	pstmt.setString(7, articulo.getActivo());
        	pstmt.setString(8, articulo.getNumSeries());
        	pstmt.setString(9, articulo.getDesglose1());
        	pstmt.setString(10, articulo.getDesglose2());
        	pstmt.setString(11, articulo.getGenerico());
        	pstmt.setLong(12, articulo.getVersion());
        	pstmt.setString(13, articulo.getCodCategorizacion());
        	pstmt.setString(14, articulo.getEscaparate());
        	pstmt.setTimestamp(15, Fechas.toSqlTimestamp(articulo.getFechaAlta()));
        	
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
	
	
	public static int update(Connection conn, ConfigEmpresaBean config, ArticuloTiendaBean articulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET DESART = ?, FORMATO = ?, CODIMP = ?, OBSERVACIONES = ?, ACTIVO = ?, " +
		      "NUMEROS_SERIE = ?, DESGLOSE1 = ?, DESGLOSE2 = ?, GENERICO = ?, VERSION = ?, " +
		      "CODCAT = ?, ESCAPARATE = ?, FECHA_ALTA = ? " +
		      "WHERE CODALM = ? " +
		      "AND CODART = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, articulo.getDesArticulo());
        	pstmt.setString(2, articulo.getFormato());
        	pstmt.setString(3, articulo.getCodImpuesto());
        	pstmt.setString(4, articulo.getObservaciones());
        	pstmt.setString(5, articulo.getActivo());
        	pstmt.setString(6, articulo.getNumSeries());
        	pstmt.setString(7, articulo.getDesglose1());
        	pstmt.setString(8, articulo.getDesglose2());
        	pstmt.setString(9, articulo.getGenerico());
        	pstmt.setLong(10, articulo.getVersion());
        	pstmt.setString(11, articulo.getCodCategorizacion());
        	pstmt.setString(12, articulo.getEscaparate());
        	pstmt.setTimestamp(13, Fechas.toSqlTimestamp(articulo.getFechaAlta()));
        	pstmt.setString(14, articulo.getCodAlmacen());
        	pstmt.setString(15, articulo.getCodArticulo());
        	
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
