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
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;


public class ClientesTiendaDao extends MantenimientoDao {

private static String TABLA = "T_CLIENTES_TBL";
	
	private static Logger log = Logger.getMLogger(ClientesTiendaDao.class);
	
	
	public static void insert(Connection conn, ConfigEmpresaBean config, 
			ClienteTiendaBean cliente) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
			
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
			  "(CODALM, CIF, DESCLI, NOMBRE_COMERCIAL, DOMICILIO, POBLACION, PROVINCIA, CP, " + 
			  "TELEFONO1, TELEFONO2, FAX, PERSONA_CONTACTO, EMAIL, ID_TRAT_IMPUESTOS, " + 
			  "CODMEDPAG, CODTAR, OBSERVACIONES, ACTIVO, FECHA_ALTA, FECHA_BAJA, VENTA_A_CREDITO)" +
			  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, cliente.getCodAlmacen());
			pstmt.setString(2, cliente.getCif());
			pstmt.setString(3, cliente.getDesCli());
			pstmt.setString(4, cliente.getNombreComercial());
			pstmt.setString(5, cliente.getDomicilio());
			pstmt.setString(6, cliente.getPoblacion());
			pstmt.setString(7, cliente.getProvincia());
			pstmt.setString(8, cliente.getCp());
			pstmt.setString(9, cliente.getTelefono1());
			pstmt.setString(10, cliente.getTelefono2());
			pstmt.setString(11, cliente.getFax());
			pstmt.setString(12, cliente.getPersonaContacto());
			pstmt.setString(13, cliente.getEmail());
			pstmt.setLong(14, cliente.getIdTratImp());
			pstmt.setString(15, cliente.getCodMedioPago());
			pstmt.setString(16, cliente.getCodTar());
			pstmt.setString(17, cliente.getObservaciones());
			pstmt.setString(18, cliente.getActivo());
			pstmt.setDate(19, Fechas.toSqlDate(cliente.getFechaAlta()));
			pstmt.setDate(20, Fechas.toSqlDate(cliente.getFechaBaja()));
			pstmt.setString(21, cliente.getVentaACredito());
			
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
			 ClienteTiendaBean cliente) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET DESCLI = ?, NOMBRE_COMERCIAL = ?, DOMICILIO = ?, POBLACION = ?, PROVINCIA = ?, " + 
		      "CP = ?, TELEFONO1 = ?, TELEFONO2 = ?, FAX = ?, PERSONA_CONTACTO = ?, EMAIL = ?, " + 
		      "ID_TRAT_IMPUESTOS = ?, CODMEDPAG = ?, CODTAR = ?, OBSERVACIONES = ?, ACTIVO = ?, " + 
		      "FECHA_ALTA = ?, FECHA_BAJA = ?, VENTA_A_CREDITO = ? " +
		      "WHERE CODALM = ? " +
		        "AND CIF = ?";
		
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
			pstmt.setString(10, cliente.getPersonaContacto());
			pstmt.setString(11, cliente.getEmail());
			pstmt.setLong(12, cliente.getIdTratImp());
			pstmt.setString(13, cliente.getCodMedioPago());
			pstmt.setString(14, cliente.getCodTar());
			pstmt.setString(15, cliente.getObservaciones());
			pstmt.setString(16, cliente.getActivo());
			pstmt.setDate(17, Fechas.toSqlDate(cliente.getFechaAlta()));
			pstmt.setDate(18, Fechas.toSqlDate(cliente.getFechaBaja()));
			pstmt.setString(19, cliente.getVentaACredito());
			pstmt.setString(20, cliente.getCodAlmacen());
			pstmt.setString(21, cliente.getCif());
        	
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
