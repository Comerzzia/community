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

package com.comerzzia.web.tesoreria.cobros.acciones;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.tesoreria.cobros.DocumentoCobroBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.tesoreria.cobros.CobroConstraintViolationException;
import com.comerzzia.servicios.tesoreria.cobros.CobroException;
import com.comerzzia.servicios.tesoreria.cobros.CobroNotFoundException;
import com.comerzzia.servicios.tesoreria.cobros.ServicioCobros;
import com.comerzzia.util.base.Estado;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class EliminarAccion extends Accion {

	public String getNombre() {
		return "eliminar";
	}

	public Vista ejecutar(HttpServletRequest request) {
		try {
    		HttpSession sesion = request.getSession();
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeEjecutar()) {
    			return SIN_PERMISO;
    		}
    		
    		String idCobro = request.getParameter("idObjeto");
    		DocumentoCobroBean documento = ServicioCobros.consultar(Long.parseLong(idCobro), datosSesion);
    		documento.setFechaBaja(new Date());
    		documento.setEstadoBean(Estado.MODIFICADO);
    		ServicioCobros.salvar(documento, datosSesion);
    		
			
			setMensaje(request, "El documento ha sido eliminado correctamente.");
			
			return getControlador().getAccion("buscar").ejecutar(request);
			
		} catch (CobroException e) {
			setError(request, e);

			return ERROR_PAGE;
		}catch (CobroNotFoundException e) {
			setMensajeError(request,e.getMessage());

			return getControlador().getAccion("buscar").ejecutar(request);
		}
		catch (CobroConstraintViolationException e) {
			setMensajeError(request,e.getMessage());

			return getControlador().getAccion("buscar").ejecutar(request);
		}
		catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
	}

}
