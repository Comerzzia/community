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

package com.comerzzia.persistencia.core.empresas;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;


public class EmpresasDao extends MantenimientoDao {

	private static String TABLA = "D_EMPRESAS_TBL";
	
	private static Logger log = Logger.getMLogger(EmpresasDao.class);
	
	
	/**
	 * Devuelve la única empresa definida en la tabla de empresas
	 * @param conn
	 * @param sesion
	 * @return
	 * @throws SQLException
	 */
	public static EmpresaBean consultar(Connection conn, ConfigEmpresaBean sesion) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	EmpresaBean empresa = null;
    	String sql = null;
    	
    	sql = "SELECT CODEMP, DESEMP, DOMICILIO, POBLACION, PROVINCIA, CP, " +
    	      "CIF, TELEFONO1, TELEFONO2, FAX, ACTIVO, REGISTRO_MERCANTIL " +
    	      "FROM " + getNombreElemento(sesion.getEsquemaEmpresa(), TABLA);
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		empresa = new EmpresaBean();
        		empresa.setCodEmp(rs.getString("CODEMP"));
        		empresa.setDesEmp(rs.getString("DESEMP"));
        		empresa.setDomicilio(rs.getString("DOMICILIO"));
        		empresa.setPoblacion(rs.getString("POBLACION"));
        		empresa.setProvincia(rs.getString("PROVINCIA"));
        		empresa.setCp(rs.getString("CP"));
        		empresa.setCif(rs.getString("CIF"));
        		empresa.setTelefono1(rs.getString("TELEFONO1"));
        		empresa.setTelefono2(rs.getString("TELEFONO2"));
        		empresa.setFax(rs.getString("FAX"));
        		empresa.setActivo(rs.getString("ACTIVO"));
        		empresa.setRegistroMercantil(rs.getString("REGISTRO_MERCANTIL"));
        	}
        	
    		return empresa;
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
	
	/**
	 * Devuelve la única empresa definida en la tabla de empresas
	 * @param conn
	 * @param sesion
	 * @return
	 * @throws SQLException
	 */
	public static EmpresaBean consultar(Connection conn, ConfigEmpresaBean sesion, String codEmp) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	EmpresaBean empresa = null;
    	String sql = null;
    	
    	sql = "SELECT CODEMP, DESEMP, DOMICILIO, POBLACION, PROVINCIA, CP, " +
    	      "CIF, TELEFONO1, TELEFONO2, FAX, ACTIVO, REGISTRO_MERCANTIL " +
    	      "FROM " + getNombreElemento(sesion.getEsquemaEmpresa(), TABLA) +
    	      "WHERE CODEMP = " + codEmp;
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		empresa = new EmpresaBean();
        		empresa.setCodEmp(rs.getString("CODEMP"));
        		empresa.setDesEmp(rs.getString("DESEMP"));
        		empresa.setDomicilio(rs.getString("DOMICILIO"));
        		empresa.setPoblacion(rs.getString("POBLACION"));
        		empresa.setProvincia(rs.getString("PROVINCIA"));
        		empresa.setCp(rs.getString("CP"));
        		empresa.setCif(rs.getString("CIF"));
        		empresa.setTelefono1(rs.getString("TELEFONO1"));
        		empresa.setTelefono2(rs.getString("TELEFONO2"));
        		empresa.setFax(rs.getString("FAX"));
        		empresa.setActivo(rs.getString("ACTIVO"));
        		empresa.setRegistroMercantil(rs.getString("REGISTRO_MERCANTIL"));
        	}
        	
    		return empresa;
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
	
	/**
	 * Inserta una empresa en la tabla de empresas.
	 * @param conn
	 * @param config
	 * @param empresa
	 * @throws SQLException
	 */
	public static void insert(Connection conn, ConfigEmpresaBean config, EmpresaBean empresa) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
	      		"(CODEMP, DESEMP, NOMBRE_COMERCIAL, DOMICILIO, POBLACION, PROVINCIA, " +
	      		"CP, CIF, TELEFONO1, TELEFONO2, FAX, ACTIVO, REGISTRO_MERCANTIL) " +
	      		"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, empresa.getCodEmp());
			pstmt.setString(2, empresa.getDesEmp());
			pstmt.setString(3, empresa.getDesEmp());
        	pstmt.setString(4, empresa.getDomicilio());
        	pstmt.setString(5, empresa.getPoblacion());
			pstmt.setString(6, empresa.getProvincia());
        	pstmt.setString(7, empresa.getCp());
        	pstmt.setString(8, empresa.getCif());
			pstmt.setString(9, empresa.getTelefono1());
        	pstmt.setString(10, empresa.getTelefono2());
        	pstmt.setString(11, empresa.getFax());
        	pstmt.setString(12, empresa.getActivo());
        	pstmt.setString(13, empresa.getRegistroMercantil());
        	
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

	/**
	 * Modifica los datos de la única empresa definida en la tabla de empresas.
	 * @param conn
	 * @param config
	 * @param empresa
	 * @throws SQLException
	 */
	public static void update(Connection conn, ConfigEmpresaBean config, EmpresaBean empresa) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET DESEMP = ?, NOMBRE_COMERCIAL = ?, DOMICILIO = ?, POBLACION = ?, PROVINCIA = ?," +
		      	  "CP = ?, CIF = ?, TELEFONO1 = ?, TELEFONO2 = ?, FAX = ?, REGISTRO_MERCANTIL = ? " +
		      "WHERE CODEMP = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, empresa.getDesEmp());
			pstmt.setString(2, empresa.getDesEmp());
        	pstmt.setString(3, empresa.getDomicilio());
        	pstmt.setString(4, empresa.getPoblacion());
			pstmt.setString(5, empresa.getProvincia());
        	pstmt.setString(6, empresa.getCp());
        	pstmt.setString(7, empresa.getCif());
			pstmt.setString(8, empresa.getTelefono1());
        	pstmt.setString(9, empresa.getTelefono2());
        	pstmt.setString(10, empresa.getFax());
        	pstmt.setString(11, empresa.getRegistroMercantil());
        	pstmt.setString(12, empresa.getCodEmp());
        	
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
	
	public static void actualizarLogotipo(Connection conn, ConfigEmpresaBean config, EmpresaBean empresa) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET LOGOTIPO = ? " +
		      "WHERE CODEMP = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setBytes(1, empresa.getLogotipo());
        	pstmt.setString(2, empresa.getCodEmp());
        	
        	log.debug("actualizarLogotipo() - " + pstmt);
        	
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

	public static byte[] obtenerLogo(Connection conn,
			ConfigEmpresaBean configEmpresa, String codEmp) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	byte[] logo = null;
    	String sql = null;
    	
    	sql = "SELECT LOGOTIPO " +
    	      "FROM " + getNombreElemento(configEmpresa.getEsquemaEmpresa(), TABLA);
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
        	log.debug("obtenerLogo() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		logo = rs.getBytes("LOGOTIPO");
        	}
        	
    		return logo;
    	}
    	catch (SQLException e) {
			throw getDaoException(e);
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
}
