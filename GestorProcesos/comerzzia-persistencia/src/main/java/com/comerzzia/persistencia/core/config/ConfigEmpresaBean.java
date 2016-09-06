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

package com.comerzzia.persistencia.core.config;

/**
 * Datos de configuración de una sesión
 * 
 */
public class ConfigEmpresaBean {
	
	/**
	 * Nombre del esquema de la empresa
	 */
	private String esquemaEmpresa;

	
	/**
	 * Obtiene el valor del atributo esquemaEmpresa
	 * @return Nombre del esquema de la empresa
	 */
	public String getEsquemaEmpresa() {
		return esquemaEmpresa;
	}
	
	/**
	 * Establece el valor del atributo esquemaEmpresa
	 * @param esquemaEmpresa Nombre del esquema de empresa
	 */
	public void setEsquemaEmpresa(String esquemaEmpresa) {
		this.esquemaEmpresa = esquemaEmpresa;
	}
}
