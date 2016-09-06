/**
 * 
 */
package com.comerzzia.web.tesoreria.pagos.ui;

import com.comerzzia.persistencia.tesoreria.pagos.DocumentoPagoBean;
import com.comerzzia.persistencia.tesoreria.pagos.tratamiento.TratamientoPagosBean;
import com.comerzzia.web.core.ui.FormularioBean;

/**
 *
 */
public class FormularioDocumentoPagoBean extends FormularioBean {

	public void inicializaDocumento(){
		TratamientoPagosBean tratamientoPagos = (TratamientoPagosBean)this.getRegistroActivo();
		tratamientoPagos.setDocumento(new DocumentoPagoBean());
	}
}
