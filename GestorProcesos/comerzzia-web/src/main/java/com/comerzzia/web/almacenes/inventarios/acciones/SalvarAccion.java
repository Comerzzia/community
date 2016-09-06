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

package com.comerzzia.web.almacenes.inventarios.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.almacenes.regularizaciones.RegularizacionBean;
import com.comerzzia.servicios.almacenes.inventarios.Inventario;
import com.comerzzia.servicios.almacenes.inventarios.ServicioInventarios;
import com.comerzzia.servicios.almacenes.stocks.StockAlmacenException;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.almacenes.inventarios.ui.FormularioInventarioBean;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;

public class SalvarAccion extends Accion {

	/**
	 * Devuelve el nombre de la acción
	 * 
	 * @return String con el nombre de la acción
	 */
	public String getNombre() {
		return "salvar";
	}

	/**
	 * Ejecuta la acción
	 * 
	 * @param request
	 *            Datos de la petición
	 * @return Vista con la siguiente pagina a mostrar
	 */
	public Vista ejecutar(HttpServletRequest request) {
		try {
			HttpSession sesion = request.getSession();
			DatosSesionBean datosSesion = (DatosSesionBean) sesion
					.getAttribute(WebKeys.DATOS_SESION);

			// Comprobamos los permisos de la acción
			PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
			if (!permisos.isPuedeAñadir()) {
				return SIN_PERMISO;
			}
			
			// Obtenemos el formulario
			FormularioInventarioBean formulario = (FormularioInventarioBean) sesion.getAttribute(WebKeys.FORMULARIO_INVENTARIO);

			leerFormulario(formulario, request);
			RegularizacionBean regularizacion = leerRegularizacion(formulario, request);
			ServicioInventarios.crear(regularizacion, datosSesion);
			
			Inventario inventario = (Inventario) formulario.getRegistroActivo();
			inventario.addRegularizacion(regularizacion);
			
			setMensaje(request, "El artículo se ha inventariado correctamente");

			return getControlador().getAccion("verFormulario").ejecutar(request);
			
		} catch (StockAlmacenException e) {
			setMensajeError(request, e.getMessage());
			return getControlador().getAccion("verFormulario").ejecutar(request);
			
		} catch (Exception e) {
			e.printStackTrace();
			setError(request, e);

			return ERROR_PAGE;
		}
	}
	
	/**
	 * Lee los campos del formulario principal y del formulario de la pestaña
	 * activa actualizando los atributos del registro activo
	 * 
	 * @param formulario
	 * @param request
	 * @throws FechaException
	 */
	private void leerFormulario(FormularioInventarioBean formulario,
			HttpServletRequest request) throws FechaException {
		
		Inventario inventario = (Inventario) formulario.getRegistroActivo();
		inventario.setCodConceptoAlmacen(request.getParameter("codConceptoAlmacen"));
		inventario.setDesConceptoAlmacen(request.getParameter("desConceptoAlmacen"));
		inventario.setCodAlmacen(request.getParameter("codAlmacen"));
		inventario.setDesAlmacen(request.getParameter("desAlmacen"));
		inventario.setFechaInventario(Fechas.getFecha(request.getParameter("fechaInventario")));		
	}
	
	private RegularizacionBean leerRegularizacion(FormularioInventarioBean formulario,
			HttpServletRequest request) throws FechaException {
		
		HttpSession sesion = request.getSession();
		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
		
		RegularizacionBean regularizacion = new RegularizacionBean();
		regularizacion.setIdUsuario(datosSesion.getUsuario().getIdUsuario());
		regularizacion.setCodConceptoAlmacen(request.getParameter("codConceptoAlmacen"));
		regularizacion.setDesConceptoAlmacen(request.getParameter("desConceptoAlmacen"));
		regularizacion.setCodAlmacen(request.getParameter("codAlmacen"));
		regularizacion.setDesAlmacen(request.getParameter("desAlmacen"));
		regularizacion.setFecha(Fechas.getFecha(request.getParameter("fechaInventario")));
		regularizacion.setCodArticulo(request.getParameter("codArticulo"));
		regularizacion.setDesArticulo(request.getParameter("desArticulo"));
		regularizacion.setDesglose1(request.getParameter("desglose1"));
		regularizacion.setDesglose2(request.getParameter("desglose2"));
		regularizacion.setUnidadMedida(request.getParameter("unidadMedida"));
		if(regularizacion.getUnidadMedida() != null && !regularizacion.equals("")){
			regularizacion.setCantidadMedida(Numero.desformatea(request.getParameter("cantidadMedida"), 0D));
			regularizacion.setStockUMAlt(Numero.desformatea(request.getParameter("stockUMAlt"), 0D));
		}
		regularizacion.setCantidad(Numero.desformatea(request.getParameter("cantidad"), 0D));		
		regularizacion.setStockActual(Numero.desformatea(request.getParameter("stockActual"), 0D));
		regularizacion.setPrecio(Numero.desformatea(request.getParameter("precio"), 0D));
		regularizacion.setImporte(Numero.redondea(regularizacion.getPrecio() * (regularizacion.getCantidad()-regularizacion.getStockActual()), 2));
		
		return regularizacion;
	}
}
