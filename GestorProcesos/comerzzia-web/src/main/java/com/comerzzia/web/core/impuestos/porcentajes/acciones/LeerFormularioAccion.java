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

package com.comerzzia.web.core.impuestos.porcentajes.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.core.impuestos.porcentajes.PorcentajeImpuestoBean;
import com.comerzzia.servicios.core.impuestos.porcentajes.ServicioPorcentajesImpuestos;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.core.impuestos.porcentajes.ui.FormularioPorcentajeImpuestosBean;


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
			FormularioPorcentajeImpuestosBean formulario = (FormularioPorcentajeImpuestosBean) sesion.getAttribute(WebKeys.FORMULARIO_PORCENTAJE_IMPUESTOS);
			if (operacion == null || !operacion.equals("cancelar")) {
				leerFormulario(formulario, request);
			}
			
            if (operacion != null) {
            	// Cambiar pestaña activa
                if (operacion.equals("pestaña")) {
                	formulario.setPestañaActiva(Integer.parseInt(indice));
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
                	switch (formulario.getPestañaActiva()) {
	    				case 1:  // Porcentaje de impuestos
	    					PorcentajeImpuestoBean codigo = new PorcentajeImpuestoBean();
	    					formulario.getFormularioPestañaActiva().setModoInsercion(codigo);
	    					break;
	    				
	    			}
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
                		setMensajeError(request, "Debe aceptar o cancelar los cambios de la línea antes de salvar el porcentaje");
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
                		// Obtenemos el porcentaje y lo actualizamos en el formulario
                		PorcentajeImpuestoBean porcentaje = (PorcentajeImpuestoBean) formulario.getRegistroActivo();
                		porcentaje = ServicioPorcentajesImpuestos.consultar(porcentaje.getIdGrupoImpuestos(),porcentaje.getIdTratImpuestos(),porcentaje.getCodImp());
                		formulario.inicializar(porcentaje);
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
	 * @throws FechaException 
	 */
	private void leerFormulario(FormularioPorcentajeImpuestosBean formulario, HttpServletRequest request) throws FechaException {
		PorcentajeImpuestoBean porcentaje = (PorcentajeImpuestoBean) formulario.getRegistroActivo();
		if (formulario.isEditable()){
			if (formulario.isEnInsercion()){
				porcentaje.setVigenciaDesde(Fechas.getFecha(request.getParameter("vigenciaDesde")));
			}
			else if (formulario.isEnEdicion()) {
				porcentaje.setPorcentaje((Numero.desformatea(request.getParameter("porcentaje"),porcentaje.getPorcentaje())));
				porcentaje.setPorcentajeRecargo(Numero.desformatea(request.getParameter("porcentajeRecargo"), porcentaje.getPorcentajeRecargo()));
			}
		}
	}
	
	
	private void leerFormularioRegistro(FormularioPorcentajeImpuestosBean formulario, HttpServletRequest request) {		

	}
}
