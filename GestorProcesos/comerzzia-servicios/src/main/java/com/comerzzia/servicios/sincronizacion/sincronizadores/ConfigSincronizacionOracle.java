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

import java.util.HashMap;

import com.comerzzia.util.xml.XMLDocumentException;


public class ConfigSincronizacionOracle extends ConfigSincronizacionBBDD implements IConfigSincronizacion {

	/**
	 * Constructor
	 */
	public ConfigSincronizacionOracle() {
		// Establecemos el driver y la url de Oracle
		driver = "oracle.jdbc.driver.OracleDriver";
		url = "jdbc:oracle:thin:@";
		
		// Cambiamos valores por defecto
		PUERTO_DEFAULT = "1521";
		
		// Establecemos los parámetros de configuración
		parametros = new HashMap<String, String>();
		parametros.put(PARAM_SERVIDOR, SERVIDOR_DEFAULT);
		parametros.put(PARAM_PUERTO, PUERTO_DEFAULT);
		parametros.put(PARAM_SERVICIO, SERVICIO_DEFAULT);
		parametros.put(PARAM_USUARIO, USUARIO_DEFAULT);
		parametros.put(PARAM_CLAVE, CLAVE_DEFAULT);
		parametros.put(PARAM_ESQUEMA, ESQUEMA_DEFAULT);
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.ConfigSincronizacionBBDD#getUrlConexion()
	 */
	public String getUrlConexion() {
		String url = this.url + parametros.get(PARAM_SERVIDOR) + ":" 
				+ parametros.get(PARAM_PUERTO) + ":" + parametros.get(PARAM_SERVICIO);
		
		return url;
	}
	
	
	/* (non-Javadoc)
	 * @see com.comerzzia.servicios.sincronizacion.sincronizadores.ConfigSincronizacionBBDD#parseUrlConexion(java.lang.String)
	 */
	public void parseUrlConexion(String url) throws XMLDocumentException {
		// Parseamos la url
		int p = url.indexOf("@");
		if (p != -1) {
			try {
				this.url = url.substring(0, p+1);
				String[] param = url.substring(p+1, url.length()).split(":");
				parametros.put(PARAM_SERVIDOR, param[0]);
				parametros.put(PARAM_PUERTO, param[1]);
				parametros.put(PARAM_SERVICIO, param[2]);
			} 
			catch (Exception e) {
				throw new XMLDocumentException("El valor del tag <url> no tiene un formato válido: " + e.getMessage());
			}
		}
		else {
			throw new XMLDocumentException("El valor del tag <url> no tiene un formato válido");
		}
	}
}
