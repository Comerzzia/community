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

package com.comerzzia.web.tesoreria.remesas.pagos.ui;

import com.comerzzia.persistencia.tesoreria.pagos.DocumentoPagoBean;
import com.comerzzia.persistencia.tesoreria.pagos.tratamiento.TratamientoPagosBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.web.core.ui.FormularioBean;

public class FormularioRemesaPagoBean extends FormularioBean {
	
	// Definición de las pestañas del formulario
	private FormularioBean pestañaDatosGenerales = new FormularioBean();

	//
	private TratamientoPagosBean tratamientoPagos;
	
	/**
	 * Constructor
	 */
	public FormularioRemesaPagoBean() {
		this.addPestaña(pestañaDatosGenerales);
	}
	
	/* (non-Javadoc)
	 * @see com.comerzzia.web.core.ui.FormularioBean#inicializaRegistroActivo()
	 */
	protected void inicializaRegistroActivo() {
		super.inicializaRegistroActivo();
	}

	public void inicializaTratamientoPagos() {
		tratamientoPagos = new TratamientoPagosBean();
		tratamientoPagos.setEstadoBean(Estado.NUEVO);
		tratamientoPagos.setDocumento(new DocumentoPagoBean());
	}

	public void inicializaDocumento() {
		tratamientoPagos.setDocumento(new DocumentoPagoBean());
	}

	public TratamientoPagosBean getTratamientoPagos() {
		return tratamientoPagos;
	}

	public void setTratamientoPagos(TratamientoPagosBean tratamientoPagos) {
		this.tratamientoPagos = tratamientoPagos;
	}

}
