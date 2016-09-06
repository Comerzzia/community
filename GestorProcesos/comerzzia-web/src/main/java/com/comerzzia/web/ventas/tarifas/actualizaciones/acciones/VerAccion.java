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

package com.comerzzia.web.ventas.tarifas.actualizaciones.acciones;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.ventas.tarifas.actualizaciones.ActualizacionTarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.actualizaciones.articulos.ArticuloActualizacionBean;
import com.comerzzia.persistencia.ventas.tarifas.actualizaciones.articulos.ParametrosBuscarArticulosActualizacionesBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.ActualizacionTarifaException;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.ActualizacionTarifaNotFoundException;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.ServicioActualizacionesTarifas;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.articulos.ServicioArticulosActualizaciones;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.tarifas.actualizaciones.iu.FormularioActualizacionBean;

public class VerAccion extends Accion {

	public String getNombre() {
		return "ver";
	}
	
	@SuppressWarnings("unchecked")
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);

    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeEjecutar()) {
    			return SIN_PERMISO;
    		}

			// Obtenemos la actualizacion
			String idActualizacion = request.getParameter(WebKeys.ID_OBJETO);
			ActualizacionTarifaBean actualizacion = ServicioActualizacionesTarifas.consultar(Long.parseLong(idActualizacion), datosSesion);

    		// Inicalizamos el formulario
    		FormularioActualizacionBean formulario = (FormularioActualizacionBean) sesion.getAttribute(WebKeys.FORMULARIO_ACTUALIZACION_TARIFA);
    		formulario.inicializar(actualizacion);

    		// consultamos artículos
    		ParametrosBuscarArticulosActualizacionesBean param = (ParametrosBuscarArticulosActualizacionesBean)formulario.getPestaña(0).getParam();
			PaginaResultados paginaResultados = ServicioArticulosActualizaciones.consultar(param, datosSesion); 
			actualizacion.setArticulosActualizacion((List<ArticuloActualizacionBean>) paginaResultados.getPagina());
			if (param.getTamañoPagina() < paginaResultados.getTotalResultados()){
				setMensajeAviso(request, "El número de registros obtenido en la consulta es mayor al número de resultados especificado. Sólo se muestran los " + param.getTamañoPagina() + " primeros registros.  ");
			}
			formulario.getFormularioPestañaActiva().setRegistros(actualizacion.getArticulosActualizacion());
			actualizacion.setArticulosCargados(true);

    		// Mostramos el formulario
    		return getControlador().getAccion("verFormulario").ejecutar(request);
		} 
		catch (ActualizacionTarifaNotFoundException e) {
			// Si no se encuentra el registro volvemos al buscador y enviamos en
			// mensaje de error
			setMensajeError(request, "No se ha encontrado el registro", e);
			return getControlador().getAccion("buscar").ejecutar(request);
		} 
		catch (ActualizacionTarifaException e) {
			setError(request, e);
			return ERROR_PAGE;
		} 
		catch (Exception e) {
			e.printStackTrace();
			setError(request, e);
			return ERROR_PAGE;
		}
	}

}
