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

package com.comerzzia.util.config;

/**
 * Configuración de base de datos
 */
public class DBInfo {
	
	/**
	 * Nombre del datasource a utilizar en la aplicación
	 */
	private String datasource = null;
	
	/**
	 * Nombre del esquema de configuración
	 */
	private String esquemaConfiguracion = null;
	
    /**
     * Nombre del esquema de la empresa
     */
    private String esquemaEmpresa = null;
    
    /**
     * Directorio en el que se encuentran los scripts de creación de bbdd
     */
    private String rutaBaseScripts = null;
    
    
	public DBInfo() {
    }
	
    public String getDatasource() {
		return datasource;
	}

	public void setDatasource(String datasource) {
		this.datasource = datasource;
	}

	public String getEsquemaConfiguracion() {
		return esquemaConfiguracion;
	}

	public void setEsquemaConfiguracion(String esquemaConfiguracion) {
		this.esquemaConfiguracion = esquemaConfiguracion;
	}

	public String getEsquemaEmpresa() {
		return esquemaEmpresa;
	}

	public void setEsquemaEmpresa(String esquemaEmpresa) {
		this.esquemaEmpresa = esquemaEmpresa;
	}
	
	/**
	 * @return the rutaBaseScripts
	 */
	public String getRutaBaseScripts() {
		return rutaBaseScripts;
	}

	/**
	 * @param rutaBaseScripts the rutaBaseScripts to set
	 */
	public void setRutaBaseScripts(String rutaBaseScripts) {
		this.rutaBaseScripts = rutaBaseScripts;
	}
}
