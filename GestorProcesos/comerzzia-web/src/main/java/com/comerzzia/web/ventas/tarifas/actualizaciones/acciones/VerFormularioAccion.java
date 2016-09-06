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
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.tarifas.actualizaciones.articulos.ServicioArticulosActualizaciones;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.tarifas.actualizaciones.iu.FormularioActualizacionBean;

public class VerFormularioAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("ventas/tarifas/actualizaciones/mantenimiento/jsp/actualizacion.jsp", Vista.INTERNA);
	
	public String getNombre() {
		return "verFormulario";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
			
			// Actualizamos el formulario
			FormularioActualizacionBean formulario = (FormularioActualizacionBean) sesion.getAttribute(WebKeys.FORMULARIO_ACTUALIZACION_TARIFA);
			inicializaPestañaActiva(formulario, datosSesion, request);
			
			return NEXT_PAGE;
		}
		catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
		}
	}
	
	@SuppressWarnings("unchecked")
	private void inicializaPestañaActiva(FormularioActualizacionBean formulario, DatosSesionBean datosSesion, HttpServletRequest request) throws Exception {
		// Obtenemos la tarifa
		ActualizacionTarifaBean actualizacion = (ActualizacionTarifaBean) formulario.getRegistroActivo();
		
		// Actualizamos la pestaña activa
		switch (formulario.getPestañaActiva()) {
			case 0: 
				ParametrosBuscarArticulosActualizacionesBean param = (ParametrosBuscarArticulosActualizacionesBean)formulario.getFormularioPestañaActiva().getParam();
				if (!formulario.isEditable()){
					if (formulario.getFormularioPestañaActiva().isModoVisualizacionTabla()){
						// Tendremos que realizar la búsqueda de artículos
						PaginaResultados paginaResultados = ServicioArticulosActualizaciones.consultar(param, datosSesion); 
						actualizacion.setArticulosActualizacion((List<ArticuloActualizacionBean>) paginaResultados.getPagina());
						if (param.getTamañoPagina() < paginaResultados.getTotalResultados()){
							setMensajeAviso(request, "El número de registros obtenido en la consulta es mayor al número de resultados especificado. Sólo se muestran los " + param.getTamañoPagina() + " primeros registros.  ");
						}
						formulario.getFormularioPestañaActiva().setRegistros(actualizacion.getArticulosActualizacion());
					}
				}
				break;
		}
	}

}
