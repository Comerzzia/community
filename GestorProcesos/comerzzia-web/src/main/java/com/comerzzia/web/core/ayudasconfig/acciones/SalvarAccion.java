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
import com.comerzzia.servicios.core.ayudasconfig.AyudaConfigConstraintViolationException;
import com.comerzzia.servicios.core.ayudasconfig.AyudaConfigException;
import com.comerzzia.servicios.core.ayudasconfig.ServicioAyudasConfig;
import com.comerzzia.servicios.core.ayudasconfig.XMLAyudaConfigException;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.core.ayudasconfig.ui.FormularioAyudaConfigBean;

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
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);

			// Comprobamos los permisos de la acción
			PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
			if (!permisos.isPuedeAñadir() && !permisos.isPuedeEditar()) {
				return SIN_PERMISO;
			}

			// Obtenemos la ayuda del formulario y lo salvamos
			FormularioAyudaConfigBean formulario = (FormularioAyudaConfigBean) sesion.getAttribute(WebKeys.FORMULARIO_AYUDAS_CONFIG);
			AyudaConfigBean ayuda = (AyudaConfigBean) formulario.getRegistroActivo();
			ServicioAyudasConfig.salvar(ayuda);
			formulario.aceptar();

			setMensaje(request, "La ayuda se ha grabado correctamente");

			// Consultamos la ayuda e inicializamos el formulario
			try {
				ayuda = ServicioAyudasConfig.consultar(ayuda.getNombre());
				formulario.inicializar(ayuda);
			} catch (Exception e) {
				setMensajeError(request,"Se ha producido un error al acceder al registro");
				return getControlador().getAccion("buscar").ejecutar(request);
			}

			return getControlador().getAccion("verFormulario").ejecutar(request);
			
		} 
		catch (XMLAyudaConfigException e) {
			setMensajeError(request, e.getMessage());

			return getControlador().getAccion("verFormulario").ejecutar(request);
		}
		catch (AyudaConfigConstraintViolationException e) {
			setMensajeError(request, e.getMessage());

			return getControlador().getAccion("verFormulario").ejecutar(request);
			
		} catch (AyudaConfigException e) {
			setError(request, e);

			return ERROR_PAGE;
		} catch (Exception e) {
			e.printStackTrace();
			setError(request, e);

			return ERROR_PAGE;
		}
	}
}
