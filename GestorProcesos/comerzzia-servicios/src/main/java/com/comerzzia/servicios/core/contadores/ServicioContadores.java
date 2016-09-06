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

package com.comerzzia.servicios.core.contadores;

import java.sql.SQLException;

import com.comerzzia.persistencia.core.contadores.ContadorBean;
import com.comerzzia.persistencia.core.contadores.ContadoresDao;
import com.comerzzia.persistencia.core.contadores.DefinicionContadorBean;
import com.comerzzia.persistencia.core.contadores.DefinicionesContadoresDao;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioContadores {
	
	protected static Logger log = Logger.getMLogger(ServicioContadores.class);

	
	public static Long obtenerContadorDefinitivo(String idContador) 
			throws ContadorException, ContadorNotFoundException {
		log.debug("obtenerContadorDefinitivo() - Obteniendo contador definitivo " + idContador);
		return actualizarContadorDefinitivo(idContador, null, null, null);
	}
	
	
	public static Long obtenerContadorDefinitivo(String idContador, String codEmpresa) 
			throws ContadorException, ContadorNotFoundException {
		log.debug("obtenerContadorDefinitivo() - Obteniendo contador definitivo " + idContador + " - " +
				  "[CODEMP=" + codEmpresa + "]");
		return actualizarContadorDefinitivo(idContador, codEmpresa, null, null);
	}
	
	
	public static Long obtenerContadorDefinitivo(String idContador, String codEmpresa, Short periodo) 
			throws ContadorException, ContadorNotFoundException {
		log.debug("obtenerContadorDefinitivo() - Obteniendo contador definitivo " + idContador + " - " +
				  "[CODEMP=" + codEmpresa + "] " +
				  "[PERIODO=" + periodo + "]");
		return actualizarContadorDefinitivo(idContador, codEmpresa, null, periodo);
	}
	
	
	public static Long obtenerContadorDefinitivo(String idContador, String codEmpresa, String codSerie, 
			Short periodo) throws ContadorException, ContadorNotFoundException {
		log.debug("obtenerContadorDefinitivo() - Obteniendo contador definitivo " + idContador + " - " +
				  "[CODEMP=" + codEmpresa + "] " +
				  "[CODSERIE=" + codSerie + "] " +
				  "[PERIODO=" + periodo + "]");
		return actualizarContadorDefinitivo(idContador, codEmpresa, codSerie, periodo);
	}
	
	
	public static Long obtenerContador(String idContador, Connection conn) 
			throws ContadorException, ContadorNotFoundException {
		log.debug("obtenerContador() - Obteniendo contador " + idContador);
		return actualizarContador(idContador, null, null, null, conn);
	}
	
	
	public static Long obtenerContador(String idContador, String codEmpresa, 
			Connection conn) throws ContadorException, ContadorNotFoundException {
		log.debug("obtenerContador() - Obteniendo contador " + idContador + " - " +
				  "[CODEMP=" + codEmpresa + "]");
		return actualizarContador(idContador, codEmpresa, null, null, conn);
	}
	
	
	public static Long obtenerContador(String idContador, String codEmpresa, Short periodo,
			Connection conn) throws ContadorException, ContadorNotFoundException {
		log.debug("obtenerContador() - Obteniendo contador " + idContador + " - " +
				  "[CODEMP=" + codEmpresa + "] " +
				  "[PERIODO=" + periodo + "]");
		return actualizarContador(idContador, codEmpresa, null, periodo, conn);
	}
	
	
	public static Long obtenerContador(String idContador, String codEmpresa, String codSerie, Short periodo, 
			Connection conn) throws ContadorException, ContadorNotFoundException {
		log.debug("obtenerContador() - Obteniendo contador " + idContador + " - " +
				  "[CODEMP=" + codEmpresa + "] " +
				  "[CODSERIE=" + codSerie + "] " +
				  "[PERIODO=" + periodo + "]");
		return actualizarContador(idContador, codEmpresa, codSerie, periodo, conn);
	}
	
	
	private static Long actualizarContadorDefinitivo(String idContador, String codEmpresa, String codSerie, 
			Short periodo) throws ContadorException, ContadorNotFoundException {
		Connection conn = new Connection();
		
		try {
			conn.abrirConexion(Database.getConnection());
			conn.iniciaTransaccion();
			
			Long valor = actualizarContador(idContador, codEmpresa, codSerie, periodo, conn);
			
			conn.commit();
			conn.finalizaTransaccion();
			
			return valor;
		}
		catch (SQLException e) {
			log.error("actualizarContadorDefinitivo() - " + e.getMessage());
			String mensaje = "Error al actualizar contador definitivo : " +  e.getMessage();
			
            throw new ContadorException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	private static synchronized Long actualizarContador(String idContador, String codEmpresa, String codSerie, Short periodo, 
			Connection conn) throws ContadorException, ContadorNotFoundException {

		// Obtenemos los datos del contador
		ContadorBean contador = obtenerDatosContador(idContador, codEmpresa, codSerie, periodo, conn);
		
		// Incrementamos el contador
		int rowcount1 = ServicioContadores.incrementarContador(contador, conn);
		
		// Si no ha habido actualización
		if (rowcount1 == 0) {
			// Creamos el contador
			ServicioContadores.crearContador(contador, conn);
			
			// Y volvemos a incrementarlo
			int rowcount2 = ServicioContadores.incrementarContador(contador, conn);
			if (rowcount2 == 0) {
				String mensaje = "No se ha podido obtener el siguiente valor del contador " + idContador;
				log.error(mensaje);
				throw new ContadorException(mensaje);
			}
		}
		
		// Obtenemos el nuevo valor del contador
		Long valor = ServicioContadores.obtenerValorContador(contador, conn);
		
		if (valor == null) {
			String mensaje = "No se ha obtenido ningún valor para el contador " + idContador;
			log.error(mensaje);
			throw new ContadorException(mensaje);
		}
		
		return valor;
	}
	
	
	private static ContadorBean obtenerDatosContador(String idContador, String codEmpresa, String codSerie, 
			Short periodo, Connection conn) throws ContadorException, ContadorNotFoundException {
		
		// Obtenemos la definición del contador
		DefinicionContadorBean definicionContador = obtenerDefinicionContador(idContador, conn);
		
		// Creamos el contador y comprobamos que tenemos todos los parámetros según la definición del mismo
		ContadorBean contador = new ContadorBean(idContador);
		
		if (definicionContador.isUsaEmpresa()) {
			if (codEmpresa == null || codEmpresa.length() == 0) {
				String mensaje = "La definición del contador " + idContador + " requiere el código de empresa";
				log.error(mensaje);
				throw new ContadorException(mensaje);
			}
			
			contador.setCodEmpresa(codEmpresa);
		}
		
		if (definicionContador.isUsaSerie()) {
			if (codSerie == null || codSerie.length() == 0) {
				String mensaje = "La definición del contador " + idContador + " requiere el código de serie";
				log.error(mensaje);
				throw new ContadorException(mensaje);
			}
			
			contador.setCodSerie(codSerie);
		}
		
		if (definicionContador.isUsaPeriodo()) {
			if (periodo == null || periodo == 0) {
				String mensaje = "La definición del contador " + idContador + " requiere el periodo";
				log.error(mensaje);
				throw new ContadorException(mensaje);
			}
			
			contador.setPeriodo(periodo);
		}
		
		return contador;
	}
	
	
	private static DefinicionContadorBean obtenerDefinicionContador(String idContador, Connection conn) 
			throws ContadorException, ContadorNotFoundException {
		try {
			DefinicionContadorBean definicionContador = 
				DefinicionesContadoresDao.consultar(conn, idContador);
			
			if (definicionContador == null) {
				String mensaje = "No se ha encontado la definición del contador " + idContador;
				log.error(mensaje);
				throw new ContadorNotFoundException(mensaje);
			}
			
			return definicionContador;
		} 
		catch (SQLException e) {
			log.error("obtenerDefinicionContador() - " + e.getMessage());
			String mensaje = "Error al obtener la definición del contador " + idContador + ": " +  e.getMessage();
			
            throw new ContadorException(mensaje, e);
		}
	}
			
	
	private static void crearContador(ContadorBean contador, Connection conn) 
			throws ContadorException {
		try {
			log.debug("crearContador() - Creando contador " + contador.getIdContador() + " - " +
					  "[CODEMP=" + contador.getCodEmpresa() + "] " + 
					  "[CODSERIE=" + contador.getCodSerie() + "] " +
					  "[PERIODO=" + contador.getPeriodo() + "]");
			
			ContadoresDao.insert(conn, contador);
		} 
		catch (SQLException e) {
			log.error("crearContador() - " + e.getMessage());
			String mensaje = "Error al crear el contador " + contador.getIdContador() + ": " +  e.getMessage();
			
            throw new ContadorException(mensaje, e);
		}
	}
	
	
	private static int incrementarContador(ContadorBean contador, Connection conn) 
			throws ContadorException {
		try {
			int rowcount = ContadoresDao.nextValue(conn, contador);
			
			// Nos aseguramos de que solo se haya actualizado el contador solicitado
			if (rowcount > 1) {
				String mensaje = "La obtención del siguiente valor del contador " + contador.getIdContador() + 
			                     " a provocado la actualización de más de una fila";
				log.error(mensaje);
				throw new ContadorException(mensaje);
			}
			
			return rowcount;
		} 
		catch (SQLException e) {
			log.error("incrementarContador() - " + e.getMessage());
			String mensaje = "Error al incrementar el valor del contador " + contador.getIdContador() + ": " +  e.getMessage();
			
            throw new ContadorException(mensaje, e);
		}
	}
	
	
	private static Long obtenerValorContador(ContadorBean contador, Connection conn) 
			throws ContadorException {
		try {
			return ContadoresDao.consultarValor(conn, contador);
		} 
		catch (SQLException e) {
			log.error("obtenerValorContador() - " + e.getMessage());
			String mensaje = "Error al obtener el valor del contador " + contador.getIdContador() + ": " +  e.getMessage();
			
            throw new ContadorException(mensaje, e);
		}
	}
}
