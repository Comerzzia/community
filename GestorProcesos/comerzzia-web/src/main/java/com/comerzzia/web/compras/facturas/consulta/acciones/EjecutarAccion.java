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

package com.comerzzia.web.compras.facturas.consulta.acciones;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.compras.facturas.ParametrosBuscarFacturasComprasBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.variables.ServicioVariables;
import com.comerzzia.servicios.core.variables.Variables;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.compras.facturas.consulta.ui.FormularioFacturaCompraBean;


public class EjecutarAccion extends Accion {
	
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "ejecutar";
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
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisos(this.getAccionMenu());
    		if (!permisos.isPuedeEjecutar()) {
    			return SIN_PERMISO;
    		}
    		
    		// Inicializamos parámetros de búsqueda
    		ParametrosBuscarFacturasComprasBean param = (ParametrosBuscarFacturasComprasBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_FACTURAS_COMPRAS);
    		if (param == null) {
    			param = new ParametrosBuscarFacturasComprasBean();
    			Date hoy = new Date();
				param.setFechaDesde(Fechas.sumaDias(hoy, -30));
				param.setFechaHasta(hoy);
    			
    			sesion.setAttribute(WebKeys.PARAM_BUSCAR_FACTURAS_COMPRAS, param);
    		}
    		else {
    			param.setNumPagina(0);
    		}
    		
    		// Inicializamos el formulario
    		FormularioFacturaCompraBean formulario = (FormularioFacturaCompraBean) sesion.getAttribute(WebKeys.FORMULARIO_FACTURA_COMPRA);
    		if (formulario == null) {
    			formulario = new FormularioFacturaCompraBean();
    			
    			// Establecer los títulos de los campos de desglose a partir de sus respectivas variables
    			try {
					formulario.setTituloDesglose1(ServicioVariables.consultarValor(Variables.ARTICULOS_DESGLOSE1_TITULO));
				} 
    			catch (Exception e) {
					formulario.setTituloDesglose1("");
					e.printStackTrace();
				}
				try {
					formulario.setTituloDesglose2(ServicioVariables.consultarValor(Variables.ARTICULOS_DESGLOSE2_TITULO));
				}
				catch (Exception e) {
					formulario.setTituloDesglose2("");
					e.printStackTrace();
				}
    			
    			sesion.setAttribute(WebKeys.FORMULARIO_FACTURA_COMPRA, formulario);
    		}
            
    		return getControlador().getAccion("buscar").ejecutar(request);
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
    }
}
