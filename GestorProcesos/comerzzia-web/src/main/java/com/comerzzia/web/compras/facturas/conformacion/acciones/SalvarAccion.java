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

package com.comerzzia.web.compras.facturas.conformacion.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.servicios.compras.facturas.FacturaCompra;
import com.comerzzia.servicios.compras.facturas.FacturaCompraException;
import com.comerzzia.servicios.compras.facturas.ServicioFacturasCompras;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.compras.facturas.conformacion.ui.FormularioConformacionFacturasBean;

public class SalvarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("compras/facturas/conformacion/mantenimiento/jsp/facturaGrabada.jsp", Vista.INTERNA);
	
	@Override
	public String getNombre() {
		return "salvar";
	}
	
	@Override
	public Vista ejecutar(HttpServletRequest request) {
		try {
    		HttpSession sesion = request.getSession();
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeEjecutar()) {
    			return SIN_PERMISO;
    		}
    		
    		// Obtenemos el albarán del formulario y lo salvamos
    		FormularioConformacionFacturasBean formulario = (FormularioConformacionFacturasBean) sesion.getAttribute(WebKeys.FORMULARIO_CONFORMACION_FACTURAS);
    		FacturaCompra factura = (FacturaCompra) formulario.getRegistroActivo();
    		if(factura.validarImportePagos()){
	    		ServicioFacturasCompras.salvar(factura, datosSesion);
	    		formulario.aceptar();
	    		
	    		setMensaje(request, "La factura de compra se ha grabado correctamente");
	    		
	    		return NEXT_PAGE;
	    		
    		}else{
    			setMensajeError(request, "El total de la factura no coincide con la suma del importe de los pagos.");
    			return getControlador().getAccion("verFormulario").ejecutar(request);
    		}
    		
    		
    	}
		catch (FacturaCompraException e) {
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
