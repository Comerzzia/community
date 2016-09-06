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

package com.comerzzia.persistencia.compras.pedidos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.config.ConfigEmpresaBean;
import com.comerzzia.persistencia.core.estados.EstadoBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class PedidosComprasDao extends MantenimientoDao {
	
	private static String TABLA = "D_PROV_PEDIDOS_CAB_TBL";
	private static String VISTA = "D_PROV_PEDIDOS_CAB";
	
	private static Logger log = Logger.getMLogger(PedidosComprasDao.class);
	
	public static PaginaResultados consultar(Connection conn, ConfigEmpresaBean config, ParametrosBuscarPedidosComprasBean param)throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// Inicializamos la página de resultados
		List<PedidoCompraBean> resultados = new ArrayList<PedidoCompraBean>(param.getTamañoPagina());
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
						PedidoCompraBean pedido = new PedidoCompraBean();
						pedido.setIdPedido(rs.getLong("ID_PROV_PEDIDO"));
						pedido.setCodEmpresa(rs.getString("CODEMP"));
						pedido.setPeriodo(rs.getShort("PERIODO"));
						pedido.setCodSerie(rs.getString("CODSERIE"));
						pedido.setNumPedido(rs.getLong("NUMPED"));
						pedido.setFecha(rs.getDate("FECHA"));
						pedido.setCodProveedor(rs.getString("CODPRO"));
						pedido.setDesProveedor(rs.getString("DESPRO"));
						pedido.setReferenciaProveedor(rs.getString("REFERENCIA_PROVEEDOR"));
						pedido.setCodConceptoAlmacen(rs.getString("CODCONALM"));
						pedido.setDesConceptoAlmacen(rs.getString("DESCONALM"));
						pedido.setCodAlmacen(rs.getString("CODALM"));
						pedido.setDesAlmacen(rs.getString("DESALM"));
						pedido.setEstado((rs.getString("ESTADO") != null) ? rs.getInt("ESTADO") : null);
						pedido.setSubEstado((rs.getString("SUBESTADO") != null) ? rs.getInt("SUBESTADO") : null);
						pedido.setDesEstado(rs.getString("DESESTADO"));
						pedido.setTotal(rs.getDouble("TOTAL"));
						
						resultados.add(pedido);
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
			ParametrosBuscarPedidosComprasBean param) {
		String sql = null;

		sql = "SELECT ID_PROV_PEDIDO, " +
					 "CODEMP, " +
					 "PERIODO, " +
					 "CODSERIE, " +
					 "NUMPED, " +
					 "FECHA, " +
					 "CODPRO, " +
					 "DESPRO, " +
					 "REFERENCIA_PROVEEDOR, " +
					 "CODCONALM, " +
					 "DESCONALM, " +
					 "CODALM, " +
					 "DESALM, " +
					 "ESTADO, " +
					 "SUBESTADO, " +
					 "DESESTADO, " +
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
				orden += ", PERIODO DESC, CODSERIE, NUMPED DESC";
			
			else if (orden.equals("PERIODO") | orden.equals("PERIODO DESC"))
				orden += ", CODSERIE, NUMPED DESC";
			
			else if (orden.equals("CODSERIE") | orden.equals("CODSERIE DESC"))
				orden = "PERIODO DESC, " + orden + ", NUMPED DESC";
			
			else if (orden.equals("NUMPED") | orden.equals("NUMPED DESC"))
				orden = "PERIODO DESC, CODSERIE, " + orden;
			
			sql += "ORDER BY " + orden;
		}

		return sql;
	}

	public static String obtenerConsultaCount(ConfigEmpresaBean config,
			ParametrosBuscarPedidosComprasBean param) {
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

	private static String getClausulaWhere(ParametrosBuscarPedidosComprasBean param) {
		String where = "";

		// PERIODO
		if (param.getPeriodo() != null && param.getPeriodo() > 0) {
			where = "PERIODO = " + param.getPeriodo() + " ";
		}

		// CODSERIE
		if (param.getCodSerie() != null && !param.getCodSerie().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODSERIE LIKE '" + param.getCodSerie() + "%' ";
		}
		
		// NUMPED
		if (param.getNumPedido() != null && param.getNumPedido() > 0) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "NUMPED = " + param.getNumPedido() + " ";
		}
		
		// CODALM
		if (param.getCodAlmacen() != null && !param.getCodAlmacen().isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += "CODALM = '" + param.getCodAlmacen() + "' ";
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
		
		// ESTADO // TODO: se podría mejorar la forma de obtener la consulta
		String condicion = "";
		String condicionGeneral = "";
		for(int i = 0; i < param.getEstados().getListaEstados().size(); i++) {
            EstadoBean estado = param.getEstados().getListaEstados().get(i);
            if(estado.isChecked()) {
            	condicion = "ESTADO = '" + estado.getEstado() + "' ";
	            condicionGeneral += "(" + condicion + ") OR ";
            }
		}
		if(!condicionGeneral.isEmpty()) {
			if (!where.isEmpty()) {
				where += "AND ";
			}
			where += " (" + condicionGeneral.substring(0,condicionGeneral.length()-3) + ") ";
		}
		
		return where;
	}

	private static void insertarParametros(PreparedStatement pstmt, ParametrosBuscarPedidosComprasBean param) throws SQLException {
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

	public static PedidoCompraBean consultar(Connection conn, ConfigEmpresaBean config, Long idPedido)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PedidoCompraBean pedido = null;
		String sql = null;
		
		sql = "SELECT ID_PROV_PEDIDO, " +
		 			 "CODEMP, " +
		 			 "PERIODO, " +
		 			 "CODSERIE, " +
		 			 "DESSERIE, " +
		 			 "NUMPED, " +
		 			 "FECHA, " +
		 			 "FECHA_SUMINISTRO_PREV, " +
		 			 "CODALM, " +
		 			 "DESALM, " +
		 			 "CODCAJA, " +
					 "UID_DIARIO_CAJA, " +
					 "CODAPLICACION, " +
					 "CODCONALM, " +
					 "DESCONALM, " +
		 			 "CODPRO, " +
		 			 "DESPRO, " +
		 			 "PERSONA_CONTACTO, " +
		 			 "REFERENCIA_PROVEEDOR, " +
		 			 "ID_GRUPO_IMPUESTOS, " +
		 			 "ID_TRAT_IMPUESTOS, " +
		 			 "DESTRATIMP, " +
		 			 "BASE, " +
		 			 "IMPUESTOS, " +
		 			 "TOTAL, " +
		 			 "OBSERVACIONES," +
		 			 "ID_USUARIO, " +
		 			 "ESTADO, " +
		 			 "SUBESTADO, " +
		 			 "DESESTADO " +
		 		"FROM " + getNombreElemento(config.getEsquemaEmpresa(), VISTA) +
		 	   "WHERE ID_PROV_PEDIDO = ? ";

		try {
    		pstmt = new PreparedStatement(conn, sql);
    		pstmt.setLong(1, idPedido);
    		
        	log.debug("consultar() - " + pstmt);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
            	pedido = new PedidoCompraBean();
				pedido.setIdPedido(rs.getLong("ID_PROV_PEDIDO"));
				pedido.setCodEmpresa(rs.getString("CODEMP"));
				pedido.setPeriodo(rs.getShort("PERIODO"));
				pedido.setCodSerie(rs.getString("CODSERIE"));
				pedido.setDesSerie(rs.getString("DESSERIE"));
				pedido.setNumPedido(rs.getLong("NUMPED"));
				pedido.setFecha(rs.getDate("FECHA"));
				pedido.setFechaSuministroPrevista(rs.getDate("FECHA_SUMINISTRO_PREV"));
				pedido.setCodAlmacen(rs.getString("CODALM"));
				pedido.setDesAlmacen(rs.getString("DESALM"));
				pedido.setCodCaja(rs.getString("CODCAJA"));
				pedido.setUidDiarioCaja(rs.getString("UID_DIARIO_CAJA"));
				pedido.setCodAplicacion(rs.getString("CODAPLICACION"));
				pedido.setCodConceptoAlmacen(rs.getString("CODCONALM"));
				pedido.setDesConceptoAlmacen(rs.getString("DESCONALM"));
				pedido.setCodProveedor(rs.getString("CODPRO"));
				pedido.setDesProveedor(rs.getString("DESPRO"));
				pedido.setPersonaContacto(rs.getString("PERSONA_CONTACTO"));
				pedido.setReferenciaProveedor(rs.getString("REFERENCIA_PROVEEDOR"));
				pedido.setIdGrupoImpuestos(rs.getLong("ID_GRUPO_IMPUESTOS"));
				pedido.setIdTratamientoImpuestos(rs.getLong("ID_TRAT_IMPUESTOS"));
				pedido.setDesTratamientoImpuestos(rs.getString("DESTRATIMP"));
				pedido.setBase(rs.getDouble("BASE"));
				pedido.setImpuestos(rs.getDouble("IMPUESTOS"));
				pedido.setTotal(rs.getDouble("TOTAL"));
				pedido.setObservaciones(rs.getString("OBSERVACIONES"));
				pedido.setIdUsuario((rs.getString("ID_USUARIO") != null) ? rs.getLong("ID_USUARIO") : null);
				pedido.setEstado((rs.getString("ESTADO") != null) ? rs.getInt("ESTADO") : null);
				pedido.setSubEstado((rs.getString("SUBESTADO") != null) ? rs.getInt("SUBESTADO") : null);
				pedido.setDesEstado(rs.getString("DESESTADO"));
            }
            
			return pedido;
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
	
	public static void insert(Connection conn, ConfigEmpresaBean config, PedidoCompraBean pedido) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "INSERT INTO " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
				"(" +
				"ID_PROV_PEDIDO, " +
				"CODEMP, " +
				"PERIODO, " +
				"CODSERIE, " +
				"NUMPED, " +
				"FECHA, " +
				"FECHA_SUMINISTRO_PREV, " +
				"CODALM, " +
				"CODAPLICACION, " +
				"CODCONALM, " +
				"CODPRO, " +
				"PERSONA_CONTACTO, " +
				"REFERENCIA_PROVEEDOR, " +
				"ID_GRUPO_IMPUESTOS, " +
				"ID_TRAT_IMPUESTOS, " +
				"BASE, " +
				"IMPUESTOS, " +
				"TOTAL, " +
				"OBSERVACIONES, " +
				"ESTADO, " +
				"SUBESTADO" +
				") " +
			  "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setLong(1, pedido.getIdPedido());
			pstmt.setString(2, pedido.getCodEmpresa());
			pstmt.setShort(3, pedido.getPeriodo());
			pstmt.setString(4, pedido.getCodSerie());
			pstmt.setLong(5, pedido.getNumPedido());
			pstmt.setDate(6, Fechas.toSqlDate(pedido.getFecha()));
			pstmt.setDate(7, Fechas.toSqlDate(pedido.getFechaSuministroPrevista()));
			pstmt.setString(8, pedido.getCodAlmacen());
			pstmt.setString(9, pedido.getCodAplicacion());
			pstmt.setString(10, pedido.getCodConceptoAlmacen());
			pstmt.setString(11, pedido.getCodProveedor());
			pstmt.setString(12, pedido.getPersonaContacto());
			pstmt.setString(13, pedido.getReferenciaProveedor());
			pstmt.setLong(14, pedido.getIdGrupoImpuestos());
			pstmt.setLong(15, pedido.getIdTratamientoImpuestos());
			pstmt.setDouble(16, pedido.getBase());
			pstmt.setDouble(17, pedido.getImpuestos());
			pstmt.setDouble(18, pedido.getTotal());
			pstmt.setString(19, pedido.getObservaciones());
			pstmt.setInt(20, pedido.getEstado());
			pstmt.setInt(21, pedido.getSubEstado());
			
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
	
	public static void update(Connection conn, ConfigEmpresaBean config, PedidoCompraBean pedido) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
				 "SET FECHA = ?, " +
				 	 "FECHA_SUMINISTRO_PREV = ?, " +
				 	 "CODALM = ?, " +
				 	 "CODAPLICACION = ?, " +
				 	 "CODCONALM = ?, " +
				 	 "CODPRO = ?, " +
				 	 "PERSONA_CONTACTO = ?, " +
				 	 "REFERENCIA_PROVEEDOR = ?, " +
				 	 "ID_GRUPO_IMPUESTOS = ?, " +
				 	 "ID_TRAT_IMPUESTOS = ?, " +
				 	 "BASE = ?, " +
				 	 "IMPUESTOS = ? , " +
				 	 "TOTAL = ?, " +
				 	 "OBSERVACIONES = ?, " +
				 	 "ESTADO = ?, " +
				 	 "SUBESTADO = ? " +
			   "WHERE ID_PROV_PEDIDO = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setDate(1, Fechas.toSqlDate(pedido.getFecha()));
			pstmt.setDate(2, Fechas.toSqlDate(pedido.getFechaSuministroPrevista()));
			pstmt.setString(3, pedido.getCodAlmacen());
			pstmt.setString(4, pedido.getCodAplicacion());
			pstmt.setString(5, pedido.getCodConceptoAlmacen());
			pstmt.setString(6, pedido.getCodProveedor());
			pstmt.setString(7, pedido.getPersonaContacto());
			pstmt.setString(8, pedido.getReferenciaProveedor());
			pstmt.setLong(9, pedido.getIdGrupoImpuestos());
			pstmt.setLong(10, pedido.getIdTratamientoImpuestos());
			pstmt.setDouble(11, pedido.getBase());
			pstmt.setDouble(12, pedido.getImpuestos());
			pstmt.setDouble(13, pedido.getTotal());
			pstmt.setString(14, pedido.getObservaciones());
			pstmt.setInt(15, pedido.getEstado());
			pstmt.setInt(16, pedido.getSubEstado());
			pstmt.setLong(17, pedido.getIdPedido());
			
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
	
	public static void delete(Connection conn, ConfigEmpresaBean config, PedidoCompraBean pedido) throws SQLException {
		delete(conn, config, pedido.getIdPedido());
	}
	
	public static void delete(Connection conn, ConfigEmpresaBean config, Long idPedido) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "DELETE " +
				"FROM " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) +
			   "WHERE ID_PROV_PEDIDO = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
        	pstmt.setLong(1, idPedido);
        	
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
	
	public static void cambiarEstado(Connection conn, ConfigEmpresaBean config, PedidoCompraBean pedido) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;
		
		sql = "UPDATE " + getNombreElemento(config.getEsquemaEmpresa(), TABLA) + 
				 "SET ESTADO = ?, " +
				 	 "SUBESTADO = ? " +
			   "WHERE ID_PROV_PEDIDO = ? ";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setInt(1, pedido.getEstado());
			pstmt.setInt(2, pedido.getSubEstado());
			pstmt.setLong(3, pedido.getIdPedido());
			
        	log.debug("cambiarEstado() - " + pstmt);
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
