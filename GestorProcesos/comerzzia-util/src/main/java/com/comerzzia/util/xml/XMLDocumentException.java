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

package com.comerzzia.util.xml;


public class XMLDocumentException extends Exception {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -5086664177325890173L;

	/** 
     * Constructor por defecto sin mensaje de error
     */
    public XMLDocumentException() {
    }
        
    /**
     * Constructor con mensaje de error
     * @param msg Mensaje de error
     */
    public XMLDocumentException(String msg) {
        super(msg);
    }
    
    /**
     * Constructor con mensaje de error y causa
     * @param msg Mensaje de error
     * @param e Causa origen del error
     */
    public XMLDocumentException(String msg, Throwable e) {
        super(msg);
        initCause(e);
    }
}
