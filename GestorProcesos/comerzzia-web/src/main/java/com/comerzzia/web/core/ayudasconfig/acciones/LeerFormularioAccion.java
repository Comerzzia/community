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

package com.comerzzia.web.core.ayudasconfig.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.core.ayudasconfig.AyudaConfigBean;
import com.comerzzia.servicios.core.ayudas.Ayudas;
import com.comerzzia.servicios.core.ayudasconfig.ServicioAyudasConfig;
import com.comerzzia.util.log.Logger;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.core.ayudasconfig.ui.FormularioAyudaConfigBean;

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
	 * @param request Datos de la petición
	 * @return Vista con la siguiente pagina a mostrar
	 */
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();

			// Obtenemos la operación solicitada
			String operacion = request.getParameter("operacion");
			String indice = request.getParameter("indice");
			log.debug("ejecutar() - operacion=" + operacion + " indice=" + indice);

			// Actualizamos el formulario
			FormularioAyudaConfigBean formulario = (FormularioAyudaConfigBean) sesion.getAttribute(WebKeys.FORMULARIO_AYUDAS_CONFIG);
			if (operacion == null || !operacion.equals("cancelar")) {
				leerFormulario(formulario, request);
			}

			if (operacion != null) {
				// Aceptar cambios del formulario
				if (operacion.equals("aceptar")) {
					return getControlador().getAccion("salvar").ejecutar(request);
				}
				// Cancelar cambios en el formulario
				else if (operacion.equals("cancelar")) {
					formulario.cancelar();

					// Si no tenemos registro activo volvemos al buscador
					if (formulario.isRegistroActivoVacio()) {
						return getControlador().getAccion("buscar").ejecutar(request);
					} 
					else {
						// Obtenemos la ayuda y la actualizamos en el formulario
						AyudaConfigBean ayuda = (AyudaConfigBean) formulario.getRegistroActivo();
						ayuda = ServicioAyudasConfig.consultar(ayuda.getNombre());
						formulario.inicializar(ayuda);
					}
				}
				else if (operacion.equals("borrarCache")) {
					Ayudas.getInstance().borrarCache();
					setMensaje(request, "Se ha borrado la caché de ayudas del sistema");
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
	private void leerFormulario(FormularioAyudaConfigBean formulario, HttpServletRequest request) {
		AyudaConfigBean ayuda = (AyudaConfigBean) formulario.getRegistroActivo();

		if (formulario.isEnInsercion()) {
			ayuda.setNombre(request.getParameter("nombre"));
		}

		if (formulario.isEditable()) {
			ayuda.setXmlAyuda(request.getParameter("xmlAyuda"));
		}
	}
}
