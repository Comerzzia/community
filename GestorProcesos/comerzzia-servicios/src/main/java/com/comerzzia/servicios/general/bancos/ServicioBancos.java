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

package com.comerzzia.servicios.general.bancos;

import java.sql.SQLException;

import com.comerzzia.persistencia.general.bancos.BancoBean;
import com.comerzzia.persistencia.general.bancos.BancosDao;
import com.comerzzia.persistencia.general.bancos.ParametrosBuscarBancosBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;

public class ServicioBancos {
	
	protected static Logger log = Logger.getMLogger(ServicioBancos.class);
	
	public static PaginaResultados consultar(ParametrosBuscarBancosBean param, DatosSesionBean datosSesion) throws BancoException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando bancos");
			conn.abrirConexion(Database.getConnection());
			return BancosDao.consultar(conn, datosSesion.getConfigEmpresa(), param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar banco: " +  e.getMessage();
			
            throw new BancoException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	public static BancoBean consultar(String codBan, DatosSesionBean datosSesion) 
		throws BancoException, BancoNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos de un banco");
			conn.abrirConexion(Database.getConnection());
			BancoBean banco = BancosDao.consultar(conn, datosSesion.getConfigEmpresa(), codBan);

			if (banco == null) {
				String msg = "No se ha encontrado el banco con identificador: " + codBan;
				log.info("consultar() - " + msg);
				throw new BancoNotFoundException(msg);
			}

			return banco;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
		String mensaje = "Error al consultar datos de un banco: " +  e.getMessage();
			
		    throw new BancoException(mensaje, e);
		}
		finally{
			conn.cerrarConexion();
		}
	}
	public static void salvar(BancoBean banco, DatosSesionBean datosSesion) 
		throws BancoException, BancoConstraintViolationException {

		switch (banco.getEstadoBean()) {
			case Estado.NUEVO:
				crear(banco, datosSesion);
				break;
		  
			case Estado.MODIFICADO:
				modificar(banco, datosSesion);
				break;
		  
			case Estado.BORRADO:
				eliminar(banco.getCodBan(), datosSesion);
		}
	}
	public static void crear(BancoBean banco, DatosSesionBean datosSesion) 
		throws BancoException, BancoConstraintViolationException {
		Connection conn = new Connection();

		try {
			log.debug("crear() - Creando nuevo Banco");
			
			conn.abrirConexion(Database.getConnection());
			BancosDao.insert(conn, datosSesion.getConfigEmpresa(), banco);
		}
		catch(KeyConstraintViolationException e){
			log.info("crear() - No se ha podido crear el banco: " + e.getMessage());
			throw new BancoConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error creando banco: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new BancoException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	public static void modificar(BancoBean banco, DatosSesionBean datosSesion) throws BancoException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando Banco " + banco.getCodBan());
			conn.abrirConexion(Database.getConnection());
			BancosDao.update(conn, datosSesion.getConfigEmpresa(), banco);
		}
		catch (SQLException e) {
			String msg = "Error modificando banco: " + e.getMessage();
    		log.error("modificar() - " + msg);
    		
    		throw new BancoException(msg, e);
    	}
    	finally {
    		conn.cerrarConexion();
    	}
	}
	public static void eliminar(String codBan, DatosSesionBean datosSesion) 
			throws BancoException, BancoConstraintViolationException {
		
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando Banco " + codBan);
			conn.abrirConexion(Database.getConnection());
			BancosDao.delete(conn, datosSesion.getConfigEmpresa(),codBan);
		}
		catch(ForeingKeyConstraintViolationException e){
			log.info("eliminar() - No se ha podido eliminar el perfil: "+ e.getMessage());
			throw new BancoConstraintViolationException(e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando banco: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new BancoException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
