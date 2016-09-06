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


public class MediosPagoTiendaDao extends MantenimientoDao {

	private static String TABLA = "T_MEDIOS_PAGO_TBL";
	
	private static Logger log = Logger.getMLogger(MediosPagoTiendaDao.class);
	    
    
    public static void insert(Connection conn, ConfigEmpresaBean config, MedioPagoTiendaBean medioPago) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(CODALM, CODMEDPAG, DESMEDPAG, CONTADO, EFECTIVO, TARJETA_CREDITO, ACTIVO) " +
		      "VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, medioPago.getCodAlmacen());
        	pstmt.setString(2, medioPago.getCodMedioPago());
        	pstmt.setString(3, medioPago.getDesMedioPago());
        	pstmt.setString(4, medioPago.getContado());
        	pstmt.setString(5, medioPago.getEfectivo());
        	pstmt.setString(6, medioPago.getTarjetaCredito());
        	pstmt.setString(7, medioPago.getActivo());
        	
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
    
    
    public static void update(Connection conn, ConfigEmpresaBean config, MedioPagoTiendaBean medioPago) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET DESMEDPAG = ?, CONTADO = ?, EFECTIVO = ?, TARJETA_CREDITO = ?, ACTIVO = ? " +
		      "WHERE CODALM = ? " +
		        "AND CODMEDPAG = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);		
        	pstmt.setString(1, medioPago.getDesMedioPago());
        	pstmt.setString(2, medioPago.getContado());
        	pstmt.setString(3, medioPago.getEfectivo());
        	pstmt.setString(4, medioPago.getTarjetaCredito());
        	pstmt.setString(5, medioPago.getActivo());
        	pstmt.setString(6, medioPago.getCodAlmacen());
        	pstmt.setString(7, medioPago.getCodMedioPago());
        	
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
