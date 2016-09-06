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

package com.comerzzia.persistencia.almacenes.traspasos;

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

public class TraspasosAlmacenesDao extends MantenimientoDao {

	private static String TABLA = "D_ALMACENES_TRASPASOS_CAB_TBL";
	private static String VISTA = "D_ALMACENES_TRASPASOS_CAB";
	
	private static Logger log = Logger.getMLogger(TraspasosAlmacenesDao.class);
	
	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, ParametrosBuscarTraspasosAlmacenesBean param)
			throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		// Inicializamos la página de resultados
		List<TraspasoAlmacenesBean> resultados = new ArrayList<TraspasoAlmacenesBean>(param.getTamañoPagina());
		PaginaResultados paginaResultados = new PaginaResultados(param, resultados);

		// Consultas
		String sql = obtenerConsulta(config, param);
		String sqlCount = obtenerConsultaCount(config, param);

		try {
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

			// Obtenemos número de resultados
			log.debug("consultar() - " + sqlCount);
			rs = stmt.executeQuery(sqlCount);
			
			if (rs.next()) {
				paginaResultados.setTotalResultados(rs.getInt(1));
			}
			
			try {
				rs.close();
			} catch (Exception ignore) {}

			// Si tenemos resultados, obtenemos la pagina requerida
			if (paginaResultados.getTotalResultados() > 0) {
				log.debug("consultar() - " + sql);
				rs = stmt.executeQuery(sql);

				int contador = 0;
				if (rs.absolute(paginaResultados.getInicio())) {
					do {
						TraspasoAlmacenesBean traspaso = new TraspasoAlmacenesBean();
						traspaso.setIdTraspaso(rs.getLong("ID_TRASPASO"));
						traspaso.setCodAplicacion(rs.getString("CODAPLICACION"));
						traspaso.setCodAlmacenOrigen(rs.getString("CODALM_ORIGEN"));
						traspaso.setDesAlmacenOrigen(rs.getString("DESALM_ORIGEN"));
						traspaso.setCodSerie(rs.getString("CODSERIE"));
						traspaso.setDesSerie(rs.getString("DESSERIE"));
						traspaso.setNumTraspaso(rs.getLong("NUMTRASPASO"));
						traspaso.setCodConAlmacen(rs.getString("CODCONALMACEN"));
						traspaso.setDesConAlmacen(rs.getString("DESCONALMACEN"));
						traspaso.setFecha(rs.getDate("FECHA"));
						traspaso.setFechaSuministro(rs.getDate("FECHA_SUMINISTRO"));
						traspaso.setFechaSuministroPrev(rs.getDate("FECHA_SUMINISTRO_PREV"));
						traspaso.setEstado(rs.getInt("ESTADO"));
						traspaso.setSubEstado(rs.getInt("SUBESTADO"));
						traspaso.setCodAlmacenDestino(rs.getString("CODALM_DESTINO"));
						traspaso.setDesAlmacenDestino(rs.getString("DESALM_DESTINO"));
						traspaso.setReferencia(rs.getString("REFERENCIA"));
						traspaso.setReferencia(rs.getString("OBSERVACIONES"));
						
						resultados.add(traspaso);
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
				stmt.close();
			} catch (Exception ignore) {}
		}
	}
	
	public static String obtenerConsulta(ConfigEmpresaBean config,
			ParametrosBuscarTraspasosAlmacenesBean param) {
		String sql = null;

		sql = "SELECT ID_TRASPASO, " +
					 "CODAPLICACION, " +
					 "CODALM_ORIGEN, " +
					 "DESALM_ORIGEN, " +
					 "CODSERIE, " +
					 "DESSERIE, " +
					 "NUMTRASPASO, " +
					 "CODCONALMACEN, " +
					 "DESCONALMACEN, " +
					 "FECHA, " +
					 "FECHA_SUMINISTRO, " +
					 "FECHA_SUMINISTRO_PREV, " +
					 "ESTADO, " +
					 "SUBESTADO, " +
					 "CODALM_DESTINO, " +
					 "DESALM_DESTINO, " +
					 "REFERENCIA, " +
					 "OBSERVACIONES " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA);

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
			ParametrosBuscarTraspasosAlmacenesBean param) {
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

	private static String getClausulaWhere(ParametrosBuscarTraspasosAlmacenesBean param) {
		String where = "";
		
		// CODSERIE
		if (param.getCodSerie() != null && !param.getCodSerie().isEmpty()) {
			where = "CODSERIE = '" + param.getCodSerie() + "' ";
		}
		
		// NUMTRASPASO
		if (param.getNumTraspaso() != null && param.getNumTraspaso() > 0) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "NUMTRASPASO = " + param.getNumTraspaso() + " ";
		}
		
		// CODALM_ORIGEN
		if (param.getCodAlmacenOrigen() != null && !param.getCodAlmacenOrigen().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODALM_ORIGEN = '" + param.getCodAlmacenOrigen() + "' ";
		}
		
		// CODALM_DESTINO
		if (param.getCodAlmacenDestino() != null && !param.getCodAlmacenDestino().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODALM_DESTINO = '" + param.getCodAlmacenDestino() + "' ";
		}
		
		// FECHA_DESDE
		if (param.isBuscarPorFechaDesde() && param.getFechaDesde() != null) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "FECHA >= '" + param.getFechaDesde() + "' ";
		}
		
		// FECHA_HASTA
		if (param.isBuscarPorFechaHasta() && param.getFechaHasta() != null) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "FECHA <= '" + param.getFechaHasta() + "' ";
		}
		
		// CODAPLICACION
		if (param.getCodAplicacion() != null && !param.getCodAplicacion().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODAPLICACION = '" + param.getCodAplicacion() + "' ";
		}
		
		// CODCONALMACEN
		if (param.getCodConAlmacen() != null && !param.getCodConAlmacen().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODCONALMACEN = '" + param.getCodConAlmacen() + "' ";
		}
		
		return where;
	}
	
	public static TraspasoAlmacenesBean consultar(Connection conn, ConfigEmpresaBean config, Long idTraspaso)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TraspasoAlmacenesBean traspaso = null;
		String sql = null;
		
		sql = "SELECT ID_TRASPASO, " +
					 "CODAPLICACION, " +
					 "CODALM_ORIGEN, " +
					 "DESALM_ORIGEN, " +
					 "CODSERIE, " +
					 "DESSERIE, " +
					 "NUMTRASPASO, " +
					 "CODCONALMACEN, " +
					 "DESCONALMACEN, " +
					 "FECHA, " +
					 "FECHA_SUMINISTRO, " +
					 "FECHA_SUMINISTRO_PREV, " +
					 "ESTADO, " +
					 "SUBESTADO, " +
					 "CODALM_DESTINO, " +
					 "DESALM_DESTINO, " +
					 "REFERENCIA, " +
					 "OBSERVACIONES " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) + 
		 	   "WHERE ID_TRASPASO = ? ";

		try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idTraspaso);
    		
        	log.debug("consultar() - " + pstmt);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
            	traspaso = new TraspasoAlmacenesBean();
            	traspaso.setIdTraspaso(rs.getLong("ID_TRASPASO"));
				traspaso.setCodAplicacion(rs.getString("CODAPLICACION"));
				traspaso.setCodAlmacenOrigen(rs.getString("CODALM_ORIGEN"));
				traspaso.setDesAlmacenOrigen(rs.getString("DESALM_ORIGEN"));
				traspaso.setCodSerie(rs.getString("CODSERIE"));
				traspaso.setDesSerie(rs.getString("DESSERIE"));
				traspaso.setNumTraspaso(rs.getLong("NUMTRASPASO"));
				traspaso.setCodConAlmacen(rs.getString("CODCONALMACEN"));
				traspaso.setDesConAlmacen(rs.getString("DESCONALMACEN"));
				traspaso.setFecha(rs.getDate("FECHA"));
				traspaso.setFechaSuministro(rs.getDate("FECHA_SUMINISTRO"));
				traspaso.setFechaSuministroPrev(rs.getDate("FECHA_SUMINISTRO_PREV"));
				traspaso.setEstado(rs.getInt("ESTADO"));
				traspaso.setSubEstado(rs.getInt("SUBESTADO"));
				traspaso.setCodAlmacenDestino(rs.getString("CODALM_DESTINO"));
				traspaso.setDesAlmacenDestino(rs.getString("DESALM_DESTINO"));
				traspaso.setReferencia(rs.getString("REFERENCIA"));
				traspaso.setObservaciones(rs.getString("OBSERVACIONES"));
            }
            
			return traspaso;
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
	
	public static void insert(Connection conn, ConfigEmpresaBean config, TraspasoAlmacenesBean traspaso) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
				"(" +
				 "ID_TRASPASO, " +
				 "CODAPLICACION, " +
				 "CODALM_ORIGEN, " +
				 "CODSERIE, " +
				 "NUMTRASPASO, " +
				 "CODCONALMACEN, " +
				 "FECHA, " +
				 "FECHA_SUMINISTRO, " +
				 "FECHA_SUMINISTRO_PREV, " +
				 "ESTADO, " +
				 "SUBESTADO, " +
				 "CODALM_DESTINO, " +
				 "REFERENCIA, " +
				 "OBSERVACIONES " +
				") " +
			  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, traspaso.getIdTraspaso());
			pstmt.setString(2, traspaso.getCodAplicacion());
			pstmt.setString(3, traspaso.getCodAlmacenOrigen());
			pstmt.setString(4, traspaso.getCodSerie());
			pstmt.setLong(5, traspaso.getNumTraspaso());
			pstmt.setString(6, traspaso.getCodConAlmacen());
			pstmt.setDate(7, Fechas.toSqlDate(traspaso.getFecha()));
			pstmt.setDate(8, Fechas.toSqlDate(traspaso.getFechaSuministro()));
			pstmt.setDate(9, Fechas.toSqlDate(traspaso.getFechaSuministroPrev()));
			pstmt.setInt(10, traspaso.getEstado());
			pstmt.setInt(11, traspaso.getSubEstado());
			pstmt.setString(12, traspaso.getCodAlmacenDestino());
			pstmt.setString(13, traspaso.getReferencia());
			pstmt.setString(14, traspaso.getObservaciones());
			
			
			
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
	
	public static void update(Connection conn, ConfigEmpresaBean config, TraspasoAlmacenesBean traspaso) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
				 "SET CODAPLICACION = ?, " +
				 "CODALM_ORIGEN = ?, " +
				 "CODSERIE = ?, " +
				 "NUMTRASPASO = ?, " +
				 "CODCONALMACEN = ?, " +
				 "FECHA = ?, " +
				 "FECHA_SUMINISTRO = ?, " +
				 "FECHA_SUMINISTRO_PREV = ?, " +
				 "ESTADO = ?, " +
				 "SUBESTADO = ?, " +
				 "CODALM_DESTINO = ?, " +
				 "REFERENCIA = ?, " +
				 "OBSERVACIONES = ?, " +
			   "WHERE ID_TRASPASO = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, traspaso.getCodAplicacion());
			pstmt.setString(2, traspaso.getCodAlmacenOrigen());
			pstmt.setString(3, traspaso.getCodSerie());
			pstmt.setLong(4, traspaso.getNumTraspaso());
			pstmt.setString(5, traspaso.getCodConAlmacen());
			pstmt.setDate(6, Fechas.toSqlDate(traspaso.getFecha()));
			pstmt.setDate(7, Fechas.toSqlDate(traspaso.getFechaSuministro()));
			pstmt.setDate(8, Fechas.toSqlDate(traspaso.getFechaSuministroPrev()));
			pstmt.setInt(9, traspaso.getEstado());
			pstmt.setInt(10, traspaso.getSubEstado());
			pstmt.setString(11, traspaso.getCodAlmacenDestino());
			pstmt.setString(12, traspaso.getReferencia());
			pstmt.setString(13, traspaso.getObservaciones());
			pstmt.setLong(14, traspaso.getIdTraspaso());
			
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
	
	public static void delete(Connection conn, ConfigEmpresaBean config, TraspasoAlmacenesBean traspaso) throws SQLException {
		delete(conn, config, traspaso.getIdTraspaso());
	}
	
	public static void delete(Connection conn, ConfigEmpresaBean config, Long idTraspaso) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
			   "WHERE ID_TRASPASO = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idTraspaso);
        	
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
