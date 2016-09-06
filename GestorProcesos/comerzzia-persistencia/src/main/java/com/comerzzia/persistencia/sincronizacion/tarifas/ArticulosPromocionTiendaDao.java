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

package com.comerzzia.persistencia.sincronizacion.tarifas;

import java.sql.SQLException;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;


public class ArticulosPromocionTiendaDao extends MantenimientoDao {

	private static String TABLA = "T_PROMOCIONES_DET_TBL";
	
	private static Logger log = Logger.getMLogger(ArticulosPromocionTiendaDao.class);
	
	
	public static void insert(Connection conn, ConfigEmpresaBean config, 
			ArticuloPromocionTiendaBean articulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(CODALM, ID_PROMOCION, CODTAR, CODART, PRECIO_TARIFA, PRECIO_VENTA, " +
		       "PUNTOS, TEXTO_PROMOCION, DATOS_PROMOCION, FECHA_INICIO, FECHA_FIN, " +
		       "SOLO_FIDELIZACION, VERSION_TARIFA, ID_TIPO_PROMOCION) " +
		       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, articulo.getCodAlmacen());
			pstmt.setLong(2, articulo.getIdPromocion());
			pstmt.setString(3, articulo.getCodTar());
			pstmt.setString(4, articulo.getCodArt());
			pstmt.setDouble(5, articulo.getPrecioTarifa());
			pstmt.setDouble(6, articulo.getPrecioVenta());
			pstmt.setLong(7, articulo.getPuntos());
			pstmt.setString(8, articulo.getTextoPromocion());
			pstmt.setBytes(9, articulo.getDatosPromocion().getBytes());
			pstmt.setDate(10, Fechas.toSqlDate(articulo.getFechaInicio()));
        	pstmt.setDate(11, Fechas.toSqlDate(articulo.getFechaFin()));
        	pstmt.setString(12, articulo.getSoloFidelizacion());
			pstmt.setLong(13, articulo.getVersionTarifa());
			pstmt.setLong(14, articulo.getIdTipoPromocion());
			
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
	
	
	public static int update(Connection conn, ConfigEmpresaBean config, 
			ArticuloPromocionTiendaBean articulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "SET CODTAR = ?, PRECIO_TARIFA = ?, PRECIO_VENTA = ?, " +
		       "PUNTOS = ?, TEXTO_PROMOCION = ?, DATOS_PROMOCION = ?, FECHA_INICIO = ?, " + 
		       "FECHA_FIN = ?, SOLO_FIDELIZACION = ?, VERSION_TARIFA = ?, " + 
		       "ID_TIPO_PROMOCION = ? " +
		      "WHERE CODALM = ? " +
			   "AND ID_PROMOCION = ? " + 
			   "AND CODART = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, articulo.getCodTar());
			pstmt.setDouble(2, articulo.getPrecioTarifa());
			pstmt.setDouble(3, articulo.getPrecioVenta());
			pstmt.setLong(4, articulo.getPuntos());
			pstmt.setString(5, articulo.getTextoPromocion());
			pstmt.setBytes(6, articulo.getDatosPromocion().getBytes());
			pstmt.setDate(7, Fechas.toSqlDate(articulo.getFechaInicio()));
        	pstmt.setDate(8, Fechas.toSqlDate(articulo.getFechaFin()));
        	pstmt.setString(9, articulo.getSoloFidelizacion());
			pstmt.setLong(10, articulo.getVersionTarifa());
			pstmt.setLong(11, articulo.getIdTipoPromocion());
			pstmt.setString(12, articulo.getCodAlmacen());
			pstmt.setLong(13, articulo.getIdPromocion());
			pstmt.setString(14, articulo.getCodArt());
			
			log.debug("update() - " + pstmt);
        	
        	return pstmt.executeUpdate();
		}
		finally {
    		try {
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
}
