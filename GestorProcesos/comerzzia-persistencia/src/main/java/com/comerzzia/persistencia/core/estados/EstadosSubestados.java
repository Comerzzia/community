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

package com.comerzzia.persistencia.core.estados;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;


public class EstadosSubestados {

	private Map<String, EstadoBean> estados = null;
	
	
	public EstadosSubestados(Map<String, EstadoBean> estados) {
		this.estados = estados;
	}
	
	public Map<String, EstadoBean> getEstados() {
		return estados;
	}
	
	public void setEstados(Map<String, EstadoBean> estados) {
		this.estados = estados;
	}
	
	
	public List<EstadoBean> getListaEstados() {
		return new ArrayList<EstadoBean>(new TreeSet<EstadoBean>(estados.values()));
	}
}
