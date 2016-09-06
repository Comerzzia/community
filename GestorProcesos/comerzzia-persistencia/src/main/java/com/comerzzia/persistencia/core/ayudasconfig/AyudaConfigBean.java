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

package com.comerzzia.persistencia.core.ayudasconfig;

import java.sql.Blob;

import com.comerzzia.util.base.MantenimientoBean;

public class AyudaConfigBean extends MantenimientoBean {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 2543669626053608116L;
	
	
	private String nombre;
	private Blob xml;
	private String xmlAyuda;
	
	
	protected void initNuevoBean() {
	}

	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre.toUpperCase();
	}
	public Blob getXml() {
		return xml;
	}
	public void setXml(Blob xml) {
		this.xml = xml;
	}

	public String getXmlAyuda() {
		return xmlAyuda;
	}

	public void setXmlAyuda(String xmlAyuda) {
		this.xmlAyuda = xmlAyuda;
	}
}
