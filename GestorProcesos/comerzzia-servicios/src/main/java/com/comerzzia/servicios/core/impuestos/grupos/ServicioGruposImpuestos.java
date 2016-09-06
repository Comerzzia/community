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

package com.comerzzia.servicios.core.impuestos.grupos;

import java.sql.SQLException;
import java.util.Date;

import com.comerzzia.persistencia.core.impuestos.grupos.GrupoImpuestosBean;
import com.comerzzia.persistencia.core.impuestos.grupos.GruposImpuestosDao;
import com.comerzzia.persistencia.core.impuestos.porcentajes.PorcentajesImpuestosDao;
import com.comerzzia.servicios.core.contadores.ContadorException;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioGruposImpuestos {
	
	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioGruposImpuestos.class);
	
	
	/**
	 * @param idGrupoImpuestos
	 * @return
	 * @throws GrupoImpuestosException
	 * @throws GrupoImpuestosNotFoundException
	 */
	public static GrupoImpuestosBean consultar(Long idGrupoImpuestos) 
			throws GrupoImpuestosException, GrupoImpuestosNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando datos del grupo de impuestos con identificador: " + idGrupoImpuestos);
			conn.abrirConexion(Database.getConnection());
			GrupoImpuestosBean grupoImpuestos = GruposImpuestosDao.consultar(conn, idGrupoImpuestos);
			
			if (grupoImpuestos == null) {
				String msg = "No se ha encontrado el grupo de impuesto con identificador: " + idGrupoImpuestos;
				log.info("consultar() - " + msg);
				
				throw new GrupoImpuestosNotFoundException(msg);
			}
			
			return grupoImpuestos;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando datos de un grupo de impuestos: " + e.getMessage();
			
			throw new GrupoImpuestosException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	/**
	 * @param fecha
	 * @return
	 * @throws GrupoImpuestosException
	 * @throws GrupoImpuestosNotFoundException
	 */
	public static GrupoImpuestosBean consultar(Date fecha) 
			throws GrupoImpuestosException, GrupoImpuestosNotFoundException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			GrupoImpuestosBean grupoImpuestos = consultar(conn, fecha);
			
			return grupoImpuestos;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando datos de un grupo de impuestos: " + e.getMessage();
			
			throw new GrupoImpuestosException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	/**
	 * @param conn
	 * @param fecha
	 * @return
	 * @throws GrupoImpuestosException
	 * @throws GrupoImpuestosNotFoundException
	 */
	public static GrupoImpuestosBean consultar(Connection conn, Date fecha) 
			throws GrupoImpuestosException, GrupoImpuestosNotFoundException {
		try {
			log.debug("consultar() - Consultando datos del grupo de impuestos con fecha de vigencia: " + fecha);
			GrupoImpuestosBean grupoImpuesto = GruposImpuestosDao.consultar(conn, fecha);
			
			if (grupoImpuesto == null) {
				String msg = "No se ha encontrado el grupo de impuesto con fechade vigencia: " + fecha;
				log.info("consultar() - " + msg);

				throw new GrupoImpuestosNotFoundException(msg);
			}
			
			return grupoImpuesto;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error consultando datos de un grupo de impuestos: " + e.getMessage();
			
			throw new GrupoImpuestosException(mensaje, e);
		}
	}
	
	public static void salvar(GrupoImpuestosBean grupo) 
	throws GrupoImpuestosException {

		switch (grupo.getEstadoBean()) {
			case Estado.NUEVO:
				crear(grupo);
				break;
		  
		}
	}
	
	public static Long crear(GrupoImpuestosBean grupo) 
	throws GrupoImpuestosException {
	Connection conn = new Connection();
	Long id = null;
	
		try {
			log.debug("crear() - Creando nuevo grupo de impuesto");			
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			grupo.setIdGrupoImpuestos(ContadorGrupoImpuestos.obtenerContador(conn));
			GruposImpuestosDao.insert(conn, grupo);
			PorcentajesImpuestosDao.inicializarPorcentajesImpuestosParaGrupo(conn, grupo.getIdGrupoImpuestos());
			id = grupo.getIdGrupoImpuestos();
			
			conn.commit();
			conn.finalizaTransaccion();
		}
		catch (ContadorException e) {
			conn.deshacerTransaccion();
			
			String msg = "Error creando grupo de impuesto: " + e.getMessage();
    		log.error("crear() - " + msg);
    		
			throw new GrupoImpuestosException(msg, e);	
		} 
		catch (SQLException e) {
			String msg = "Error creando nuevo grupo impuesto: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new GrupoImpuestosException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
		return id;
	}
}
