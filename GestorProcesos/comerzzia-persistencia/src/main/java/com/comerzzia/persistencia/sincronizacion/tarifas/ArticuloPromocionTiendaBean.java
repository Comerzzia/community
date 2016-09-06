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

package com.comerzzia.persistencia.sincronizacion.tarifas;

import java.util.Date;

import com.comerzzia.persistencia.ventas.promociones.PromocionBean;
import com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean;
import com.comerzzia.util.xml.XMLDocument;


public class ArticuloPromocionTiendaBean {

	private String codAlmacen = null;
	private PromocionBean promocion = null;
	private ArticuloPromocionBean articulo = null;
	
	
	public ArticuloPromocionTiendaBean(PromocionBean promocion, ArticuloPromocionBean articulo, String codAlmacen) {
		this.promocion = promocion;
		this.articulo = articulo;
		this.codAlmacen = codAlmacen;
	}
	
	
	public String getCodAlmacen() {
		return this.codAlmacen;
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean#getCodArt()
	 */
	public String getCodArt() {
		return articulo.getCodArt();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean#getDatosPromocion()
	 */
	public XMLDocument getDatosPromocion() {
		return articulo.getDatosPromocion();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean#getFechaFin()
	 */
	public Date getFechaFin() {
		return articulo.getFechaFin();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean#getFechaInicio()
	 */
	public Date getFechaInicio() {
		return articulo.getFechaInicio();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean#getIdPromocion()
	 */
	public Long getIdPromocion() {
		return articulo.getIdPromocion();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean#getPrecioTarifa()
	 */
	public Double getPrecioTarifa() {
		return articulo.getPrecioTarifa();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean#getPrecioVenta()
	 */
	public Double getPrecioVenta() {
		return articulo.getPrecioVenta();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean#getPuntos()
	 */
	public Long getPuntos() {
		return articulo.getPuntos();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean#getTextoPromocion()
	 */
	public String getTextoPromocion() {
		return articulo.getTextoPromocion();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean#getVersionTarifa()
	 */
	public Long getVersionTarifa() {
		return articulo.getVersionTarifa();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.promociones.PromocionBean#getCodTar()
	 */
	public String getCodTar() {
		return promocion.getCodTar();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.promociones.PromocionBean#getSoloFidelizacion()
	 */
	public String getSoloFidelizacion() {
		return promocion.getSoloFidelizacion();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.ventas.promociones.PromocionBean#getIdTipoPromocion()
	 */
	public Long getIdTipoPromocion() {
		return promocion.getIdTipoPromocion();
	}
}
