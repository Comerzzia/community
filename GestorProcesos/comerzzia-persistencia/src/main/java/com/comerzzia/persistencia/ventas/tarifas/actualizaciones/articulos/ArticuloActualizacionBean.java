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

package com.comerzzia.persistencia.ventas.tarifas.actualizaciones.articulos;

import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean;

public class ArticuloActualizacionBean extends ArticuloTarifaBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6099134871304179519L;

	private Long idActualizacion;
	
	protected void initNuevoBean() {

	}

	public Long getIdActualizacion() {
		return idActualizacion;
	}

	public void setIdActualizacion(Long idActualizacion) {
		this.idActualizacion = idActualizacion;
	}
}
