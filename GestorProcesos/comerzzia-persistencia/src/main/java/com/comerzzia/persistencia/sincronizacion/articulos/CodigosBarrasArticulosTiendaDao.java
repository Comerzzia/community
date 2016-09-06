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
import java.util.Date;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;


public class CodigosBarrasArticulosTiendaDao extends MantenimientoDao {

	protected static final String TABLA = "T_ARTICULOS_CODBAR_TBL";
	
	/** Logger */
	protected static Logger log = Logger.getMLogger(CodigosBarrasArticulosTiendaDao.class);
	
	
	public static void insert(Connection conn, ConfigEmpresaBean config, CodigoBarrasArticuloTiendaBean codigo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(CODALM, CODART, DESGLOSE1, DESGLOSE2, CODIGO_BARRAS, DUN14, FECHA_ALTA, FACTOR_CONVERSION) " +
		      "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codigo.getCodAlmacen());
			pstmt.setString(2, codigo.getCodArticulo());
        	pstmt.setString(3, codigo.getDesglose1());
        	pstmt.setString(4, codigo.getDesglose2());
        	pstmt.setString(5, codigo.getCodigoBarras());
        	pstmt.setString(6, codigo.getDun14());
        	pstmt.setTimestamp(7, Fechas.toSqlTimestamp(new Date()));
        	pstmt.setDouble(8, codigo.getFactorConversion());
        	
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
	
	
	public static int update(Connection conn, ConfigEmpresaBean config, CodigoBarrasArticuloTiendaBean codigo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET DESGLOSE1 = ?, DESGLOSE2 = ?, DUN14 = ?, FACTOR_CONVERSION = ? " +
		      "WHERE CODALM = ?" +
		      "AND CODART = ? " +
		      "AND CODIGO_BARRAS = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codigo.getDesglose1());
			pstmt.setString(2, codigo.getDesglose2());
			pstmt.setString(3, codigo.getDun14());
			pstmt.setDouble(4, codigo.getFactorConversion());
			pstmt.setString(5, codigo.getCodAlmacen());
			pstmt.setString(6, codigo.getCodArticulo());
			pstmt.setString(7, codigo.getCodigoBarras());
        	
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
