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

package com.comerzzia.web.backoffice.articulos.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.servicios.core.login.ServicioLogin;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.variables.ServicioVariables;
import com.comerzzia.servicios.core.variables.Variables;
import com.comerzzia.web.backoffice.articulos.ui.FormularioConsultaArticulosBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class EjecutarAccion extends Accion {

	private static final String CODALMACEN_SELECCIONADO = "CODALMACEN_SELECCIONADO";

	/**
	 * Devuelve el nombre de la acción
	 * 
	 * @return String con el nombre de la acción
	 */
	public String getNombre() {
		return "ejecutar";
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

			// Comprobamos los permisos de la acción
			PermisosEfectivosAccionBean permisos = datosSesion.getPermisos(this.getAccionMenu());
			if (!permisos.isPuedeEjecutar()) {
				return SIN_PERMISO;
			}

			// Comprobamos el número de tiendas que tiene asociado el usuario
			int numeroTiendas = ServicioLogin.numeroAlmacenesUsuario(datosSesion);

			if (numeroTiendas == 0) {
				return SIN_ALMACEN;
			}

			// Inicializamos el formulario
			FormularioConsultaArticulosBean formulario = (FormularioConsultaArticulosBean) sesion.getAttribute(WebKeys.FORMULARIO_CONSULTA_ARTICULOS);

			if (formulario == null) {
				formulario = new FormularioConsultaArticulosBean();
				formulario.setRegistros(null);
				
				// Establecer los títulos de los campos de desglose a partir de
				// sus respectivas variables
				try {
					formulario.setTituloDesglose1(ServicioVariables.consultarValor(Variables.ARTICULOS_DESGLOSE1_TITULO));
				} catch (Exception e) {
					formulario.setTituloDesglose1("");
					e.printStackTrace();
				}
				try {
					formulario.setTituloDesglose2(ServicioVariables.consultarValor(Variables.ARTICULOS_DESGLOSE2_TITULO));
				} catch (Exception e) {
					formulario.setTituloDesglose2("");
					e.printStackTrace();
				}
			}
			
			formulario.setPestañaActiva(0);
			formulario.setModoVisualizacionTabla();
			
			sesion.setAttribute(WebKeys.FORMULARIO_CONSULTA_ARTICULOS, formulario);

			
			String codAlmacenSeleccionado = (String) datosSesion.getAtributos().get(CODALMACEN_SELECCIONADO);
			if (codAlmacenSeleccionado == null && numeroTiendas > 1) {
				return new Vista("seleccionAlmacen?accion=obtenerAlmacenes", Vista.INTERNA);
			}
			else {
				return getControlador().getAccion("verFormulario").ejecutar(request);
			}
		} catch (Exception e) {
			e.printStackTrace();
			setError(request, e);

			return ERROR_PAGE;
		}
	}
}
