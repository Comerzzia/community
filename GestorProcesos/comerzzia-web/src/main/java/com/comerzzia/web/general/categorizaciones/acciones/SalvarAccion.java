/**
 * 
 */
package com.comerzzia.web.general.categorizaciones.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.categorizaciones.CategorizacionBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.categorizaciones.CategorizacionConstraintViolationException;
import com.comerzzia.servicios.general.categorizaciones.CategorizacionException;
import com.comerzzia.servicios.general.categorizaciones.ServicioCategorizaciones;
import com.comerzzia.util.base.Estado;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

/**
 *
 */
public class SalvarAccion extends Accion {

private static final Vista NEXT_PAGE = new Vista("general/categorizaciones/mantenimiento/jsp/categorizacion.jsp", Vista.INTERNA);

	
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
    		
    		CategorizacionBean categorizacion = (CategorizacionBean) sesion.getAttribute(WebKeys.CATEGORIZACION_BEAN);
    		if (categorizacion.getEstadoBean() == Estado.NUEVO) {
    			categorizacion.setCodCat(request.getParameter("codCat"));
    		}
    		categorizacion.setDesCat(request.getParameter("desCat"));
    		categorizacion.setActivo(request.getParameter("activo") != null);
    		
    		ServicioCategorizaciones.salvar(categorizacion, datosSesion);
    		
    		// Liberamos recursos
    		sesion.removeAttribute(WebKeys.CATEGORIZACION_BEAN);
    		    		
    		// Volvemos a consultar el registro
    		try {
    			categorizacion = ServicioCategorizaciones.consultar(categorizacion.getCodCat(), datosSesion);
    			
    			sesion.setAttribute(WebKeys.CATEGORIZACION_BEAN, categorizacion);
    			setMensaje(request, "La categorización se ha salvado correctamente");
    			return NEXT_PAGE;
    		}
    		catch (Exception e) {
    			setMensajeError(request, "La categorización se ha salvado correctamente pero no se ha podido acceder al registro", e);
    			return getControlador().getAccion("buscar").ejecutar(request);
    		}
    	}
    	catch (CategorizacionConstraintViolationException e) {
    		setMensajeError(request, e.getMessage());
    		return NEXT_PAGE;
    	}
    	catch (CategorizacionException e) {
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
