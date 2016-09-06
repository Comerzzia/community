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

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.tiendas.TiendaBean;
import com.comerzzia.persistencia.general.tiendas.tarifas.TarifaTiendaBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.tiendas.ServicioTiendas;
import com.comerzzia.servicios.general.tiendas.TiendaException;
import com.comerzzia.servicios.general.tiendas.tarifas.ServicioTarifasTiendas;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class BuscarCambiosArticulosTarifasAccion extends Accion {

	private static final Vista NEXT_PAGE = new Vista("backoffice/cambiosArticulosTarifas/cambios/jsp/cambiosArticulosTarifas.jsp", Vista.INTERNA);
	
	public String getNombre() {
		return "buscarCambiosArticulosTarifas";
	}
	
	public Vista ejecutar(HttpServletRequest request) {
		HttpSession sesion = request.getSession();
		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
		String mensaje = "";
		boolean existenCambios = false;
		// Comprobamos los permisos de la acción
		PermisosEfectivosAccionBean permisos = datosSesion.getPermisos(this.getAccionMenu());
		if (!permisos.isPuedeEjecutar()) {
			return SIN_PERMISO;
		}

		try {
			//consultamos las tiendas asociadas al usuario
			List<TiendaBean> listaTiendas = ServicioTiendas.consultarTiendasUsuario(datosSesion.getUsuario().getIdUsuario(), datosSesion);
			
			if (listaTiendas != null && !listaTiendas.isEmpty()){
				//añadimos las tarifas a cada una de las tiendas
				for (TiendaBean tienda : listaTiendas){
					List<TarifaTiendaBean> tarifas = ServicioTarifasTiendas.consultar(tienda.getCodAlm(), datosSesion);
					tienda.setTarifas(tarifas);
					//buscamos si hay cambios en las tarifas o en los articulos de la tienda
					for (TarifaTiendaBean tarifa : tarifas){
						if ((!tarifa.getVersionTarifa().equals(tarifa.getVersionTarifaRevisada())) || (!tienda.getVersionArticulos().equals(tienda.getVersionArticulosRevisada()))){
							existenCambios = true;
							if (mensaje.isEmpty()){
								mensaje += "Existen cambios en: " + tienda.getNombre();
							}else {
								mensaje += ", " + tienda.getNombre();
							}
							break;
						}
					}
				}

				if (existenCambios){
					setMensajeAviso(request, mensaje);
				}else{
					mensaje = "No existen cambios en las tiendas";
					setMensaje(request, mensaje);
				}
				
				request.setAttribute("listaTiendas", listaTiendas);
			}else{
				return SIN_ALMACEN;
			}
			
		} catch (TiendaException e) {
			setError(request, e);
            return ERROR_PAGE;
            
    	} catch (Exception e) {
            e.printStackTrace();
            setError(request, e);
            
            return ERROR_PAGE;
        }
        
		return NEXT_PAGE;
	}
}

