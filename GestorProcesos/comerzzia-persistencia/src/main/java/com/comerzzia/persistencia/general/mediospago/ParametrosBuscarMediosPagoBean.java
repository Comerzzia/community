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

package com.comerzzia.persistencia.general.mediospago;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarMediosPagoBean extends ParametrosBuscarBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1587756957047618741L;

	private String codMedioPago = "";
	private String desMedioPago = "";
	private String activo = "";
	
	public ParametrosBuscarMediosPagoBean() {
		super.setOrden("CODMEDPAG");
	}
	
	public String getCodMedioPago() {
		return codMedioPago;
	}
	public void setCodMedioPago(String codMedioPago) {
		this.codMedioPago = (codMedioPago !=null) ? codMedioPago.toUpperCase() : "";
	}
	public String getDesMedioPago() {
		return desMedioPago;
	}
	public void setDesMedioPago(String desMedioPago) {
		this.desMedioPago = (desMedioPago !=null) ? desMedioPago : "";
	}
	public String getActivo() {
		return activo;
	}
	public void setActivo(String activo) {
		this.activo = (activo != null) ? activo : "";
	}
	
}
