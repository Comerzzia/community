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

package com.comerzzia.persistencia.compras.albaranes.impuestos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.core.impuestos.ImpuestoBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;


public class ImpuestosAlbaranesComprasDao extends MantenimientoDao {

protected static final String TABLA = "D_PROV_ALBARANES_IMP_TBL";
	
	/** Logger */
	protected static Logger log = Logger.getMLogger(ImpuestosAlbaranesComprasDao.class);
	
	
	public static List<ImpuestoBean> consultar(Connection conn, ConfigEmpresaBean config, Long idAlbaran) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	
    	List<ImpuestoBean> impuestos = new ArrayList<ImpuestoBean>();
    	
    	sql = "SELECT ID_PROV_ALBARAN, CODIMP, BASE, IMPUESTOS, TOTAL " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE ID_PROV_ALBARAN = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idAlbaran);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	while (rs.next()){
        		ImpuestoBean impuesto = new ImpuestoBean();
        		impuesto.setIdDocumento(rs.getLong("ID_PROV_ALBARAN"));
        		impuesto.setCodImpuesto(rs.getString("CODIMP"));
        		impuesto.setBase(rs.getDouble("BASE"));
        		impuesto.setImpuestos(rs.getDouble("IMPUESTOS"));
        		
        		// TODO: total es calculado o no
        		
        		impuestos.add(impuesto);
        	}
        	
        	return impuestos;
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
	
	
	public static void insert(Connection conn, ConfigEmpresaBean config, ImpuestoBean impuesto) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(ID_PROV_ALBARAN, CODIMP, BASE, IMPUESTOS, TOTAL) VALUES " +
		      "(?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, impuesto.getIdDocumento());
			pstmt.setString(2, impuesto.getCodImpuesto());
			pstmt.setDouble(3, impuesto.getBase());
			pstmt.setDouble(4, impuesto.getImpuestos());
			pstmt.setDouble(5, impuesto.getTotal());
			
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
	
	
	public static void delete(Connection conn, ConfigEmpresaBean config, Long idAlbaran) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
			   "WHERE ID_PROV_ALBARAN = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idAlbaran);
        	
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
