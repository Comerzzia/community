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

package com.comerzzia.web.compras.albaranes.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.servicios.compras.albaranes.AlbaranCompraConstraintViolationException;
import com.comerzzia.servicios.compras.albaranes.AlbaranCompraException;
import com.comerzzia.servicios.compras.albaranes.ServicioAlbaranesCompras;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.compras.albaranes.ui.FormularioAlbaranCompraBean;


public class EliminarAccion extends Accion {

	@Override
	public String getNombre() {
		return "eliminar";
	}
	
	@Override
	public Vista ejecutar(HttpServletRequest request) {
		HttpSession sesion = request.getSession();

		try {
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeEliminar()) {
    			return SIN_PERMISO;
    		}
    		
    		// Eliminamos el albarán
    		Long idAlbaran = Long.parseLong(request.getParameter(WebKeys.ID_OBJETO));
			ServicioAlbaranesCompras.eliminar(idAlbaran, datosSesion);

    		setMensaje(request, "El albarán de compra se ha borrado correctamente");
    		
    		return getControlador().getAccion("buscar").ejecutar(request);
    	}
    	catch (AlbaranCompraConstraintViolationException e) {
    		setMensajeAviso(request, "No se ha podido borrar el albarán de compra: " + e.getMessage());
    		
    		FormularioAlbaranCompraBean formulario = (FormularioAlbaranCompraBean) sesion.getAttribute(WebKeys.FORMULARIO_ALBARAN_COMPRA);
    		// Si no tenemos registro activo volvemos al buscador
    		if (formulario.isRegistroActivoVacio()) {
    			return getControlador().getAccion("buscar").ejecutar(request);
    		}
    		else { // en caso contrario volvemos al formulario
    			return getControlador().getAccion("verFormulario").ejecutar(request);
    		}
		}
    	catch (AlbaranCompraException e) {
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
