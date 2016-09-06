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

package com.comerzzia.persistencia.tiendavirtual.config;

/**
 * Datos de configuración de una sesión
 * 
 */
public class ConfigTiendaVirtualBean {

	
	private String codAlmacen;
	private String codAlmacenCentral;
	
	/**
	 * Nombre del esquema de la tienda virtual
	 */
	private String esquemaTiendaVirtual;

	/**
	 * Obtiene el valor del atributo esquemaTiendaVirtual
	 * 
	 * @return Nombre del esquema de la tienda virtual
	 */
	public String getEsquemaTiendaVirtual() {
		return esquemaTiendaVirtual;
	}

	/**
	 * Establece el valor del atributo esquemaTiendaVirtual
	 * 
	 * @param esquemaTiendaVirtual
	 *            Nombre del esquema de la tienda virtual
	 */
	public void setEsquemaTiendaVirtual(String esquemaTiendaVirtual) {
		this.esquemaTiendaVirtual = esquemaTiendaVirtual;
	}

	public String getCodAlmacen() {
		return codAlmacen;
	}

	public void setCodAlmacen(String codAlmacen) {
		this.codAlmacen = codAlmacen;
	}

	public String getCodAlmacenCentral() {
		return codAlmacenCentral;
	}

	public void setCodAlmacenCentral(String codAlmacenCentral) {
		this.codAlmacenCentral = codAlmacenCentral;
	}
	
	
}
