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

package com.comerzzia.web.tesoreria.pagos.acciones.pagar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.tesoreria.pagos.tratamiento.TratamientoPagosBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.tesoreria.pagos.ServicioPagos;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.tesoreria.pagos.ui.FormularioDocumentoPagoBean;

public class PagarAccion extends Accion {

	public String getNombre() {
		return "pagar";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		try {
    		HttpSession sesion = request.getSession();
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeEjecutar()) {
    			return SIN_PERMISO;
    		}
    		
    		FormularioDocumentoPagoBean formulario = (FormularioDocumentoPagoBean)sesion.getAttribute(WebKeys.FORMULARIO_DOCUMENTO_PAGO);
    		TratamientoPagosBean tratamientoPagos = (TratamientoPagosBean)formulario.getRegistroActivo();
    		
    		tratamientoPagos.getDocumento().setImporte(Numero.desformatea(request.getParameter("importePagado"), 0D));
    		
    		tratamientoPagos.getDocumento().setCodBancoPago(request.getParameter("codBancoPago"));
    		tratamientoPagos.getDocumento().setDesBancoPago(request.getParameter("desBancoPago"));
    		tratamientoPagos.getDocumento().setFechaPago(Fechas.getFecha(request.getParameter("fechaPago")));
    		
			ServicioPagos.pagar(tratamientoPagos, datosSesion);
			
			setMensaje(request, "Los vencimientos has sido pagados correctamente");
			
			return getControlador().getAccion("buscar").ejecutar(request);
			
		} catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
	}

}
