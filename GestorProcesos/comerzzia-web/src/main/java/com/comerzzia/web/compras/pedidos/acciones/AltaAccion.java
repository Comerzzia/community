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

package com.comerzzia.web.compras.pedidos.acciones;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.series.SerieBean;
import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenUsuarioBean;
import com.comerzzia.servicios.compras.pedidos.PedidoCompra;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.series.ServicioSeries;
import com.comerzzia.servicios.general.tiendas.usuarios.ServicioAlmacenesUsuarios;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.compras.pedidos.ui.FormularioPedidoCompraBean;


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
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisos(this.getAccionMenu());
    		if (!permisos.isPuedeAñadir()) {
    			return SIN_PERMISO;
    		}
    		
    		// Actualizamos el formulario con el nuevo pedido
    		FormularioPedidoCompraBean formulario = (FormularioPedidoCompraBean) sesion.getAttribute(WebKeys.FORMULARIO_PEDIDO_COMPRA);
    		PedidoCompra pedido = new PedidoCompra();
    		formulario.setModoInsercion(pedido);
    		formulario.setPestañaActiva(0);
    		
    		// Inicializamos datos del pedido
    		pedido.setCodEmpresa(datosSesion.getEmpresa().getCodEmp());
    		pedido.setPeriodo(new Integer(Fechas.año()).shortValue());
    		// Obtener los almacenes asignados al usuario
    		List<AlmacenUsuarioBean> almacenesUsuario = ServicioAlmacenesUsuarios.consultar(datosSesion.getUsuario().getIdUsuario(), datosSesion);
			// Si el usuario tiene asignado sólo un almacén, inicializar almacén y serie del almacén
			if(almacenesUsuario != null
					&& almacenesUsuario.size() == 1) {
				AlmacenUsuarioBean almacenUsuario = almacenesUsuario.get(0);
				pedido.setCodAlmacen(almacenUsuario.getCodAlmacen());
				pedido.setDesAlmacen(almacenUsuario.getDesAlmacen());
				
				SerieBean serie = ServicioSeries.consultar(almacenUsuario.getCodAlmacen(), datosSesion);
				pedido.setCodSerie(serie.getCodSerie());
				pedido.setDesSerie(serie.getDesSerie());
			}
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
