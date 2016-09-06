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

import com.comerzzia.servicios.compras.albaranes.AlbaranCompra;
import com.comerzzia.servicios.compras.albaranes.AlbaranCompraException;
import com.comerzzia.servicios.compras.albaranes.AlbaranCompraNotFoundException;
import com.comerzzia.servicios.compras.albaranes.ServicioAlbaranesCompras;
import com.comerzzia.servicios.compras.albaranes.pagos.PagoAlbaranCompraConstraintViolationException;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.compras.albaranes.ui.FormularioAlbaranCompraBean;
import com.comerzzia.web.core.ui.FormularioBean;


public class VerAccion extends Accion {

	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "ver";
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
    		if (!permisos.isPuedeEjecutar()) {
    			return SIN_PERMISO;
    		}
    		
    		// Obtener el Albarán de Compra
    		Long idAlbaran = Long.parseLong(request.getParameter(WebKeys.ID_OBJETO));
    		AlbaranCompra albaran = ServicioAlbaranesCompras.consultar(idAlbaran, datosSesion);
    		
    		// Inicializamos el Formulario
    		FormularioAlbaranCompraBean formulario = (FormularioAlbaranCompraBean) sesion.getAttribute(WebKeys.FORMULARIO_ALBARAN_COMPRA);
    		formulario.inicializar(albaran);
    		formulario.setPestañaActiva(0);
    		for (FormularioBean pestaña : formulario.getPestañas()) {
    			pestaña.setModoVisualizacionTabla();
    		}
    		
    		// Controbamos si los totales corresponden con el detalle
    		if (!albaran.checkTotales()) {
    			setMensajeAviso(request, "Los importes totales del albarán no coinciden con la suma de los importes de las líneas");
    		}
    		
    		// Comprobamos los totales de los pagos
    		try {
    			albaran.checkTotalesPagos();
    		}
    		catch (PagoAlbaranCompraConstraintViolationException e) {
    			setMensajeAviso(request, e.getMessage());
    		}
    		
    		// Mostramos el formulario
    		return getControlador().getAccion("verFormulario").ejecutar(request);
    	}
    	catch (AlbaranCompraNotFoundException e) {
    		// Si no se encuentra el registro volvemos al buscador y enviamos en mensaje de error
            setMensajeError(request, "No se ha encontrado el registro", e);
            return getControlador().getAccion("buscar").ejecutar(request);
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
