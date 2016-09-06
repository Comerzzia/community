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
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.variables.ServicioVariables;
import com.comerzzia.servicios.core.variables.VariableConstraintViolationException;
import com.comerzzia.servicios.core.variables.VariableException;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.core.variables.ui.FormularioVariablesBean;

public class SalvarAccion extends Accion {

	/**
	 * Devuelve el nombre de la acción
	 * 
	 * @return String con el nombre de la acción
	 */
	public String getNombre() {
		return "salvar";
	}

	/**
	 * Ejecuta la acción
	 * 
	 * @param request
	 *            Datos de la petición
	 * @return Vista con la siguiente pagina a mostrar
	 */
	@SuppressWarnings("unchecked")
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion
					.getAttribute(WebKeys.DATOS_SESION);

			// Comprobamos los permisos de la acción
			PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
			if (!permisos.isPuedeAñadir() && !permisos.isPuedeEditar()) {
				return SIN_PERMISO;
			}

			// Obtenemos el formulario y salvamos o eliminamos las variables
			FormularioVariablesBean formulario = (FormularioVariablesBean) sesion.getAttribute(WebKeys.FORMULARIO_VARIABLES);
			List<VariableBean> variables = formulario.getRegistros();
			for (VariableBean variable : variables){
				if(variable.isEstadoBorrado())
					ServicioVariables.eliminar(variable.getIdVariable(), datosSesion);
				else
					ServicioVariables.grabarVariableNivelGeneral(variable.getIdVariable(), variable.getValor());
			}
			formulario.aceptar();

			setMensaje(request, "Las variables se han grabado correctamente");

			return getControlador().getAccion("verFormulario").ejecutar(request);
			
		} catch (VariableConstraintViolationException e) {
			setMensajeError(request, e.getMessage());
			return getControlador().getAccion("verFormulario").ejecutar(request);
		} catch (VariableException e) {
			setError(request, e);
			return ERROR_PAGE;
		} catch (Exception e) {
			e.printStackTrace();
			setError(request, e);
			return ERROR_PAGE;
		}
	}
}
