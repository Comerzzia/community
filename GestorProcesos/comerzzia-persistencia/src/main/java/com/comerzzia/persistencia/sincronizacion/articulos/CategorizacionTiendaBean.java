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

package com.comerzzia.persistencia.sincronizacion.articulos;

import com.comerzzia.persistencia.general.categorizaciones.CategorizacionBean;


public class CategorizacionTiendaBean {

	private String codAlmacen = null;
	private CategorizacionBean categorizacion = null;
	
	
	public CategorizacionTiendaBean(CategorizacionBean categorizacion, String codAlmacen) {
		this.categorizacion = categorizacion;
		this.codAlmacen = codAlmacen;
	}
	
	
	public String getCodAlmacen() {
		return this.codAlmacen;
	}


	/**
	 * @return
	 * @see com.comerzzia.util.base.MantenimientoBean#getActivo()
	 */
	public String getActivo() {
		return categorizacion.getActivo();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.categorizaciones.CategorizacionBean#getCodCat()
	 */
	public String getCodCat() {
		return categorizacion.getCodCat();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.categorizaciones.CategorizacionBean#getDesCat()
	 */
	public String getDesCat() {
		return categorizacion.getDesCat();
	}
}
