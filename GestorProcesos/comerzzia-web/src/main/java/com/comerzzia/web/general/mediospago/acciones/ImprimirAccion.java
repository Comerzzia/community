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

package com.comerzzia.web.general.mediospago.acciones;

import javax.servlet.http.HttpServletRequest;

import com.comerzzia.persistencia.core.informes.TrabajoInformeBean;
import com.comerzzia.servicios.core.informes.InformeException;
import com.comerzzia.web.base.InformeAccion;
import com.comerzzia.web.base.Vista;

public class ImprimirAccion extends InformeAccion {

	public String getNombreInforme() {
		return "general.medio_pago.lstmediospago";
	}
	
	public Vista nuevoInforme(HttpServletRequest request, TrabajoInformeBean trabajoInforme) {
		return new Vista("general/medios_pago/buscar/jsp/imprimir.jsp", Vista.INTERNA);
	}
	
	public void imprimirInforme(HttpServletRequest request, TrabajoInformeBean trabajoInforme) 
			throws InformeException {
		if (request.getParameter("soloActivos") != null){
			trabajoInforme.addParametro("ACTIVO", "S");
		}
		if (request.getParameter("desMedioPagoDesde").isEmpty()){
			trabajoInforme.addParametro("DESMEDPAG_DESDE", "0");
		}
		else{
			trabajoInforme.addParametro("DESMEDPAG_DESDE", request.getParameter("desMedioPagoDesde"));
		}
		if (request.getParameter("desMedioPagoHasta").isEmpty()){
			trabajoInforme.addParametro("DESMEDPAG_HASTA", "ZZZZ");
		}
		else{
			trabajoInforme.addParametro("DESMEDPAG_HASTA", request.getParameter("desMedioPagoHasta"));
		}
	}
}
