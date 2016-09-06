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

package com.comerzzia.web.backoffice.cambiosArticulosTarifas.acciones;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.tiendas.tarifas.TarifaTiendaBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.almacenes.AlmacenConstraintViolationException;
import com.comerzzia.servicios.general.almacenes.AlmacenException;
import com.comerzzia.servicios.general.almacenes.ClienteAlmacenConstraintViolationException;
import com.comerzzia.servicios.general.clientes.ClienteConstraintViolationException;
import com.comerzzia.servicios.general.clientes.ClienteException;
import com.comerzzia.servicios.general.tiendas.ServicioTiendas;
import com.comerzzia.servicios.general.tiendas.Tienda;
import com.comerzzia.servicios.general.tiendas.TiendaConstraintViolationException;
import com.comerzzia.servicios.general.tiendas.TiendaException;
import com.comerzzia.servicios.general.tiendas.TiendaNotFoundException;
import com.comerzzia.servicios.general.tiendas.tarifas.ServicioTarifasTiendas;
import com.comerzzia.servicios.ventas.tarifas.TarifaException;
import com.comerzzia.servicios.ventas.tarifas.TarifaNotFoundException;
import com.comerzzia.util.base.Estado;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class ActualizarTiendaAccion extends Accion {

	public static String ARTICULOS = "articulos";
	public static String TARIFAS = "tarifas";
	
	public String getNombre() {
		return "actualizarTienda";
	}

	public Vista ejecutar(HttpServletRequest request) {
		HttpSession sesion = request.getSession();
		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
		String mensaje = "";
		
		// Comprobamos los permisos de la acción
		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
		if (!permisos.isPuedeEjecutar()) {
			return SIN_PERMISO;
		}
		
		try {
			String operacion = (String)request.getParameter("operacion");
			String codAlm = request.getParameter("codAlm");
			Tienda tienda = ServicioTiendas.consultar(codAlm, datosSesion);
			if (operacion.equals(ARTICULOS)){
				//actualizamos la versión de los artículos
				tienda.setVersionArticulosRevisada(tienda.getVersionArticulos());
				tienda.setFechaVersionArticulosRevisada(tienda.getFechaVersionArticulos());
				mensaje = "Los artículos de la tienda " + tienda.getNombre()+ " han sido actualizados correctamente.";
			}else if (operacion.equals(TARIFAS)){
				//actualizamos la versión de las tarifas
				String codTarifa = request.getParameter("codTarifa");
				TarifaTiendaBean tarifa = ServicioTarifasTiendas.consultarTarifa(codAlm, codTarifa, datosSesion);
				tarifa.setEstadoBean(Estado.MODIFICADO);
				tarifa.setVersionTarifaRevisada(tarifa.getVersionTarifa());
				tarifa.setFechaVersionTarifaRevisada(tarifa.getFechaVersionTarifa());
				tienda.setTarifasCargadas(true);
				tienda.setTarifas(new ArrayList<TarifaTiendaBean>());
				tienda.addTarifa(tarifa);
				mensaje = "La tarifa " + tarifa.getCodTarifa() + " de la tienda " + tienda.getNombre()+ " ha sido actualizada correctamente.";
			}
			
			tienda.setEstadoBean(Estado.MODIFICADO);
			ServicioTiendas.salvar(tienda, datosSesion);
			
			setMensaje(request, mensaje);
		} 
		catch (TiendaException e) {
			setError(request, e);
    		
            return ERROR_PAGE;
		} 
		catch (TiendaNotFoundException e) {
			setMensajeError(request, e.getMessage());
		} 
		catch (TiendaConstraintViolationException e) {
			setMensajeError(request, e.getMessage());
		} 
		catch (AlmacenException e) {
			setError(request, e);
    		
            return ERROR_PAGE;
		} 
		catch (AlmacenConstraintViolationException e) {
			setMensajeError(request, e.getMessage());
		} 
		catch (ClienteAlmacenConstraintViolationException e) {
			setMensajeError(request, e.getMessage());
		} 
		catch (ClienteException e) {
			setError(request, e);
    		
            return ERROR_PAGE;
		} 
		catch (ClienteConstraintViolationException e) {
			setMensajeError(request, e.getMessage());
		} 
		catch (TarifaException e) {
			setError(request, e);
    		
            return ERROR_PAGE;
		} 
		catch (TarifaNotFoundException e) {
			setMensajeError(request, e.getMessage());
		} 
		catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
		
		return getControlador().getAccion("buscarCambiosArticulosTarifas").ejecutar(request);
	}

}
