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

package com.comerzzia.servicios.general.tiendas;

import com.comerzzia.util.base.MantenimientoBean;

public class AsistenteTienda extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -992058373378602306L;
	
	private int paso;
	
	private Tienda tienda;
	
	public AsistenteTienda(){
		this.tienda = new Tienda();
	}
	
	@Override
	protected void initNuevoBean() {
	}
	
	public int getPaso() {
		return paso;
	}

	public void setPaso(int paso) {
		this.paso = paso;
	}
	
	public void setPasoAnterior() {
		this.paso--;
	}
	
	public Tienda getTienda() {
		return tienda;
	}
}
