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

package com.comerzzia.web.general.tiendas.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.tiendas.Tienda;
import com.comerzzia.servicios.general.tiendas.tarifas.ServicioTarifasTiendas;
import com.comerzzia.servicios.general.tiendas.usuarios.ServicioAlmacenesUsuarios;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.general.tiendas.ui.FormularioTiendaBean;

public class VerFormularioAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista(
			"general/tiendas/mantenimiento/jsp/tienda.jsp", Vista.INTERNA);

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
			FormularioTiendaBean formulario = (FormularioTiendaBean) sesion.getAttribute(WebKeys.FORMULARIO_TIENDA);
			inicializaPestañaActiva(formulario, datosSesion, request);

			return NEXT_PAGE;
		} catch (Exception e) {
			e.printStackTrace();
			setError(request, e);

			return ERROR_PAGE;
		}
	}

	private void inicializaPestañaActiva(FormularioTiendaBean formulario,
			DatosSesionBean datosSesion, HttpServletRequest request)
			throws Exception {
		// Obtenemos la tienda
		Tienda tienda = (Tienda) formulario.getRegistroActivo();

		// Actualizamos la pestaña activa
		switch (formulario.getPestañaActiva()) {
			case 1: // Las pestaña de cajas se quitó del interfaz
//				if (!tienda.isCajasCargadas()) {
//					tienda.setCajas(ServicioCajas.consultarCaja(tienda.getCodAlm(),
//							datosSesion));
//					tienda.setCajasCargadas(true);
//					formulario.getFormularioPestañaActiva().setRegistros(
//							tienda.getCajas());
//				}
				break;
			case 2:
				if (!tienda.isTarifasCargadas()) {
					tienda.setTarifas(ServicioTarifasTiendas.consultar(tienda
							.getCodAlm(), datosSesion));
					tienda.setTarifasCargadas(true);
	
					formulario.getFormularioPestañaActiva().setRegistros(
							tienda.getTarifas());
				}
				request.setAttribute("lstTarifasDisponibles", formulario.obtenerListaTarifasDisponibles(datosSesion));			
			case 3:
				if(!tienda.isConfiguracionCargada()){
					tienda.cargarConfiguracion();
					tienda.setConfiguracionCargada(true);
				}
				break;
			case 4:
				if(!tienda.isUsuariosCargados()){
					tienda.setUsuarios(ServicioAlmacenesUsuarios.consultar(tienda.getCodAlm(), datosSesion));
					tienda.setUsuariosCargados(true);
					formulario.getFormularioPestañaActiva().setRegistros(tienda.getUsuarios());
				}
				request.setAttribute("lstUsuariosDisponibles", formulario.obtenerListaUsuariosDisponibles());
				break;
		}
	}
}
