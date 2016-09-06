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

package com.comerzzia.web.backoffice.ventas.pedidos.acciones;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.almacenes.AlmacenBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.almacenes.ServicioAlmacenes;
import com.comerzzia.servicios.ventas.pedidos.PedidoVenta;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.web.backoffice.ventas.pedidos.ui.FormularioPedidoVentaBackofficeBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;


public class AltaAccion extends Accion {

	private static final String CODALMACEN_SELECCIONADO = "CODALMACEN_SELECCIONADO";
	
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
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisos(this.getAccionMenu());
    		if (!permisos.isPuedeAñadir()) {
    			return SIN_PERMISO;
    		}
    		
    		// Actualizamos el formulario con el nuevo pedido
    		FormularioPedidoVentaBackofficeBean formulario = (FormularioPedidoVentaBackofficeBean) sesion.getAttribute(WebKeys.FORMULARIO_PEDIDO_VENTA_BACKOFFICE);
    		PedidoVenta pedido = new PedidoVenta();
    		formulario.setModoInsercion(pedido);
    		formulario.setPestañaActiva(0);
    		
    		// Inicializamos datos del pedido
    		pedido.setCodEmpresa(datosSesion.getEmpresa().getCodEmp());
    		pedido.setPeriodo(new Integer(Fechas.año()).shortValue());
    		String codAlmacenSeleccionado = (String) datosSesion.getAtributos().get(CODALMACEN_SELECCIONADO);
    		AlmacenBean almacen = ServicioAlmacenes.consultar(codAlmacenSeleccionado, datosSesion);
    		pedido.setCodSerie(almacen.getCodAlm());
    		pedido.setCliente(almacen.getCodCliente(), datosSesion);
    		pedido.setEstadoSolicitud();
    		
    		// TODO: mejorar creación de Date solo con fecha
    		pedido.setFecha(new Date());
    		
    		// Mostramos el formulario
    		return getControlador().getAccion("verFormulario").ejecutar(request);
    	}
    	catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
	}
}
