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

package com.comerzzia.web.compras.estadisticas.acciones;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import com.comerzzia.persistencia.core.informes.TrabajoInformeBean;
import com.comerzzia.servicios.core.informes.InformeException;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.web.base.InformeAccion;
import com.comerzzia.web.base.Vista;

public class ImprimirAccion extends InformeAccion {

	@Override
	public String getNombreInforme() {
		return "compras.estadisticas.lstSituacionCompras";
	}
	
	@Override
	public Vista nuevoInforme(HttpServletRequest request,
			TrabajoInformeBean trabajoInforme) {
		return new Vista("compras/estadisticas/buscar/jsp/imprimir.jsp", Vista.INTERNA);
	}

	@Override
	public void imprimirInforme(HttpServletRequest request, TrabajoInformeBean trabajoInforme) throws InformeException {
		
		if (request.getParameter("soloActivos")!=null){
			trabajoInforme.addParametro("ACTIVO", "S");
		}
		
		//Fechas
		Date hoy = new Date();
		try {
			
			if (request.getParameter("fechaDesde").isEmpty()){
				trabajoInforme.addParametro("FECHA_DESDE", Fechas.sumaDias(hoy, -30));
			}
			else{
				Date fechaDesde = Fechas.getFecha(request.getParameter("fechaDesde"));				
				trabajoInforme.addParametro("FECHA_DESDE", fechaDesde);
			}
			if (request.getParameter("fechaHasta").isEmpty()){
				trabajoInforme.addParametro("FECHA_HASTA", hoy);
			}
			else{
				Date fechaHasta = Fechas.getFecha(request.getParameter("fechaHasta"));
				trabajoInforme.addParametro("FECHA_HASTA", fechaHasta);
			}
		} catch (FechaException e) {
			// TODO -- controlar excepcion de fechas --
			e.printStackTrace();
		}
		
		//Proveedores
		if (request.getParameter("codProDesde").isEmpty()){
			trabajoInforme.addParametro("CODPRO_DESDE", "0");
		}
		else{
			trabajoInforme.addParametro("CODPRO_DESDE", request.getParameter("codProDesde"));
		}
		if (request.getParameter("codProHasta").isEmpty()){
			trabajoInforme.addParametro("CODPRO_HASTA", "ZZZZ");
		}
		else{
			trabajoInforme.addParametro("CODPRO_HASTA", request.getParameter("codProHasta"));
		}
		
		//Artículos
		if (request.getParameter("codArtDesde").isEmpty()){
			trabajoInforme.addParametro("CODART_DESDE", "0");
		}
		else{
			trabajoInforme.addParametro("CODART_DESDE", request.getParameter("codArtDesde"));
		}
		if (request.getParameter("codArtHasta").isEmpty()){
			trabajoInforme.addParametro("CODART_HASTA", "ZZZZ");
		}
		else{
			trabajoInforme.addParametro("CODART_HASTA", request.getParameter("codArtHasta"));
		}
		
		//Familias
		if (request.getParameter("codFamDesde").isEmpty()){
			trabajoInforme.addParametro("CODFAM_DESDE", "0");
		}
		else{
			trabajoInforme.addParametro("CODFAM_DESDE", request.getParameter("codFamDesde"));
		}
		if (request.getParameter("codFamHasta").isEmpty()){
			trabajoInforme.addParametro("CODFAM_HASTA", "ZZZZ");
		}
		else{
			trabajoInforme.addParametro("CODFAM_HASTA", request.getParameter("codFamHasta"));
		}

	}
}
