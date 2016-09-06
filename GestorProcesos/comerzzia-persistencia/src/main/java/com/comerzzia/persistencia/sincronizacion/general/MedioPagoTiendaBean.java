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

package com.comerzzia.persistencia.sincronizacion.general;

import com.comerzzia.persistencia.general.mediospago.MedioPagoBean;


public class MedioPagoTiendaBean {

	private String codAlmacen = null;
	private MedioPagoBean medioPago = null;
	
	
	/**
	 * @param activo
	 * @see com.comerzzia.util.base.MantenimientoBean#setActivo(boolean)
	 */
	public void setActivo(boolean activo) {
		medioPago.setActivo(activo);
	}


	/**
	 * Constructor
	 * 
	 * @param medioPago
	 * @param codAlmacen
	 */
	public MedioPagoTiendaBean(MedioPagoBean medioPago, String codAlmacen) {
		this.medioPago = medioPago;
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
		return medioPago.getActivo();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.mediospago.MedioPagoBean#getCodMedioPago()
	 */
	public String getCodMedioPago() {
		return medioPago.getCodMedioPago();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.mediospago.MedioPagoBean#getContado()
	 */
	public String getContado() {
		return medioPago.getContado();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.mediospago.MedioPagoBean#getDesMedioPago()
	 */
	public String getDesMedioPago() {
		return medioPago.getDesMedioPago();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.mediospago.MedioPagoBean#getEfectivo()
	 */
	public String getEfectivo() {
		return medioPago.getEfectivo();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.mediospago.MedioPagoBean#getTarjetaCredito()
	 */
	public String getTarjetaCredito() {
		return medioPago.getTarjetaCredito();
	}
	
	
	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.mediospago.MedioPagoBean#isVisibleVenta()
	 */
	public boolean isVisibleVenta() {
		return medioPago.isVisibleVenta();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.mediospago.MedioPagoBean#isVisibleTiendaVirtual()
	 */
	public boolean isVisibleTiendaVirtual() {
		return medioPago.isVisibleTiendaVirtual();
	}
}
