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

package com.comerzzia.web.ventas.facturas.consulta.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.facturas.FacturaVenta;
import com.comerzzia.servicios.ventas.facturas.detalle.ServicioDetallesFacturasVentas;
import com.comerzzia.servicios.ventas.facturas.pagos.ServicioPagosFacturasVentas;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.facturas.consulta.ui.FormularioFacturaVentaBean;


public class VerFormularioAccion extends Accion {
	
	private static final Vista NEXT_PAGE = new Vista("ventas/facturas/consulta/mantenimiento/jsp/facturaVenta.jsp", Vista.INTERNA);

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
			FormularioFacturaVentaBean formulario = (FormularioFacturaVentaBean) sesion.getAttribute(WebKeys.FORMULARIO_FACTURA_VENTA);
			inicializaPestañaActiva(formulario, datosSesion);
			
			return NEXT_PAGE;
		}
		catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
		}
	}
	
	
	private void inicializaPestañaActiva(FormularioFacturaVentaBean formulario, DatosSesionBean datosSesion) throws Exception {
		// Obtenemos la Factura
		FacturaVenta factura = (FacturaVenta) formulario.getRegistroActivo();
		switch (formulario.getPestañaActiva()) {
			case 1:
				if (!factura.isDetallesCargados()){
					factura.setDetallesFactura(ServicioDetallesFacturasVentas.consultar(factura.getIdFacturaRep(), datosSesion));
					factura.setDetallesCargados(true);
					formulario.getFormularioPestañaActiva().setRegistros(factura.getDetallesFactura());
				}
				break;
			case 2:
				if (!factura.isMediosPagoCargados()){
					factura.setMediosPago(ServicioPagosFacturasVentas.consultar(factura.getIdFacturaRep(), datosSesion));
					factura.setMediosPagoCargados(true);
					formulario.getFormularioPestañaActiva().setRegistros(factura.getMediosPago());
				}
				break;
		}
	}
}
