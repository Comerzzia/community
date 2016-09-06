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

package com.comerzzia.util.base;

import java.util.Locale;
import java.util.ResourceBundle;


public class Exception extends java.lang.Exception {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -4499603132946556598L;

	/**
	 * Archivo de propiedades con los mensajes de errores
	 */
	private String mensajes = "comerzzia.mensajes.errores";
	
	/**
	 * Clave para traducción del mensaje de error por defecto
	 */
	private String msgKey = "error.default";
	
	/** 
     * Constructor por defecto sin mensaje de error
     */
    public Exception() {
    }
    
    /**
     * Constructor con mensaje de error
     * @param msg Mensaje de error
     */
    public Exception(String msg) {
        super(msg);
    }
    
    /**
     * Constructor con mensaje de error, causa
     * @param msg Mensaje de error
     * @param e Causa origen del error
     */
    public Exception(String msg, Throwable e) {
        super(msg);
        initCause(e);
    }
    
    /**
     * Constructor con mensaje de error y clave para el mensaje traducido
     * @param msg Mensaje de error
     * @param msg Clave del mensaje para traducción
     */
    public Exception(String msg, String msgKey) {
        super(msg);
        this.msgKey = msgKey;
    }
    
    /**
     * Constructor con mensaje de error, clave y causa
     * @param msg Mensaje de error
     * @param msg Clave del mensaje para traducción
     * @param e Causa origen del error
     */
    public Exception(String msg, String msgKey, Throwable e) {
        super(msg);
        initCause(e);
        this.msgKey = msgKey;
    }
    
    
    /**
     * Obtiene el mensaje de error en el locale indicado
     * @param locale Locale en el que se desea obtener el mensaje
     * @return Mensaje de error traducido. Si no se ha indicado clave se devuelve un
     * mensaje de error general, y  si no se encuentra traducción de la clave indicada
     * se devuelve el mensaje original de la excepción
     */
    public String getLocalizedMessage(Locale locale) {
    	ResourceBundle rb = ResourceBundle.getBundle(mensajes, locale);

    	String mensaje = rb.getString(msgKey);
    	return (mensaje != null ? mensaje : getMessage());
    }
    
    
    public String getMessageKey() {
    	return msgKey;
    }
}
