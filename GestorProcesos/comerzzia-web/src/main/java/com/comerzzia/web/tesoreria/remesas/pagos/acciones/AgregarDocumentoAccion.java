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
import com.comerzzia.servicios.tesoreria.pagos.PagoException;
import com.comerzzia.servicios.tesoreria.pagos.ServicioPagos;
import com.comerzzia.servicios.tesoreria.remesas.pagos.RemesaPago;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.tesoreria.remesas.pagos.ui.FormularioRemesaPagoBean;

public class AgregarDocumentoAccion extends Accion {

	
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "agregarDocumento";
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
    		if (!permisos.isPuedeEjecutar()) {
    			return SIN_PERMISO;
    		}

    		//Cogemos el formulario de la sesión
    		FormularioRemesaPagoBean formulario = (FormularioRemesaPagoBean)sesion.getAttribute(WebKeys.FORMULARIO_REMESA_PAGO);
    		RemesaPago remesaPago = (RemesaPago)formulario.getRegistroActivo();
    		
			// Recogemos los documentos seleccionados
    		String[] checks = request.getParameterValues("chk");
    		if(checks != null){
        		// Agregamos el documento a la preremesa
    			for (String idPago : checks){
            		ServicioPagos.asignarRemesa(remesaPago.getIdRemesa(), Long.parseLong(idPago), datosSesion);
    			}
    			
    			if (checks.length > 1) {
    	    		setMensaje(request, "Los documentos de pago se han añadido a la preremesa correctamente");
				}
    			else{
    				setMensaje(request, "El documento de pago se ha añadido a la preremesa correctamente");
    			}
    		}
    		else{
    			setMensajeError(request, "Debe seleccionar al menos un documento para que pueda ser agregado.");
    		}

    		return getControlador().getAccion("buscarDocumentos").ejecutar(request);

    	}
    	catch (PagoException e) {
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
