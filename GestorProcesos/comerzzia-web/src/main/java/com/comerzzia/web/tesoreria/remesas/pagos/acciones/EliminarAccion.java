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

package com.comerzzia.web.tesoreria.remesas.pagos.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.tesoreria.remesas.pagos.RemesaPagoConstraintViolationException;
import com.comerzzia.servicios.tesoreria.remesas.pagos.RemesaPagoException;
import com.comerzzia.servicios.tesoreria.remesas.pagos.ServicioRemesasPagos;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.tesoreria.remesas.pagos.ui.FormularioRemesaPagoBean;

public class EliminarAccion extends Accion {

	
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "eliminar";
    }
    
    /**
     * Ejecuta la acción
     * @param request Datos de la petición
     * @return Vista con la siguiente pagina a mostrar
     */
    public Vista ejecutar(HttpServletRequest request) {
    	HttpSession sesion = request.getSession();

		try {
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeEliminar()) {
    			return SIN_PERMISO;
    		}

    		// Eliminamos la remesa
    		Long idRemesa = Long.parseLong(request.getParameter(WebKeys.ID_OBJETO));
    		ServicioRemesasPagos.eliminar(idRemesa, datosSesion);

    		setMensaje(request, "La remesa se ha borrado correctamente");
    		
    		return getControlador().getAccion("buscar").ejecutar(request);
    	}
    	catch (RemesaPagoConstraintViolationException e) {
    		setMensajeError(request, "No se ha podido borrar la remesa porque existen registros asociados");
    		
    		FormularioRemesaPagoBean formulario = (FormularioRemesaPagoBean) sesion.getAttribute(WebKeys.FORMULARIO_REMESA_PAGO);
    		// Si no tenemos registro activo volvemos al buscador
    		if (formulario.isRegistroActivoVacio()) {
    			return getControlador().getAccion("buscar").ejecutar(request);
    		}
    		else { // en caso contrario volvemos al formulario
    			return getControlador().getAccion("verFormulario").ejecutar(request);
    		}
		}
    	catch (RemesaPagoException e) {
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
