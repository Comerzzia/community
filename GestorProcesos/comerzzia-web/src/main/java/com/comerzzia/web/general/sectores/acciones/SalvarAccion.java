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

package com.comerzzia.web.general.sectores.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.sectores.SectorBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.sectores.SectorConstraintViolationException;
import com.comerzzia.servicios.general.sectores.SectorException;
import com.comerzzia.servicios.general.sectores.ServicioSectores;
import com.comerzzia.util.base.Estado;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class SalvarAccion extends Accion {
	
	private static final Vista NEXT_PAGE = new Vista("general/sectores/mantenimiento/jsp/sector.jsp", Vista.INTERNA);

	
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
    		
    		SectorBean sector = (SectorBean) sesion.getAttribute(WebKeys.SECTOR_BEAN);
    		if (sector.getEstadoBean() == Estado.NUEVO) {
    			sector.setCodSec(request.getParameter("codSec"));
    		}
    		
    		// TODO: comprobar que idObjeto es igual a codserie
    		
    		sector.setDesSec(request.getParameter("desSec"));
    		sector.setActivo(request.getParameter("activo") != null);
    		
    		ServicioSectores.salvar(sector, datosSesion);
    		
    		// Liberamos recursos
    		sesion.removeAttribute(WebKeys.SERIE_BEAN);
    		
    		// Volvemos a consultar el registro
    		try {
    			sector = ServicioSectores.consultar(sector.getCodSec(), datosSesion);
    			
    			sesion.setAttribute(WebKeys.SECTOR_BEAN, sector);
    			setMensaje(request, "El sector se ha salvado correctamente");
    			return NEXT_PAGE;
    		}
    		catch (Exception e) {
    			setMensajeError(request, "El sector se ha salvado correctamente pero no se ha podido acceder al registro", e);
    			return getControlador().getAccion("buscar").ejecutar(request);
    		}
    	}
    	catch (SectorConstraintViolationException e) {
    		setMensajeError(request, e.getMessage());
    		return NEXT_PAGE;
    	}
    	catch (SectorException e) {
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
