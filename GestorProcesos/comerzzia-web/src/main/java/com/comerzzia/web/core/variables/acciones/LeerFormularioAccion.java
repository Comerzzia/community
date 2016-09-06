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

package com.comerzzia.web.core.variables.acciones;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.core.variables.VariableBean;
import com.comerzzia.servicios.core.variables.Variables;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.log.Logger;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.core.variables.ui.FormularioVariablesBean;

public class LeerFormularioAccion extends Accion {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(LeerFormularioAccion.class);

	/**
	 * Devuelve el nombre de la acción
	 * 
	 * @return String con el nombre de la acción
	 */
	public String getNombre() {
		return "leerFormulario";
	}

	/**
	 * Ejecuta la acción
	 * 
	 * @param request
	 *            Datos de la petición
	 * @return Vista con la siguiente pagina a mostrar
	 */
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();

			// Obtenemos la operación solicitada
			String operacion = request.getParameter("operacion");
			String indice = request.getParameter("indice");
			log.debug("ejecutar() - operacion=" + operacion + " indice="
					+ indice);

			// Actualizamos el formulario
			FormularioVariablesBean formulario = (FormularioVariablesBean) sesion.getAttribute(WebKeys.FORMULARIO_VARIABLES);
			
			if (operacion != null) {
				// Editar formulario
				if(operacion.equals("editar")){
					return getControlador().getAccion("editar").ejecutar(request);
				}
				// Aceptar cambios del formulario
				else if (operacion.equals("aceptar")) {
					leerFormulario(formulario, request);
					return getControlador().getAccion("salvar").ejecutar(request);
				}
				// Cancelar cambios en el formulario
				else if (operacion.equals("cancelar")) {
					formulario.cancelar();
				}
			}

