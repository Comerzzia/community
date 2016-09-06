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

package com.comerzzia.web.backoffice.cambiosArticulosTarifas.acciones.tarifas;

import javax.servlet.http.HttpServletRequest;

import com.comerzzia.persistencia.core.informes.TrabajoInformeBean;
import com.comerzzia.servicios.core.informes.InformeException;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.web.base.InformeAccion;
import com.comerzzia.web.base.Vista;

public class ImprimirAccion extends InformeAccion {

	public String getNombreInforme() {
		return "backoffice.articulos.lstCambiosTarifas";
	}

	public Vista nuevoInforme(HttpServletRequest request,
			TrabajoInformeBean trabajoInforme) {
		return new Vista("backoffice/cambiosArticulosTarifas/buscar/tarifas/jsp/imprimir.jsp", Vista.INTERNA);
	}
	
	public void imprimirInforme(HttpServletRequest request,
			TrabajoInformeBean trabajoInforme) throws InformeException {

		try {
			trabajoInforme.addParametro("CODALM", request.getParameter("codAlm"));
			trabajoInforme.addParametro("CODTAR", request.getParameter("codTarifa"));
			trabajoInforme.addParametro("VERSION_TARIFA_REV", request.getParameter("versionTarifaRev"));
			trabajoInforme.addParametro("FECHA_VERSION_ARTICULOS_REV", Fechas.getFecha(request.getParameter("fechaVersionTarifaRev")));
		} catch (FechaException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
