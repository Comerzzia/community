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
import com.comerzzia.persistencia.ventas.pedidos.EstadosPedidosVenta;
import com.comerzzia.persistencia.ventas.pedidos.ParametrosBuscarPedidosVentasBean;
import com.comerzzia.servicios.core.estados.ServicioEstados;
import com.comerzzia.servicios.core.login.ServicioLogin;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.core.variables.ServicioVariables;
import com.comerzzia.servicios.general.almacenes.ServicioAlmacenes;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.web.backoffice.ventas.pedidos.ui.FormularioPedidoVentaBackofficeBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;


public class EjecutarAccion extends Accion {

	private static final String CODALMACEN_SELECCIONADO = "CODALMACEN_SELECCIONADO";
	
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
    		
			// Comprobamos que el usuario tiene tiendas asignadas
			int numeroTiendas = ServicioLogin.numeroAlmacenesUsuario(datosSesion);
			if (numeroTiendas == 0) {
				return SIN_ALMACEN;
			}
    		
			// Comprobar que hay un almacén seleccionado
			String codAlmacenSeleccionado = (String) datosSesion.getAtributos().get(CODALMACEN_SELECCIONADO);
			if (codAlmacenSeleccionado == null && numeroTiendas > 1) {
				return new Vista("seleccionAlmacen?accion=obtenerAlmacenes", Vista.INTERNA);
			}
			
			// Consultar el almacén seleccionado para comprobar si tiene cliente asociado
			AlmacenBean almacen = ServicioAlmacenes.consultar(codAlmacenSeleccionado, datosSesion);
			if (almacen.getCodCliente() == null || almacen.getCodCliente().isEmpty()) {
				setMensaje(request, "El almacén seleccionado no tiene un cliente asociado");
				
				return ERROR_PAGE;
			}
			
    		// Inicializamos parámetros de búsqueda también si el cliente es distinto
    		ParametrosBuscarPedidosVentasBean param = (ParametrosBuscarPedidosVentasBean) sesion.getAttribute(WebKeys.PARAM_BUSCAR_PEDIDOS_VENTAS_BACKOFFICE);
    		if (param == null || !almacen.getCodCliente().equals(param.getCodCliente())) {
    			param = new ParametrosBuscarPedidosVentasBean();
    			
    			// Establecer cliente asociado al almacén seleccionado y serie
    			param.setCodCliente(almacen.getCodCliente());
    			
    			// Inicializar rango de fechas
    			Date hoy = new Date();
    			param.setFechaDesde(Fechas.sumaDias(hoy, -30));
    			param.setFechaHasta(hoy);
    			
    			// Establecer conjunto de estados correspondiente
    			param.setEstados(ServicioEstados.consultar(EstadosPedidosVenta.ESTADO_RECEPTOR_PROCESO));
    			
    			sesion.setAttribute(WebKeys.PARAM_BUSCAR_PEDIDOS_VENTAS_BACKOFFICE, param);
    		}
    		
    		param.setNumPagina(0);
    		
    		// Inicializamos el formulario
    		FormularioPedidoVentaBackofficeBean formulario = (FormularioPedidoVentaBackofficeBean) sesion.getAttribute(WebKeys.FORMULARIO_PEDIDO_VENTA_BACKOFFICE);
    		if (formulario == null) {
    			formulario = new FormularioPedidoVentaBackofficeBean();
    			
    			// Establecer los títulos de los campos de desglose a partir de sus respectivas variables
    			try {
					formulario.setTituloDesglose1(ServicioVariables.consultarValor("ARTICULOS.DESGLOSE1_TITULO"));
				} 
    			catch (Exception e) {
					formulario.setTituloDesglose1("");
					e.printStackTrace();
				}
				try {
					formulario.setTituloDesglose2(ServicioVariables.consultarValor("ARTICULOS.DESGLOSE2_TITULO"));
				}
				catch (Exception e) {
					formulario.setTituloDesglose2("");
					e.printStackTrace();
				}
    			
    			sesion.setAttribute(WebKeys.FORMULARIO_PEDIDO_VENTA_BACKOFFICE, formulario);
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
