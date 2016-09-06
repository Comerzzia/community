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

package com.comerzzia.persistencia.general.articulos.codigosbarras;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;

public class CodigosBarrasArticulosDao extends MantenimientoDao {

	protected static final String TABLA = "D_ARTICULOS_CODBAR_TBL";
	
	/** Logger */
	protected static Logger log = Logger.getMLogger(CodigosBarrasArticulosDao.class);
	
	private CodigosBarrasArticulosDao() {
	}
	
	public static List<CodigoBarrasArticuloBean> consultar(Connection conn, ConfigEmpresaBean config, String codArticulo) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	List<CodigoBarrasArticuloBean> listaCodigos = new ArrayList<CodigoBarrasArticuloBean>();
    	String sql = null;
    	
    	sql = "SELECT DESGLOSE1, DESGLOSE2, CODIGO_BARRAS, DUN14, FACTOR_CONVERSION " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODART = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, codArticulo);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	while (rs.next()){
        		CodigoBarrasArticuloBean codigo = new CodigoBarrasArticuloBean();
        		codigo.setDesglose1(rs.getString("DESGLOSE1"));
        		codigo.setDesglose2(rs.getString("DESGLOSE2"));
        		codigo.setCodigoBarras(rs.getString("CODIGO_BARRAS"));
        		codigo.setDun14(rs.getString("DUN14"));
        		codigo.setFactorConversion(rs.getDouble("FACTOR_CONVERSION"));
        		codigo.setCodArticulo(codArticulo);
        		listaCodigos.add(codigo);
        	}
        	
    		return listaCodigos;
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

	
	public static CodigoBarrasArticuloBean consultarCodigoBarras(Connection conn, ConfigEmpresaBean config, String codigoBarras) 
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
    	ResultSet rs = null;
    	
    	CodigoBarrasArticuloBean codigoBarrasArticulo = null;
    	
    	sql = "SELECT CODART, " +
    				 "DESGLOSE1, " +
    				 "DESGLOSE2, " +
    				 "CODIGO_BARRAS, " +
    				 "DUN14, " +
    				 "FACTOR_CONVERSION " +
    			"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
    		   "WHERE CODIGO_BARRAS = ? ";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, codigoBarras);
    		
        	log.debug("consultarCodigoBarras() - " + pstmt);
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		codigoBarrasArticulo = new CodigoBarrasArticuloBean();
        		codigoBarrasArticulo.setCodArticulo(rs.getString("CODART"));
        		codigoBarrasArticulo.setDesglose1(rs.getString("DESGLOSE1"));
        		codigoBarrasArticulo.setDesglose2(rs.getString("DESGLOSE2"));
        		codigoBarrasArticulo.setCodigoBarras(rs.getString("CODIGO_BARRAS"));
        		codigoBarrasArticulo.setDun14(rs.getString("DUN14"));
        		codigoBarrasArticulo.setFactorConversion(rs.getDouble("FACTOR_CONVERSION"));
        	}
        	
    		return codigoBarrasArticulo;
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
	
	
	public static void insert(Connection conn, ConfigEmpresaBean config, CodigoBarrasArticuloBean codigo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(CODART, DESGLOSE1, DESGLOSE2, CODIGO_BARRAS, DUN14, FECHA_ALTA, FACTOR_CONVERSION) " +
		      "VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codigo.getCodArticulo());
        	pstmt.setString(2, codigo.getDesglose1());
        	pstmt.setString(3, codigo.getDesglose2());
        	pstmt.setString(4, codigo.getCodigoBarras());
        	pstmt.setString(5, codigo.getDun14());
        	pstmt.setDate(6, Fechas.toSqlDate(new Date()));
        	pstmt.setDouble(7, codigo.getFactorConversion());
        	
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
	
	
	public static void update(Connection conn, ConfigEmpresaBean config, CodigoBarrasArticuloBean codigo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET DESGLOSE1 = ?, DESGLOSE2 = ?, DUN14 = ?, FECHA_ALTA = ?, FACTOR_CONVERSION = ? " +
		      "WHERE CODART = ? AND CODIGO_BARRAS = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codigo.getDesglose1());
			pstmt.setString(2, codigo.getDesglose2());
			pstmt.setString(3, codigo.getDun14());
			pstmt.setDate(4, Fechas.toSqlDate(new Date()));
			pstmt.setDouble(5, codigo.getFactorConversion());
			pstmt.setString(6, codigo.getCodArticulo());
			pstmt.setString(7, codigo.getCodigoBarras());
        	
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
	
	
	public static void delete(Connection conn, ConfigEmpresaBean config, CodigoBarrasArticuloBean codigo) throws SQLException {
		delete(conn, config, codigo.getCodArticulo(), codigo.getCodigoBarras());
	}
	
	
	public static void delete(Connection conn, ConfigEmpresaBean config, String codArticulo, String codigoBarras) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODART = ? AND CODIGO_BARRAS = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, codArticulo);
        	pstmt.setString(2, codigoBarras);
        	
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
	
	
	public static void delete(Connection conn, ConfigEmpresaBean config, String codArticulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODART = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, codArticulo);
        	
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
