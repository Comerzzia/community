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

package com.comerzzia.servicios.sincronizacion.sincronizadores;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.comerzzia.util.xml.XMLDocumentException;
import com.comerzzia.util.xml.XMLDocumentUtils;


public abstract class ConfigSincronizacionBBDD implements IConfigSincronizacion {
	
	/*
	 * Definición de parámetros de configuración
	 */
	protected static final String PARAM_SERVIDOR = "Servidor";
	protected static final String PARAM_PUERTO = "Puerto";
	protected static final String PARAM_SERVICIO = "Servicio";
	protected static final String PARAM_USUARIO = "Usuario";
	protected static final String PARAM_CLAVE = "Clave";
	protected static final String PARAM_ESQUEMA = "Esquema";
	
	/*
	 * Definición de tags del XML
	 */
	protected static final String TAG_BASE_DATOS = "baseDatos";
	protected static final String TAG_DRIVER = "driver";
	protected static final String TAG_URL = "url";
	protected static final String TAG_USUARIO = "usuario";
	protected static final String TAG_CLAVE = "clave";
	protected static final String TAG_ESQUEMA = "esquema";
	
	/*
	 * Definición de valores por defecto
	 */
	protected String SERVIDOR_DEFAULT = "XXX.XXX.XXX.XXX";
	protected String PUERTO_DEFAULT = "1521";
	protected String SERVICIO_DEFAULT = "CMZ";
	protected String USUARIO_DEFAULT = "cmztpv";
	protected String CLAVE_DEFAULT = "cmztpv";
	protected String ESQUEMA_DEFAULT = "cmztpv";
	
	
	/**
	 * Driver de conexión
	 */
	protected String driver = null;
	
	/**
	 * Comienzo de la url de conexión
	 */
	protected String url = null;
	
	/**
	 * Mapa de parámetros de configuración
	 */
	protected Map<String, String> parametros = null;
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.IConfigSincronizacion#getListaParametros()
	 */
	public List<String> getListaParametros() {
		return new ArrayList<String>(parametros.keySet());
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.IConfigSincronizacion#setValor(java.lang.String, java.lang.String)
	 */
	public void setValor(String parametro, String valor) {
		parametros.put(parametro, valor);
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.IConfigSincronizacion#getValor(java.lang.String)
	 */
	public String getValor(String parametro) {
		return parametros.get(parametro);
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.IConfigSincronizacion#getXmlConfiguracion()
	 */
	public Document getXmlConfiguracion() throws XMLDocumentException {
		Document configuracion = XMLDocumentUtils.createDocument();
		
		Element root = (Element) configuracion.createElement(TAG_SINCRONIZACION);
		Element baseDatos = (Element) configuracion.createElement(TAG_BASE_DATOS);
		XMLDocumentUtils.appendChild(configuracion, baseDatos, TAG_DRIVER, this.driver);
		XMLDocumentUtils.appendChild(configuracion, baseDatos, TAG_URL, getUrlConexion());
		XMLDocumentUtils.appendChild(configuracion, baseDatos, TAG_USUARIO,  parametros.get(PARAM_USUARIO));
		XMLDocumentUtils.appendChild(configuracion, baseDatos, TAG_CLAVE, parametros.get(PARAM_CLAVE));
		XMLDocumentUtils.appendChild(configuracion, baseDatos, TAG_ESQUEMA, parametros.get(PARAM_ESQUEMA));
		
		root.appendChild(baseDatos);
		configuracion.appendChild(root);
		
		return configuracion;
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.IConfigSincronizacion#setXmlConfiguracion(org.w3c.dom.Document)
	 */
	public void setXmlConfiguracion(Document configuracion) throws XMLDocumentException {
		Element baseDatos = XMLDocumentUtils.getElement(configuracion.getDocumentElement(), TAG_BASE_DATOS, false);
		this.driver = XMLDocumentUtils.getTagValue(baseDatos, TAG_DRIVER, false);
		String url = XMLDocumentUtils.getTagValue(baseDatos, TAG_URL, false);

		// Parseamos la url
		parseUrlConexion(url);
		
		parametros.put(PARAM_USUARIO, XMLDocumentUtils.getTagValue(baseDatos, TAG_USUARIO, false));
		parametros.put(PARAM_CLAVE, XMLDocumentUtils.getTagValue(baseDatos, TAG_CLAVE, true));
		parametros.put(PARAM_ESQUEMA, XMLDocumentUtils.getTagValue(baseDatos, TAG_ESQUEMA, false));
	}
	
	
	/**
	 * Obtiene la cadena de conexión a la base de datos
	 * 
	 * @return cadena de conexión a la base de datos
	 */
	public abstract String getUrlConexion();
	
	
	/**
	 * Parsea la cadena de conexión pasada
	 * 
	 * @return
	 */
	public abstract void parseUrlConexion(String url) throws XMLDocumentException;
}
