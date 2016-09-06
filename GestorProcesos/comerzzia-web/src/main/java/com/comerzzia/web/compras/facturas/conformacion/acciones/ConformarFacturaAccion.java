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

import com.comerzzia.persistencia.compras.albaranes.ParametrosBuscarAlbaranesComprasBean;
import com.comerzzia.servicios.compras.albaranes.AlbaranCompra;
import com.comerzzia.servicios.compras.albaranes.ServicioAlbaranesCompras;
import com.comerzzia.servicios.compras.facturas.ConformarFacturaException;
import com.comerzzia.servicios.compras.facturas.FacturaCompra;
import com.comerzzia.servicios.compras.facturas.FacturaCompraException;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.compras.facturas.conformacion.ui.FormularioConformacionFacturasBean;

public class ConformarFacturaAccion extends Accion {

	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "conformarFactura";
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
    		
    		FormularioConformacionFacturasBean formulario = (FormularioConformacionFacturasBean) sesion.getAttribute(WebKeys.FORMULARIO_CONFORMACION_FACTURAS);
    		ParametrosBuscarAlbaranesComprasBean param = (ParametrosBuscarAlbaranesComprasBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_ALBARANES_FACTURAS);
    		
    		// Creamos la factura
    		FacturaCompra factura = new FacturaCompra();
    		formulario.setModoInsercion(factura);
    		formulario.setPestañaActiva(0);
    		
    		// Recogemos los albaranes seleccionados
    		String[] checks = request.getParameterValues("chk");
    		if(checks != null){   			
        		// Se cargan los datos del proveedor en la factura
        		factura.cargarDatosProveedor(param.getCodProveedor(), datosSesion);
        		
	    		for (String idAlbaran : checks){
	    			AlbaranCompra albaranCompra = ServicioAlbaranesCompras.consultar(Long.parseLong(idAlbaran), datosSesion);
					factura.setAlbaran(albaranCompra);
	    		}   		
    		}else{
    			setMensajeError(request, "Debe seleccionar al menos un albarán para poder conformar la factura.");
    			return getControlador().getAccion("buscar").ejecutar(request);
    		}
    		
    		// Añadimos la empresa a la factura
    		factura.setCodEmpresa(datosSesion.getEmpresa().getCodEmp());
    		
    		return getControlador().getAccion("verFormulario").ejecutar(request);
    	}
		catch (ConformarFacturaException e) {
            setMensajeError(request, e.getMessage());
            return getControlador().getAccion("buscar").ejecutar(request);
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
