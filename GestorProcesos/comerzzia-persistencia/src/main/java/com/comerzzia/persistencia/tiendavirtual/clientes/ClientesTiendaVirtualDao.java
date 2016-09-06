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

package com.comerzzia.persistencia.tiendavirtual.clientes;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.tiendavirtual.config.ConfigTiendaVirtualBean;
import com.comerzzia.util.base.MantenimientoDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.PreparedStatement;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;

public class ClientesTiendaVirtualDao extends MantenimientoDao {

	private static String TABLA_TV = "TV_CLIENTES_TBL";
	private static String TABLA = "T_CLIENTES_TBL";
	private static String VISTA = "T_CLIENTES";

	private static Logger log = Logger.getMLogger(ClientesTiendaVirtualDao.class);

	public static ClienteBean consultarParaLogin(Connection conn, ConfigTiendaVirtualBean config, UsuarioClienteTiendaVirtualBean usuarioCliente)
			throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ClienteBean cliente = null;
		String sql = null;

		sql = "SELECT CODALM, CIF, DESCLI, NOMBRE_COMERCIAL, DOMICILIO, "
				+ "POBLACION, PROVINCIA, CP, TELEFONO1, TELEFONO2, FAX, "
				+ "PERSONA_CONTACTO, EMAIL, ID_TRAT_IMPUESTOS, CODMEDPAG, "
				+ "CODTAR, OBSERVACIONES, ACTIVO, FECHA_ALTA, FECHA_BAJA, "
				+ "VENTA_A_CREDITO, USUARIO, CLAVE " + "FROM "
				+ getNombreElemento(config.getEsquemaTiendaVirtual(), VISTA)
				+ "WHERE CODALM = ? AND USUARIO = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, config.getCodAlmacen());
			pstmt.setString(2, usuarioCliente.getUsuario());
			log.debug("consultar() - " + pstmt);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				usuarioCliente.setCif(rs.getString("CIF"));
				usuarioCliente.setUsuario(rs.getString("USUARIO"));
				usuarioCliente.setClave(rs.getString("CLAVE"));

