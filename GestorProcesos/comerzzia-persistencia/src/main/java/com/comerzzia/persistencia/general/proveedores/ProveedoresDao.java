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

package com.comerzzia.persistencia.general.proveedores;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ProveedoresDao extends MantenimientoDao {

	private static String TABLA = "D_PROVEEDORES_TBL";
	private static String VISTA = "D_PROVEEDORES";

	private static Logger log = Logger.getMLogger(ProveedoresDao.class);

	public static PaginaResultados consultar(Connection conn,
			ConfigEmpresaBean config, ParametrosBuscarProveedoresBean param)
			throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		// Inicializamos la página de resultados
		List<ProveedorBean> resultados = new ArrayList<ProveedorBean>(param
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
						ProveedorBean proveedor = new ProveedorBean();
						proveedor.setCodPro(rs.getString("CODPRO"));
						proveedor.setDesPro(rs.getString("DESPRO"));
						proveedor.setTipoProveedor(rs
								.getString("TIPO_PROVEEDOR"));
						proveedor.setNombreComercial(rs
								.getString("NOMBRE_COMERCIAL"));
						proveedor.setDomicilio(rs.getString("DOMICILIO"));
						proveedor.setPoblacion(rs.getString("POBLACION"));
						proveedor.setProvincia(rs.getString("PROVINCIA"));
						proveedor.setCp(rs.getString("CP"));
						proveedor.setCodPais(rs.getString("CODPAIS"));
						proveedor.setDesPais(rs.getString("DESPAIS"));
						proveedor.setTelefono1(rs.getString("TELEFONO1"));
						proveedor.setTelefono2(rs.getString("TELEFONO2"));
						proveedor.setFax(rs.getString("FAX"));
						proveedor.setPersonaContacto(rs
								.getString("PERSONA_CONTACTO"));
						proveedor.setEmail(rs.getString("EMAIL"));
						proveedor.setCif(rs.getString("CIF"));
						proveedor.setIdTratImp(rs.getLong("ID_TRAT_IMPUESTOS"));
						proveedor.setCodTratImp(rs.getString("CODTRATIMP"));
						proveedor.setDesTratImp(rs.getString("DESTRATIMP"));
						proveedor.setIdMedioPagoVencimiento((rs.getString("ID_MEDPAG_VEN") != null) ? rs.getLong("ID_MEDPAG_VEN") : null);
						proveedor.setDesMedioPagoVencimiento(rs.getString("DESMEDPAG_VEN"));
						proveedor.setObservaciones(rs
								.getString("OBSERVACIONES"));
						proveedor.setActivo(rs.getString("ACTIVO"));
						proveedor.setFechaAlta(rs.getDate("FECHA_ALTA"));
						proveedor.setFechaBaja(rs.getDate("FECHA_BAJA"));
						proveedor.setBanco(rs.getString("BANCO"));
						proveedor.setDomicilioBanco(rs
								.getString("BANCO_DOMICILIO"));
						proveedor.setPoblacionBanco(rs
								.getString("BANCO_POBLACION"));
						proveedor.setCcc(rs.getString("CCC"));

						resultados.add(proveedor);
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
			ParametrosBuscarProveedoresBean param) {
		String sql = null;

		sql = "SELECT CODPRO, DESPRO, TIPO_PROVEEDOR, NOMBRE_COMERCIAL, DOMICILIO, POBLACION, PROVINCIA, CP, "
				+ "CODPAIS, DESPAIS, TELEFONO1, TELEFONO2, FAX, PERSONA_CONTACTO, EMAIL, CIF, "
				+ "ID_TRAT_IMPUESTOS, CODTRATIMP, DESTRATIMP, ID_MEDPAG_VEN, "
				+ "DESMEDPAG_VEN, OBSERVACIONES, ACTIVO, FECHA_ALTA, FECHA_BAJA, BANCO, BANCO_DOMICILIO, "
				+ "BANCO_POBLACION, CCC "
				+ "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), VISTA);

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
			ParametrosBuscarProveedoresBean param) {
		String sql = null;

		sql = "SELECT COUNT(*) " + "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), VISTA);

		// Clausula WHERE
		String where = getClausulaWhere(param);
		if (where.length() > 0) {
			sql += "WHERE " + where;
		}

		return sql;
	}

	private static String getClausulaWhere(ParametrosBuscarProveedoresBean param) {
		String where = "";

		// CODPRO
		if (!param.getCodPro().isEmpty()) {
			where = "CODPRO LIKE '" + param.getCodPro() + "%' ";
		}

		// DESPRO
		if (!param.getDesPro().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "UPPER(DESPRO) LIKE UPPER('" + param.getDesPro() + "%') ";
		}

		// CIF
		if (!param.getCif().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CIF = '" + param.getCif() + "' ";
		}

		// ACTIVO
		if (!param.getActivo().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "ACTIVO = '" + param.getActivo() + "' ";
		}

		return where;
	}

	public static ProveedorBean consultar(Connection conn,
			ConfigEmpresaBean config, String codPro) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ProveedorBean proveedor = null;
		String sql = null;

		sql = "SELECT CODPRO, DESPRO, TIPO_PROVEEDOR, NOMBRE_COMERCIAL, DOMICILIO, POBLACION, PROVINCIA, CP, "
				+ "CODPAIS, DESPAIS, TELEFONO1, TELEFONO2, FAX, PERSONA_CONTACTO, EMAIL, CIF, "
				+ "ID_TRAT_IMPUESTOS, CODTRATIMP, DESTRATIMP, ID_MEDPAG_VEN, "
				+ "DESMEDPAG_VEN, OBSERVACIONES, ACTIVO, FECHA_ALTA, FECHA_BAJA, BANCO, BANCO_DOMICILIO, "
				+ "BANCO_POBLACION, CCC "
				+ "FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), VISTA)
				+ "WHERE CODPRO = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codPro);
			log.debug("consultar() - " + pstmt);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				proveedor = new ProveedorBean();
				proveedor.setCodPro(rs.getString("CODPRO"));
				proveedor.setDesPro(rs.getString("DESPRO"));
				proveedor.setTipoProveedor(rs.getString("TIPO_PROVEEDOR"));
				proveedor.setNombreComercial(rs.getString("NOMBRE_COMERCIAL"));
				proveedor.setDomicilio(rs.getString("DOMICILIO"));
				proveedor.setPoblacion(rs.getString("POBLACION"));
				proveedor.setProvincia(rs.getString("PROVINCIA"));
				proveedor.setCp(rs.getString("CP"));
				proveedor.setCodPais(rs.getString("CODPAIS"));
				proveedor.setDesPais(rs.getString("DESPAIS"));
				proveedor.setTelefono1(rs.getString("TELEFONO1"));
				proveedor.setTelefono2(rs.getString("TELEFONO2"));
				proveedor.setFax(rs.getString("FAX"));
				proveedor.setPersonaContacto(rs.getString("PERSONA_CONTACTO"));
				proveedor.setEmail(rs.getString("EMAIL"));
				proveedor.setCif(rs.getString("CIF"));
				proveedor.setIdTratImp(rs.getLong("ID_TRAT_IMPUESTOS"));
				proveedor.setCodTratImp(rs.getString("CODTRATIMP"));
				proveedor.setDesTratImp(rs.getString("DESTRATIMP"));
				proveedor.setIdMedioPagoVencimiento((rs.getString("ID_MEDPAG_VEN") != null) ? rs.getLong("ID_MEDPAG_VEN") : null);
				proveedor.setDesMedioPagoVencimiento(rs.getString("DESMEDPAG_VEN"));
				proveedor.setObservaciones(rs.getString("OBSERVACIONES"));
				proveedor.setActivo(rs.getString("ACTIVO"));
				proveedor.setFechaAlta(rs.getDate("FECHA_ALTA"));
				proveedor.setFechaBaja(rs.getDate("FECHA_BAJA"));
				proveedor.setBanco(rs.getString("BANCO"));
				proveedor.setDomicilioBanco(rs.getString("BANCO_DOMICILIO"));
				proveedor.setPoblacionBanco(rs.getString("BANCO_POBLACION"));
				proveedor.setCcc(rs.getString("CCC"));
			}

			return proveedor;
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

	public static void insert(Connection conn, ConfigEmpresaBean config,
			ProveedorBean proveedor) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "(CODPRO, DESPRO, TIPO_PROVEEDOR, NOMBRE_COMERCIAL, DOMICILIO, POBLACION, PROVINCIA, CP, "
				+ "CODPAIS, TELEFONO1, TELEFONO2, FAX, PERSONA_CONTACTO, EMAIL, CIF, "
				+ "ID_TRAT_IMPUESTOS, ID_MEDPAG_VEN, OBSERVACIONES, ACTIVO, FECHA_ALTA, FECHA_BAJA, BANCO, BANCO_DOMICILIO, "
				+ "BANCO_POBLACION, CCC) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
				+ "?, ?, ?, ?, ?, ?)";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, proveedor.getCodPro());
			pstmt.setString(2, proveedor.getDesPro());
			pstmt.setString(3, proveedor.getTipoProveedor());
			pstmt.setString(4, proveedor.getNombreComercial());
			pstmt.setString(5, proveedor.getDomicilio());
			pstmt.setString(6, proveedor.getPoblacion());
			pstmt.setString(7, proveedor.getProvincia());
			pstmt.setString(8, proveedor.getCp());
			pstmt.setString(9, proveedor.getCodPais());
			pstmt.setString(10, proveedor.getTelefono1());
			pstmt.setString(11, proveedor.getTelefono2());
			pstmt.setString(12, proveedor.getFax());
			pstmt.setString(13, proveedor.getPersonaContacto());
			pstmt.setString(14, proveedor.getEmail());
			pstmt.setString(15, proveedor.getCif());
			pstmt.setLong(16, proveedor.getIdTratImp());
			pstmt.setLong(17, proveedor.getIdMedioPagoVencimiento());
			pstmt.setString(18, proveedor.getObservaciones());
			pstmt.setString(19, proveedor.getActivo());
			pstmt.setDate(20, Fechas.toSqlDate(proveedor.getFechaAlta()));
			if (proveedor.getFechaBaja() != null) {
				pstmt.setDate(21, Fechas.toSqlDate(proveedor.getFechaBaja()));
			} else {
				pstmt.setDate(21, null);
			}
			pstmt.setString(22, proveedor.getBanco());
			pstmt.setString(23, proveedor.getDomicilioBanco());
			pstmt.setString(24, proveedor.getPoblacionBanco());
			pstmt.setString(25, proveedor.getCcc());

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
			ProveedorBean proveedor) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "UPDATE "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "SET DESPRO = ?, TIPO_PROVEEDOR = ?, NOMBRE_COMERCIAL = ?, DOMICILIO = ?, POBLACION = ?, PROVINCIA = ?,"
				+ "CP = ?, CODPAIS = ?, TELEFONO1 = ?, TELEFONO2 = ?, FAX = ?, "
				+ "PERSONA_CONTACTO = ?, EMAIL = ?, CIF = ?, ID_TRAT_IMPUESTOS = ?, ID_MEDPAG_VEN = ?, "
				+ "OBSERVACIONES = ?, ACTIVO = ?, FECHA_BAJA = ?, BANCO = ?, BANCO_DOMICILIO = ?, "
				+ "BANCO_POBLACION = ?, CCC = ? " + "WHERE CODPRO = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, proveedor.getDesPro());
			pstmt.setString(2, proveedor.getTipoProveedor());
			pstmt.setString(3, proveedor.getNombreComercial());
			pstmt.setString(4, proveedor.getDomicilio());
			pstmt.setString(5, proveedor.getPoblacion());
			pstmt.setString(6, proveedor.getProvincia());
			pstmt.setString(7, proveedor.getCp());
			pstmt.setString(8, proveedor.getCodPais());
			pstmt.setString(9, proveedor.getTelefono1());
			pstmt.setString(10, proveedor.getTelefono2());
			pstmt.setString(11, proveedor.getFax());
			pstmt.setString(12, proveedor.getPersonaContacto());
			pstmt.setString(13, proveedor.getEmail());
			pstmt.setString(14, proveedor.getCif());
			pstmt.setLong(15, proveedor.getIdTratImp());
			pstmt.setLong(16, proveedor.getIdMedioPagoVencimiento());
			pstmt.setString(17, proveedor.getObservaciones());
			pstmt.setString(18, proveedor.getActivo());
			if (proveedor.getFechaBaja() != null) {
				pstmt.setDate(19, Fechas.toSqlDate(proveedor.getFechaBaja()));
			} else {
				pstmt.setDate(19, null);
			}
			pstmt.setString(20, proveedor.getBanco());
			pstmt.setString(21, proveedor.getDomicilioBanco());
			pstmt.setString(22, proveedor.getPoblacionBanco());
			pstmt.setString(23, proveedor.getCcc());
			pstmt.setString(24, proveedor.getCodPro());

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
			ProveedorBean proveedor) throws SQLException {
		delete(conn, config, proveedor.getCodPro());
	}

	public static void delete(Connection conn, ConfigEmpresaBean config,
			String codPro) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "DELETE FROM "
				+ getNombreElemento(config.getEsquemaEmpresa(), TABLA)
				+ "WHERE CODPRO = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codPro);

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

	public static Long consultarTotalProveedores(Connection conn, ConfigEmpresaBean config) throws SQLException {
		Statement stmt = null;
    	ResultSet rs = null;
    	Long total = null;
    	
    	// Consultas
    	String sql = "SELECT COUNT(*) " +
	      						"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
        
    	try {
    		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    		log.debug("consultarTotalProveedores() - " + sql);
        	
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
