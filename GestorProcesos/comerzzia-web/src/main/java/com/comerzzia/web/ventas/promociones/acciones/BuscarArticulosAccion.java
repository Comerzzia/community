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

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean;
import com.comerzzia.persistencia.ventas.promociones.articulos.ParametrosBuscarArticulosPromocionesBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.promociones.articulos.ArticuloPromocionException;
import com.comerzzia.servicios.ventas.promociones.articulos.ServicioArticulosPromociones;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.promociones.ui.FormularioPromocionBean;

public class BuscarArticulosAccion extends Accion {

	public String getNombre() {
		return "buscarArticulos";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		
		try {
    		HttpSession sesion = request.getSession();
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Obtenemos parámetros de búsqueda
    		FormularioPromocionBean formulario = (FormularioPromocionBean) sesion.getAttribute(WebKeys.FORMULARIO_PROMOCION);
    		ParametrosBuscarArticulosPromocionesBean param = (ParametrosBuscarArticulosPromocionesBean) formulario.getFormularioPestañaActiva().getParam();
    		
    		List<ArticuloPromocionBean> lstArticulos = ServicioArticulosPromociones.consultarArticulosPromocion(param, datosSesion);
            formulario.getFormularioPestañaActiva().setRegistros(lstArticulos);
            
            return getControlador().getAccion("verFormulario").ejecutar(request);
    	}
    	catch (ArticuloPromocionException e) {
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
