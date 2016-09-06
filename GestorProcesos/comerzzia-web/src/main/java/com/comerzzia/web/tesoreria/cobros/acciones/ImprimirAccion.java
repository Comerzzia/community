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

package com.comerzzia.web.tesoreria.cobros.acciones;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.comerzzia.persistencia.core.informes.TrabajoInformeBean;
import com.comerzzia.servicios.core.informes.InformeException;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.web.base.InformeAccion;
import com.comerzzia.web.base.Vista;

public class ImprimirAccion extends InformeAccion {

	public String getNombreInforme() {
		return "tesoreria.cobros.lstCobros";
	}
	
	public Vista nuevoInforme(HttpServletRequest request, TrabajoInformeBean trabajoInforme) {
		return new Vista("tesoreria/cobros/buscar/jsp/imprimir.jsp", Vista.INTERNA);
	}
	
	public void imprimirInforme(HttpServletRequest request, TrabajoInformeBean trabajoInforme) 
			throws InformeException {
		//cliente
		if (request.getParameter("codClienteDesde").isEmpty()){
			trabajoInforme.addParametro("CODCLI_DESDE", "0");
		}
		else{
			trabajoInforme.addParametro("CODCLI_DESDE", request.getParameter("codClienteDesde"));
		}
		if (request.getParameter("codClienteHasta").isEmpty()){
			trabajoInforme.addParametro("CODCLI_HASTA", "ZZZZZZZZZZZ");
		}
		else{
			trabajoInforme.addParametro("CODCLI_HASTA", request.getParameter("codClienteHasta"));
		}
		
		//Fechas
		Date hoy = new Date();
		try {
			
			if (request.getParameter("fechaVencimientoDesde").isEmpty()){
				trabajoInforme.addParametro("FECHA_VENCIMIENTO_DESDE", Fechas.sumaDias(hoy, -30));
			}
			else{
				Date fechaDesde = Fechas.getFecha(request.getParameter("fechaVencimientoDesde"));				
				trabajoInforme.addParametro("FECHA_VENCIMIENTO_DESDE", fechaDesde);
			}
			if (request.getParameter("fechaVencimientoHasta").isEmpty()){
				trabajoInforme.addParametro("FECHA_VENCIMIENTO_HASTA", hoy);
			}
			else{
				Date fechaHasta = Fechas.getFecha(request.getParameter("fechaVencimientoHasta"));
				trabajoInforme.addParametro("FECHA_VENCIMIENTO_HASTA", fechaHasta);
			}
		} catch (FechaException e) {
			// TODO -- controlar excepcion de fechas --
			e.printStackTrace();
		}
		
		//Tipo efecto
		if (request.getParameter("codTipoEfectoDesde").isEmpty()){
			trabajoInforme.addParametro("CODTIPOEFEC_DESDE", "0");
		}
		else{
			trabajoInforme.addParametro("CODTIPOEFEC_DESDE", request.getParameter("codTipoEfectoDesde"));
		}
		if (request.getParameter("codTipoEfectoHasta").isEmpty()){
			trabajoInforme.addParametro("CODTIPOEFEC_HASTA", "ZZ");
		}
		else{
			trabajoInforme.addParametro("CODTIPOEFEC_HASTA", request.getParameter("codTipoEfectoHasta"));
		}
		
		//Serie
		if (request.getParameter("codSerieDesde").isEmpty()){
			trabajoInforme.addParametro("CODSERIE_DESDE", "0");
		}
		else{
			trabajoInforme.addParametro("CODSERIE_DESDE", request.getParameter("codSerieDesde"));
		}
		if (request.getParameter("codSerieHasta").isEmpty()){
			trabajoInforme.addParametro("CODSERIE_HASTA", "ZZZZZ");
		}
		else{
			trabajoInforme.addParametro("CODSERIE_HASTA", request.getParameter("codSerieHasta"));
		}
		
	}

}
