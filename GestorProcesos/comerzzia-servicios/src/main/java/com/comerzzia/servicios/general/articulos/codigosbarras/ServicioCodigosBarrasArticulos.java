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

package com.comerzzia.servicios.general.articulos.codigosbarras;

import java.sql.SQLException;
import java.util.List;

import com.comerzzia.persistencia.general.articulos.codigosbarras.CodigoBarrasArticuloBean;
import com.comerzzia.persistencia.general.articulos.codigosbarras.CodigosBarrasArticulosDao;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.variables.ServicioVariables;
import com.comerzzia.servicios.core.variables.Variables;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.codigoBarras.CodigoBarras;
import com.comerzzia.util.codigoBarras.Ean13;
import com.comerzzia.util.codigoBarras.Ean8;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;


public class ServicioCodigosBarrasArticulos {
	
	protected static Logger log = Logger.getMLogger(ServicioCodigosBarrasArticulos.class);

	
	public static List<CodigoBarrasArticuloBean> consultarCodigosBarras(String codArticulo, 
			DatosSesionBean datosSesion) throws CodigoBarrasArticuloException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultarCodigosBarras() - Consultando codigos de barras del artículo " + codArticulo);
			
			conn.abrirConexion(Database.getConnection());
			return CodigosBarrasArticulosDao.consultar(conn, datosSesion.getConfigEmpresa(), codArticulo);
		}
		catch(SQLException e){
			String msg = "Error consultando códigos de barras: " + e.getMessage();
    		log.error("consultarCodigosBarras() - " + msg);
    		
    		throw new CodigoBarrasArticuloException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static void salvar(CodigoBarrasArticuloBean codigoBarras, DatosSesionBean datosSesion, Connection conn) 
		throws CodigoBarrasArticuloException, CodigoBarrasArticuloConstraintViolationException {

		switch (codigoBarras.getEstadoBean()) {
			case Estado.NUEVO:
				crear(codigoBarras, datosSesion, conn);
				break;
		  
			case Estado.MODIFICADO:
				modificar(codigoBarras, datosSesion, conn);
				break;
		  
			case Estado.BORRADO:
				eliminar(codigoBarras, datosSesion, conn);
		}
	}


	public static void crear(CodigoBarrasArticuloBean codigoBarras, DatosSesionBean datosSesion, Connection conn) 
			throws CodigoBarrasArticuloException, CodigoBarrasArticuloConstraintViolationException {
		try {
			log.debug("crear() - Creando nuevo código de barras " + codigoBarras.getCodigoBarras() 
					+ " para el artículo " + codigoBarras.getCodArticulo());
			
			CodigosBarrasArticulosDao.insert(conn, datosSesion.getConfigEmpresa(), codigoBarras);
		}
		catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear el código de barras: " + e.getMessage());
			throw new CodigoBarrasArticuloConstraintViolationException("Error creando código de barras: "
					+ "El código de barras " + codigoBarras.getCodigoBarras() + " ya está registrado en el sistema");
		}
		catch (SQLException e) {
			String msg = "Error creando nuevo código de barras: " + e.getMessage();
			log.error("crear() - " + msg);
			
			throw new CodigoBarrasArticuloException(msg, e);
		}
	}
	
	
	public static void modificar(CodigoBarrasArticuloBean codigoBarras, DatosSesionBean datosSesion, Connection conn) 
			throws CodigoBarrasArticuloException {
		try {
			log.debug("modificar() - Modificando código de barras " + codigoBarras.getCodigoBarras() 
					+ " del artículo " + codigoBarras.getCodArticulo());
			
			CodigosBarrasArticulosDao.update(conn, datosSesion.getConfigEmpresa(), codigoBarras);
		}
		catch (SQLException e) {
			String msg = "Error modificando código de barras: " + e.getMessage();
			log.error("modificar() - " + msg);
			
			throw new CodigoBarrasArticuloException(msg, e);
		}
	}
	
	
	public static void eliminar(CodigoBarrasArticuloBean codigoBarras, DatosSesionBean datosSesion, Connection conn) 
			throws CodigoBarrasArticuloException, CodigoBarrasArticuloConstraintViolationException {
		try {
			log.debug("eliminar() - Eliminando código de barras " + codigoBarras.getCodigoBarras() 
					+ " del artículo " + codigoBarras.getCodArticulo());
			
			CodigosBarrasArticulosDao.delete(conn, datosSesion.getConfigEmpresa(), codigoBarras);
		}
		catch (ForeingKeyConstraintViolationException e) {
			log.info("eliminar() - No se ha podido eliminar el código de barras: " + e.getMessage());
			throw new CodigoBarrasArticuloConstraintViolationException("Error eliminando código de barras: " + e.getDefaultMessage());
		}
		catch (SQLException e) {
			String msg = "Error eliminando código de barras: " + e.getMessage();
			log.error("eliminar() - " + msg);
			
			throw new CodigoBarrasArticuloException(msg, e);
		}
	}
	
	public static String generarAleatorio(DatosSesionBean datosSesion) throws CodigoBarrasArticuloException {
		Connection conn = null;
		boolean codigoValido = false;
		String codigoBarras = "";
		int maxIteraciones = 10;
		try {
			
			String variable = ServicioVariables.consultarValor(Variables.ARTICULOS_CODIGOS_BARRAS_FORMATO);
			
			//instanciamos la clase correspondiente según la variable
			CodigoBarras codigo = null;
			if(variable.equals(Variables.EAN13)){
				codigo = new Ean13();
			}else{
				codigo = new Ean8();
			}
			
			conn = new Connection();
			
			log.debug("generar() - Generando código de barras aleatorio");
			
			conn.abrirConexion(Database.getConnection());
			
			int i;
			for (i = 0; i < maxIteraciones && !codigoValido; i++) {
				codigoBarras = codigo.generarAleatorio();
				
				//comprobamos que el código de barras generado no existe
				log.debug("generar() - Comprobando si existe el código de barras " + codigoBarras);
				
				// Consultar el código recibido como código de barras
				CodigoBarrasArticuloBean codigoBarrasArticulo = CodigosBarrasArticulosDao.consultarCodigoBarras(conn, datosSesion.getConfigEmpresa(), codigoBarras);
				
				if(codigoBarrasArticulo == null){
					log.debug("generar() - El código generado es correcto.");
					
					codigoValido = true;	
				}else{
					log.debug("generar() - Ya existe el código de barras " + codigoBarras);
				}
			}
			
			//hemos agotado el número máximo de iteracions
			if(i == 10){
				log.debug("generar() - Se han agotado el número máximo de iteraciones para generar un código de barras aleatorio.");
				throw new CodigoBarrasArticuloException("No ha sido posible generar el código de barras aleatorio.");
			}
			
			return codigoBarras;
			
		}
		catch (CodigoBarrasArticuloException e) {
			throw e;
		}
		catch (Exception e) {
			String msg = "Error generando un código de barras: " + e.getMessage();
			log.error("generar() - " + msg);
			
			throw new CodigoBarrasArticuloException(msg, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
