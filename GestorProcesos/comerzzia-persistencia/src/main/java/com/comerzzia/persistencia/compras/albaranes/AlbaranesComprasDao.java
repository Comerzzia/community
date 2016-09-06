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

package com.comerzzia.persistencia.compras.albaranes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class AlbaranesComprasDao extends MantenimientoDao {
	
	private static String TABLA = "D_PROV_ALBARANES_CAB_TBL";
	private static String VISTA = "D_PROV_ALBARANES_CAB";
	
	private static Logger log = Logger.getMLogger(AlbaranesComprasDao.class);
	
	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, ParametrosBuscarAlbaranesComprasBean param)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// Inicializamos la página de resultados
		List<AlbaranCompraBean> resultados = new ArrayList<AlbaranCompraBean>(param.getTamañoPagina());
		PaginaResultados paginaResultados = new PaginaResultados(param, resultados);

		// Consultas
		String sql = obtenerConsulta(config, param);
		String sqlCount = obtenerConsultaCount(config, param);

		try {
			pstmt = new PreparedStatement(conn, sqlCount);
			insertarParametros(pstmt, param);
    		
			// Obtenemos número de resultados
			log.debug("consultar() - " + pstmt);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				paginaResultados.setTotalResultados(rs.getInt(1));
			}
			
			try {
				rs.close();
			} catch (Exception ignore) {}
			
			try {
				pstmt.close();
			} catch (Exception ignore) {}

			// Si tenemos resultados, obtenemos la pagina requerida
			if (paginaResultados.getTotalResultados() > 0) {
				pstmt = new PreparedStatement(conn, sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        		insertarParametros(pstmt, param);
            	log.debug("consultar() - " + pstmt);
                rs = pstmt.executeQuery();

				int contador = 0;
				if (rs.absolute(paginaResultados.getInicio())) {
					do {
						AlbaranCompraBean albaran = new AlbaranCompraBean();
						albaran.setIdAlbaran(rs.getLong("ID_PROV_ALBARAN"));
						albaran.setCodEmpresa(rs.getString("CODEMP"));
						albaran.setPeriodo(rs.getShort("PERIODO"));
						albaran.setCodSerie(rs.getString("CODSERIE"));
						albaran.setNumAlbaran(rs.getLong("NUMALB"));
						albaran.setFecha(rs.getDate("FECHA"));
						albaran.setFechaSuministro(rs.getDate("FECHA_SUMINISTRO"));
						albaran.setReferenciaProveedor(rs.getString("REFERENCIA_PROVEEDOR"));
						albaran.setCodProveedor(rs.getString("CODPRO"));
						albaran.setDesProveedor(rs.getString("DESPRO"));
						albaran.setCodConceptoAlmacen(rs.getString("CODCONALM"));
						albaran.setDesConceptoAlmacen(rs.getString("DESCONALM"));
						albaran.setPersonaContacto(rs.getString("PERSONA_CONTACTO"));
						albaran.setTotal(rs.getDouble("TOTAL"));
						albaran.setBase(rs.getDouble("BASE"));
						albaran.setImpuestos(rs.getDouble("IMPUESTOS"));
						albaran.setCodSerieFactura(rs.getString("CODSERIE_FACTURA"));
						albaran.setNumFactura((rs.getString("NUMFAC") != null) ? rs.getLong("NUMFAC") : null);
						albaran.setFechaFactura(rs.getDate("FECHA_FACTURA"));
						
						resultados.add(albaran);
						contador++;
					} while (rs.next() && contador < paginaResultados.getTamañoPagina());
				}
			}

			return paginaResultados;
		}
		finally {
			try {
				rs.close();
			} catch (Exception ignore) {}
			
			try {
				pstmt.close();
			} catch (Exception ignore) {}
		}
	}
	
	public static String obtenerConsulta(ConfigEmpresaBean config,
			ParametrosBuscarAlbaranesComprasBean param) {
		String sql = null;

		sql = "SELECT ID_PROV_ALBARAN, " +
					 "CODEMP, " +
					 "PERIODO, " +
					 "CODSERIE, " +
					 "NUMALB, " +
					 "FECHA, " +
					 "FECHA_SUMINISTRO, " +
					 "REFERENCIA_PROVEEDOR, " +
					 "CODPRO, " +
					 "DESPRO, " +
					 "CODCONALM, " +
					 "DESCONALM, " +
					 "PERSONA_CONTACTO, " +
					 "TOTAL, " +
					 "BASE, " +
					 "IMPUESTOS," +
					 "CODSERIE_FACTURA," +
					 "NUMFAC," +
					 "FECHA_FACTURA " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);

		// Clausula WHERE
		String where = getClausulaWhere(param);
		if (where.length() > 0) {
			sql += "WHERE " + where;
		}

		// Clausula ORDER BY
		if (!param.getOrden().isEmpty()) {
			String orden = param.getOrden();
			
			if (orden.equals("FECHA") | orden.equals("FECHA DESC"))
				orden += ", PERIODO DESC, CODSERIE, NUMALB DESC";
			
			else if (orden.equals("PERIODO") | orden.equals("PERIODO DESC"))
				orden += ", CODSERIE, NUMALB DESC";
			
			else if (orden.equals("CODSERIE") | orden.equals("CODSERIE DESC"))
				orden = "PERIODO DESC, " + orden + ", NUMALB DESC";
			
			else if (orden.equals("NUMALB") | orden.equals("NUMALB DESC"))
				orden = "PERIODO DESC, CODSERIE, " + orden;
			
			sql += "ORDER BY " + orden;
		}

		return sql;
	}

	public static String obtenerConsultaCount(ConfigEmpresaBean config,
			ParametrosBuscarAlbaranesComprasBean param) {
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

	private static String getClausulaWhere(ParametrosBuscarAlbaranesComprasBean param) {
		String where = "";

		// NUMALB
		if (param.getPeriodo() != null && param.getPeriodo() > 0) {
			where += "PERIODO = " + param.getPeriodo() + " ";
		}

		// CODSERIE
		if (param.getCodSerie() != null && !param.getCodSerie().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where = "CODSERIE >= '" + param.getCodSerie() + "' ";
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where = "CODSERIE LIKE '" + param.getCodSerie() + "%' ";
		}
		
		// CODSERIE HASTA
		if (param.getCodSerieHasta() != null && !param.getCodSerieHasta().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where = "CODSERIE <= '" + param.getCodSerieHasta() + "' ";
		}
		
		// NUMALB
		if (param.getNumAlbaran() != null && param.getNumAlbaran() > 0) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "NUMALB = " + param.getNumAlbaran() + " ";
		}
		
		// CODPRO
		if (param.getCodProveedor() != null && !param.getCodProveedor().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODPRO = '" + param.getCodProveedor() + "' ";
		}
		
		// CODCONALM
		if (param.getCodConceptoAlmacen() != null && !param.getCodConceptoAlmacen().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODCONALM = '" + param.getCodConceptoAlmacen() + "' ";
		}

		// FECHA_DESDE
		if (param.isBuscarPorFechaDesde() &&  param.getFechaDesde() != null) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "FECHA >= ? ";
		}
		
		// FECHA_HASTA
		if (param.isBuscarPorFechaHasta() && param.getFechaHasta() != null) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "FECHA <= ? ";
		}
		
		// ID_FACTURA_SOP
		if (param.isNoFacturados()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "ID_FACTURA_SOP IS NULL ";
		}
		
		return where;
	}

	private static void insertarParametros(PreparedStatement pstmt, ParametrosBuscarAlbaranesComprasBean param) throws SQLException {
		Integer indice = 1;
		// FECHA_DESDE
		if (param.isBuscarPorFechaDesde() && param.getFechaDesde() != null) {
			pstmt.setDate(indice, Fechas.toSqlDate(param.getFechaDesde()));
			indice++;
		}
		
		// FECHA_HASTA
		if (param.isBuscarPorFechaHasta() && param.getFechaHasta() != null) {
			pstmt.setDate(indice, Fechas.toSqlDate(param.getFechaHasta()));			
		}
	}
	
	public static AlbaranCompraBean consultar(Connection conn, ConfigEmpresaBean config, Long idAlbaran)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AlbaranCompraBean albaran = null;
		String sql = null;
		
		sql = "SELECT ID_PROV_ALBARAN, " +
		 			 "CODEMP, " +
		 			 "PERIODO, " +
		 			 "CODSERIE, " +
		 			 "DESSERIE, " +
		 			 "CODCONALM, " +
		 			 "DESCONALM, " +
		 			 "CODAPLICACION, " +
		 			 "NUMALB, " +
		 			 "FECHA, " +
		 			 "FECHA_SUMINISTRO, " +
		 			 "REFERENCIA_PROVEEDOR, " +
		 			 "CODPRO, " +
		 			 "DESPRO, " +
					 "PERSONA_CONTACTO, " +
		 			 "CODALM, " +
		 			 "DESALM, " +
		 			 "CODCAJA, " +
		 			 "UID_DIARIO_CAJA, " +
		 			 "ID_GRUPO_IMPUESTOS, " +
		 			 "ID_TRAT_IMPUESTOS, " +
		 			 "DESTRATIMP, " +
		 			 "BASE, " +
		 			 "IMPUESTOS, " +
		 			 "TOTAL, " +
		 			 "OBSERVACIONES, " +
		 			 "ID_USUARIO, " +
		 			 "ID_FACTURA_SOP, " +
					 "CODSERIE_FACTURA," +
					 "NUMFAC," +
					 "FECHA_FACTURA " +
		 		"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		 	   "WHERE ID_PROV_ALBARAN = ? ";

		try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idAlbaran);
    		
        	log.debug("consultar() - " + pstmt);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
            	albaran = new AlbaranCompraBean();
				albaran.setIdAlbaran(rs.getLong("ID_PROV_ALBARAN"));
				albaran.setCodEmpresa(rs.getString("CODEMP"));
				albaran.setPeriodo(rs.getShort("PERIODO"));
				albaran.setCodSerie(rs.getString("CODSERIE"));
				albaran.setDesSerie(rs.getString("DESSERIE"));
				albaran.setCodConceptoAlmacen(rs.getString("CODCONALM"));
				albaran.setDesConceptoAlmacen(rs.getString("DESCONALM"));
				albaran.setCodAplicacion(rs.getString("CODAPLICACION"));
				albaran.setNumAlbaran(rs.getLong("NUMALB"));
				albaran.setFecha(rs.getDate("FECHA"));
				albaran.setFechaSuministro(rs.getDate("FECHA_SUMINISTRO"));
				albaran.setReferenciaProveedor(rs.getString("REFERENCIA_PROVEEDOR"));
				albaran.setCodProveedor(rs.getString("CODPRO"));
				albaran.setDesProveedor(rs.getString("DESPRO"));
				albaran.setPersonaContacto(rs.getString("PERSONA_CONTACTO"));
				albaran.setCodAlmacen(rs.getString("CODALM"));
				albaran.setDesAlmacen(rs.getString("DESALM"));
				albaran.setCodCaja(rs.getString("CODCAJA"));
				albaran.setIdDiarioCaja((rs.getString("UID_DIARIO_CAJA") != null) ? rs.getLong("UID_DIARIO_CAJA") : null);
				albaran.setIdGrupoImpuestos(rs.getLong("ID_GRUPO_IMPUESTOS"));
				albaran.setIdTratamientoImpuestos(rs.getLong("ID_TRAT_IMPUESTOS"));
				albaran.setDesTratamientoImpuestos(rs.getString("DESTRATIMP"));
				albaran.setBase(rs.getDouble("BASE"));
				albaran.setImpuestos(rs.getDouble("IMPUESTOS"));
				albaran.setTotal(rs.getDouble("TOTAL"));
				albaran.setObservaciones(rs.getString("OBSERVACIONES"));
				albaran.setIdUsuario((rs.getString("ID_USUARIO") != null) ? rs.getLong("ID_USUARIO") : null);
				albaran.setIdFacturaSoportada(rs.getString("ID_FACTURA_SOP") != null ? rs.getLong("ID_FACTURA_SOP") : null);
				albaran.setCodSerieFactura(rs.getString("CODSERIE_FACTURA"));
				albaran.setNumFactura((rs.getString("NUMFAC") != null) ? rs.getLong("NUMFAC") : null);
				albaran.setFechaFactura(rs.getDate("FECHA_FACTURA"));

            }
            
			return albaran;
		}
		finally {
			try {
				rs.close();
			} catch (Exception ignore) {}
			
			try {
				pstmt.close();
			} catch (Exception ignore) {}
		}
	}
	
	public static void insert(Connection conn, ConfigEmpresaBean config, AlbaranCompraBean albaran) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
				"(" +
				"ID_PROV_ALBARAN, " +
				"CODEMP, " +
				"PERIODO, " +
				"CODSERIE, " +
				"NUMALB, " +
				"FECHA, " +
				"FECHA_SUMINISTRO, " +
				"REFERENCIA_PROVEEDOR, " +
				"CODPRO, " +
				"PERSONA_CONTACTO, " +
				"CODALM, " +
				"ID_GRUPO_IMPUESTOS, " +
				"ID_TRAT_IMPUESTOS, " +
				"BASE, " +
				"IMPUESTOS, " +
				"TOTAL, " +
				"OBSERVACIONES, " +
				"CODCONALM, " +
				"CODAPLICACION " +
				") " +
			  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, albaran.getIdAlbaran());
			pstmt.setString(2, albaran.getCodEmpresa());
			pstmt.setShort(3, albaran.getPeriodo());
			pstmt.setString(4, albaran.getCodSerie());
			pstmt.setLong(5, albaran.getNumAlbaran());
			pstmt.setDate(6, Fechas.toSqlDate(albaran.getFecha()));
			pstmt.setDate(7, Fechas.toSqlDate(albaran.getFechaSuministro()));
			pstmt.setString(8, albaran.getReferenciaProveedor());
			pstmt.setString(9, albaran.getCodProveedor());
			pstmt.setString(10, albaran.getPersonaContacto());
			pstmt.setString(11, albaran.getCodAlmacen());
			pstmt.setLong(12, albaran.getIdGrupoImpuestos());
			pstmt.setLong(13, albaran.getIdTratamientoImpuestos());
			pstmt.setDouble(14, albaran.getBase());
			pstmt.setDouble(15, albaran.getImpuestos());
			pstmt.setDouble(16, albaran.getTotal());
			pstmt.setString(17, albaran.getObservaciones());
			pstmt.setString(18, albaran.getCodConceptoAlmacen());
			pstmt.setString(19, albaran.getCodAplicacion());
			
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
	
	public static void update(Connection conn, ConfigEmpresaBean config, AlbaranCompraBean albaran) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
				 "SET FECHA = ?, " +
				 	 "FECHA_SUMINISTRO = ?, " +
				 	 "REFERENCIA_PROVEEDOR = ?, " +
				 	 "CODPRO = ?, " +
				 	 "PERSONA_CONTACTO = ?, " +
				 	 "CODALM = ?, " +
				 	 "ID_GRUPO_IMPUESTOS = ?, " +
				 	 "ID_TRAT_IMPUESTOS = ?, " +
				 	 "BASE = ?, " +
				 	 "IMPUESTOS = ?, " +
				 	 "TOTAL = ?, " +
				 	 "OBSERVACIONES = ?, " +
				 	 "CODCONALM = ? " +
			   "WHERE ID_PROV_ALBARAN = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setDate(1, Fechas.toSqlDate(albaran.getFecha()));
			pstmt.setDate(2, Fechas.toSqlDate(albaran.getFechaSuministro()));
			pstmt.setString(3, albaran.getReferenciaProveedor());
			pstmt.setString(4, albaran.getCodProveedor());
			pstmt.setString(5, albaran.getPersonaContacto());
			pstmt.setString(6, albaran.getCodAlmacen());
			pstmt.setLong(7, albaran.getIdGrupoImpuestos());
			pstmt.setLong(8, albaran.getIdTratamientoImpuestos());
			pstmt.setDouble(9, albaran.getBase());
			pstmt.setDouble(10, albaran.getImpuestos());
			pstmt.setDouble(11, albaran.getTotal());
			pstmt.setString(12, albaran.getObservaciones());
			pstmt.setString(13, albaran.getCodConceptoAlmacen());
			pstmt.setLong(14, albaran.getIdAlbaran());
			
        	log.debug("update() - " + pstmt);
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
	
	public static void delete(Connection conn, ConfigEmpresaBean config, AlbaranCompraBean albaran) throws SQLException {
		delete(conn, config, albaran.getIdAlbaran());
	}
	
	public static void delete(Connection conn, ConfigEmpresaBean config, Long idAlbaran) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
			   "WHERE ID_PROV_ALBARAN = ? ";
		
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
	
	public static void actualizarFactura(Connection conn, ConfigEmpresaBean config, AlbaranCompraBean albaran) throws SQLException{
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
				 "SET ID_FACTURA_SOP = ? " +
			   "WHERE ID_PROV_ALBARAN = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, albaran.getIdFacturaSoportada());
			pstmt.setLong(2, albaran.getIdAlbaran());
			
        	log.debug("actualizarFactura() - " + pstmt);
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

	public static Long consultarTotalAlbaranesCompras(Connection conn, ConfigEmpresaBean config, String codEmpresa) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	Long total = null;
    	
    	// Consultas
    	String sql = "SELECT COUNT(*) " +
	      		       "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) + 
	      		   	  "WHERE CODEMP = ?";
        
    	try {
    		pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codEmpresa);
			log.debug("consultarTotalAlbaranesCompras() - " + pstmt);
        	
    		rs = pstmt.executeQuery();
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
    			pstmt.close();
    		}
    		catch(Exception ignore) {;}
    	}
	}
}
