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

package com.comerzzia.web.base;

import javax.servlet.http.HttpServletRequest;

import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.comerzzia.servicios.core.ayudas.AyudaXMLException;

public abstract class AccionXML {
    
    /**
     * Constructor
     */
    public AccionXML() {
    }
    
    /**
     * Devuelve el nombre identificador de la acción 
     * @return 
     */
	public abstract String getNombre();
    
    /**
     * Ejecuta la acción 
     * @param request datos de la peticion
     * @return 
     */
    public abstract Element ejecutar(HttpServletRequest request, Document document) throws AyudaXMLException;
}
