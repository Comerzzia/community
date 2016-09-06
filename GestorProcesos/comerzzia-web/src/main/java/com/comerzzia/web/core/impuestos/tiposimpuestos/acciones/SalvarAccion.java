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

package com.comerzzia.web.core.impuestos.tiposimpuestos.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.core.impuestos.tiposimpuestos.TipoImpuestoBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.impuestos.tiposimpuestos.ServicioTiposImpuestos;
import com.comerzzia.servicios.core.impuestos.tiposimpuestos.TipoImpuestoConstraintViolationException;
import com.comerzzia.servicios.core.impuestos.tiposimpuestos.TipoImpuestoException;
import com.comerzzia.util.base.Estado;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class SalvarAccion extends Accion {
	
	private static final Vista NEXT_PAGE = new Vista("core/impuestos/tipos_impuestos/mantenimiento/jsp/tipoImpuesto.jsp", Vista.INTERNA);

	
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
    		
    		TipoImpuestoBean tipoImpuesto = (TipoImpuestoBean) sesion.getAttribute(WebKeys.TIPO_IMPUESTO_BEAN);
    		if (tipoImpuesto.getEstadoBean() == Estado.NUEVO) {
    			tipoImpuesto.setCodTipoImpuesto(request.getParameter("codTipoImpuesto"));
    		}
    		
    		// TODO: comprobar que idObjeto es igual a codtipoImpuesto
    		
    		tipoImpuesto.setDesTipoImpuesto(request.getParameter("desTipoImpuesto"));
    		tipoImpuesto.setActivo(request.getParameter("activo") != null);
    		
    		ServicioTiposImpuestos.salvar(tipoImpuesto);
    		
    		// Liberamos recursos
    		sesion.removeAttribute(WebKeys.TIPO_IMPUESTO_BEAN);
    		
    		// Volvemos a consultar el registro
    		try {
    			tipoImpuesto = ServicioTiposImpuestos.consultar(tipoImpuesto.getCodTipoImpuesto());
    			
    			sesion.setAttribute(WebKeys.TIPO_IMPUESTO_BEAN, tipoImpuesto);
    			setMensaje(request, "El tipo de impuesto se ha salvado correctamente");
    			return NEXT_PAGE;
    		}
    		catch (Exception e) {
    			setMensajeError(request, "El tipo impuesto se ha salvado correctamente pero no se ha podido acceder al registro", e);
    			return getControlador().getAccion("buscar").ejecutar(request);
    		}
    	}
    	catch (TipoImpuestoConstraintViolationException e) {
    		setMensajeError(request, e.getMessage());
    		return NEXT_PAGE;
    	}
    	catch (TipoImpuestoException e) {
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
