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

package com.comerzzia.servicios.core.ayudas;

import java.sql.SQLException;

import com.comerzzia.persistencia.core.ayudas.AyudaBean;
import com.comerzzia.persistencia.core.ayudas.AyudasDao;
import com.comerzzia.persistencia.core.ayudas.ElementoAyudaBean;
import com.comerzzia.persistencia.core.ayudas.ParametrosBuscarAyudasBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.util.xml.XMLDocumentException;


public class ServicioAyudas {
	
	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioAyudas.class);
	
	
	public static AyudaBean obtenerDefinicion(String nombre) throws AyudaException, AyudaNotFoundException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Obteniendo definición de la ayuda " + nombre);
			conn.abrirConexion(Database.getConnection());
			
			AyudaBean ayuda = AyudasDao.consultarAyuda(conn, nombre);
			
			if (ayuda == null) {
				throw new AyudaNotFoundException("No se ha encontrado la definición de la ayuda " + nombre);
			}
			
			return ayuda;
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar definición de la ayuda " + nombre + 
			                 ": " +  e.getMessage();
			
            throw new AyudaException(mensaje, e);
		}
		catch (XMLDocumentException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar definición de la ayuda " + nombre + 
			                 ": " +  e.getMessage();
			
            throw new AyudaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static PaginaResultados consultar(AyudaBean ayuda, 
			ParametrosBuscarAyudasBean param, DatosSesionBean datosSesion) throws AyudaException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Realizando consulta de ayuda de " + ayuda.getNombre());
			conn.abrirConexion(Database.getConnection());
			
			return AyudasDao.consultar(conn, datosSesion.getConfigEmpresa(), ayuda, param);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al realizar consulta de ayuda de " + ayuda.getNombre() + 
			                 ": " +  e.getMessage();
			
            throw new AyudaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
	
	
	public static ElementoAyudaBean consultar(AyudaBean ayuda, String codigo, 
			DatosSesionBean datosSesion) throws AyudaException {
		Connection conn = new Connection();
		
		try {
			log.debug("consultar() - Realizando consulta de elemento de ayuda " + ayuda.getNombre());
			conn.abrirConexion(Database.getConnection());
			
			return AyudasDao.consultar(conn, datosSesion.getConfigEmpresa(), ayuda, codigo);
		}
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al realizar consulta de elemento de ayuda " + ayuda.getNombre() + 
			                 ": " +  e.getMessage();
			
            throw new AyudaException(mensaje, e);
		}
		finally {
			conn.cerrarConexion();
		}
	}
}
