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

package com.comerzzia.servicios.core.database;

import java.net.InetAddress;

import com.comerzzia.servicios.core.variables.ServicioVariables;
import com.comerzzia.servicios.core.variables.Variables;
import com.comerzzia.util.log.Logger;


public class VariablesComerzzia {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(DatabaseComerzzia.class);
	
	private static final String URL_PROTOCOLO = "http://";
	private static final String URL_WSCLIENTES = "/ws/services/WSClientes";
	
	private String servidor = "127.0.0.1";
	private int puerto = 8080;
	private String contexto = "comerzzia";
	
	
	/**
	 * Constructor
	 */
	public VariablesComerzzia() {
		try {
			// Obtenemos la IP del servidor
			InetAddress i = InetAddress.getLocalHost();
			servidor = i.getHostAddress();
		}
		catch (Exception ignore) {
		}
		
		if (servidor == null) {
			servidor = "127.0.0.1";
		}
	}
	
	
	/**
	 * Realiza la inicialización de las variables del sistema
	 */
	public void inicialiar() {
		try {
			// Obtenemos el valor de la variable del WS de Clientes
			String wsClientes = ServicioVariables.consultarValor(Variables.WEBSERVICES_WSCLIENTES);
			
			// Si no tiene valor la inicializamos
			if (wsClientes == null || wsClientes.isEmpty()) {
				String url = URL_PROTOCOLO + servidor + ":" + puerto;
				if (!contexto.startsWith("/")) {
					url += "/";
				}
				url += contexto + URL_WSCLIENTES;
				
				ServicioVariables.grabarVariableNivelGeneral(Variables.WEBSERVICES_WSCLIENTES, url);
			}
		} 
		catch (Exception e) {
			log.error("inicialiar() - Error al inicializar variables del sistema: " + e.getMessage(), e);
		}
	}
}
