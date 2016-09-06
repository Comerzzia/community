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

package com.comerzzia.web.general.mediospago.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.mediospago.MedioPagoBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.mediospago.MedioPagoConstraintViolationException;
import com.comerzzia.servicios.general.mediospago.MedioPagoException;
import com.comerzzia.servicios.general.mediospago.ServicioMediosPago;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.general.mediospago.ui.FormularioMedioPagoBean;

public class SalvarAccion extends Accion {
		
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "salvar";
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

    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeAñadir()) {
    			return SIN_PERMISO;
    		}
    		
    		// Obtenemos el medio de pago del formulario y lo salvamos
    		FormularioMedioPagoBean formulario = (FormularioMedioPagoBean) sesion.getAttribute(WebKeys.FORMULARIO_MEDIO_PAGO);
    		MedioPagoBean medioPago = (MedioPagoBean) formulario.getRegistroActivo();
    		ServicioMediosPago.salvar(medioPago, datosSesion);
    		formulario.aceptar();
    		
    		setMensaje(request, "El medio de pago se ha grabado correctamente");
    		
    		// Consultamos el medio de pago e inicializamos el formulario
    		try {
    			medioPago = ServicioMediosPago.consultar(medioPago.getCodMedioPago(), datosSesion);
				formulario.inicializar(medioPago);
			}
    		catch (Exception e) {
    			setMensajeError(request, "Se ha producido un error al acceder al registro");
    			return getControlador().getAccion("buscar").ejecutar(request);
			}
    		
    		return getControlador().getAccion("verFormulario").ejecutar(request);
    	}
    	catch (MedioPagoConstraintViolationException e) {
    		setMensajeError(request, e.getMessage());
    		return getControlador().getAccion("verFormulario").ejecutar(request);
    	}
    	catch (MedioPagoException e) {
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
