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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.servicios.ventas.facturas.FacturaVenta;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.facturas.facturacion.ui.FormularioFacturacionAlbaranesVentasBean;

public class LeerFormularioAccion extends Accion {

	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(LeerFormularioAccion.class);
	
	/**
     * Devuelve el nombre de la acción
     * @return String con el nombre de la acción
     */
	public String getNombre() {
		return "leerFormulario";
	}
	
	/**
     * Ejecuta la acción
     * @param request Datos de la petición
     * @return Vista con la siguiente pagina a mostrar
     */
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();
			
			// Obtenemos la operación solicitada
			String operacion = request.getParameter("operacion");
			String indice = request.getParameter("indice");
			log.debug("ejecutar() - operacion=" + operacion + " indice=" + indice);
			
			// Actualizamos el formulario
			FormularioFacturacionAlbaranesVentasBean formulario = (FormularioFacturacionAlbaranesVentasBean) sesion.getAttribute(WebKeys.FORMULARIO_FACTURACION_ALBARANES_VENTAS);
			if (operacion == null || !operacion.equals("cancelar")) {
				leerFormulario(formulario, request);
			}
			
            if (operacion != null) {
                // Aceptar cambios del formulario
                if (operacion.equals("aceptar")) {
               		return getControlador().getAccion("salvar").ejecutar(request);
                }
                // Cancelar cambios en el formulario
                else if (operacion.equals("cancelar")) {
                	return getControlador().getAccion("buscar").ejecutar(request);
                }
            }
            
            // Mostramos el formulario
           return getControlador().getAccion("verFormulario").ejecutar(request);
		}
		catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
		}
	}
	
	private void leerFormulario(FormularioFacturacionAlbaranesVentasBean formulario, HttpServletRequest request) throws FechaException {
		FacturaVenta factura = (FacturaVenta) formulario.getRegistroActivo();
		factura.setDesCliente(request.getParameter("desCliente"));
		factura.setDomicilio(request.getParameter("domicilio"));
		factura.setPoblacion(request.getParameter("poblacion"));
		factura.setProvincia(request.getParameter("provincia"));
		factura.setCp(request.getParameter("cp"));
		factura.setCif(request.getParameter("cif"));
		factura.setFecha(Fechas.getFecha(request.getParameter("fecha")));
		factura.setConcepto(request.getParameter("concepto"));
		factura.setCodSerie(request.getParameter("codSerie"));
		factura.setDesSerie(request.getParameter("desSerie"));
		factura.setObservaciones(request.getParameter("observaciones"));
		
	}
	
}
