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

package com.comerzzia.servicios.core.ayudasconfig;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import org.xml.sax.SAXException;

import com.comerzzia.persistencia.core.ayudasconfig.AyudaConfigBean;
import com.comerzzia.persistencia.core.ayudasconfig.AyudasConfigDao;
import com.comerzzia.persistencia.core.ayudasconfig.ParametrosBuscarAyudasConfigBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.ForeingKeyConstraintViolationException;
import com.comerzzia.util.base.KeyConstraintViolationException;
import com.comerzzia.util.db.Connection;
import com.comerzzia.util.db.Database;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.util.xml.XMLDocumentException;
import com.comerzzia.util.xml.XMLDocumentUtils;

public class ServicioAyudasConfig {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(ServicioAyudasConfig.class);

	public static PaginaResultados consultar(ParametrosBuscarAyudasConfigBean param)throws AyudaConfigException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando ayudas");
			conn.abrirConexion(Database.getConnection());
			
			return AyudasConfigDao.consultar(conn, param);
			
		} catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar ayudas: " + e.getMessage();

			throw new AyudaConfigException(mensaje, e);
		} finally {
			conn.cerrarConexion();
		}
	}

	public static AyudaConfigBean consultar(String nombre)throws AyudaConfigException, AyudaConfigNotFoundException {
		Connection conn = new Connection();

		try {
			log.debug("consultar() - Consultando datos de la ayuda: " + nombre);
			
			conn.abrirConexion(Database.getConnection());
			AyudaConfigBean ayuda = AyudasConfigDao.consultar(conn, nombre);

			if (ayuda == null) {
				String msg = "No se ha encontrado la ayuda con el nombre: " + nombre;
				log.info("consultar() - " + msg);
				throw new AyudaConfigNotFoundException(msg);
			}

			//Parseamos el blob para obtener una string que contiene el xml de la ayuda
			ayuda.setXmlAyuda(XMLDocumentUtils.DocumentToString(XMLDocumentUtils.createDocumentBuilder().parse(ayuda.getXml().getBinaryStream())));
			
			return ayuda;
			
		} 
		catch (SQLException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de la ayuda: " + e.getMessage();

			throw new AyudaConfigException(mensaje, e);
			
		} 
		catch (XMLDocumentException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de la ayuda: " + e.getMessage();

			throw new AyudaConfigException(mensaje, e);
		} 
		catch (SAXException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de la ayuda: " + e.getMessage();

			throw new AyudaConfigException(mensaje, e);
		} 
		catch (IOException e) {
			log.error("consultar() - " + e.getMessage());
			String mensaje = "Error al consultar datos de la ayuda: " + e.getMessage();

			throw new AyudaConfigException(mensaje, e);
		} 
		finally {
			conn.cerrarConexion();
		}
	}

	public static void salvar(AyudaConfigBean ayuda) throws AyudaConfigException,AyudaConfigConstraintViolationException, XMLAyudaConfigException {
		switch (ayuda.getEstadoBean()) {
		case Estado.NUEVO:
			crear(ayuda);
			break;

		case Estado.MODIFICADO:
			modificar(ayuda);
			break;

		case Estado.BORRADO:
			eliminar(ayuda.getNombre());
		}
	}

	public static void crear(AyudaConfigBean ayuda) throws AyudaConfigException,AyudaConfigConstraintViolationException, XMLAyudaConfigException {
		Connection conn = new Connection();

		try {
			log.debug("crear() - Creando nueva Ayuda");

			//Comprobar previamente si es un xml
			try{
				InputStream is = new ByteArrayInputStream(ayuda.getXmlAyuda().getBytes("UTF-8"));
				XMLDocumentUtils.createDocumentBuilder().parse(is);
			}
			catch (Exception e) {
				throw new XMLAyudaConfigException("El xml introducido no es correcto", e);
			}

			conn.abrirConexion(Database.getConnection());
			
			AyudasConfigDao.insert(conn, ayuda);

		} catch (KeyConstraintViolationException e) {
			log.info("crear() - No se ha podido crear la ayuda: " + e.getMessage());
			
			throw new AyudaConfigConstraintViolationException(e.getDefaultMessage());
		} catch (SQLException e) {
			String msg = "Error creando ayuda: " + e.getMessage();
			log.error("crear() - " + msg);

			throw new AyudaConfigException(msg, e);
		} finally {
			if(conn != null){
				conn.cerrarConexion();
			}
		}
	}

	public static void modificar(AyudaConfigBean ayuda) throws AyudaConfigException,AyudaConfigConstraintViolationException, XMLAyudaConfigException {
		Connection conn = new Connection();

		try {
			log.debug("modificar() - Modificando Ayuda" + ayuda.getNombre());

			//Comprobar previamente si es un xml
			try{
				InputStream is = new ByteArrayInputStream(ayuda.getXmlAyuda().getBytes("UTF-8"));
				XMLDocumentUtils.createDocumentBuilder().parse(is);
			}
			catch (Exception e) {
				throw new XMLAyudaConfigException("El xml introducido no es correcto", e);
			}

			conn.abrirConexion(Database.getConnection());

			AyudasConfigDao.update(conn, ayuda);

		} catch (SQLException e) {
			String msg = "Error modificando aydua: " + e.getMessage();
			log.error("modificar() - " + msg);

			throw new AyudaConfigException(msg, e);
		} finally {
			if(conn != null){
				conn.cerrarConexion();
			}
		}
	}

	public static void eliminar(String nombre) throws AyudaConfigException,AyudaConfigConstraintViolationException {
		Connection conn = new Connection();

		try {
			conn.abrirConexion(Database.getConnection());

			log.debug("eliminar() - Eliminando Ayuda " + nombre);
			
			AyudasConfigDao.delete(conn, nombre);

		} catch (ForeingKeyConstraintViolationException e) {
			log.info("eliminar() - No se ha podido eliminar la ayuda: " + e.getMessage());
			
			throw new AyudaConfigConstraintViolationException(e.getDefaultMessage());
		} catch (SQLException e) {
			String msg = "Error eliminando ayuda: " + e.getMessage();
			log.error("eliminar() - " + msg);

			throw new AyudaConfigException(msg, e);
		} finally {
			conn.cerrarConexion();
		}
	}
}
