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

package com.comerzzia.web.backoffice.regularizaciones.acciones;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.core.informes.TrabajoInformeBean;
import com.comerzzia.servicios.core.informes.InformeException;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.web.base.InformeAccion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class ImprimirAccion extends InformeAccion {
	
	private static final String CODALMACEN_SELECCIONADO = "CODALMACEN_SELECCIONADO";

	public String getNombreInforme() {
		return "almacenes.lstRegularizacionAlmacen";
	}
	
	public Vista nuevoInforme(HttpServletRequest request, TrabajoInformeBean trabajoInforme) {
		return new Vista("backoffice/regularizaciones/buscar/jsp/imprimir.jsp", Vista.INTERNA);
	}
	
	public void imprimirInforme(HttpServletRequest request, TrabajoInformeBean trabajoInforme) 
			throws InformeException {
		
		HttpSession sesion = request.getSession();
		DatosSesionBean datosSesion = (DatosSesionBean) sesion
				.getAttribute(WebKeys.DATOS_SESION);

		if (request.getParameter("soloActivos")!=null){
			trabajoInforme.addParametro("ACTIVO", "S");
		}
//		ALMACEN
		trabajoInforme.addParametro("CODALM_DESDE", (String) datosSesion.getAtributos().get(CODALMACEN_SELECCIONADO));
		trabajoInforme.addParametro("CODALM_HASTA", (String) datosSesion.getAtributos().get(CODALMACEN_SELECCIONADO));
		
//		CONCEPTO DE ALMACEN
		if (request.getParameter("codConceptoAlmacenDesde").isEmpty()){
			trabajoInforme.addParametro("CODCONALM_DESDE", "0");
		}
		else{
			trabajoInforme.addParametro("CODCONALM_DESDE", request.getParameter("codConceptoAlmacenDesde"));
		}
		if (request.getParameter("codConceptoAlmacenHasta").isEmpty()){
			trabajoInforme.addParametro("CODCONALM_HASTA", "ZZZZ");
		}
		else{
			trabajoInforme.addParametro("CODCONALM_HASTA", request.getParameter("codConceptoAlmacenHasta"));
		}
		
//		FECHA
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
			e.printStackTrace();
		}
	}
	
}
