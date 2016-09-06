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

package com.comerzzia.persistencia.ventas.albaranes;

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

public class AlbaranesVentasDao extends MantenimientoDao {
	
	private static String TABLA = "D_CLIE_ALBARANES_CAB_TBL";
	private static String VISTA = "D_CLIE_ALBARANES_CAB";
	
	private static Logger log = Logger.getMLogger(AlbaranesVentasDao.class);

	
	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, ParametrosBuscarAlbaranesVentasBean param)throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// Inicializamos la página de resultados
		List<AlbaranVentaBean> resultados = new ArrayList<AlbaranVentaBean>(param.getTamañoPagina());
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
			} 
			catch (Exception ignore) {}
			try {
				pstmt.close();
			} 
			catch (Exception ignore) {}
			

			// Si tenemos resultados, obtenemos la pagina requerida
			if (paginaResultados.getTotalResultados() > 0) {
        		pstmt = new PreparedStatement(conn, sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        		insertarParametros(pstmt, param);
            	log.debug("consultar() - " + pstmt);
                rs = pstmt.executeQuery();

				int contador = 0;
				if (rs.absolute(paginaResultados.getInicio())) {
					do {
						AlbaranVentaBean albaran = new AlbaranVentaBean();
						albaran.setIdAlbaran(rs.getLong("ID_CLIE_ALBARAN"));
						albaran.setCodEmpresa(rs.getString("CODEMP"));
						albaran.setPeriodo(rs.getShort("PERIODO"));
						albaran.setCodSerie(rs.getString("CODSERIE"));
						albaran.setNumAlbaran(rs.getLong("NUMALB"));
						albaran.setFecha(rs.getDate("FECHA"));
						albaran.setFechaSuministro(rs.getDate("FECHA_SUMINISTRO"));
						albaran.setReferenciaCliente(rs.getString("REFERENCIA_CLIENTE"));
						albaran.setCodCliente(rs.getString("CODCLI"));
						albaran.setDesCliente(rs.getString("DESCLI"));
						albaran.setCodConceptoAlmacen(rs.getString("CODCONALM"));
						albaran.setDesConceptoAlmacen(rs.getString("DESCONALM"));
						albaran.setPersonaContacto(rs.getString("PERSONA_CONTACTO"));
						albaran.setBase(rs.getDouble("BASE"));
						albaran.setImpuestos(rs.getDouble("IMPUESTOS"));
						albaran.setTotal(rs.getDouble("TOTAL"));
						
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

	public static List<AlbaranVentaBean> consultarListaAlbaranes(Connection conn, ConfigEmpresaBean config, ParametrosBuscarAlbaranesVentasBean param)throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// Inicializamos la página de resultados
		List<AlbaranVentaBean> resultados = new ArrayList<AlbaranVentaBean>();

		// Consulta
		String sql = "SELECT ID_CLIE_ALBARAN, " +
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
							 "REFERENCIA_CLIENTE, " +
							 "CODCLI, " +
							 "DESCLI, " +
							 "CODTAR, " +
							 "DESTAR, " +
							 "PERSONA_CONTACTO, " +
							 "CODALM, " +
							 "DESALM, " +
							 "ID_GRUPO_IMPUESTOS, " +
							 "ID_TRAT_IMPUESTOS, " +
							 "BASE, " +
							 "IMPUESTOS, " +
							 "TOTAL, " +
							 "OBSERVACIONES " +
						"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);
		
		//Completamos con la claúsula where
		sql += " WHERE " + getClausulaWhere(param);

		try {
    		pstmt = new PreparedStatement(conn, sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    		insertarParametros(pstmt, param);
        	log.debug("consultarListaAlbaranes() - " + pstmt);
            rs = pstmt.executeQuery();

			while(rs.next()) {
				AlbaranVentaBean albaran = new AlbaranVentaBean();
				albaran.setIdAlbaran(rs.getLong("ID_CLIE_ALBARAN"));
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
				albaran.setReferenciaCliente(rs.getString("REFERENCIA_CLIENTE"));
				albaran.setCodCliente(rs.getString("CODCLI"));
				albaran.setDesCliente(rs.getString("DESCLI"));
				albaran.setCodTarifa(rs.getString("CODTAR"));
				albaran.setDesTarifa(rs.getString("DESTAR"));
				albaran.setPersonaContacto(rs.getString("PERSONA_CONTACTO"));
				albaran.setCodAlmacen(rs.getString("CODALM"));
				albaran.setDesAlmacen(rs.getString("DESALM"));
				albaran.setIdGrupoImpuestos(rs.getLong("ID_GRUPO_IMPUESTOS"));
				albaran.setIdTratamientoImpuestos(rs.getLong("ID_TRAT_IMPUESTOS"));
				albaran.setBase(rs.getDouble("BASE"));
				albaran.setImpuestos(rs.getDouble("IMPUESTOS"));
				albaran.setTotal(rs.getDouble("TOTAL"));
				albaran.setObservaciones(rs.getString("OBSERVACIONES"));
				
				resultados.add(albaran);
				
			}

			return resultados;

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
	
	public static PaginaResultados consultarAlbaranesNoFacturadosClientes(Connection conn, ConfigEmpresaBean config, ParametrosBuscarAlbaranesVentasBean param)throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// Inicializamos la página de resultados
		List<AlbaranVentaBean> resultados = new ArrayList<AlbaranVentaBean>(param.getTamañoPagina());
		PaginaResultados paginaResultados = new PaginaResultados(param, resultados);

		// Consultas
		String sql = obtenerConsultaAlbaranesNoFacturadosClientes(config, param);
		String sqlCount = obtenerConsultaAlbaranesNoFacturadosClientesCount(config, param);

		try {
    		pstmt = new PreparedStatement(conn, sqlCount);
    		insertarParametros(pstmt, param);

			// Obtenemos número de resultados
			log.debug("consultar() - " + pstmt);
			rs = pstmt.executeQuery();
			
			int contador = 0;
			while (rs.next()) {
				contador++;
				paginaResultados.setTotalResultados(contador);
			}
			
			try {
				rs.close();
			} 
			catch (Exception ignore) {}
			try {
				pstmt.close();
			} 
			catch (Exception ignore) {}
			

			// Si tenemos resultados, obtenemos la pagina requerida
			if (paginaResultados.getTotalResultados() > 0) {
        		pstmt = new PreparedStatement(conn, sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        		insertarParametros(pstmt, param);
            	log.debug("consultar() - " + pstmt);
                rs = pstmt.executeQuery();

				contador = 0;
				if (rs.absolute(paginaResultados.getInicio())) {
					do {
						AlbaranVentaBean albaran = new AlbaranVentaBean();
						albaran.setCodCliente(rs.getString("CODCLI"));
						albaran.setDesCliente(rs.getString("DESCLI"));
						albaran.setNumAlbaran(rs.getLong("NUMALBARANES"));
						albaran.setBase(rs.getDouble("BASE"));
						
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
	
	public static String obtenerConsulta(ConfigEmpresaBean config, ParametrosBuscarAlbaranesVentasBean param) {
		String sql = null;

		sql = "SELECT ID_CLIE_ALBARAN, " +
					 "CODEMP, " +
					 "PERIODO, " +
					 "CODSERIE, " +
					 "NUMALB, " +
					 "FECHA, " +
					 "FECHA_SUMINISTRO, " +
					 "REFERENCIA_CLIENTE, " +
					 "CODCLI, " +
					 "DESCLI, " +
					 "CODCONALM, " +
					 "DESCONALM, " +
					 "PERSONA_CONTACTO, " +
					 "BASE, " +
					 "IMPUESTOS, " +
					 "TOTAL " +
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

	public static String obtenerConsultaAlbaranesNoFacturadosClientes(ConfigEmpresaBean config, ParametrosBuscarAlbaranesVentasBean param) {
		String sql = null;

		sql = "SELECT CODCLI, DESCLI, COUNT(*)AS NUMALBARANES, SUM(BASE)AS BASE " + 
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);

		// Clausula WHERE
		String where = getClausulaWhere(param);
		if (where.length() > 0) {
			sql += "WHERE " + where;
		}

		//Clausula GROUP BY
		sql += " GROUP BY CODCLI, DESCLI ";
		
		return sql;
	}
	
	public static String obtenerConsultaCount(ConfigEmpresaBean config,ParametrosBuscarAlbaranesVentasBean param) {
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

	public static String obtenerConsultaAlbaranesNoFacturadosClientesCount(ConfigEmpresaBean config,ParametrosBuscarAlbaranesVentasBean param) {
		String sql = null;

		sql = "SELECT COUNT(*) " +
			    "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);

		// Clausula WHERE
		String where = getClausulaWhere(param);
		if (where.length() > 0) {
			sql += "WHERE " + where;
		}

		//Clausula GROUP BY
		sql += " GROUP BY CODCLI, DESCLI ";

		return sql;
	}

	private static String getClausulaWhere(ParametrosBuscarAlbaranesVentasBean param) {
		String where = "";

		// PERIODO
		if (param.getPeriodo() != null && param.getPeriodo() > 0) {
			where += "PERIODO = " + param.getPeriodo() + " ";
		}

		// CODSERIE
		if (param.getCodSerie() != null && !param.getCodSerie().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODSERIE LIKE '" + param.getCodSerie() + "%' ";
		}
		
		// CODSERIE DESDE
		if (param.getCodSerieDesde() != null && !param.getCodSerieDesde().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			if (param.getCodSerieHasta() != null && !param.getCodSerieHasta().isEmpty()) {
				where += "CODSERIE >= '" + param.getCodSerieDesde() + "' ";
			}
			else{
				where += "CODSERIE LIKE '" + param.getCodSerieDesde() + "%' ";
			}
		}

		// CODSERIE HASTA
		if (param.getCodSerieHasta() != null && !param.getCodSerieHasta().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			if (param.getCodSerieDesde() != null && !param.getCodSerieDesde().isEmpty()) {
				where += "CODSERIE <= '" + param.getCodSerieHasta() + "' ";
			}
			else{
				where += "CODSERIE LIKE '" + param.getCodSerieHasta() + "%' ";
			}
		}

		// NUMALB
		if (param.getNumAlbaran() != null && param.getNumAlbaran() > 0) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "NUMALB = " + param.getNumAlbaran() + " ";
		}
		
		// CODCLI
		if (param.getCodCliente() != null && !param.getCodCliente().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODCLI = '" + param.getCodCliente() + "' ";
		}

		// CODCLI DESDE
		if (param.getCodClienteDesde() != null && !param.getCodClienteDesde().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			if (param.getCodClienteHasta() != null && !param.getCodClienteHasta().isEmpty()) {
				where += "CODCLI >= '" + param.getCodClienteDesde() + "' ";
			}
			else{
				where += "CODCLI LIKE '" + param.getCodClienteDesde() + "%' ";
			}
		}

		// CODCLI HASTA
		if (param.getCodClienteHasta() != null && !param.getCodClienteHasta().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			if (param.getCodClienteDesde() != null && !param.getCodClienteDesde().isEmpty()) {
				where += "CODCLI <= '" + param.getCodClienteHasta() + "' ";
			}
			else{
				where += "CODCLI LIKE '" + param.getCodClienteHasta() + "%' ";
			}
		}
		
		// CODALM
		if (param.getCodAlmacen() != null && !param.getCodAlmacen().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODALM = '" + param.getCodAlmacen() + "' ";
		}

		// CODCONALM
		if (param.getCodConceptoAlmacen() != null && !param.getCodConceptoAlmacen().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODCONALM = '" + param.getCodConceptoAlmacen() + "' ";
		}

		// FECHA_DESDE
		if (param.isBuscarPorFechaDesde() && param.getFechaDesde() != null) {
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

		// ID_FACTURA_REP
		if (param.isNoFacturados()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "ID_FACTURA_REP IS NULL ";
		}

		return where;
	}

	private static void insertarParametros(PreparedStatement pstmt, ParametrosBuscarAlbaranesVentasBean param) throws SQLException {
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

	public static AlbaranVentaBean consultar(Connection conn, ConfigEmpresaBean config, Long idAlbaran)throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		AlbaranVentaBean albaran = null;
		String sql = null;
		
		sql = "SELECT ID_CLIE_ALBARAN, " +
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
		 			 "REFERENCIA_CLIENTE, " +
		 			 "CODCLI, " +
		 			 "DESCLI, " +
		 			 "CODTAR, " +
		 			 "DESTAR, " +
		 			 "PERSONA_CONTACTO, " +
		 			 "CODALM, " +
		 			 "DESALM, " +
		 			 "ID_GRUPO_IMPUESTOS, " +
		 			 "ID_TRAT_IMPUESTOS, " +
		 			 "DESTRATIMP, " +
		 			 "BASE, " +
		 			 "IMPUESTOS, " +
		 			 "TOTAL, " +
		 			 "OBSERVACIONES, " +
		 			 "UID_TICKET," +
		 			 "TRACKING_PORTE, " +
		 			 "ID_FACTURA_REP " +
		 		"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		 	   "WHERE ID_CLIE_ALBARAN = ? ";

		try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idAlbaran);
    		
        	log.debug("consultar() - " + pstmt);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
            	albaran = new AlbaranVentaBean();
				albaran.setIdAlbaran(rs.getLong("ID_CLIE_ALBARAN"));
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
				albaran.setReferenciaCliente(rs.getString("REFERENCIA_CLIENTE"));
				albaran.setCodCliente(rs.getString("CODCLI"));
				albaran.setDesCliente(rs.getString("DESCLI"));
				albaran.setCodTarifa(rs.getString("CODTAR"));
				albaran.setDesTarifa(rs.getString("DESTAR"));
				albaran.setPersonaContacto(rs.getString("PERSONA_CONTACTO"));
				albaran.setCodAlmacen(rs.getString("CODALM"));
				albaran.setDesAlmacen(rs.getString("DESALM"));
				albaran.setIdGrupoImpuestos(rs.getLong("ID_GRUPO_IMPUESTOS"));
				albaran.setIdTratamientoImpuestos(rs.getLong("ID_TRAT_IMPUESTOS"));
				albaran.setDesTratamientoImpuestos(rs.getString("DESTRATIMP"));
				albaran.setBase(rs.getDouble("BASE"));
				albaran.setImpuestos(rs.getDouble("IMPUESTOS"));
				albaran.setTotal(rs.getDouble("TOTAL"));
				albaran.setObservaciones(rs.getString("OBSERVACIONES"));
				albaran.setUidTicket(rs.getString("UID_TICKET"));
				albaran.setTrackingPorte(rs.getString("TRACKING_PORTE"));
				albaran.setIdFacturaRepercutida(rs.getLong("ID_FACTURA_REP"));
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
	
	public static void insert(Connection conn, ConfigEmpresaBean config, AlbaranVentaBean albaran) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
				"(" +
				"ID_CLIE_ALBARAN, " +
				"CODEMP, " +
				"PERIODO, " +
				"CODSERIE, " +
				"NUMALB, " +
				"FECHA, " +
				"FECHA_SUMINISTRO, " +
				"REFERENCIA_CLIENTE, " +
				"CODCLI, " +
				"CODTAR, " +
				"PERSONA_CONTACTO, " +
				"CODALM, " +
				"ID_GRUPO_IMPUESTOS, " +
				"ID_TRAT_IMPUESTOS, " +
				"BASE, " +
				"IMPUESTOS, " +
				"TOTAL, " +
				"OBSERVACIONES, " +
				"CODCONALM, " +
				"CODAPLICACION, " +
				"UID_TICKET, " +
				"HORA, " +
				"CODCAJA, " +
				"ID_USUARIO, " +
				"TRACKING_PORTE " +
				") " +
			  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, albaran.getIdAlbaran());
			pstmt.setString(2, albaran.getCodEmpresa());
			pstmt.setShort(3, albaran.getPeriodo());
			pstmt.setString(4, albaran.getCodSerie());
			pstmt.setLong(5, albaran.getNumAlbaran());
			pstmt.setDate(6, Fechas.toSqlDate(albaran.getFecha()));
			pstmt.setDate(7, Fechas.toSqlDate(albaran.getFechaSuministro()));
			pstmt.setString(8, albaran.getReferenciaCliente());
			pstmt.setString(9, albaran.getCodCliente());
			pstmt.setString(10, albaran.getCodTarifa());
			pstmt.setString(11, albaran.getPersonaContacto());
			pstmt.setString(12, albaran.getCodAlmacen());
			pstmt.setLong(13, albaran.getIdGrupoImpuestos());
			pstmt.setLong(14, albaran.getIdTratamientoImpuestos());
			pstmt.setDouble(15, albaran.getBase());
			pstmt.setDouble(16, albaran.getImpuestos());
			pstmt.setDouble(17, albaran.getTotal());
			pstmt.setString(18, albaran.getObservaciones());
			pstmt.setString(19, albaran.getCodConceptoAlmacen());
			pstmt.setString(20, albaran.getCodAplicacion());
			pstmt.setString(21, albaran.getUidTicket());
			pstmt.setString(22, albaran.getHora());
			pstmt.setString(23, albaran.getCodCaja());
			pstmt.setLong(24, albaran.getIdUsuario());
			pstmt.setString(25, albaran.getTrackingPorte());
			
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

	public static void update(Connection conn, ConfigEmpresaBean config, AlbaranVentaBean albaran) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
				 "SET FECHA = ?, " +
				 	 "FECHA_SUMINISTRO = ?, " +
				 	 "REFERENCIA_CLIENTE = ?, " +
				 	 "CODCLI = ?, " +
				 	 "CODTAR = ?, " +
				 	 "PERSONA_CONTACTO = ?, " +
				 	 "CODALM = ?, " +
				 	 "ID_GRUPO_IMPUESTOS = ?, " +
				 	 "ID_TRAT_IMPUESTOS = ?, " +
				 	 "BASE = ?, " +
				 	 "IMPUESTOS = ?, " +
				 	 "TOTAL = ?, " +
				 	 "OBSERVACIONES = ?, " +
				 	 "CODCONALM = ?, " +
				 	 "TRACKING_PORTE = ? " +
			   "WHERE ID_CLIE_ALBARAN = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setDate(1, Fechas.toSqlDate(albaran.getFecha()));
			pstmt.setDate(2, Fechas.toSqlDate(albaran.getFechaSuministro()));
			pstmt.setString(3, albaran.getReferenciaCliente());
			pstmt.setString(4, albaran.getCodCliente());
			pstmt.setString(5, albaran.getCodTarifa());
			pstmt.setString(6, albaran.getPersonaContacto());
			pstmt.setString(7, albaran.getCodAlmacen());
			pstmt.setLong(8, albaran.getIdGrupoImpuestos());
			pstmt.setLong(9, albaran.getIdTratamientoImpuestos());
			pstmt.setDouble(10, albaran.getBase());
			pstmt.setDouble(11, albaran.getImpuestos());
			pstmt.setDouble(12, albaran.getTotal());
			pstmt.setString(13, albaran.getObservaciones());
			pstmt.setString(14, albaran.getCodConceptoAlmacen());
			pstmt.setString(15, albaran.getTrackingPorte());
			pstmt.setLong(16, albaran.getIdAlbaran());
			
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
	
	public static void delete(Connection conn, ConfigEmpresaBean config, AlbaranVentaBean albaran) throws SQLException {
		delete(conn, config, albaran.getIdAlbaran());
	}
	
	public static void delete(Connection conn, ConfigEmpresaBean config, Long idAlbaran) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
			   "WHERE ID_CLIE_ALBARAN = ? ";
		
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

	public static void actualizarFactura(Connection conn, ConfigEmpresaBean config, AlbaranVentaBean albaran) throws SQLException{
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
				 "SET ID_FACTURA_REP = ? " +
			   "WHERE ID_CLIE_ALBARAN = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, albaran.getIdFacturaRepercutida());
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

	public static void modificarTracking(Connection conn, ConfigEmpresaBean config, AlbaranVentaBean albaran) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
				 "SET TRACKING_PORTE = ? " +
			   "WHERE ID_CLIE_ALBARAN = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, albaran.getTrackingPorte());
			pstmt.setLong(2, albaran.getIdAlbaran());
			
        	log.debug("modificarTracking() - " + pstmt);
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

	public static Long consultarTotalAlbaranesVentas(Connection conn, ConfigEmpresaBean config, String codEmpresa) throws SQLException {
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
			log.debug("consultarTotalAlbaranesVentas() - " + pstmt);
        	
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
	
	public static Long consultarTotalTickets(Connection conn, ConfigEmpresaBean config, String codEmpresa) throws SQLException {
		PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	Long total = null;
    	
    	String sql = "SELECT COUNT(*) " +
	      		       "FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) + 
	      		   	  "WHERE CODEMP = ? " +
	      		   	  	"AND UID_TICKET IS NOT NULL ";
        
    	try {
    		pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, codEmpresa);
			log.debug("consultarTotalTickets() - " + pstmt);
        	
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
