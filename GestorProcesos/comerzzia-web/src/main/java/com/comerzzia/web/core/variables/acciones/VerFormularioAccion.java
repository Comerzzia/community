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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.variables.ServicioVariables;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.core.variables.ui.FormularioVariablesBean;

public class VerFormularioAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("core/variables/mantenimiento/jsp/variables.jsp", Vista.INTERNA);

	/**
	 * Devuelve el nombre de la acción
	 * 
	 * @return String con el nombre de la acción
	 */
	public String getNombre() {
		return "verFormulario";
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
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);

			// Actualizamos el formulario
			FormularioVariablesBean formulario = (FormularioVariablesBean) sesion.getAttribute(WebKeys.FORMULARIO_VARIABLES);
			inicializaFormulario(formulario, datosSesion, request);

			return NEXT_PAGE;
		} 
		catch (Exception e) {
			e.printStackTrace();
			setError(request, e);

			return ERROR_PAGE;
		}
	}

	private void inicializaFormulario(FormularioVariablesBean formulario,	
			DatosSesionBean datosSesion, HttpServletRequest request) throws Exception {
		
		if(formulario.getRegistros().isEmpty()){
			formulario.setRegistros(ServicioVariables.obtenerVariables());
		}
	}
}
