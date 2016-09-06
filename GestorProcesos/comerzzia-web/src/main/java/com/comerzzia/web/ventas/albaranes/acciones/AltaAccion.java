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

package com.comerzzia.web.ventas.albaranes.acciones;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.albaranes.AlbaranVenta;
import com.comerzzia.servicios.ventas.albaranes.AlbaranVentaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.albaranes.ui.FormularioAlbaranVentaBean;


public class AltaAccion extends Accion {

	@Override
	public String getNombre() {
		return "alta";
	}
	
	
	@Override
	public Vista ejecutar(HttpServletRequest request) {
		try {
    		HttpSession sesion = request.getSession();
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeAñadir()) {
    			return SIN_PERMISO;
    		}
    		
    		// Actualizamos el formulario con el nuevo albarán
    		FormularioAlbaranVentaBean formulario = (FormularioAlbaranVentaBean) sesion.getAttribute(WebKeys.FORMULARIO_ALBARAN_VENTA);
    		AlbaranVenta albaran = new AlbaranVenta();
    		formulario.setModoInsercion(albaran);
    		formulario.setPestañaActiva(0);
    		
    		// Inicializamos datos del albarán
    		albaran.setCodEmpresa(datosSesion.getEmpresa().getCodEmp());
    		albaran.setPeriodo(new Integer(Fechas.año()).shortValue());
    		
    		// TODO: mejorar creación de Date solo con fecha
    		Date fecha = new Date();
    		
    		albaran.setFechaAlbaran(fecha);
    		albaran.setFechaSuministro(fecha);
    		
    		// Mostramos el formulario
    		return getControlador().getAccion("verFormulario").ejecutar(request);
    	}
		catch (AlbaranVentaException e) {
			setMensajeError(request, "Error al crear nuevo albarán: " + e.getMessage());
			return getControlador().getAccion("buscar").ejecutar(request);
		}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
	}
}