			// Mostramos el formulario
			return getControlador().getAccion("verFormulario").ejecutar(request);
			
		} catch (Exception e) {
			e.printStackTrace();
			setError(request, e);

			return ERROR_PAGE;
		}
	}

	/**
	 * Lee los campos del formulario principal y del formulario de la pestaña
	 * activa actualizando los atributos del registro activo
	 * 
	 * @param formulario
	 * @param request
	 */
	@SuppressWarnings("unchecked")
	private void leerFormulario(FormularioVariablesBean formulario,	HttpServletRequest request) {		
		List<VariableBean> variables = formulario.getRegistros();
		// Articulos
		leerVariablesArticulos(variables, request);
		// Tarifas
		leerVariablesTarifas(variables, request);
		// Sincronizador tiendas
		leerVariablesSincronizador(variables, request);
		// Tickets
		leerVariablesTickets(variables, request);
		// Conexión
		leerVariablesWS(variables, request);
	}
	
	private void leerVariablesArticulos(List<VariableBean> variables,	HttpServletRequest request){
		// Desglose1
		String desglose1 = request.getParameter("desglose1");
		if(!desglose1.equals(variables.get(0).getValorDefecto())){
			variables.get(0).setValor(desglose1);
			variables.get(0).setEstadoBean(Estado.MODIFICADO);
		}else{
			variables.get(0).setValor(null);
			variables.get(0).setEstadoBean(Estado.BORRADO);
		}
		// Desglose2
		String desglose2 = request.getParameter("desglose2");
		if(!desglose2.equals(variables.get(1).getValorDefecto())){
			variables.get(1).setValor(desglose2);
			variables.get(1).setEstadoBean(Estado.MODIFICADO);
		}else{
			variables.get(1).setValor(null);
			variables.get(1).setEstadoBean(Estado.BORRADO);
		}
		// Formato de los códigos de barras
		String formato = request.getParameter("formatoValor").equals(Variables.EAN13) ? Variables.EAN13 : Variables.EAN8;
		if(!formato.equals(variables.get(11).getValorDefecto())){
			variables.get(11).setValor(formato);
			variables.get(11).setEstadoBean(Estado.MODIFICADO);
		}else{
			variables.get(11).setValor(null);
			variables.get(11).setEstadoBean(Estado.BORRADO);
		}
	}
	
	private void leerVariablesTarifas(List<VariableBean> variables,	HttpServletRequest request){
		// Redondeo1
		String redondeo1 = request.getParameter("r1Desde") + "-" + request.getParameter("r1Hasta") 
				+ "-" + request.getParameter("r1Valor");
			
		if(!redondeo1.equals(variables.get(2).getValorDefecto())){
			variables.get(2).setValor(redondeo1);
			variables.get(2).setEstadoBean(Estado.MODIFICADO);
		}else{
			variables.get(2).setValor(null);
			variables.get(2).setEstadoBean(Estado.BORRADO);
		}	
		// Redondeo2
		String redondeo2 = request.getParameter("r2Desde") + "-" + request.getParameter("r2Hasta") 
				+ "-" + request.getParameter("r2Valor");
			
		if(!redondeo2.equals(variables.get(3).getValorDefecto())){
			variables.get(3).setValor(redondeo2);
			variables.get(3).setEstadoBean(Estado.MODIFICADO);
		}else{
			variables.get(3).setValor(null);
			variables.get(3).setEstadoBean(Estado.BORRADO);
		}
		// Redondeo3
		String redondeo3 = request.getParameter("r3Desde") + "-" + request.getParameter("r3Hasta") 
				+ "-" + request.getParameter("r3Valor");
			
		if(!redondeo3.equals(variables.get(4).getValorDefecto())){
			variables.get(4).setValor(redondeo3);
			variables.get(4).setEstadoBean(Estado.MODIFICADO);
		}else{
			variables.get(4).setValor(null);
			variables.get(4).setEstadoBean(Estado.BORRADO);
		}
	}
	
	private void leerVariablesSincronizador(List<VariableBean> variables,	HttpServletRequest request){
		// Arranque automatico
		String arranqueAuto = request.getParameter("arranqueAuto") == null ? "N" : "S";
		if(!arranqueAuto.equals(variables.get(5).getValorDefecto())){
			variables.get(5).setValor(arranqueAuto);
			variables.get(5).setEstadoBean(Estado.MODIFICADO);
		}else{
			variables.get(5).setValor(null);
			variables.get(5).setEstadoBean(Estado.BORRADO);
		}
		// Maximo de trabajos simultaneos
		String maxTrabajos = request.getParameter("maxTrabajos");
		if(!maxTrabajos.equals(variables.get(6).getValorDefecto())){
			variables.get(6).setValor(maxTrabajos);
			variables.get(6).setEstadoBean(Estado.MODIFICADO);
		}else{
			variables.get(6).setValor(null);
			variables.get(6).setEstadoBean(Estado.BORRADO);
		}
	}
	
	private void leerVariablesTickets(List<VariableBean> variables,	HttpServletRequest request){
		// Procesamiento automatico
		String ticketsAutomatico = request.getParameter("ticketsAutomatico") == null ? "N" : "S";
		if(!variables.get(7).getValorDefecto().equals(ticketsAutomatico)){
			variables.get(7).setValor(ticketsAutomatico);
			variables.get(7).setEstadoBean(Estado.MODIFICADO);
		}else{
			variables.get(7).setValor(null);
			variables.get(7).setEstadoBean(Estado.BORRADO);
		}
		// Tiempo
		String ticketsTiempo = request.getParameter("ticketsTiempo");
		if(!ticketsTiempo.equals(variables.get(8).getValorDefecto())){
			variables.get(8).setValor(ticketsTiempo);
			variables.get(8).setEstadoBean(Estado.MODIFICADO);
		}else{
			variables.get(8).setValor(null);
			variables.get(8).setEstadoBean(Estado.BORRADO);
		}
		// Usa descuento en linea
		String ticketsUsa = request.getParameter("ticketsUsa") == null ? "N" : "S";
		if(!ticketsUsa.equals(variables.get(9).getValorDefecto())){
			variables.get(9).setValor(ticketsUsa);
			variables.get(9).setEstadoBean(Estado.MODIFICADO);
		}else{
			variables.get(9).setValor(null);
			variables.get(9).setEstadoBean(Estado.BORRADO);
		}
	}
	
	private void leerVariablesWS(List<VariableBean> variables,	HttpServletRequest request){
		// Webservice
		String webservice = request.getParameter("webservice");
		if(!webservice.equals(variables.get(10).getValorDefecto())){
			variables.get(10).setValor(webservice);
			variables.get(10).setEstadoBean(Estado.MODIFICADO);
		}else{
			variables.get(10).setValor(null);
			variables.get(10).setEstadoBean(Estado.BORRADO);
		}
	}
}
