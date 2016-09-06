/**
 * 
 */
package com.comerzzia.web.tesoreria.remesas.cobros.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.tesoreria.remesas.cobros.RemesaCobro;
import com.comerzzia.servicios.tesoreria.remesas.cobros.RemesaCobroConstraintViolationException;
import com.comerzzia.servicios.tesoreria.remesas.cobros.RemesaCobroException;
import com.comerzzia.servicios.tesoreria.remesas.cobros.ServicioRemesasCobros;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.tesoreria.remesas.cobros.ui.FormularioRemesaCobroBean;

public class SalvarAccion extends Accion {

	public String getNombre() {
		return "salvar";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		try {
    		HttpSession sesion = request.getSession();
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeAñadir() && !permisos.isPuedeEditar()) {
    			return SIN_PERMISO;
    		}
    		
    		// Obtenemos la remesa y la salvamos
    		FormularioRemesaCobroBean formulario = (FormularioRemesaCobroBean) sesion.getAttribute(WebKeys.FORMULARIO_REMESA_COBRO);
    		RemesaCobro remesaCobro = (RemesaCobro) formulario.getRegistroActivo();
    		ServicioRemesasCobros.salvar(remesaCobro, datosSesion);
    		formulario.aceptar();
    		
    		setMensaje(request, "La remesa se ha grabado correctamente. Asigne documentos de cobors a la misma.");
    		
    		// Consultamos la remesa e inicializamos el formulario
    		try {
    			remesaCobro = ServicioRemesasCobros.consultar(remesaCobro.getIdRemesa(), datosSesion);
				formulario.inicializar(remesaCobro);
			}
    		catch (Exception e) {
    			setMensajeError(request, "Se ha producido un error al acceder al registro");
    			return getControlador().getAccion("buscar").ejecutar(request);
			}
    		
    		return getControlador().getAccion("verFormulario").ejecutar(request);
    	}
		catch (RemesaCobroConstraintViolationException e) {
    		setMensajeError(request, e.getMessage());
    		
    		return getControlador().getAccion("verFormulario").ejecutar(request);
    	}
    	catch (RemesaCobroException e) {
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
