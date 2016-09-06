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

package com.comerzzia.persistencia.general.series;

import com.comerzzia.util.base.MantenimientoBean;


public class SerieBean extends MantenimientoBean {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 5556770250248448182L;
	
	private String codSerie;
	private String desSerie;
		
	
	protected void initNuevoBean() {	
	}

	public String getCodSerie() {
		return codSerie;
	}
	
	public void setCodSerie(String codSerie) {
		this.codSerie = codSerie.toUpperCase();
	}
	
	public String getDesSerie() {
		return desSerie;
	}
	
	public void setDesSerie(String desSerie) {
		this.desSerie = desSerie;
	}
}
