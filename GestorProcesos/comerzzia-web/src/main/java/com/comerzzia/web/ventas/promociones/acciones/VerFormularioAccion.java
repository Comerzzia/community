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

package com.comerzzia.web.ventas.promociones.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.ventas.promociones.PromocionBean;
import com.comerzzia.persistencia.ventas.promociones.articulos.ParametrosBuscarArticulosPromocionesBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.promociones.articulos.ServicioArticulosPromociones;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.promociones.ui.FormularioPromocionBean;

public class VerFormularioAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("ventas/promociones/mantenimiento/jsp/promocion.jsp", Vista.INTERNA);

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
			FormularioPromocionBean formulario = (FormularioPromocionBean) sesion.getAttribute(WebKeys.FORMULARIO_PROMOCION);
			inicializaPestañaActiva(formulario, datosSesion);
			
			return NEXT_PAGE;
		}
		catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
		}
	}
	
	
	private void inicializaPestañaActiva(FormularioPromocionBean formulario, DatosSesionBean datosSesion) throws Exception {
		if(!formulario.isEnInsercion()){
			// Obtenemos la promocion
			PromocionBean promocion = (PromocionBean) formulario.getRegistroActivo();
			// Añadimos el idPromocion a los parametros de busqueda
			ParametrosBuscarArticulosPromocionesBean param = (ParametrosBuscarArticulosPromocionesBean) formulario.getFormularioPestañaActiva().getParam();
			param.setIdPromocion(promocion.getIdPromocion());
			
			if(!promocion.isArticulosCargados()){
				promocion.setArticulos(ServicioArticulosPromociones.consultarArticulosPromocion(param, datosSesion));
				promocion.setArticulosCargados(true);
				formulario.getFormularioPestañaActiva().setRegistros(promocion.getArticulos());
			}
		}
	}
}
