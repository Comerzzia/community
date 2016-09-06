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

package com.comerzzia.persistencia.core.acciones.operaciones;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;


public class OperacionesDao extends MantenimientoDao {

	private static String TABLA = "CONFIG_ACCIONES_OPERACIONE_TBL";
	
	private static Logger log = Logger.getMLogger(OperacionesDao.class);
	
	
	/**
	 * Obtiene las operaciones de una Accion
	 * @param conn
	 * @param config
	 * @param idAccion
	 * @return
	 * @throws SQLException
	 */
	public static List<OperacionBean> consultar(Connection conn, Long idAccion) 
			throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	
    	List<OperacionBean> operaciones = new ArrayList<OperacionBean>();
    	
    	sql = "SELECT ID_ACCION, ID_OPERACION, ORDEN, DESOPERACION " +
    	      "FROM " + getNombreElementoConfiguracion(TABLA) +
    	      "WHERE ID_ACCION = ?";
		
		try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idAccion);
        	log.debug("consultar() - " + pstmt);
        	
        	rs = pstmt.executeQuery();
        	
        	while (rs.next()){
        		OperacionBean operacion = new OperacionBean();
        		operacion.setIdAccion(rs.getLong("ID_ACCION"));
        		operacion.setIdOperacion(rs.getByte("ID_OPERACION"));
        		operacion.setOrden(rs.getByte("ORDEN"));
        		operacion.setDesOperacion(rs.getString("DESOPERACION"));
        		
        		operaciones.add(operacion);
        	}
        	
        	return operaciones;
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
