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

package com.comerzzia.web.backoffice.ventas.pedidos.acciones;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.core.informes.TrabajoInformeBean;
import com.comerzzia.persistencia.ventas.pedidos.ParametrosBuscarPedidosVentasBean;
import com.comerzzia.servicios.core.informes.InformeException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.web.base.InformeAccion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class ImprimirListadoPedidosAccion extends InformeAccion {

	public String getNombreInforme() {
		return "backoffice.aprovisionamientos.lstAprovisionamientos";
	}
	
	public Vista nuevoInforme(HttpServletRequest request, TrabajoInformeBean trabajoInforme) {
		// Inicializar datos del formulario de lanzamiento del informe
		Date hoy = new Date();
		request.setAttribute("fechaDesde", Fechas.sumaDias(hoy, -30));
		request.setAttribute("fechaHasta", hoy);
		
		
		return new Vista("backoffice/ventas/pedidos/buscar/jsp/imprimir.jsp", Vista.INTERNA);
	}
	
	public void imprimirInforme(HttpServletRequest request, TrabajoInformeBean trabajoInforme)throws InformeException {
		//Cogemos el codcli de la sesión
		HttpSession sesion = request.getSession();
		ParametrosBuscarPedidosVentasBean param = (ParametrosBuscarPedidosVentasBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_PEDIDOS_VENTAS_BACKOFFICE);
		//CODCLI
		trabajoInforme.addParametro("CODCLI", param.getCodCliente());

		// Concepto de Almacén desde
		if (request.getParameter("codConceptoAlmacenDesde").isEmpty()){
			trabajoInforme.addParametro("CODCONALM_DESDE", "0");
		}
		else{
			trabajoInforme.addParametro("CODCONALM_DESDE", request.getParameter("codConceptoAlmacenDesde"));
		}
		// Concepto de Almacén hasta
		if (request.getParameter("codConceptoAlmacenHasta").isEmpty()){
			trabajoInforme.addParametro("CODCONALM_HASTA", "ZZZZ");
		}
		else{
			trabajoInforme.addParametro("CODCONALM_HASTA", request.getParameter("codConceptoAlmacenHasta"));
		}
		
		try{
			//FechaDesde
			if (request.getParameter("fechaDesde").isEmpty()){
				trabajoInforme.addParametro("FECHA_DESDE", null);
			}
			else{
				Date fechaDesde = Fechas.getFecha(request.getParameter("fechaDesde"));				
				trabajoInforme.addParametro("FECHA_DESDE", fechaDesde);
			}

			//FechaHasta
			if (request.getParameter("fechaHasta").isEmpty()){
				trabajoInforme.addParametro("FECHA_HASTA", null);
			}
			else{
				Date fechaHasta = Fechas.getFecha(request.getParameter("fechaHasta"));
				trabajoInforme.addParametro("FECHA_HASTA", fechaHasta);
			}
			
		}
		catch (Exception e) {
			log.error(e.getMessage());
		}
	}
}
