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

package com.comerzzia.portlets.tiendavirtual.acciones.inicio;

import javax.portlet.RenderRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.comerzzia.portlets.base.AccionInicio;
import com.comerzzia.portlets.base.Vista;


public class InicioModeEditAccion extends AccionInicio{
	
	/** Logger */
	private static Log log = LogFactory.getLog(InicioModeEditAccion.class);

	public Vista ejecutar(RenderRequest request)  {
		log.fatal("ejecutar() - El modo EDIT no está implementado y configurado en este portlet.");
		return ERROR_GENERAL;
	}
}