				cliente = new ClienteBean();
				cliente.setCif(rs.getString("CIF"));
				cliente.setCodCli(rs.getString("CIF"));
				cliente.setDesCli(rs.getString("DESCLI"));
				cliente.setNombreComercial(rs.getString("NOMBRE_COMERCIAL"));
				cliente.setDomicilio(rs.getString("DOMICILIO"));
				cliente.setPoblacion(rs.getString("POBLACION"));
				cliente.setProvincia(rs.getString("PROVINCIA"));
				cliente.setCp(rs.getString("CP"));
				cliente.setTelefono1(rs.getString("TELEFONO1"));
				cliente.setTelefono2(rs.getString("TELEFONO2"));
				cliente.setFax(rs.getString("FAX"));
				cliente.setPersonaContacto(rs.getString("PERSONA_CONTACTO"));
				cliente.setEmail(rs.getString("EMAIL"));
				cliente.setIdTratImp(rs.getLong("ID_TRAT_IMPUESTOS"));
				cliente.setCodMedioPago(rs.getString("CODMEDPAG"));
				cliente.setCodTar(rs.getString("CODTAR"));
				cliente.setObservaciones(rs.getString("OBSERVACIONES"));
				cliente.setActivo(rs.getString("ACTIVO"));
				cliente.setFechaAlta(Fechas.toSqlDate(rs.getDate("FECHA_ALTA")));
				cliente.setFechaBaja(Fechas.toSqlDate(rs.getDate("FECHA_BAJA")));

			}
			return cliente;
		} 
		finally {
			try {
				rs.close();
			} 
			catch (Exception ignore) {}
			try {
				pstmt.close();
			} 
			catch (Exception ignore) {}
		}
	}

	public static ClienteBean consultar(Connection conn, ConfigTiendaVirtualBean config, String cif)
			throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ClienteBean cliente = null;

		sql = "SELECT CODALM, CIF, DESCLI, NOMBRE_COMERCIAL, DOMICILIO, "
				+ "POBLACION, PROVINCIA, CP, TELEFONO1, TELEFONO2, FAX, "
				+ "PERSONA_CONTACTO, EMAIL, ID_TRAT_IMPUESTOS, CODMEDPAG, "
				+ "CODTAR, OBSERVACIONES, ACTIVO, FECHA_ALTA, FECHA_BAJA, VENTA_A_CREDITO "
				+ "FROM "
				+ getNombreElemento(config.getEsquemaTiendaVirtual(), TABLA)
				+ "WHERE CIF = ? AND CODALM = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, cif);
			pstmt.setString(2, config.getCodAlmacen());
			log.debug("consultar() - " + pstmt);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				cliente = new ClienteBean();
				cliente.setCif(rs.getString("CIF"));
				cliente.setDesCli(rs.getString("DESCLI"));
				cliente.setNombreComercial(rs.getString("NOMBRE_COMERCIAL"));
				cliente.setDomicilio(rs.getString("DOMICILIO"));
				cliente.setPoblacion(rs.getString("POBLACION"));
				cliente.setProvincia(rs.getString("PROVINCIA"));
				cliente.setCp(rs.getString("CP"));
				cliente.setTelefono1(rs.getString("TELEFONO1"));
				cliente.setTelefono2(rs.getString("TELEFONO2"));
				cliente.setFax(rs.getString("FAX"));
				cliente.setPersonaContacto(rs.getString("PERSONA_CONTACTO"));
				cliente.setEmail(rs.getString("EMAIL"));
				cliente.setIdTratImp(rs.getLong("ID_TRAT_IMPUESTOS"));
				cliente.setCodMedioPago(rs.getString("CODMEDPAG"));
				cliente.setCodTar(rs.getString("CODTAR"));
				cliente.setObservaciones(rs.getString("OBSERVACIONES"));
				cliente.setActivo(rs.getString("ACTIVO"));
				cliente.setFechaAlta(Fechas.toSqlDate(rs.getDate("FECHA_ALTA")));
				cliente.setFechaBaja(Fechas.toSqlDate(rs.getDate("FECHA_BAJA")));
			}
			return cliente;
		} 
		finally {
			try {
				rs.close();
			} 
			catch (Exception ignore) {}
			try {
				pstmt.close();
			} 
			catch (Exception ignore) {}
		}
	}

	public static UsuarioClienteTiendaVirtualBean consultarUsuarioCliente(Connection conn, ConfigTiendaVirtualBean config, String usuario)
			throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		UsuarioClienteTiendaVirtualBean usuarioCliente = null;
		
		sql = "SELECT CODALM, CIF, USUARIO, CLAVE "
				+ "FROM "
				+ getNombreElemento(config.getEsquemaTiendaVirtual(), TABLA_TV)
				+ "WHERE USUARIO = ? AND CODALM = ?";
		
		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, usuario);
			pstmt.setString(2, config.getCodAlmacen());
			log.debug("consultarUsuarioCliente() - " + pstmt);
		
			rs = pstmt.executeQuery();
		
			if (rs.next()) {
				usuarioCliente = new UsuarioClienteTiendaVirtualBean();
				usuarioCliente.setCif(rs.getString("CIF"));
				usuarioCliente.setClave(rs.getString("CLAVE"));
				usuarioCliente.setUsuario(rs.getString("USUARIO"));
			}
			return usuarioCliente;
		} 
		finally {
			try {
				rs.close();
			} 
			catch (Exception ignore) {}
			try {
				pstmt.close();
			} 
			catch (Exception ignore) {}
		}
	}

	
	public static void insertarUsuarioCliente(Connection conn, ConfigTiendaVirtualBean config, UsuarioClienteTiendaVirtualBean usuarioCliente)
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO "
				+ getNombreElemento(config.getEsquemaTiendaVirtual(), TABLA_TV)
				+ "(CODALM, CIF, USUARIO, CLAVE) " + "VALUES (?, ?, ?, ?)";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, config.getCodAlmacen());
			pstmt.setString(2, usuarioCliente.getCif());
			pstmt.setString(3, usuarioCliente.getUsuario());
			pstmt.setString(4, usuarioCliente.getClave());

			log.debug("insertarUsuarioCliente() - " + pstmt);

			pstmt.execute();
		} 
		catch (SQLException e) {
			throw getDaoException(e);
		} 
		finally {
			try {
				pstmt.close();
			} 
			catch (Exception ignore) {}
		}
	}

	public static void insertarClienteTienda(Connection conn, ConfigTiendaVirtualBean config, ClienteBean cliente) 
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "INSERT INTO "
				+ getNombreElemento(config.getEsquemaTiendaVirtual(), TABLA)
				+ "(CODALM, CIF, DESCLI, DOMICILIO, POBLACION, PROVINCIA, CP, TELEFONO1, TELEFONO2, EMAIL, ID_TRAT_IMPUESTOS, CODMEDPAG, CODTAR, OBSERVACIONES, ACTIVO, FECHA_ALTA, VENTA_A_CREDITO) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, config.getCodAlmacen());
			pstmt.setString(2, cliente.getCif());
			pstmt.setString(3, cliente.getDesCli());
			pstmt.setString(4, cliente.getDomicilio());
			pstmt.setString(5, cliente.getPoblacion());
			pstmt.setString(6, cliente.getProvincia());
			pstmt.setString(7, cliente.getCp());
			pstmt.setString(8, cliente.getTelefono1());
			pstmt.setString(9, cliente.getTelefono2());
			pstmt.setString(10, cliente.getEmail());
			pstmt.setLong(11, cliente.getIdTratImp());
			pstmt.setString(12, cliente.getCodMedioPago());
			pstmt.setString(13, cliente.getCodTar());
			pstmt.setString(14, cliente.getObservaciones());
			pstmt.setString(15, cliente.getActivo());
			pstmt.setDate(16, Fechas.toSqlDate(cliente.getFechaAlta()));
			pstmt.setString(17, "N");
			log.debug("insertarClienteTienda() - " + pstmt);
			pstmt.execute();
		} 
		catch (SQLException e) {
			throw getDaoException(e);
		} 
		finally {
			try {
				pstmt.close();
			} 
			catch (Exception ignore) {}
		}
	}

	public static void actualizarUsuarioCliente(Connection conn, ConfigTiendaVirtualBean config, UsuarioClienteTiendaVirtualBean clienteTV)
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "UPDATE " + getNombreElemento(config.getEsquemaTiendaVirtual(), TABLA_TV)
				+ "SET CLAVE = ? " + "WHERE CIF = ? AND CODALM = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, clienteTV.getClave());
			pstmt.setString(2, clienteTV.getCif());
			pstmt.setString(3, config.getCodAlmacen());
			log.debug("actualizarUsuarioCliente() - " + pstmt);
			pstmt.execute();
		} 
		catch (SQLException e) {
			throw getDaoException(e);
		} 
		finally {
			try {
				pstmt.close();
			} 
			catch (Exception ignore) {}
		}
	}

	public static void actualizarClienteTienda(Connection conn, ConfigTiendaVirtualBean config, ClienteBean clienteTienda) 
			throws SQLException {
		PreparedStatement pstmt = null;
		String sql = null;

		sql = "UPDATE "
				+ getNombreElemento(config.getEsquemaTiendaVirtual(), TABLA) 
				+ "SET DESCLI = ?, DOMICILIO = ?, CP = ?, POBLACION = ?, PROVINCIA = ?, TELEFONO1 = ?, TELEFONO2 = ?, EMAIL = ?, OBSERVACIONES = ? "
				+ "WHERE CIF = ? AND CODALM = ?";

		try {
			pstmt = new PreparedStatement(conn, sql);
			pstmt.setString(1, clienteTienda.getDesCli());
			pstmt.setString(2, clienteTienda.getDomicilio());
			pstmt.setString(3, clienteTienda.getCp());
			pstmt.setString(4, clienteTienda.getPoblacion());
			pstmt.setString(5, clienteTienda.getProvincia());
			pstmt.setString(6, clienteTienda.getTelefono1());
			pstmt.setString(7, clienteTienda.getTelefono2());
			pstmt.setString(8, clienteTienda.getEmail());
			pstmt.setString(9, clienteTienda.getObservaciones());
			pstmt.setString(10, clienteTienda.getCif());
			pstmt.setString(11, config.getCodAlmacen());

			log.debug("actualizarClienteTienda() - " + pstmt);

			pstmt.execute();
		} 
		catch (SQLException e) {
			throw getDaoException(e);
		} 
		finally {
			try {
				pstmt.close();
			} 
			catch (Exception ignore) {}
		}
	}
}
