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

package com.comerzzia.web.ventas.promociones.acciones;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.ventas.promociones.PromocionBean;
import com.comerzzia.persistencia.ventas.promociones.articulos.ArticuloPromocionBean;
import com.comerzzia.persistencia.ventas.promociones.articulos.ParametrosBuscarArticulosPromocionesBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.promociones.ServicioPromociones;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.promociones.ui.FormularioPromocionBean;

public class LeerFormularioAccion extends Accion {
	
	private static final Vista NEXT_PAGE = new Vista("ventas/promociones/mantenimiento/jsp/seleccionarFechaFin.jsp", Vista.INTERNA);

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
			FormularioPromocionBean formulario = (FormularioPromocionBean) sesion.getAttribute(WebKeys.FORMULARIO_PROMOCION);
			if (operacion == null || !operacion.equals("cancelar")) {
				leerFormulario(formulario, request);
			}
			
            if (operacion != null) {
            	// Consulta artículos 
                if (operacion.equals("consultarArticulos")) {
                	// Si tenemos el formulario en edición debemos aceptar o cancelar los cambios antes de realizar una nueva consulta de artículos
                	if (formulario.isEnEdicion()) {
                		setMensajeError(request, "Debe aceptar o cancelar los cambios antes de realizar una nueva consulta");
                	}
                	else {
                		leerParametrosBusqueda(formulario, request);
                		return getControlador().getAccion("buscarArticulos").ejecutar(request);
                	}
                }
            	// Cambiar modo visualización de la pestaña activa 
                else if (operacion.equals("vistaTablaPestaña")) {
                	formulario.getFormularioPestañaActiva().setModoVisualizacionTabla();
                }
                // Ver un registro de la pestaña activa
                else if (operacion.equals("verRegistroPestaña")) {
                	formulario.getFormularioPestañaActiva().seleccionaRegistroActivo(Integer.parseInt(indice));
                	formulario.getFormularioPestañaActiva().setModoVisualizacionFicha();
                }
                // Añadir un nuevo registro a la pestaña activa
                else if (operacion.equals("nuevoRegistroPestaña")) {
                	PromocionBean promocion = (PromocionBean) formulario.getRegistroActivo();
                	ArticuloPromocionBean articulo = new ArticuloPromocionBean();
                	if(promocion.isActiva()){
                		articulo.setFechaInicio(promocion.getFechaInicio());
                		articulo.setFechaFin(promocion.getFechaFin());
                	}
                	formulario.getFormularioPestañaActiva().setModoInsercion(articulo);
                }
                // Editar un registro de la pestaña activa
                else if (operacion.equals("editarRegistroPestaña")) {
                	formulario.getFormularioPestañaActiva().setModoEdicion(Integer.parseInt(indice));
                }
                // Eliminar un registro de la pesaña activa
                else if (operacion.equals("eliminarRegistroPestaña")) {
                	formulario.getFormularioPestañaActiva().eliminar(Integer.parseInt(indice));
                }
                // Aceptar cambios del formulario de la pestaña activa
                if (operacion.equals("aceptarRegistroPestaña")) {
                	leerFormularioRegistro(formulario, request);
                	formulario.getFormularioPestañaActiva().aceptar();
                }
                // Cancelar cambios del formulario de la pestaña activa
                else if (operacion.equals("cancelarRegistroPestaña")) {
                	formulario.getFormularioPestañaActiva().cancelar();
                }
                // Aceptar cambios del formulario
                else if (operacion.equals("aceptar")) {
                	// Si tenemos algún formulario en edición forzamos a que se acepten o cancelen los cambios
                	int pestaña = formulario.getIndicePrimeraPestañaEditable();
                	if (pestaña != -1) {
                		formulario.setPestañaActiva(pestaña);
                		setMensajeError(request, "Debe aceptar o cancelar los cambios de la línea antes de salvar el artículo de la promoción");
                	}
                	else {
                		return getControlador().getAccion("salvar").ejecutar(request);
                	}
                }
                // Cancelar cambios en el formulario
                else if (operacion.equals("cancelar")) {
                	formulario.cancelar();
                	
                	// Si no tenemos registro activo volvemos al buscador
                	if (formulario.isRegistroActivoVacio()) {
                		return getControlador().getAccion("buscar").ejecutar(request);
                	}
                	else {
                		// Obtenemos la promocion y lo actualizamos en el formulario
                		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
                		PromocionBean promocion = (PromocionBean) formulario.getRegistroActivo();
                		promocion = ServicioPromociones.consultar(promocion.getIdPromocion(), datosSesion);
                		formulario.inicializar(promocion);
                	}
                }
                else if(operacion.equals("anular")){
                	((PromocionBean)formulario.getRegistroActivo()).setFechaFin(new Date());
                	return NEXT_PAGE;
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
	
	/**
	 * Lee los campos del formulario principal y del formulario de la pestaña activa
	 * actualizando los atributos del registro activo
	 * @param formulario
	 * @param request
	 * @throws FechaException 
	 */
	private void leerFormulario(FormularioPromocionBean formulario, HttpServletRequest request) throws FechaException {
		PromocionBean promocion = (PromocionBean) formulario.getRegistroActivo();
		
		if (formulario.isEditable()) {
			promocion.setDescripcion(request.getParameter("descripcion"));
    		promocion.setCodTar(request.getParameter("codTar"));   		
    		promocion.setSoloFidelizacion(request.getParameter("soloFidelizacion") != null);  		
    		promocion.setFechaInicio(Fechas.getFecha(request.getParameter("fechaInicio")));
    		promocion.setFechaFin(Fechas.getFecha(request.getParameter("fechaFin")));
		}
	}
	
	/**
	 * Lee los parámetros de búsqueda de artículos
	 * @param formulario
	 * @param request
	 * @throws FechaException 
	 */
	private void leerParametrosBusqueda(FormularioPromocionBean formulario, HttpServletRequest request) {
		ParametrosBuscarArticulosPromocionesBean param = (ParametrosBuscarArticulosPromocionesBean) formulario.getFormularioPestañaActiva().getParam();
		
		param.setDescripcion(request.getParameter("descripcionArt"));   
    	param.setCodArt(request.getParameter("codArtBus"));
    	param.setDesArt(request.getParameter("desArtBus"));   
    	param.setCodFam(request.getParameter("codFam"));
    	param.setDesFam(request.getParameter("desFam"));   
    	param.setCodPro(request.getParameter("codPro"));
    	param.setDesPro(request.getParameter("desPro"));   
	}
	
	
	private void leerFormularioRegistro(FormularioPromocionBean formulario, HttpServletRequest request) throws FechaException {
		ArticuloPromocionBean articulo = (ArticuloPromocionBean) formulario.getFormularioPestañaActiva().getRegistroActivo();
		articulo.setCodArt(request.getParameter("codArt"));
		articulo.setDesArt(request.getParameter("desArt"));
        articulo.setPrecioTarifa(Numero.desformatea(request.getParameter("precioTarifa"), 0D));
        articulo.setPrecioTarifaConImpuestos(Numero.desformatea(request.getParameter("precioTarifaConImpuestos"), 0D));
    	articulo.setPrecioVenta(Numero.desformatea(request.getParameter("precioVenta"), null));
    	articulo.setPrecioTotal(Numero.desformatea(request.getParameter("precioTotal"), null));
        articulo.setPuntos(Numero.desformateaLong(request.getParameter("puntos"), 0L));
        articulo.setTextoPromocion(request.getParameter("textoPromocion"));
        
        PromocionBean promocion = (PromocionBean) formulario.getRegistroActivo();
        if(promocion.isActiva()){
        	articulo.setFechaInicio(Fechas.getFecha(request.getParameter("fechaInicioArt")));
        	articulo.setFechaFin(Fechas.getFecha(request.getParameter("fechaFinArt")));
        }
	}
	
}
