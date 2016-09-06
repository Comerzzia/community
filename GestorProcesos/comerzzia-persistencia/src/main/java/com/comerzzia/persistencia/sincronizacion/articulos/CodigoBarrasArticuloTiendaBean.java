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

import com.comerzzia.persistencia.general.articulos.codigosbarras.CodigoBarrasArticuloBean;


public class CodigoBarrasArticuloTiendaBean {

	private String codAlmacen = null;
	private CodigoBarrasArticuloBean codigoBarras = null;
	
	
	public CodigoBarrasArticuloTiendaBean(CodigoBarrasArticuloBean codigoBarras, String codAlmacen) {
		this.codigoBarras = codigoBarras;
		this.codAlmacen = codAlmacen;
	}
	
	
	public String getCodAlmacen() {
		return this.codAlmacen;
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.articulos.codigosbarras.CodigoBarrasArticuloBean#getCodArticulo()
	 */
	public String getCodArticulo() {
		return codigoBarras.getCodArticulo();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.articulos.codigosbarras.CodigoBarrasArticuloBean#getCodigoBarras()
	 */
	public String getCodigoBarras() {
		return codigoBarras.getCodigoBarras();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.articulos.codigosbarras.CodigoBarrasArticuloBean#getDesglose1()
	 */
	public String getDesglose1() {
		return codigoBarras.getDesglose1();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.articulos.codigosbarras.CodigoBarrasArticuloBean#getDesglose2()
	 */
	public String getDesglose2() {
		return codigoBarras.getDesglose2();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.articulos.codigosbarras.CodigoBarrasArticuloBean#getDun14()
	 */
	public String getDun14() {
		return codigoBarras.getDun14();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.articulos.codigosbarras.CodigoBarrasArticuloBean#getFactorConversion()
	 */
	public Double getFactorConversion() {
		return codigoBarras.getFactorConversion();
	}
}
