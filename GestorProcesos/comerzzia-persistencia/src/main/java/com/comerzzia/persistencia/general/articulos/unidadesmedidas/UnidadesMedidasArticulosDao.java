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

package com.comerzzia.persistencia.general.articulos.unidadesmedidas;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;

public class UnidadesMedidasArticulosDao extends MantenimientoDao {
	
	protected static final String TABLA = "D_ARTICULOS_UNID_MEDIDA_TBL";
	
	 /** Logger */
    protected static Logger log = Logger.getMLogger(UnidadesMedidasArticulosDao.class);
	
    
	public UnidadesMedidasArticulosDao (){
	}
	
	
	public static List<UnidadMedidaArticuloBean> consultar(Connection conn, ConfigEmpresaBean config, String codArticulo) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	List<UnidadMedidaArticuloBean> listaUnidadesMedidas = new ArrayList<UnidadMedidaArticuloBean>();
    	String sql = null;
    	
    	sql = "SELECT CODART, UNIDAD_MEDIDA, FACTOR_CONVERSION, ALTO, ANCHO, FONDO, PESO " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODART = ? " +
		      "ORDER BY FACTOR_CONVERSION";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, codArticulo);
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	while (rs.next()){
        		UnidadMedidaArticuloBean unidadMedida = new UnidadMedidaArticuloBean();
        		unidadMedida.setCodArticulo(rs.getString("CODART"));
        		unidadMedida.setUnidadMedida(rs.getString("UNIDAD_MEDIDA"));
        		unidadMedida.setFactorConversion(rs.getDouble("FACTOR_CONVERSION"));
        		unidadMedida.setAlto((rs.getString("ALTO") != null) ? rs.getLong("ALTO") : null);
        		unidadMedida.setAncho((rs.getString("ANCHO") != null) ? rs.getLong("ANCHO") : null);
        		unidadMedida.setFondo((rs.getString("FONDO") != null) ? rs.getLong("FONDO") : null);
        		unidadMedida.setPeso((rs.getString("PESO") != null) ? rs.getDouble("PESO") : null);
        		
        		listaUnidadesMedidas.add(unidadMedida);
        	}
        	
    		return listaUnidadesMedidas;
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
	
	
	public static UnidadMedidaArticuloBean consultarUnidadMedida(Connection conn, ConfigEmpresaBean config, String unidadMedida, String codArticulo)
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;

		UnidadMedidaArticuloBean unidadMediadArticulo = null;

		sql = "SELECT CODART, UNIDAD_MEDIDA, FACTOR_CONVERSION, ALTO, ANCHO, FONDO, PESO " +
			    "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
			   "WHERE UNIDAD_MEDIDA = ? " +
			     "AND CODART = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, unidadMedida);

			log.debug("consultarUnidadesMedidas() - " + pstmt);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				unidadMediadArticulo = new UnidadMedidaArticuloBean();
				unidadMediadArticulo.setCodArticulo(rs.getString("CODART"));
				unidadMediadArticulo.setFactorConversion(rs.getDouble("UNIDAD_MEDIDA"));
				unidadMediadArticulo.setFactorConversion(rs.getDouble("FACTOR_CONVERSION"));
				unidadMediadArticulo.setAlto((rs.getString("ALTO") != null) ? rs.getLong("ALTO") : null);
				unidadMediadArticulo.setAncho((rs.getString("ANCHO") != null) ? rs.getLong("ANCHO") : null);
				unidadMediadArticulo.setFondo((rs.getString("FONDO") != null) ? rs.getLong("FONDO") : null);
				unidadMediadArticulo.setPeso(rs.getDouble("PESO"));
			}

			return unidadMediadArticulo;
			
		} finally {
			try {
				rs.close();
			} catch (Exception ignore) {
				;
			}
			try {
				pstmt.close();
			} catch (Exception ignore) {
				;
			}
		}
	}

	
	public static void insert(Connection conn, ConfigEmpresaBean config, UnidadMedidaArticuloBean unidadMedida) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "(CODART, UNIDAD_MEDIDA, FACTOR_CONVERSION, ALTO, ANCHO, FONDO, PESO) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, unidadMedida.getCodArticulo());
			pstmt.setString(2, unidadMedida.getUnidadMedida());
			pstmt.setDouble(3, unidadMedida.getFactorConversion());
			pstmt.setLong(4, unidadMedida.getAlto());
			pstmt.setLong(5, unidadMedida.getAncho());
			pstmt.setLong(6, unidadMedida.getFondo());
			pstmt.setDouble(7, unidadMedida.getPeso());

			log.debug("insert() - " + pstmt);

			pstmt.execute();
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

	
	public static void update(Connection conn, ConfigEmpresaBean config,
			UnidadMedidaArticuloBean unidadMedida) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "UPDATE "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "SET FACTOR_CONVERSION = ?, ALTO = ?, ANCHO = ?, FONDO = ?, PESO = ? "
				+ "WHERE CODART = ? AND UNIDAD_MEDIDA = ? ";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setDouble(1, unidadMedida.getFactorConversion());
			pstmt.setLong(2, unidadMedida.getAlto());
			pstmt.setLong(3, unidadMedida.getAncho());
			pstmt.setLong(4, unidadMedida.getFondo());
			pstmt.setDouble(5, unidadMedida.getPeso());
			pstmt.setString(6, unidadMedida.getCodArticulo());
			pstmt.setString(7, unidadMedida.getUnidadMedida());

			log.debug("update() - " + pstmt);

			pstmt.execute();
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

	
	public static void delete(Connection conn, ConfigEmpresaBean config,
			UnidadMedidaArticuloBean unidadMedida) throws SQLException {
		delete(conn, config, unidadMedida.getCodArticulo(), unidadMedida.getUnidadMedida());
	}

	
	public static void delete(Connection conn, ConfigEmpresaBean config,
			String codArticulo, String unidadMedida) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "DELETE FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE CODART = ? AND UNIDAD_MEDIDA = ? ";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codArticulo);
			pstmt.setString(2, unidadMedida);

			log.debug("delete() - " + pstmt);

			pstmt.execute();
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

	
	public static void delete(Connection conn, ConfigEmpresaBean config, String codArticulo) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
		      "WHERE CODART = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setString(1, codArticulo);
        	
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
