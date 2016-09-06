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

package com.comerzzia.web.ventas.tarifas.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.ventas.tarifas.TarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ArticuloTarifaBean;
import com.comerzzia.persistencia.ventas.tarifas.articulos.ParametrosBuscarArticulosTarifaBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.tarifas.ServicioTarifas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.tarifas.iu.FormularioTarifaBean;


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
			FormularioTarifaBean formulario = (FormularioTarifaBean) sesion.getAttribute(WebKeys.FORMULARIO_TARIFA);
			if (operacion == null || !operacion.equals("cancelar")) {
				leerFormulario(formulario, request);
			}

			// obtenemos tarifa actual como registro activo
			TarifaBean tarifa = (TarifaBean) formulario.getRegistroActivo();
			
            if (operacion != null) {
            	// Cambiar pestaña activa
                if (operacion.equals("pestaña")) {
                	formulario.setPestañaActiva(Integer.parseInt(indice));
                }
                // Cambiar modo visualización de la pestaña activa 
                else if (operacion.equals("vistaTablaPestaña")) {
                	formulario.getFormularioPestañaActiva().setModoVisualizacionTabla();
                }
                // Realizar búsqueda de registros en una pestaña 
                else if (operacion.equals("buscarRegistrosPestaña")) {
                	leerParametrosBusqueda(formulario, request);
                }
                // Ver un registro de la pestaña activa
                else if (operacion.equals("verRegistroPestaña")) {
                	formulario.getFormularioPestañaActiva().seleccionaRegistroActivo(Integer.parseInt(indice));
                	formulario.getFormularioPestañaActiva().setModoVisualizacionFicha();
                }
                // Añadir un nuevo registro a la pestaña activa
                else if (operacion.equals("nuevoRegistroPestaña")) {
                	switch (formulario.getPestañaActiva()) {
	    				case 0:  // Artículos
	    					if (tarifa.isTarifaGeneral()){
	    						setMensajeAviso(request, "No se pueden añadir artículos a la tarifa general.");
	    					} // TODO: TARIFAS: comprobar que no se añade un artículo que ya existe. Ahora mismo se está controlando al salvar con la constraint de base de datos
	    					else{ 
		    					ArticuloTarifaBean articulo = new ArticuloTarifaBean();
		    					formulario.getFormularioPestañaActiva().setModoInsercion(articulo);
	    					}
	    					break;
	    			}
                }
                // Editar un registro de la pestaña activa
                else if (operacion.equals("editarRegistroPestaña")) {
                	formulario.getFormularioPestañaActiva().setModoEdicion(Integer.parseInt(indice));
                }
                // Eliminar un registro de la pesaña activa
                else if (operacion.equals("eliminarRegistroPestaña")) {
					if (tarifa.isTarifaGeneral()){
						setMensajeAviso(request, "No se pueden eliminar artículos de la tarifa general.");
					}
					else{
						formulario.getFormularioPestañaActiva().eliminar(Integer.parseInt(indice));
					}
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
                		setMensajeError(request, "Debe aceptar o cancelar los cambios de la línea antes de salvar la tarifa.");
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
                		// Obtenemos el artículo y lo actualizamos en el formulario
                		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
                		tarifa = (TarifaBean) formulario.getRegistroActivo();
                		tarifa = ServicioTarifas.consultar(tarifa.getCodTar(), datosSesion);
                		formulario.inicializar(tarifa);
                	}
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
	 */
	private void leerFormulario(FormularioTarifaBean formulario, HttpServletRequest request) {
		TarifaBean tarifa = (TarifaBean) formulario.getRegistroActivo();
		
		if (formulario.isEnInsercion()) {
			tarifa.setCodTar(request.getParameter("codTar"));
		}
		
		if (formulario.isEditable()) {
			tarifa.setDesTar(request.getParameter("desTar"));
		}
	}
	
	private void leerFormularioRegistro(FormularioTarifaBean formulario, HttpServletRequest request) {
		switch (formulario.getPestañaActiva()) {
		case 0:  // Artículos
			if (formulario.getFormularioPestañaActiva().isEditable()) {
				ArticuloTarifaBean articulo = (ArticuloTarifaBean) formulario.getFormularioPestañaActiva().getRegistroActivo();
				articulo.setCodArt(request.getParameter("codArticulo"));
				articulo.setDesArt(request.getParameter("desArticulo"));
				articulo.setPrecioCosto(Numero.desformatea(request.getParameter("precioCosto"), null));
				articulo.setFactorMarcaje(Numero.desformatea(request.getParameter("factorMarcaje"), null));
				articulo.setPrecioVenta(Numero.desformatea(request.getParameter("precioVenta"), null));
				articulo.setPrecioTotal(Numero.desformatea(request.getParameter("precioTotal"), null));
			}
			break;
		}
	}

	
	private void leerParametrosBusqueda(FormularioTarifaBean formulario, HttpServletRequest request) {
		switch (formulario.getPestañaActiva()) {
			case 0:  // Artículos
				ParametrosBuscarArticulosTarifaBean param = (ParametrosBuscarArticulosTarifaBean)formulario.getFormularioPestañaActiva().getParam();
				param.setCodTar(request.getParameter("codTar"));
				param.setDesArtText(request.getParameter("desArtText"));
				param.setCodArt(request.getParameter("codArt"));
				param.setDesArt(request.getParameter("desArt"));
				param.setCodFam(request.getParameter("codFam"));
				param.setDesFam(request.getParameter("desFam"));
				param.setCodPro(request.getParameter("codPro"));
				param.setDesPro(request.getParameter("desPro"));
				param.setNumPagina(1);
		        // Actualizar el número de resultados por página
		        try { 
		        	param.setTamañoPagina(Integer.parseInt(request.getParameter("tamanoPagina")));
		        } catch(Exception ignore) {
		        	// Si no se recibe el tamaño de página, se mantiene el que se tenía
		        }
				break;
		}
	}
		
}
