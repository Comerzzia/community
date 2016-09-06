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

package com.comerzzia.persistencia.core.informes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class InformesDao extends MantenimientoDao{

	private static String TABLA_CONFIG = "CONFIG_ACCIONES_INFORMES_TBL";
	
	private static Logger log = Logger.getMLogger(InformesDao.class);

	
	/** Consulta en base de datos todas las versiones del informe indicado por su identificador de acción
	 * asociada. 
	 * @param conn
	 * @param idAccion
	 * @return
	 * @throws SQLException
	 */
	public static List<VersionInformeBean> consultarVersiones(Connection conn, Long idAccion) throws SQLException{
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
		String sql = null; 
		List<VersionInformeBean> versiones = new ArrayList<VersionInformeBean>();
		
		try{
			sql = "SELECT ID_ACCION, ID_VERSION, VERSION, TITULO, DESCRIPCION, FORMATO_SALIDA, ACTIVO " +
				  "FROM " + getNombreElementoConfiguracion(TABLA_CONFIG) +
				  "WHERE ID_ACCION = ? " +
				  "ORDER BY ID_VERSION";
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idAccion);
        	
        	log.debug("consultarVersiones() - " + pstmt);
        	rs = pstmt.executeQuery();
        	while (rs.next()){
        		VersionInformeBean versionInforme = new VersionInformeBean();
        		versionInforme.setIdInforme(idAccion);
        		versionInforme.setIdVersion(rs.getLong("ID_VERSION"));
        		versionInforme.setTitulo(rs.getString("TITULO"));
        		versionInforme.setDescripcion(rs.getString("DESCRIPCION"));
        		versionInforme.setFormatoSalida(rs.getString("FORMATO_SALIDA"));
        		versionInforme.setVersion(rs.getString("VERSION"));
        		versionInforme.setActivo(rs.getString("ACTIVO"));
        		versiones.add(versionInforme);
        	}
        	return versiones;
		}
		finally{
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

	
	/** Consulta todos los datos de la versión de un infome a partir del identificado de éste y de la versión
	 * asociada. 
	 * @param conn
	 * @param idAccion
	 * @param idVersion
	 * @return
	 * @throws SQLException
	 */
	public static VersionInformeBean consultarVersion(Connection conn, Long idAccion, Long idVersion) throws SQLException{
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
		String sql = null; 
		VersionInformeBean versionInforme = null;
		try{
			sql = "SELECT ID_ACCION, ID_VERSION, VERSION, TITULO, DESCRIPCION, FORMATO_SALIDA, ACTIVO " +
				  "FROM " + getNombreElementoConfiguracion(TABLA_CONFIG) +
				  "WHERE ID_ACCION = ? AND ID_VERSION = ?";
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idAccion);
        	pstmt.setLong(2, idVersion);
        	
        	log.debug("consultarVersion() - " + pstmt);
        	rs = pstmt.executeQuery();
        	if (rs.next()){
        		versionInforme = new VersionInformeBean();
        		versionInforme.setIdInforme(idAccion);
        		versionInforme.setIdVersion(rs.getLong("ID_VERSION"));
        		versionInforme.setTitulo(rs.getString("TITULO"));
        		versionInforme.setDescripcion(rs.getString("DESCRIPCION"));
        		versionInforme.setFormatoSalida(rs.getString("FORMATO_SALIDA"));
        		versionInforme.setVersion(rs.getString("VERSION"));
        		versionInforme.setActivo(rs.getString("ACTIVO"));
        	}
        	return versionInforme;
		}
		finally{
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
