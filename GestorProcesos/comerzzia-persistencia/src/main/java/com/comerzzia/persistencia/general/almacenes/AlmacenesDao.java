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

package com.comerzzia.persistencia.general.almacenes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class AlmacenesDao extends MantenimientoDao {

	private static String TABLA = "D_ALMACENES_TBL";
	private static String VISTA = "D_ALMACENES";

	private static Logger log = Logger.getMLogger(AlmacenesDao.class);

	public static PaginaResultados consultar(Connection conn,
			ConfigEmpresaBean config, ParametrosBuscarAlmacenesBean param)
			throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		// Inicializamos la página de resultados
		List<AlmacenBean> resultados = new ArrayList<AlmacenBean>(param
				.getTamañoPagina());
		PaginaResultados paginaResultados = new PaginaResultados(param,
				resultados);

		// Consultas
		String sql = obtenerConsulta(config, param);
		String sqlCount = obtenerConsultaCount(config, param);

		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);

			// Obtenemos número de resultados
			log.debug("consultar() - " + sqlCount);
			rs = stmt.executeQuery(sqlCount);
			if (rs.next()) {
				paginaResultados.setTotalResultados(rs.getInt(1));
			}
			rs.close();

			// Si tenemos resultados, obtenemos la pagina requerida
			if (paginaResultados.getTotalResultados() > 0) {
				log.debug("consultar() - " + sql);
				rs = stmt.executeQuery(sql);

				int contador = 0;
				if (rs.absolute(paginaResultados.getInicio())) {
					do {
						AlmacenBean almacen = new AlmacenBean();
						almacen.setCodAlm(rs.getString("CODALM"));
						almacen.setDesAlm(rs.getString("DESALM"));
						almacen.setDomicilio(rs.getString("DOMICILIO"));
						almacen.setPoblacion(rs.getString("POBLACION"));
						almacen.setProvincia(rs.getString("PROVINCIA"));
						almacen.setCp(rs.getString("CP"));
						almacen.setTelefono1(rs.getString("TELEFONO1"));
						almacen.setTelefono2(rs.getString("TELEFONO2"));
						almacen.setFax(rs.getString("FAX"));
						almacen.setPersonaContacto(rs
								.getString("PERSONA_CONTACTO"));
						almacen.setCodEmp(rs.getString("CODEMP"));
						almacen.setCodCliente(rs.getString("CODCLI"));
						almacen.setActivo(rs.getString("ACTIVO"));
						resultados.add(almacen);
						contador++;
					} while (rs.next()
							&& contador < paginaResultados.getTamañoPagina());
				}
			}
			return paginaResultados;
		} finally {
			try {
				rs.close();
			} catch (Exception ignore) {
				;
			}
			try {
				stmt.close();
			} catch (Exception ignore) {
				;
			}
		}
	}

	public static String obtenerConsulta(ConfigEmpresaBean config,
			ParametrosBuscarAlmacenesBean param) {
		String sql = null;

		sql = "SELECT CODALM, DESALM, DOMICILIO, POBLACION, PROVINCIA, CP, TELEFONO1, TELEFONO2, FAX, PERSONA_CONTACTO, CODEMP, CODCLI, ACTIVO "
				+ "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA);

		// Clausula WHERE
		String where = getClausulaWhere(param);
		if (where.length() > 0) {
			sql += "WHERE " + where;
		}

		// Clausula ORDER BY
		if (!param.getOrden().isEmpty()) {
			sql += "ORDER BY " + param.getOrden();
		}

		return sql;
	}

	public static String obtenerConsultaCount(ConfigEmpresaBean config,
			ParametrosBuscarAlmacenesBean param) {
		String sql = null;

		sql = "SELECT COUNT(*) " + "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA);

		// Clausula WHERE
		String where = getClausulaWhere(param);
		if (where.length() > 0) {
			sql += "WHERE " + where;
		}

		return sql;
	}

	private static String getClausulaWhere(ParametrosBuscarAlmacenesBean param) {
		String where = "";

		// CODALM
		if (!param.getCodAlm().isEmpty()) {
			where = "CODALM LIKE '" + param.getCodAlm() + "%' ";
		}

		// DESALM
		if (!param.getDesAlm().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "UPPER(DESALM) LIKE UPPER('" + param.getDesAlm() + "%') ";
		}

		if (!param.getActivo().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "ACTIVO = '" + param.getActivo() + "' ";
		}

		return where;
	}

	public static AlmacenBean consultar(Connection conn,
			ConfigEmpresaBean config, String codAlm) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AlmacenBean almacen = null;
		String sql = null;

		sql = "SELECT CODALM, DESALM, DOMICILIO, POBLACION, PROVINCIA, CP, TELEFONO1, TELEFONO2, FAX, PERSONA_CONTACTO, CODEMP, CODCLI, DESCLI, ACTIVO "

				+ "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), VISTA)
				+ "WHERE CODALM = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codAlm);
			log.debug("consultar() - " + pstmt);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				almacen = new AlmacenBean();
				almacen.setCodAlm(rs.getString("CODALM"));
				almacen.setDesAlm(rs.getString("DESALM"));
				almacen.setDomicilio(rs.getString("DOMICILIO"));
				almacen.setPoblacion(rs.getString("POBLACION"));
				almacen.setProvincia(rs.getString("PROVINCIA"));
				almacen.setCp(rs.getString("CP"));
				almacen.setTelefono1(rs.getString("TELEFONO1"));
				almacen.setTelefono2(rs.getString("TELEFONO2"));
				almacen.setFax(rs.getString("FAX"));
				almacen.setPersonaContacto(rs.getString("PERSONA_CONTACTO"));
				almacen.setCodEmp(rs.getString("CODEMP"));
				almacen.setCodCliente(rs.getString("CODCLI"));
				almacen.setDesCliente(rs.getString("DESCLI"));
				almacen.setActivo(rs.getString("ACTIVO"));
			}

			return almacen;
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
	
	/**
	 * Obtiene un almacén a partir del cliente que tiene asignado, que debe ser único para cada almacén.
	 * 
	 * @param conn
	 * @param config
	 * @param codCliente
	 * @return
	 * @throws SQLException
	 */
	public static AlmacenBean consultarPorCliente(Connection conn, ConfigEmpresaBean config, String codCliente) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AlmacenBean almacen = null;
		String sql = null;

		sql = "SELECT CODALM " + 
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) + 
			   "WHERE CODCLI = ? ";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codCliente);
			log.debug("consultarPorCliente() - " + pstmt);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				String codAlmacen = rs.getString("CODALM");
				/*
				 * Ya que para cada almacén sólo debe haber un único cliente asignado, 
				 * comprobar que no existen más resultados;
				 */
				if(rs.next()) {
					throw new SQLException("Error de configuración en la base datos: falta la clave única por código de cliente");
				}
				
				return consultar(conn, config, codAlmacen);
			}

			return almacen;
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
	
	public static String consultarCodEmpresa(Connection conn, ConfigEmpresaBean config, String codAlmacen) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String codEmpresa = "";
		String sql = null;

		sql = "SELECT CODEMP "
				+ "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE CODALM = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codAlmacen);
			log.debug("consultarCodEmpresa() - " + pstmt);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				codEmpresa = rs.getString("CODEMP");
			}

			return codEmpresa;
		
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

	public static List<AlmacenBean> consultar(Connection conn, ConfigEmpresaBean config) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	String sql = null;
		List<AlmacenBean> resultados = new ArrayList<AlmacenBean>();
    	
    	sql = "SELECT CODALM, DESALM " +
    	      "FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA);
    	
    	try {
    		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

    		log.debug("consultar() - " + sql);
        	
    		rs = stmt.executeQuery(sql);
        	while (rs.next()){
        		AlmacenBean almacen = new AlmacenBean();
        		almacen.setCodAlm(rs.getString("CODALM"));
        		almacen.setDesAlm(rs.getString("DESALM"));
        		
        		resultados.add(almacen);
        	}
        	
    		return resultados;
    	}
    	finally {
    		try{
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try{
    			stmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}

	public static void insert(Connection conn, ConfigEmpresaBean config,
			AlmacenBean almacen) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "(CODALM, DESALM, DOMICILIO, POBLACION, PROVINCIA, CP, TELEFONO1, TELEFONO2, FAX, PERSONA_CONTACTO, CODEMP, CODCLI, ACTIVO) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, almacen.getCodAlm());
			pstmt.setString(2, almacen.getDesAlm());
			pstmt.setString(3, almacen.getDomicilio());
			pstmt.setString(4, almacen.getPoblacion());
			pstmt.setString(5, almacen.getProvincia());
			pstmt.setString(6, almacen.getCp());
			pstmt.setString(7, almacen.getTelefono1());
			pstmt.setString(8, almacen.getTelefono2());
			pstmt.setString(9, almacen.getFax());
			pstmt.setString(10, almacen.getPersonaContacto());
			pstmt.setString(11, almacen.getCodEmp());
			pstmt.setString(12, almacen.getCodCliente());
			pstmt.setString(13, almacen.getActivo());

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
			AlmacenBean almacen) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "UPDATE "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "SET DESALM = ?, DOMICILIO = ?, POBLACION = ?, PROVINCIA = ?, CP = ?, TELEFONO1 = ?, TELEFONO2 = ?, FAX = ?, PERSONA_CONTACTO = ?, CODCLI = ?, ACTIVO = ? "
				+ "WHERE CODALM = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, almacen.getDesAlm());
			pstmt.setString(2, almacen.getDomicilio());
			pstmt.setString(3, almacen.getPoblacion());
			pstmt.setString(4, almacen.getProvincia());
			pstmt.setString(5, almacen.getCp());
			pstmt.setString(6, almacen.getTelefono1());
			pstmt.setString(7, almacen.getTelefono2());
			pstmt.setString(8, almacen.getFax());
			pstmt.setString(9, almacen.getPersonaContacto());
			pstmt.setString(10, almacen.getCodCliente());
			pstmt.setString(11, almacen.getActivo());
			pstmt.setString(12, almacen.getCodAlm());

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
			AlmacenBean almacen) throws SQLException {
		delete(conn, config, almacen.getCodAlm());
	}

	public static void delete(Connection conn, ConfigEmpresaBean config,
			String codAlm) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "DELETE FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE CODALM = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codAlm);

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

	public static Long consultarTotalAlmacenes(Connection conn, ConfigEmpresaBean config) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	Long total = null;
    	
    	// Consultas
    	String sql = "SELECT COUNT(*) " +
	      						"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
        
    	try {
    		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    		log.debug("consultarTotalAlmacenes() - " + sql);
        	
    		rs = stmt.executeQuery(sql);
        	if (rs.next()){
        		total = rs.getLong(1);
        	}
        	
        	return total;
    	}
    	finally {
    		try {
    			rs.close();
    		}
    		catch(Exception ignore) {;}
    		try {
    			stmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
}
