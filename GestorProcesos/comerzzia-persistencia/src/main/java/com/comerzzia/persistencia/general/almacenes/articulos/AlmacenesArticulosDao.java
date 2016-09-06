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

package com.comerzzia.persistencia.general.almacenes.articulos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class AlmacenesArticulosDao extends MantenimientoDao {

	private static String TABLA = "D_ALMACENES_ARTICULOS_TBL";
	private static String VISTA = "D_ALMACENES_ARTICULOS";

	private static Logger log = Logger.getMLogger(AlmacenesArticulosDao.class);

	public static AlmacenArticuloBean consultar(Connection conn, ConfigEmpresaBean config, String codArt, String codAlm,
												String desglose1, String desglose2) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	AlmacenArticuloBean almacenArticulo = null;
    	
    	sql = "SELECT CODALM, CODART, DESALM, DESGLOSE1, DESGLOSE2, STOCK, STOCK_UM_ALTERNATIVA, STOCK_MINIMO," +
    			     "STOCK_MAXIMO, STOCK_PENDIENTE_RECIBIR, STOCK_PENDIENTE_SERVIR, UBICACION1, " +
    			     "UBICACION2, UBICACION3, UBICACION4, PMP, ACTIVO " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		      "WHERE CODALM = ? " +
		        "AND CODART = ? " +
		        "AND DESGLOSE1 = ? " +
		        "AND DESGLOSE2 = ? ";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, codAlm);
    		pstmt.setString(2, codArt);
    		pstmt.setString(3, desglose1);
    		pstmt.setString(4, desglose2);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	if (rs.next()){
        		almacenArticulo = new AlmacenArticuloBean();
        		almacenArticulo.setCodAlm(rs.getString("CODALM"));
        		almacenArticulo.setDesAlm(rs.getString("DESALM"));
        		almacenArticulo.setCodArt(rs.getString("CODART"));
        		almacenArticulo.setDesglose1(rs.getString("DESGLOSE1"));
        		almacenArticulo.setDesglose2(rs.getString("DESGLOSE2"));
        		almacenArticulo.setStock(rs.getDouble("STOCK"));
        		almacenArticulo.setStockUMA(rs.getDouble("STOCK_UM_ALTERNATIVA"));
        		almacenArticulo.setStockMinimo(rs.getDouble("STOCK_MINIMO"));
        		almacenArticulo.setStockMaximo(rs.getDouble("STOCK_MAXIMO"));
        		almacenArticulo.setStockPendRecibir(rs.getDouble("STOCK_PENDIENTE_RECIBIR"));
        		almacenArticulo.setStockPendServir(rs.getDouble("STOCK_PENDIENTE_SERVIR"));
        		almacenArticulo.setUbicacion1(rs.getString("UBICACION1"));
        		almacenArticulo.setUbicacion2(rs.getString("UBICACION2"));
        		almacenArticulo.setUbicacion3(rs.getString("UBICACION3"));
        		almacenArticulo.setUbicacion4(rs.getString("UBICACION4"));
        		almacenArticulo.setPmp(rs.getDouble("PMP"));
        		almacenArticulo.setActivo(rs.getString("ACTIVO"));
        	}
        	
    		return almacenArticulo;
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
	
	public static void insert(Connection conn, ConfigEmpresaBean config, AlmacenArticuloBean almacen) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
		      "(CODALM, CODART, DESGLOSE1, DESGLOSE2, STOCK, STOCK_UM_ALTERNATIVA, STOCK_MINIMO, " + 
			   "STOCK_MAXIMO, STOCK_PENDIENTE_RECIBIR, STOCK_PENDIENTE_SERVIR, UBICACION1, " + 
			   "UBICACION2, UBICACION3, UBICACION4, PMP, ACTIVO) " +
		      "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, almacen.getCodAlm());
        	pstmt.setString(2, almacen.getCodArt());
        	pstmt.setString(3, almacen.getDesglose1());
			pstmt.setString(4, almacen.getDesglose2());
        	pstmt.setDouble(5, almacen.getStock());
        	pstmt.setDouble(6, almacen.getStockUMA());
			pstmt.setDouble(7, almacen.getStockMinimo());
        	pstmt.setDouble(8, almacen.getStockMaximo());
        	pstmt.setDouble(9, almacen.getStockPendRecibir());
			pstmt.setDouble(10, almacen.getStockPendServir());
        	pstmt.setString(11, almacen.getUbicacion1());
        	pstmt.setString(12, almacen.getUbicacion2());
			pstmt.setString(13, almacen.getUbicacion3());
        	pstmt.setString(14, almacen.getUbicacion4());
        	pstmt.setDouble(15, almacen.getPmp());
			pstmt.setString(16, almacen.getActivo());
        	
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
	
	public static Integer updateStock(Connection conn, ConfigEmpresaBean config, AlmacenArticuloBean almacenArticulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "UPDATE "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "SET STOCK = ?, STOCK_UM_ALTERNATIVA = ? "
				+ "WHERE CODALM = ? " +
				    "AND CODART = ? " +
				    "AND DESGLOSE1 = ? " +
				    "AND DESGLOSE2 = ? ";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setDouble(1, almacenArticulo.getStock());
			pstmt.setDouble(2, almacenArticulo.getStockUMA());
			pstmt.setString(3, almacenArticulo.getCodAlm());
			pstmt.setString(4, almacenArticulo.getCodArt());
			pstmt.setString(5, almacenArticulo.getDesglose1());
			pstmt.setString(6, almacenArticulo.getDesglose2());

			log.debug("updateStock() - " + pstmt);

			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw getDaoException(e);
		} finally {
			try {
				pstmt.close();
			} catch (Exception ignore) {
				;
			}
		}
	}

	public static Integer updateStockPendServir(Connection conn, ConfigEmpresaBean config, AlmacenArticuloBean almacenArticulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "UPDATE "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "SET STOCK_PENDIENTE_SERVIR = ? "
				+ "WHERE CODALM = ? " +
				    "AND CODART = ? " +
				    "AND DESGLOSE1 = ? " +
				    "AND DESGLOSE2 = ? ";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setDouble(1, almacenArticulo.getStockPendServir());
			pstmt.setString(2, almacenArticulo.getCodAlm());
			pstmt.setString(3, almacenArticulo.getCodArt());
			pstmt.setString(4, almacenArticulo.getDesglose1());
			pstmt.setString(5, almacenArticulo.getDesglose2());

			log.debug("updateStockPendServir() - " + pstmt);

			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw getDaoException(e);
		} finally {
			try {
				pstmt.close();
			} catch (Exception ignore) {
				;
			}
		}
	}

	public static Integer updateStockPendRecibir(Connection conn, ConfigEmpresaBean config, AlmacenArticuloBean almacenArticulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "UPDATE "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "SET STOCK_PENDIENTE_RECIBIR = ? "
				+ "WHERE CODALM = ? " +
				    "AND CODART = ? " +
				    "AND DESGLOSE1 = ? " +
				    "AND DESGLOSE2 = ? ";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setDouble(1, almacenArticulo.getStockPendRecibir());
			pstmt.setString(2, almacenArticulo.getCodAlm());
			pstmt.setString(3, almacenArticulo.getCodArt());
			pstmt.setString(4, almacenArticulo.getDesglose1());
			pstmt.setString(5, almacenArticulo.getDesglose2());

			log.debug("updateStockPendRecibir() - " + pstmt);

			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw getDaoException(e);
		} finally {
			try {
				pstmt.close();
			} catch (Exception ignore) {
				;
			}
		}
	}
	
	public static Integer updateStockMinimo(Connection conn, ConfigEmpresaBean config, AlmacenArticuloBean almacenArticulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "UPDATE "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "SET STOCK_MINIMO = ? "
				+ "WHERE CODALM = ? " +
				    "AND CODART = ? " +
				    "AND DESGLOSE1 = ? " +
				    "AND DESGLOSE2 = ? ";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setDouble(1, almacenArticulo.getStockMinimo());
			pstmt.setString(2, almacenArticulo.getCodAlm());
			pstmt.setString(3, almacenArticulo.getCodArt());
			pstmt.setString(4, almacenArticulo.getDesglose1());
			pstmt.setString(5, almacenArticulo.getDesglose2());

			log.debug("updateStockMinimo() - " + pstmt);

			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw getDaoException(e);
		} finally {
			try {
				pstmt.close();
			} catch (Exception ignore) {
				;
			}
		}
	}
	
	public static Integer updateStockMaximo(Connection conn, ConfigEmpresaBean config, AlmacenArticuloBean almacenArticulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "UPDATE "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "SET STOCK_MAXIMO = ? "
				+ "WHERE CODALM = ? " +
				    "AND CODART = ? " +
				    "AND DESGLOSE1 = ? " +
				    "AND DESGLOSE2 = ? ";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setDouble(1, almacenArticulo.getStockMaximo());
			pstmt.setString(2, almacenArticulo.getCodAlm());
			pstmt.setString(3, almacenArticulo.getCodArt());
			pstmt.setString(4, almacenArticulo.getDesglose1());
			pstmt.setString(5, almacenArticulo.getDesglose2());

			log.debug("updateStockMaximo() - " + pstmt);

			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw getDaoException(e);
		} finally {
			try {
				pstmt.close();
			} catch (Exception ignore) {
				;
			}
		}
	}
	
	public static List<AlmacenArticuloBean> consultar(Connection conn, ConfigEmpresaBean config, String codArt) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<AlmacenArticuloBean> almacenes = new ArrayList<AlmacenArticuloBean>();
		
		sql = "SELECT CODALM, CODART, DESALM, DESGLOSE1, DESGLOSE2, STOCK, STOCK_UM_ALTERNATIVA, STOCK_MINIMO," +
				"STOCK_MAXIMO, STOCK_PENDIENTE_RECIBIR, STOCK_PENDIENTE_SERVIR, UBICACION1, " +
				"UBICACION2, UBICACION3, UBICACION4, PMP, ACTIVO " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
				"WHERE CODART = ? " +
				"ORDER BY CODALM, DESGLOSE1, DESGLOSE2";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codArt);
			log.debug("consultar() - " + pstmt);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()){
				AlmacenArticuloBean almacenArticulo = new AlmacenArticuloBean();
				almacenArticulo.setCodAlm(rs.getString("CODALM"));
				almacenArticulo.setDesAlm(rs.getString("DESALM"));
				almacenArticulo.setCodArt(rs.getString("CODART"));
				almacenArticulo.setDesglose1(rs.getString("DESGLOSE1"));
				almacenArticulo.setDesglose2(rs.getString("DESGLOSE2"));
				almacenArticulo.setStock(rs.getDouble("STOCK"));
				almacenArticulo.setStockUMA(rs.getDouble("STOCK_UM_ALTERNATIVA"));
				almacenArticulo.setStockMinimo(rs.getDouble("STOCK_MINIMO"));
				almacenArticulo.setStockMaximo(rs.getDouble("STOCK_MAXIMO"));
				almacenArticulo.setStockPendRecibir(rs.getDouble("STOCK_PENDIENTE_RECIBIR"));
				almacenArticulo.setStockPendServir(rs.getDouble("STOCK_PENDIENTE_SERVIR"));
				almacenArticulo.setUbicacion1(rs.getString("UBICACION1"));
				almacenArticulo.setUbicacion2(rs.getString("UBICACION2"));
				almacenArticulo.setUbicacion3(rs.getString("UBICACION3"));
				almacenArticulo.setUbicacion4(rs.getString("UBICACION4"));
				almacenArticulo.setPmp(rs.getDouble("PMP"));
				almacenArticulo.setActivo(rs.getString("ACTIVO"));
				
				almacenes.add(almacenArticulo);
			}
			
			return almacenes;
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
