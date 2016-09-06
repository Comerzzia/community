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

import java.util.Date;

import com.comerzzia.persistencia.general.articulos.ArticuloBean;


public class ArticuloTiendaBean {

	private String codAlmacen = null;
	private ArticuloBean articulo = null;
	
	
	public ArticuloTiendaBean(ArticuloBean articulo, String codAlmacen) {
		this.articulo = articulo;
		this.codAlmacen = codAlmacen;
	}
	

	public String getCodAlmacen() {
		return this.codAlmacen;
	}
	
	
	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.articulos.ArticuloBean#getFechaAlta()
	 */
	public Date getFechaAlta() {
		return articulo.getFechaAlta();
	}


	/**
	 * @return
	 * @see com.comerzzia.util.base.MantenimientoBean#getActivo()
	 */
	public String getActivo() {
		return articulo.getActivo();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.articulos.ArticuloBean#getCodArticulo()
	 */
	public String getCodArticulo() {
		return articulo.getCodArticulo();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.articulos.ArticuloBean#getCodImpuesto()
	 */
	public String getCodImpuesto() {
		return articulo.getCodImpuesto();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.articulos.ArticuloBean#getDesArticulo()
	 */
	public String getDesArticulo() {
		return articulo.getDesArticulo();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.articulos.ArticuloBean#getDesglose1()
	 */
	public String getDesglose1() {
		return articulo.getDesglose1();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.articulos.ArticuloBean#getDesglose2()
	 */
	public String getDesglose2() {
		return articulo.getDesglose2();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.articulos.ArticuloBean#getFormato()
	 */
	public String getFormato() {
		return articulo.getFormato();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.articulos.ArticuloBean#getGenerico()
	 */
	public String getGenerico() {
		return articulo.getGenerico();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.articulos.ArticuloBean#getNumSeries()
	 */
	public String getNumSeries() {
		return articulo.getNumSeries();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.articulos.ArticuloBean#getObservaciones()
	 */
	public String getObservaciones() {
		return articulo.getObservaciones();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.articulos.ArticuloBean#getVersion()
	 */
	public Long getVersion() {
		return articulo.getVersion();
	}
	
	
	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.articulos.ArticuloBean#getCodCategorizacion()
	 */
	public String getCodCategorizacion() {
		return articulo.getCodCategorizacion();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.articulos.ArticuloBean#getEscaparate()
	 */
	public String getEscaparate() {
		return articulo.getEscaparate();
	}
}
