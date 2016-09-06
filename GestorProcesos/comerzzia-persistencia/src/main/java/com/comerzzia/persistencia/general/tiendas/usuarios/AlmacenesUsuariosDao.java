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

package com.comerzzia.persistencia.general.tiendas.usuarios;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;


public class AlmacenesUsuariosDao extends MantenimientoDao {

	private static String TABLA = "D_ALMACENES_USUARIOS_TBL";
	private static String VISTA = "D_ALMACENES_USUARIOS";

	private static Logger log = Logger.getMLogger(AlmacenesUsuariosDao.class);

	
	public static List<AlmacenUsuarioBean> consultar(Connection conn, ConfigEmpresaBean config,
			Long idUsuario) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<AlmacenUsuarioBean> lstAlmacenes = new ArrayList<AlmacenUsuarioBean>();
		String sql = null;

		sql = "SELECT ID_USUARIO, CODALM, DESALM "
				+ "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), VISTA)
				+ "WHERE ID_USUARIO = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idUsuario);
			log.debug("consultar() - " + pstmt);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				AlmacenUsuarioBean almacenUsuario = new AlmacenUsuarioBean();
				almacenUsuario.setIdUsuario(rs.getLong("ID_USUARIO"));
				almacenUsuario.setCodAlmacen(rs.getString("CODALM"));
				almacenUsuario.setDesAlmacen(rs.getString("DESALM"));

				lstAlmacenes.add(almacenUsuario);
			}

			return lstAlmacenes;
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
	
	public static List<AlmacenUsuarioBean> consultar(Connection conn, ConfigEmpresaBean config, String codAlmacen) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<AlmacenUsuarioBean> lstUsuarios = new ArrayList<AlmacenUsuarioBean>();
		String sql = null;

		sql = "SELECT ID_USUARIO, USUARIO, DESUSUARIO, CODALM "
				+ "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), VISTA)
				+ "WHERE CODALM = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codAlmacen);
			log.debug("consultar() - " + pstmt);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				AlmacenUsuarioBean almacenUsuario = new AlmacenUsuarioBean();
				almacenUsuario.setIdUsuario(rs.getLong("ID_USUARIO"));
				almacenUsuario.setUsuario(rs.getString("USUARIO"));
				almacenUsuario.setDesUsuario(rs.getString("DESUSUARIO"));
				almacenUsuario.setCodAlmacen(rs.getString("CODALM"));

				lstUsuarios.add(almacenUsuario);
			}

			return lstUsuarios;
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
	
	
	public static List<Long> consultarUsuarios(Connection conn, ConfigEmpresaBean config, String codAlmacen) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	String sql = null;
    	
    	List<Long> usuarios = new ArrayList<Long>();
    	
    	sql = "SELECT ID_USUARIO " + 
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) + 
    	      "WHERE CODALM = ?";
    	
    	try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setString(1, codAlmacen);
    		
        	log.debug("consultar() - " + pstmt);
        	
            rs = pstmt.executeQuery();
        	
        	while (rs.next()){
        		usuarios.add(rs.getLong("ID_USUARIO"));
        	}
        	
        	return usuarios;
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

	public static void insert(Connection conn, ConfigEmpresaBean config, AlmacenUsuarioBean almacenUsuario)
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "(CODALM, ID_USUARIO) " + "VALUES (?, ?)";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, almacenUsuario.getCodAlmacen());
			pstmt.setLong(2, almacenUsuario.getIdUsuario());

			log.debug("insert() - " + pstmt);

			pstmt.execute();
		} 
		catch (SQLException e) {
			throw getDaoException(e);
		} 
		finally {
			try {
				pstmt.close();
			} catch (Exception ignore) {
				;
			}
		}
	}

	public static void delete(Connection conn, ConfigEmpresaBean config, AlmacenUsuarioBean almacenUsuario)
			throws SQLException {
		delete(conn, config, almacenUsuario.getCodAlmacen(), almacenUsuario.getIdUsuario());
	}
	
	public static void delete(Connection conn, ConfigEmpresaBean config, String codAlm, Long idUsuario)
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE CODALM = ? " + "AND ID_USUARIO = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codAlm);
			pstmt.setLong(2, idUsuario);
		
			log.debug("delete() - " + pstmt);
		
			pstmt.execute();
		} 
		catch (SQLException e) {
			throw getDaoException(e);
		} 
		finally {
			try {
				pstmt.close();
			} catch (Exception ignore) {
				;
			}
		}
	}

	public static void delete(Connection conn, ConfigEmpresaBean config, Long idUsuario)
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "DELETE FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE ID_USUARIO = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, idUsuario);

			log.debug("delete() - " + pstmt);

			pstmt.execute();
		} 
		catch (SQLException e) {
			throw getDaoException(e);
		} 
		finally {
			try {
				pstmt.close();
			} catch (Exception ignore) {
				;
			}
		}
	}
	
	public static void delete(Connection conn, ConfigEmpresaBean config, String codAlmacen)
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE CODALM = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codAlmacen);
		
			log.debug("delete() - " + pstmt);
		
			pstmt.execute();
		} 
		catch (SQLException e) {
			throw getDaoException(e);
		} 
		finally {
			try {
				pstmt.close();
			} catch (Exception ignore) {
				;
			}
		}
	}
}
