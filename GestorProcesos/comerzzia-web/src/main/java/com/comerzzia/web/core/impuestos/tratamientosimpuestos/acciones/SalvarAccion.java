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

package com.comerzzia.web.core.impuestos.tratamientosimpuestos.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.core.impuestos.tratamientosimpuestos.TratamientoImpuestoBean;
import com.comerzzia.servicios.core.impuestos.tratamientosimpuestos.ServicioTratamientosImpuestos;
import com.comerzzia.servicios.core.impuestos.tratamientosimpuestos.TratamientoImpuestoConstraintViolationException;
import com.comerzzia.servicios.core.impuestos.tratamientosimpuestos.TratamientoImpuestoException;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class SalvarAccion extends Accion {
	
	private static final Vista NEXT_PAGE = new Vista("core/impuestos/tratamientos_impuestos/mantenimiento/jsp/tratamientoImpuesto.jsp", Vista.INTERNA);

	
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
    		
    		TratamientoImpuestoBean tratImpuesto = (TratamientoImpuestoBean) sesion.getAttribute(WebKeys.TRAT_IMPUESTOS_BEAN);
    		
    		// TODO: comprobar que idObjeto es igual a idTratImpuestos
    		
    		tratImpuesto.setCodTratImp(request.getParameter("codTratImp"));
    		tratImpuesto.setDesTratImp(request.getParameter("desTratImp"));
    		tratImpuesto.setAplicaRecargo(request.getParameter("aplicaRecargo") != null);
    		
    		ServicioTratamientosImpuestos.salvar(tratImpuesto);
    		
    		// Liberamos recursos
    		sesion.removeAttribute(WebKeys.TRAT_IMPUESTOS_BEAN);
    		
    		// Volvemos a consultar el registro
    		try {
    			tratImpuesto = ServicioTratamientosImpuestos.consultar(tratImpuesto.getIdTratImpuestos());
    			
    			sesion.setAttribute(WebKeys.TRAT_IMPUESTOS_BEAN, tratImpuesto);
    			setMensaje(request, "El tratamiento de impuestos se ha salvado correctamente");
    			return NEXT_PAGE;
    		}
    		catch (Exception e) {
    			setMensajeError(request, "El tratamiento de impuestos se ha salvado correctamente pero no se ha podido acceder al registro", e);
    			return getControlador().getAccion("buscar").ejecutar(request);
    		}
    	}
    	catch (TratamientoImpuestoConstraintViolationException e) {
    		setMensajeError(request, e.getMessage());
    		return NEXT_PAGE;
    	}
    	catch (TratamientoImpuestoException e) {
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
