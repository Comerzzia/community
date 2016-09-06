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

package com.comerzzia.persistencia.sincronizacion.general;

import java.sql.SQLException;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;


public class TiendasTiendaDao extends MantenimientoDao {
	
	private static String TABLA = "T_TIENDAS_TBL";
	
	private static Logger log = Logger.getMLogger(TiendasTiendaDao.class);
    
    
    public static void insert(Connection conn, ConfigEmpresaBean config, 
    		TiendaTiendaBean tienda) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(CODALM, DESALM, NOMBRE_COMERCIAL, DOMICILIO, POBLACION, PROVINCIA, " + 
		      "CP, TELEFONO1, TELEFONO2, FAX, CIF, PERSONA_CONTACTO, ACTIVO, " + 
		      "CLIENTE_POR_DEFECTO) " +
		      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, tienda.getCodAlm());
        	pstmt.setString(2, tienda.getDesAlm());
        	pstmt.setString(3, tienda.getNombreComercial());
        	pstmt.setString(4, tienda.getDomicilio());
        	pstmt.setString(5, tienda.getPoblacion());
        	pstmt.setString(6, tienda.getProvincia());
        	pstmt.setString(7, tienda.getCp());
        	pstmt.setString(8, tienda.getTelefono1());
        	pstmt.setString(9, tienda.getTelefono2());
        	pstmt.setString(10, tienda.getFax());
        	pstmt.setString(11, tienda.getCif());
        	pstmt.setString(12, tienda.getPersonaContacto());
        	pstmt.setString(13, tienda.getActivo());
        	pstmt.setString(14, tienda.getCifCliente());
        	
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
    
    
    public static void update(Connection conn, ConfigEmpresaBean config, TiendaTiendaBean tienda) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET DESALM = ?, NOMBRE_COMERCIAL = ?, DOMICILIO = ?, POBLACION = ?, " + 
		      "PROVINCIA = ?, CP = ?, TELEFONO1 = ?, TELEFONO2 = ?, FAX = ?, CIF = ?, " + 
		      "PERSONA_CONTACTO = ?, ACTIVO = ?, CLIENTE_POR_DEFECTO = ? " +
		      "WHERE CODALM = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, tienda.getDesAlm());
			pstmt.setString(2, tienda.getNombreComercial());
			pstmt.setString(3, tienda.getDomicilio());
			pstmt.setString(4, tienda.getPoblacion());
			pstmt.setString(5, tienda.getProvincia());
			pstmt.setString(6, tienda.getCp());
			pstmt.setString(7, tienda.getTelefono1());
			pstmt.setString(8, tienda.getTelefono2());
			pstmt.setString(9, tienda.getFax());
			pstmt.setString(10, tienda.getCif());
			pstmt.setString(11, tienda.getPersonaContacto());
			pstmt.setString(12, tienda.getActivo());
        	pstmt.setString(13, tienda.getCifCliente());
        	pstmt.setString(14, tienda.getCodAlm());
        	
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
