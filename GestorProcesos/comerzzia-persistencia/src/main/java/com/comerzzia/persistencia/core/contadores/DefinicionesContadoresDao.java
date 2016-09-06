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

package com.comerzzia.persistencia.core.contadores;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;


public class DefinicionesContadoresDao extends MantenimientoDao {

	private static String TABLA = "CONFIG_CONTADORES_DEF_TBL";
	
	private static Logger log = Logger.getMLogger(DefinicionesContadoresDao.class);
	
	
	public static DefinicionContadorBean consultar(Connection conn, String contador) 
			throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	DefinicionContadorBean definicionContador = null;
    	String sql = null;
    	
    	sql = "SELECT ID_CONTADOR, USA_CODEMP, USA_CODSERIE, USA_PERIODO, DESCRIPCION " +
    	      "FROM " + getNombreElementoConfiguracion(TABLA) +
	          "WHERE ID_CONTADOR = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, contador);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		definicionContador = new DefinicionContadorBean();
        		definicionContador.setIdContador(rs.getString("ID_CONTADOR"));
        		definicionContador.setUsaEmpresa(rs.getString("USA_CODEMP"));
        		definicionContador.setUsaSerie(rs.getString("USA_CODSERIE"));
        		definicionContador.setUsaPeriodo(rs.getString("USA_PERIODO"));
        		definicionContador.setDescripcion(rs.getString("DESCRIPCION"));
        	}
        	
    		return definicionContador;
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
