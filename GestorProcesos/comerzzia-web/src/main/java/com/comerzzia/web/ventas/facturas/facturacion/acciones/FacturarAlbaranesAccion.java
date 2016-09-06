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
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.ventas.albaranes.AlbaranVentaBean;
import com.comerzzia.persistencia.ventas.albaranes.ParametrosBuscarAlbaranesVentasBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.albaranes.AlbaranVenta;
import com.comerzzia.servicios.ventas.albaranes.ServicioAlbaranesVentas;
import com.comerzzia.servicios.ventas.facturas.FacturaVenta;
import com.comerzzia.servicios.ventas.facturas.FacturaVentaException;
import com.comerzzia.servicios.ventas.facturas.FacturarAlbaranVentaException;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.facturas.facturacion.ui.FormularioFacturacionAlbaranesVentasBean;

public class FacturarAlbaranesAccion extends Accion {

	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
    public String getNombre() {
        return "facturarAlbaranes";
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
    		
    		//Obtenemos el formulario y los parámetros de búsqueda
    		FormularioFacturacionAlbaranesVentasBean formulario = (FormularioFacturacionAlbaranesVentasBean) sesion.getAttribute(WebKeys.FORMULARIO_FACTURACION_ALBARANES_VENTAS);
    		ParametrosBuscarAlbaranesVentasBean param = (ParametrosBuscarAlbaranesVentasBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_ALBARANES_VENTAS_NO_FACTURADOS);
    		
    		// Recogemos los checks seleccionados
    		String[] checks = request.getParameterValues("chk");
    		if(checks != null){
    			// Eliminamos los numero de facturas por si se han creado facturas anteriormente
    			formulario.setPrimeraFactura(null);
	    		formulario.setUltimaFactura(null);
    			//Comprobamos si tenemos un cliente o varios
    			if((param.getCodClienteDesde().equals(param.getCodClienteHasta())) || (param.getCodClienteHasta().equals(""))){
    	    		//Borramos la lista de facturas de ventas de la sesión
    				sesion.removeAttribute(WebKeys.LISTA_FACTURAS_VENTAS);
    				
    				//Un sólo cliente
    	    		// Creamos la factura
    	    		FacturaVenta factura = new FacturaVenta();
    	    		formulario.setModoInsercion(factura);
    	    		formulario.setPestañaActiva(0);
    				
    	    		// Se cargan los datos del cliente en la factura
    	    		factura.cargarDatosCliente(param.getCodClienteDesde(), datosSesion);
    	    		
    	    		for (String idAlbaran : checks){
    	    			AlbaranVenta albaranVenta = ServicioAlbaranesVentas.consultar(Long.parseLong(idAlbaran), datosSesion);
    					factura.setAlbaran(albaranVenta);
    	    		}   		

    	    		// Añadimos la empresa a la factura
    	    		factura.setCodEmpresa(datosSesion.getEmpresa().getCodEmp());
    	    		
    	    		//Inicializamos la fecha de facturación al día actual por defecto
    				factura.setFecha(new Date());
    			}
    			else{
    				//Tenemos varios clientes
    				//Por cada cliente creamos una factura de venta
		    		List<FacturaVenta> lstFacturasVenta = new ArrayList<FacturaVenta>();

					//Extraemos los valores que indican el codcli
					for (String codCliente : checks){
			    		// Creamos la factura
			    		FacturaVenta factura = new FacturaVenta();
			    		formulario.setModoInsercion(factura);
			    		formulario.setPestañaActiva(0);
			    		
						// Se cargan los datos del cliente en la factura
        	    		factura.cargarDatosCliente(codCliente, datosSesion);
						
						//Creamos los parámetros de búsqueda que necesitamos para consultar
						ParametrosBuscarAlbaranesVentasBean paramBuscar = new ParametrosBuscarAlbaranesVentasBean();
						paramBuscar.setCodCliente(codCliente);
						paramBuscar.setCodSerieDesde(param.getCodSerieDesde());
						paramBuscar.setCodSerieHasta(param.getCodSerieHasta());
						paramBuscar.setCodAlmacen(param.getCodAlmacen());
						paramBuscar.setCodConceptoAlmacen(param.getCodConceptoAlmacen());
						paramBuscar.setFechaDesde(param.getFechaDesde());
						paramBuscar.setBuscarPorFechaDesde(true);
						paramBuscar.setFechaHasta(param.getFechaHasta());
						paramBuscar.setBuscarPorFechaHasta(true);
						paramBuscar.setNoFacturados(true);
						
						//Obtenemos la lista de resultados con los albaranes de ventas que coinciden con los
						//parámetros de búsqueda
						List<AlbaranVentaBean> lstAlbaranes = ServicioAlbaranesVentas.consultarListaAlbaranes(paramBuscar, datosSesion);
					
						//Insertamos cada albarán en la lista de albaranes
			    		for (AlbaranVentaBean albaranVentaBean : lstAlbaranes){
			    			AlbaranVenta albaranVenta = new AlbaranVenta(albaranVentaBean);
							factura.setAlbaran(albaranVenta);
			    		}   		

			    		//Calculamos los impuestos
		    			factura.calcularSumaImpuestosAlbaranes();

			    		// Añadimos la empresa a la factura
    		    		factura.setCodEmpresa(datosSesion.getEmpresa().getCodEmp());
    		    		
    		    		//Inicializamos la fecha de facturación al día actual por defecto
    					factura.setFecha(new Date());
    		    		
    		    		//Cada FacturaVenta en una lista final que contiene las facturas de los clientes
    					lstFacturasVenta.add(factura);
					}

    				//Guardamos la lista en sesión
					sesion.setAttribute(WebKeys.LISTA_FACTURAS_VENTAS, lstFacturasVenta);
					request.setAttribute(WebKeys.LISTA_FACTURAS_VENTAS, lstFacturasVenta);
					
		    		return new Vista("ventas/facturas/facturacion/mantenimiento/jsp/facturaVenta.jsp", Vista.INTERNA);
    			}
    		}
    		else{
    			setMensajeError(request, "Debe seleccionar al menos un albarán para poder conformar la factura.");
    			return getControlador().getAccion("buscar").ejecutar(request);
    		}
			
    		return getControlador().getAccion("verFormulario").ejecutar(request);

		}
		catch (FacturarAlbaranVentaException e) {
            setMensajeError(request, e.getMessage());
            return getControlador().getAccion("buscar").ejecutar(request);
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
