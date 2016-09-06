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
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.compras.facturas.conformacion.ui.FormularioConformacionFacturasBean;

public class VerFormularioAccion extends Accion {

	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
	public String getNombre() {
		return "verFormulario";
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
			
			// Actualizamos el formulario
			FormularioConformacionFacturasBean formulario = (FormularioConformacionFacturasBean) sesion.getAttribute(WebKeys.FORMULARIO_CONFORMACION_FACTURAS);
			inicializaPestañaActiva(formulario, datosSesion);
			
			// Mostramos el formulario
            if(formulario.getPestañaActiva() == 2)
            	return new Vista("compras/facturas/conformacion/mantenimiento/jsp/pagos.jsp", Vista.INTERNA);
            else
            	return new Vista("compras/facturas/conformacion/mantenimiento/jsp/facturaCompra.jsp", Vista.INTERNA);

		}
		catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
		}
	}
	
	private void inicializaPestañaActiva(FormularioConformacionFacturasBean formulario, DatosSesionBean datosSesion) throws Exception {
		// Obtenemos la Factura
		FacturaCompra factura = (FacturaCompra) formulario.getRegistroActivo();
		
		if (!factura.isDetalleImpuestosCargados()){
			factura.calcularSumaImpuestosAlbaranes();
			factura.setDetalleImpuestosCargados(true);
		}
		
		switch (formulario.getPestañaActiva()) {
			case 2:
				if (!factura.isMediosPagoCargados()){
					factura.inicializaMediosPagoFactura(datosSesion);
					factura.setMediosPagoCargados(true);
					formulario.getFormularioPestañaActiva().setRegistros(factura.getMediosPago());
				}
				break;
		}
	}
}
