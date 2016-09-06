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

import java.util.List;

import org.w3c.dom.Document;

import com.comerzzia.util.xml.XMLDocumentException;


/**
 * Configuración de un método de sincronización
 *
 * Contiene métodos para poder establecer los parámetros de configuración 
 * para la sincronización de forma dinámica, así como obtener el XML de 
 * configuración a partir de los valores establecidos para cada uno de 
 * estos parámetros
 */
public interface IConfigSincronizacion {
	
	public static final String TAG_SINCRONIZACION = "sincronizacion";
	

	/**
	 * Obtiene la lista de parámetros de configuración
	 * 
	 * @return Lista con los nombres de los parámetros de configuración
	 */
	public List<String> getListaParametros();
	
	
	/**
	 * Establece el valor de un parámetro
	 * 
	 * @param parametro Nombre del parámetro
	 * @param valor Valor
	 */
	public void setValor(String parametro, String valor);
	
	
	/**
	 * Obtiene le valor de un parámetro
	 * 
	 * @param parametro Nombre del parámetro
	 * @return
	 */
	public String getValor(String parametro);
	
	
	/**
	 * Establace el XML de configuración con los parámetros de configuración
	 * @param configuracion
	 */
	public void setXmlConfiguracion(Document configuracion) throws XMLDocumentException;
	
	
	/**
	 * @return
	 */
	public Document getXmlConfiguracion() throws XMLDocumentException;
}
