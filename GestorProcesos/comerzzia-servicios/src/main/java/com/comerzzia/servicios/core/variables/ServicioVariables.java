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

package com.comerzzia.servicios.core.variables;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.core.variables.VariableBean;
import com.comerzzia.persistencia.core.variables.VariablesDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioVariables {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioVariables.class);
	
	public static VariableBean consultar(String idVariable)throws VariableException, VariableNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando la variable: " + idVariable);
			conn.abrirConexion(Database.getConnection());
			
			VariableBean variable = VariablesDao.consultar(conn, idVariable);
			
			if (variable == null) {
				String msg = "No se ha encontrado la variable con identificador: " + idVariable;
				log.info("consultar() - " + msg);
				throw new VariableNotFoundException(msg);
			}
			
			return variable;

		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar la variable: " +  e.getMessage();
			
            throw new VariableException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static String consultarValor(String idVariable)throws VariableException, VariableNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Consultando valor de la variable: " + idVariable);
			conn.abrirConexion(Database.getConnection());
			
			VariableBean variable = VariablesDao.consultar(conn, idVariable);
			
			if (variable == null) {
				String msg = "No se ha encontrado la variable con identificador: " + idVariable;
				log.info("consultar() - " + msg);
				throw new VariableNotFoundException(msg);
			}
			
			if(variable.getValor() != null && !variable.getValor().isEmpty()){
				return variable.getValor();
			}
			else{
				return variable.getValorDefecto(); 
			}

		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar valor de una variable: " +  e.getMessage();
			
            throw new VariableException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void grabarVariableNivelGeneral(String idVariable, String valor) throws VariableException, VariableConstraintViolationException{
		VariableBean variable = new VariableBean();
		variable.setIdVariable(idVariable);
		variable.setValor(valor);
		variable.setPeso(new Long(100));
		
		grabarVariable(variable);
	}
	
	public static void grabarVariable(VariableBean variable) throws VariableException, VariableConstraintViolationException{
		int rowcount = ServicioVariables.modificar(variable);
		if(rowcount == 0)
			ServicioVariables.crear(variable);
	}
	
	public static void crear(VariableBean variable)	throws VariableException, VariableConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("crear() - Creando nueva variable");	
			conn.abrirConexion(Database.getConnection());
			VariablesDao.insert(conn, variable);
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear la variable: " + e.getMessage());
			throw new VariableConstraintViolationException("Error creando nueva variable: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error creando nueva variable: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new VariableException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}

	public static int modificar(VariableBean variable) throws VariableException {
		Connection conn = new Connection();
		
		try {
			log.debug("modificar() - Modificando variable " + variable.getIdVariable());
			conn.abrirConexion(Database.getConnection());
			return VariablesDao.update(conn, variable);
		}
		catch (SQLException e) {
			String msg = "Error modificando variable: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new VariableException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static void eliminar(String idVariable, DatosSesionBean datosSesion) 
			throws VariableException, VariableConstraintViolationException {
		Connection conn = new Connection();
		
		try {
			log.debug("eliminar() - Eliminando variable " + idVariable);
			conn.abrirConexion(Database.getConnection());
			VariablesDao.delete(conn, idVariable);
		}
		catch(ForeingKeyConstraintViolationException e){
			log.info("eliminar() - No se ha podido eliminar la variable: "+ e.getMessage());
			throw new VariableConstraintViolationException("Error eliminando variable: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando variable: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new VariableException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	public static List<VariableBean> obtenerVariables() throws VariableException {
		List<VariableBean> variables = new ArrayList<VariableBean>();
		Connection conn = new Connection();
		
		try {
			log.debug("obtenerVariables() - Obteniendo variables de configuración ");
			conn.abrirConexion(Database.getConnection());
			
			for (String idVariable : Variables.parametros){
				VariableBean variable = VariablesDao.consultar(conn, idVariable);
				if(variable != null)
					variables.add(variable);
			}
			
			return variables;
		}
		catch (SQLException e) {
			String msg = "Error obteniendo variables de configuración: " + e.getMessage();
			log.error("obtenerVariables() - " + msg);
			
			throw new VariableException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
