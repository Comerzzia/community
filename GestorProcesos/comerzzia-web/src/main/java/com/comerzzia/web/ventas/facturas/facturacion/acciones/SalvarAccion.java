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

package com.comerzzia.web.ventas.facturas.facturacion.acciones;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.facturas.FacturaVenta;
import com.comerzzia.servicios.ventas.facturas.FacturaVentaException;
import com.comerzzia.servicios.ventas.facturas.ServicioFacturasVentas;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.facturas.facturacion.ui.FormularioFacturacionAlbaranesVentasBean;

public class SalvarAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("ventas/facturas/facturacion/mantenimiento/jsp/facturaGrabada.jsp", Vista.INTERNA);
	
	@Override
	public String getNombre() {
		return "salvar";
	}
	
	@SuppressWarnings("unchecked")
	public Vista ejecutar(HttpServletRequest request) {
		try {
    		HttpSession sesion = request.getSession();
    		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
    		
    		// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeEjecutar()) {
    			return SIN_PERMISO;
    		}
    		
    		// Obtenemos el formulario y lo salvamos
    		FormularioFacturacionAlbaranesVentasBean formulario = (FormularioFacturacionAlbaranesVentasBean) sesion.getAttribute(WebKeys.FORMULARIO_FACTURACION_ALBARANES_VENTAS);
    		FacturaVenta factura = (FacturaVenta) formulario.getRegistroActivo();
    		
    		//Obtenemos la lista de facturas de ventas
    		List<FacturaVenta> lstFacturasVenta = (List<FacturaVenta>)sesion.getAttribute(WebKeys.LISTA_FACTURAS_VENTAS);
    		
    		//Si la lista es distinta de null significa que hay varios clientes
    		if(lstFacturasVenta != null){
    			//Por cada factura de venta de la lista insertamos los datos necesarios
    			for (FacturaVenta facturaVenta : lstFacturasVenta) {
					//Insertamos en la factura la fecha de facturación, el codSerie, las observaciónes y el concepto 
    				facturaVenta.setFecha(factura.getFecha());
    				facturaVenta.setCodSerie(factura.getCodSerie());
    				facturaVenta.setObservaciones(factura.getObservaciones());
    				facturaVenta.setConcepto(factura.getConcepto());
    				
    				//Cargamos los datos del cliente
    				facturaVenta.cargarDatosCliente(facturaVenta.getCodCliente(), datosSesion);
    				
    				//Calculamos los pagos
    				facturaVenta.inicializaMediosPagoFactura(datosSesion);
    			}
    		}
    		//Tenemos un sólo cliente, por lo tanto una sola factura, asi que la añadimos
    		//a la lista
    		else{
    			lstFacturasVenta = new ArrayList<FacturaVenta>();
    			
    			//Calculamos los pagos
    			factura.inicializaMediosPagoFactura(datosSesion);

				lstFacturasVenta.add(factura);
    		}
    		
			//Guardamos la factura
			ServicioFacturasVentas.crearFactura(lstFacturasVenta, datosSesion);
			
			//Se graban la primera y la ultima factura creada para mostrarlas posteriormente
			formulario.setPrimeraFactura(lstFacturasVenta.get(0).getNumFactura());
			formulario.setUltimaFactura(lstFacturasVenta.get(lstFacturasVenta.size()-1).getNumFactura());
			
			//Aceptamos el formulario
			formulario.aceptar();

			if(lstFacturasVenta.size() > 1){
        		setMensaje(request, "Las facturas de ventas se han grabado correctamente");
			}
			else{
        		setMensaje(request, "La factura de venta se ha grabado correctamente");	
			}
			
			return NEXT_PAGE;
		}
		catch (FacturaVentaException e) {
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
