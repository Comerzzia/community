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

package com.comerzzia.persistencia.general.clientes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ClientesDao extends MantenimientoDao{

	private static String TABLA = "D_CLIENTES_TBL";
	private static String VISTA = "D_CLIENTES";
	
	private static Logger log = Logger.getMLogger(ClientesDao.class);

	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, ParametrosBuscarClientesBean param) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	
    	// Inicializamos la página de resultados
    	List<ClienteBean> resultados = new ArrayList<ClienteBean>(param.getTamañoPagina());
    	PaginaResultados paginaResultados = new PaginaResultados(param, resultados);
    	
    	// Consultas
    	String sql = obtenerConsulta(config, param);
    	String sqlCount = obtenerConsultaCount(config, param);
        
    	try {
    		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    		
    		// Obtenemos número de resultados
        	log.debug("consultar() - " + sqlCount);
        	rs = stmt.executeQuery(sqlCount);
        	if (rs.next()){
        		paginaResultados.setTotalResultados(rs.getInt(1));
        	}
        	rs.close();
        	
        	// Si tenemos resultados, obtenemos la pagina requerida
            if (paginaResultados.getTotalResultados() > 0) {
            	log.debug("consultar() - " + sql);
                rs = stmt.executeQuery(sql);
                
                int contador = 0;
                if (rs.absolute(paginaResultados.getInicio())) {
                    do {
                		ClienteBean cliente = new ClienteBean();
                		cliente.setCodCli(rs.getString("CODCLI"));
                		cliente.setDesCli(rs.getString("DESCLI"));
                		cliente.setNombreComercial(rs.getString("NOMBRE_COMERCIAL"));
                		cliente.setDomicilio(rs.getString("DOMICILIO"));
                		cliente.setPoblacion(rs.getString("POBLACION"));
                		cliente.setProvincia(rs.getString("PROVINCIA"));
                		cliente.setCp(rs.getString("CP"));
                		cliente.setTelefono1(rs.getString("TELEFONO1"));
                		cliente.setTelefono2(rs.getString("TELEFONO2"));
                		cliente.setFax(rs.getString("FAX"));
                		cliente.setCodPais(rs.getString("CODPAIS"));
                		cliente.setDesPais(rs.getString("DESPAIS"));
                		cliente.setPersonaContacto(rs.getString("PERSONA_CONTACTO"));
                		cliente.setEmail(rs.getString("EMAIL"));
                		cliente.setCif(rs.getString("CIF"));
                		cliente.setIdTratImp(rs.getLong("ID_TRAT_IMPUESTOS"));
                		cliente.setCodTratImp(rs.getString("CODTRATIMP"));
                		cliente.setDesTratImp(rs.getString("DESTRATIMP"));
                		cliente.setIdMedioPagoVencimiento((rs.getString("ID_MEDPAG_VEN") != null) ? rs.getLong("ID_MEDPAG_VEN") : null);
                		cliente.setDesMedioPagoVencimiento(rs.getString("DESMEDPAG_VEN"));
                		cliente.setCodTar(rs.getString("CODTAR"));
                		cliente.setDesTar(rs.getString("DESTAR"));
                		cliente.setCodSec(rs.getString("CODSEC"));
                		cliente.setDesSec(rs.getString("DESSEC"));
                		cliente.setBanco(rs.getString("BANCO"));
                		cliente.setDomicilioBanco(rs.getString("BANCO_DOMICILIO"));
                		cliente.setPoblacionBanco(rs.getString("BANCO_POBLACION"));
                		cliente.setCcc(rs.getString("CCC"));
                		cliente.setObservaciones(rs.getString("OBSERVACIONES"));
                		cliente.setActivo(rs.getString("ACTIVO"));
                		cliente.setFechaAlta(rs.getDate("FECHA_ALTA"));
                		cliente.setFechaBaja(rs.getDate("FECHA_BAJA"));
                		
                		resultados.add(cliente);
                        contador++;
                    } while (rs.next() && contador < paginaResultados.getTamañoPagina());                   
                }        		
        	}
            
            return paginaResultados;
    	}
    	finally {
    		try {
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try {
    			stmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
	
	
	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarClientesBean param) {
		String sql = null;
		
		sql = "SELECT CODCLI, DESCLI, NOMBRE_COMERCIAL, DOMICILIO, POBLACION, PROVINCIA, CP, " + 
			         "TELEFONO1, TELEFONO2, FAX, CODPAIS, DESPAIS, PERSONA_CONTACTO, EMAIL, CIF, " + 
			         "ID_TRAT_IMPUESTOS, CODTRATIMP, DESTRATIMP, ID_MEDPAG_VEN, " + 
			         "DESMEDPAG_VEN, CODTAR, DESTAR, CODSEC, DESSEC, BANCO, BANCO_DOMICILIO, " + 
			         "BANCO_POBLACION, CCC, OBSERVACIONES, ACTIVO, FECHA_ALTA, FECHA_BAJA " +
		       "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }
        
        // Clausula ORDER BY
        if (!param.getOrden().isEmpty()) {
        	sql += "ORDER BY " + param.getOrden();
        }
        
		return sql;
	}
	
	
	public static String obtenerConsultaCount(ConfigEmpresaBean config, ParametrosBuscarClientesBean param) {
		String sql = null;
		
		sql = "SELECT COUNT(*) " +
		      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
		
		// Clausula WHERE
        String where = getClausulaWhere(param);
        if (where.length() > 0) {
            sql += "WHERE " + where;
        }
        
		return sql;
	}
	
	
	private static String getClausulaWhere(ParametrosBuscarClientesBean param) {
		String where = "";
		
		// CODCLI
		if (!param.getCodCli().isEmpty()) {
			where = "CODCLI LIKE '" + param.getCodCli() + "%' ";
		}
		
		// DESCLI
		if (!param.getDesCli().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "UPPER(DESCLI) LIKE UPPER('" + param.getDesCli() + "%') ";
		}
		
		// NOMBRE_COMERCIAL
		if (!param.getNombreComercial().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "UPPER(NOMBRE_COMERCIAL) LIKE UPPER('" + param.getNombreComercial() + "%') ";
		}
		
		// CIF
		if (!param.getCif().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "CIF = '" + param.getCif() + "' ";
		}

		//ACTIVO
		if (!param.getActivo().isEmpty()) {
			if(!where.isEmpty()){
    			where += "AND ";
    		}
			where += "ACTIVO = '" + param.getActivo() + "' ";
		}
		
		return where;
	}
	
	
	public static ClienteBean consultar(Connection conn, ConfigEmpresaBean config, String codCli) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	ClienteBean cliente = null;
    	String sql = null;
    	
		sql = "SELECT CODCLI, DESCLI, NOMBRE_COMERCIAL, DOMICILIO, POBLACION, PROVINCIA, CP, " + 
			         "TELEFONO1, TELEFONO2, FAX, CODPAIS, DESPAIS, PERSONA_CONTACTO, EMAIL, CIF, " + 
			         "ID_TRAT_IMPUESTOS, CODTRATIMP, DESTRATIMP, ID_MEDPAG_VEN, " + 
			         "DESMEDPAG_VEN, CODMEDPAG, CODTAR, DESTAR, CODSEC, DESSEC, BANCO, BANCO_DOMICILIO, " + 
			         "BANCO_POBLACION, CCC, OBSERVACIONES, ACTIVO, FECHA_ALTA, FECHA_BAJA, " +
			         "CODALM_TIENDA, DESALM_TIENDA, RIESGO_CONCEDIDO " +
    	        "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		       "WHERE CODCLI = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, codCli);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		cliente = new ClienteBean();
        		cliente.setCodCli(rs.getString("CODCLI"));
        		cliente.setDesCli(rs.getString("DESCLI"));
        		cliente.setNombreComercial(rs.getString("NOMBRE_COMERCIAL"));
        		cliente.setDomicilio(rs.getString("DOMICILIO"));
        		cliente.setPoblacion(rs.getString("POBLACION"));
        		cliente.setProvincia(rs.getString("PROVINCIA"));
        		cliente.setCp(rs.getString("CP"));
        		cliente.setTelefono1(rs.getString("TELEFONO1"));
        		cliente.setTelefono2(rs.getString("TELEFONO2"));
        		cliente.setFax(rs.getString("FAX"));
        		cliente.setCodPais(rs.getString("CODPAIS"));
        		cliente.setDesPais(rs.getString("DESPAIS"));
        		cliente.setPersonaContacto(rs.getString("PERSONA_CONTACTO"));
        		cliente.setEmail(rs.getString("EMAIL"));
        		cliente.setCif(rs.getString("CIF"));
        		cliente.setIdTratImp(rs.getLong("ID_TRAT_IMPUESTOS"));
        		cliente.setCodTratImp(rs.getString("CODTRATIMP"));
        		cliente.setDesTratImp(rs.getString("DESTRATIMP"));
        		cliente.setIdMedioPagoVencimiento((rs.getString("ID_MEDPAG_VEN") != null) ? rs.getLong("ID_MEDPAG_VEN") : null);
        		cliente.setDesMedioPagoVencimiento(rs.getString("DESMEDPAG_VEN"));
        		cliente.setCodMedioPago(rs.getString("CODMEDPAG"));
        		cliente.setCodTar(rs.getString("CODTAR"));
        		cliente.setDesTar(rs.getString("DESTAR"));
        		cliente.setCodSec(rs.getString("CODSEC"));
        		cliente.setDesSec(rs.getString("DESSEC"));
        		cliente.setBanco(rs.getString("BANCO"));
        		cliente.setDomicilioBanco(rs.getString("BANCO_DOMICILIO"));
        		cliente.setPoblacionBanco(rs.getString("BANCO_POBLACION"));
        		cliente.setCcc(rs.getString("CCC"));
        		cliente.setObservaciones(rs.getString("OBSERVACIONES"));
        		cliente.setActivo(rs.getString("ACTIVO"));
        		cliente.setFechaAlta(rs.getDate("FECHA_ALTA"));
        		cliente.setFechaBaja(rs.getDate("FECHA_BAJA"));
        		cliente.setCodAlmacenTienda(rs.getString("CODALM_TIENDA"));
        		cliente.setDesAlmacenTienda(rs.getString("DESALM_TIENDA"));
        		cliente.setRiesgoConcedido(rs.getDouble("RIESGO_CONCEDIDO"));
        	}
        	
    		return cliente;
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
	
	
	public static ClienteBean consultarCif(Connection conn, ConfigEmpresaBean config, String cif) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	ClienteBean cliente = null;
    	String sql = null;
    	
		sql = "SELECT CODCLI, DESCLI, NOMBRE_COMERCIAL, DOMICILIO, POBLACION, PROVINCIA, CP, " + 
			         "TELEFONO1, TELEFONO2, FAX, CODPAIS, DESPAIS, PERSONA_CONTACTO, EMAIL, CIF, " + 
			         "ID_TRAT_IMPUESTOS, CODTRATIMP, DESTRATIMP, ID_MEDPAG_VEN, " + 
			         "DESMEDPAG_VEN, CODMEDPAG, CODTAR, DESTAR, CODSEC, DESSEC, BANCO, BANCO_DOMICILIO, " + 
			         "BANCO_POBLACION, CCC, OBSERVACIONES, ACTIVO, FECHA_ALTA, FECHA_BAJA, " +
			         "CODALM_TIENDA, DESALM_TIENDA, RIESGO_CONCEDIDO " +
    	        "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		       "WHERE CIF = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, cif);
        	log.debug("consultarCif() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		cliente = new ClienteBean();
        		cliente.setCodCli(rs.getString("CODCLI"));
        		cliente.setDesCli(rs.getString("DESCLI"));
        		cliente.setNombreComercial(rs.getString("NOMBRE_COMERCIAL"));
        		cliente.setDomicilio(rs.getString("DOMICILIO"));
        		cliente.setPoblacion(rs.getString("POBLACION"));
        		cliente.setProvincia(rs.getString("PROVINCIA"));
        		cliente.setCp(rs.getString("CP"));
        		cliente.setTelefono1(rs.getString("TELEFONO1"));
        		cliente.setTelefono2(rs.getString("TELEFONO2"));
        		cliente.setFax(rs.getString("FAX"));
        		cliente.setCodPais(rs.getString("CODPAIS"));
        		cliente.setDesPais(rs.getString("DESPAIS"));
        		cliente.setPersonaContacto(rs.getString("PERSONA_CONTACTO"));
        		cliente.setEmail(rs.getString("EMAIL"));
        		cliente.setCif(rs.getString("CIF"));
        		cliente.setIdTratImp(rs.getLong("ID_TRAT_IMPUESTOS"));
        		cliente.setCodTratImp(rs.getString("CODTRATIMP"));
        		cliente.setDesTratImp(rs.getString("DESTRATIMP"));
        		cliente.setIdMedioPagoVencimiento((rs.getString("ID_MEDPAG_VEN") != null) ? rs.getLong("ID_MEDPAG_VEN") : null);
        		cliente.setDesMedioPagoVencimiento(rs.getString("DESMEDPAG_VEN"));
        		cliente.setCodMedioPago(rs.getString("CODMEDPAG"));
        		cliente.setCodTar(rs.getString("CODTAR"));
        		cliente.setDesTar(rs.getString("DESTAR"));
        		cliente.setCodSec(rs.getString("CODSEC"));
        		cliente.setDesSec(rs.getString("DESSEC"));
        		cliente.setBanco(rs.getString("BANCO"));
        		cliente.setDomicilioBanco(rs.getString("BANCO_DOMICILIO"));
        		cliente.setPoblacionBanco(rs.getString("BANCO_POBLACION"));
        		cliente.setCcc(rs.getString("CCC"));
        		cliente.setObservaciones(rs.getString("OBSERVACIONES"));
        		cliente.setActivo(rs.getString("ACTIVO"));
        		cliente.setFechaAlta(rs.getDate("FECHA_ALTA"));
        		cliente.setFechaBaja(rs.getDate("FECHA_BAJA"));
        		cliente.setCodAlmacenTienda(rs.getString("CODALM_TIENDA"));
        		cliente.setDesAlmacenTienda(rs.getString("DESALM_TIENDA"));
        		cliente.setRiesgoConcedido(rs.getDouble("RIESGO_CONCEDIDO"));
        	}
        	
    		return cliente;
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
	
	
	public static void insert(Connection conn, ConfigEmpresaBean config, ClienteBean cliente) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(CODCLI, DESCLI, NOMBRE_COMERCIAL, DOMICILIO, POBLACION, PROVINCIA, CP, " + 
			   "TELEFONO1, TELEFONO2, FAX, CODPAIS, PERSONA_CONTACTO, EMAIL, CIF, " + 
			   "ID_TRAT_IMPUESTOS, ID_MEDPAG_VEN, CODTAR, CODSEC, BANCO, BANCO_DOMICILIO, " + 
			   "BANCO_POBLACION, CCC, OBSERVACIONES, ACTIVO, FECHA_ALTA, FECHA_BAJA, RIESGO_CONCEDIDO) " +
		      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, " +
		              "?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, cliente.getCodCli());
        	pstmt.setString(2, cliente.getDesCli());
        	pstmt.setString(3, cliente.getNombreComercial());
			pstmt.setString(4, cliente.getDomicilio());
        	pstmt.setString(5, cliente.getPoblacion());
        	pstmt.setString(6, cliente.getProvincia());
			pstmt.setString(7, cliente.getCp());
        	pstmt.setString(8, cliente.getTelefono1());
        	pstmt.setString(9, cliente.getTelefono2());
			pstmt.setString(10, cliente.getFax());
        	pstmt.setString(11, cliente.getCodPais());
        	pstmt.setString(12, cliente.getPersonaContacto());
			pstmt.setString(13, cliente.getEmail());
        	pstmt.setString(14, cliente.getCif());
        	pstmt.setLong(15, cliente.getIdTratImp());
        	pstmt.setLong(16, cliente.getIdMedioPagoVencimiento());
        	pstmt.setString(17, cliente.getCodTar());
			pstmt.setString(18, cliente.getCodSec());
        	pstmt.setString(19, cliente.getBanco());
        	pstmt.setString(20, cliente.getDomicilioBanco());
			pstmt.setString(21, cliente.getPoblacionBanco());
        	pstmt.setString(22, cliente.getCcc());
        	pstmt.setString(23, cliente.getObservaciones());
			pstmt.setString(24, cliente.getActivo());
			pstmt.setDate(25, Fechas.toSqlDate(cliente.getFechaAlta()));
			pstmt.setDate(26, Fechas.toSqlDate(cliente.getFechaBaja()));
			pstmt.setDouble(27, cliente.getRiesgoConcedido());
        	
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
	
	
	public static void update(Connection conn, ConfigEmpresaBean config, ClienteBean cliente) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		         "SET DESCLI = ?, NOMBRE_COMERCIAL = ?, DOMICILIO = ?, POBLACION = ?, PROVINCIA = ?," +
		      	     "CP = ?, TELEFONO1 = ?, TELEFONO2 = ?, FAX = ?, CODPAIS = ?," +
		      	     "PERSONA_CONTACTO = ?, EMAIL = ?, CIF = ?, ID_TRAT_IMPUESTOS = ?, ID_MEDPAG_VEN = ?," +
		      	     " CODTAR = ?, CODSEC = ?, BANCO = ?, BANCO_DOMICILIO = ?, " +
		      	     "BANCO_POBLACION = ?, CCC = ?, OBSERVACIONES = ?, ACTIVO = ?, FECHA_BAJA = ?, RIESGO_CONCEDIDO = ? " +
		       "WHERE CODCLI = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, cliente.getDesCli());
        	pstmt.setString(2, cliente.getNombreComercial());
			pstmt.setString(3, cliente.getDomicilio());
        	pstmt.setString(4, cliente.getPoblacion());
        	pstmt.setString(5, cliente.getProvincia());
			pstmt.setString(6, cliente.getCp());
        	pstmt.setString(7, cliente.getTelefono1());
        	pstmt.setString(8, cliente.getTelefono2());
			pstmt.setString(9, cliente.getFax());
        	pstmt.setString(10, cliente.getCodPais());
        	pstmt.setString(11, cliente.getPersonaContacto());
			pstmt.setString(12, cliente.getEmail());
        	pstmt.setString(13, cliente.getCif());
        	pstmt.setLong(14, cliente.getIdTratImp());
        	pstmt.setLong(15, cliente.getIdMedioPagoVencimiento());
        	pstmt.setString(16, cliente.getCodTar());
			pstmt.setString(17, cliente.getCodSec());
        	pstmt.setString(18, cliente.getBanco());
        	pstmt.setString(19, cliente.getDomicilioBanco());
			pstmt.setString(20, cliente.getPoblacionBanco());
        	pstmt.setString(21, cliente.getCcc());
        	pstmt.setString(22, cliente.getObservaciones());
			pstmt.setString(23, cliente.getActivo());
			pstmt.setDate(24, Fechas.toSqlDate(cliente.getFechaBaja()));
			pstmt.setDouble(25, cliente.getRiesgoConcedido());
			pstmt.setString(26, cliente.getCodCli());
        	
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
	
	
	public static void delete(Connection conn, ConfigEmpresaBean config, ClienteBean cliente) throws SQLException {
		delete(conn, config, cliente.getCodCli());
	}
	
	
	public static void delete(Connection conn, ConfigEmpresaBean config, String codCli) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODCLI = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, codCli);
        	
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

	public static Long consultarTotalClientes(Connection conn, ConfigEmpresaBean config) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	Long total = null;
    	
    	// Consultas
    	String sql = "SELECT COUNT(*) " +
	      						"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
        
    	try {
    		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    		log.debug("consultarTotalClientes() - " + sql);
        	
    		rs = stmt.executeQuery(sql);
        	if (rs.next()){
        		total = rs.getLong(1);
        	}
        	
        	return total;
    	}
    	finally {
    		try {
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try {
    			stmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}

}
