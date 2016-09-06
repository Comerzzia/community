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

package com.comerzzia.web.ventas.tarifas.acciones;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ParametrosBuscarArticulosTarifaBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.tarifas.articulos.ServicioArticulosTarifas;
import com.comerzzia.util.paginacion.PaginaResultados;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.tarifas.iu.FormularioTarifaBean;


public class VerFormularioAccion extends Accion {
	
	private static final Vista NEXT_PAGE = new Vista("ventas/tarifas/mantenimiento/jsp/tarifa.jsp", Vista.INTERNA);

	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
	public String getNombre() {
		return "verFormulario";
	}
	
	/**
     * Ejecuta la acción
     * @param request Datos de la petición
     * @return Vista con la siguiente pagina a mostrar
     */
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
			
			// Actualizamos el formulario
			FormularioTarifaBean formulario = (FormularioTarifaBean) sesion.getAttribute(WebKeys.FORMULARIO_TARIFA);
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
	private void inicializaPestañaActiva(FormularioTarifaBean formulario, DatosSesionBean datosSesion, HttpServletRequest request) throws Exception {
		// Obtenemos la tarifa
		TarifaBean tarifa = (TarifaBean) formulario.getRegistroActivo();
		
		// Actualizamos la pestaña activa
		switch (formulario.getPestañaActiva()) {
			case 0: 
				ParametrosBuscarArticulosTarifaBean param = (ParametrosBuscarArticulosTarifaBean)formulario.getFormularioPestañaActiva().getParam();
				if (!formulario.isEditable()){
					if (formulario.getFormularioPestañaActiva().isModoVisualizacionTabla()){
						// Tendremos que realizar la búsqueda de artículos
						PaginaResultados paginaResultados = ServicioArticulosTarifas.consultar(param, datosSesion); 
						tarifa.setArticulos((List<ArticuloTarifaBean>) paginaResultados.getPagina());
						if (param.getTamañoPagina() < paginaResultados.getTotalResultados()){
							setMensajeAviso(request, "El número de registros obtenido en la consulta es mayor al número de resultados especificado. Sólo se muestran los " + param.getTamañoPagina() + " primeros registros.  ");
						}
						formulario.getFormularioPestañaActiva().setRegistros(tarifa.getArticulos());
					}
				}
				break;
		}
	}
}
