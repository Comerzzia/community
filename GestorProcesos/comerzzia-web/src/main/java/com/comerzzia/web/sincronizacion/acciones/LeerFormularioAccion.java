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

package com.comerzzia.web.sincronizacion.acciones;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.sincronizacion.TrabajoSincronizadorBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.sincronizacion.ServicioSincronizador;
import com.comerzzia.servicios.sincronizacion.SincronizadorTiendas;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.sincronizacion.ui.FormularioSincronizacionBean;


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
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
			
			// Comprobamos los permisos de la acción
    		PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
    		if (!permisos.isPuedeEjecutar()) {
    			return SIN_PERMISO;
    		}
			
			// Obtenemos la operación solicitada
			String operacion = request.getParameter("operacion");
			String indice = request.getParameter("indice");
			log.debug("ejecutar() - operacion=" + operacion + " indice=" + indice);
			
			// Actualizamos el formulario
			FormularioSincronizacionBean formulario = (FormularioSincronizacionBean) sesion.getAttribute(WebKeys.FORMULARIO_SINCRONIZACION);
			
			try {
				// Actualizamos los segundos de refresco del formulario
				formulario.setSegundosRefresco(Short.parseShort(request.getParameter("segundosRefresco")));
			}
			catch (Exception ignore) {
			}
			
            if (operacion != null) {
            	// Cambiar pestaña activa
                if (operacion.equals("pestaña")) {
                	// Si la pestaña activa esta en edicion no dejamos cambiar de pestaña para evitar que se edite el trabajo en dos pestañas
                	if (formulario.getFormularioPestañaActiva().isEditable()) {
                		setMensajeError(request, "Debe aceptar o cancelar los cambios");
                	
                	}else{
                		formulario.setPestañaActiva(Integer.parseInt(indice));
                		formulario.getFormularioPestañaActiva().setModoVisualizacionTabla();
                	}
                }
                // Cambiar modo visualización de la pestaña activa 
                else if (operacion.equals("vistaTablaPestaña")) {
                	formulario.getFormularioPestañaActiva().setModoVisualizacionTabla();
                }
                // Ver un trabajo de la lista
                else if (operacion.equals("verTrabajo")) {
                	TrabajoSincronizadorBean trabajo = ServicioSincronizador.consultar(Numero.desformateaLong(indice, 0L), datosSesion);
                	formulario.getFormularioPestañaActiva().inicializar(trabajo);
                	formulario.getFormularioPestañaActiva().setModoVisualizacionFicha();
                }
                // Editar un trabajo de la lista
                else if (operacion.equals("editarTrabajo")) {                	
                	TrabajoSincronizadorBean trabajo = ServicioSincronizador.consultar(Numero.desformateaLong(indice, 0L), datosSesion);
                	if(trabajo.getFechaProximaEjecucion() == null)
                		trabajo.setFechaProximaEjecucion(new Date());
                	formulario.getFormularioPestañaActiva().inicializar(trabajo);
                	formulario.getFormularioPestañaActiva().setModoEdicion();
                }
                // Aceptar cambios de un trabajo
                if (operacion.equals("aceptarTrabajo")) {
                	leerFormularioRegistro(formulario, request);
                	formulario.getFormularioPestañaActiva().aceptar();
                	return getControlador().getAccion("salvar").ejecutar(request);
                }
                // Cancelar cambios de un trabajo
                else if (operacion.equals("cancelarTrabajo")) {
                	formulario.getFormularioPestañaActiva().cancelar();
                	// Volvemos a calcular los datos del trabajo
                	TrabajoSincronizadorBean registro = (TrabajoSincronizadorBean)formulario.getFormularioPestañaActiva().getRegistroActivo();
                	TrabajoSincronizadorBean trabajo = ServicioSincronizador.consultar(registro.getIdTrabajo(), datosSesion);
                	formulario.getFormularioPestañaActiva().inicializar(trabajo);
                }
                // Iniciar sincronizador
                else if (operacion.equals("arrancar")) {
                	try {
                		SincronizadorTiendas.getInstance().arrancar();
						setMensaje(request, "El Sincronizador de Tiendas ha arrancado correctamente");
					} 
                	catch (Exception e) {
                		setMensajeError(request, "Error al arrancar el Sincronizador de Tiendas: " + e.getMessage());
					}
                }
                // Parar sincronizador
                else if (operacion.equals("parar")) {
                	try {
                		SincronizadorTiendas.getInstance().parar();
						setMensaje(request, "El Sincronizador de Tiendas se ha detenido correctamente");
					} 
                	catch (Exception e) {
                		setMensajeError(request, "Error al detener el Sincronizador de Tiendas: " + e.getMessage());
					}
                }
                // Reiniciar sincronizador
                else if (operacion.equals("reiniciar")) {
                	try {
                		SincronizadorTiendas.getInstance().reiniciar();
						setMensaje(request, "El Sincronizador de Tiendas se ha reiniciado correctamente");
					} 
                	catch (Exception e) {
                		setMensajeError(request, "Error al reiniciar el Sincronizador de Tiendas: " + e.getMessage());
					}
                }
                // Iniciar trabajo
                else if (operacion.equals("arrancarTrabajo")) {
                	try {
                		SincronizadorTiendas.getInstance().arrancarTrabajo(Long.parseLong(indice));
                		if (SincronizadorTiendas.getInstance().isParado()) {
                			setMensajeAviso(request, "El trabajo se ha arrancado correctamente. Su ejecución comenzará cuando se arranque el Sincronizador");
                		}
                		else {
                			setMensaje(request, "El trabajo se ha arrancado correctamente");
                		}
					} 
                	catch (Exception e) {
                		setMensajeError(request, "Error al arrancar trabajo: " + e.getMessage());
					}
                }
                // Pausar trabajo
                else if (operacion.equals("pausarTrabajo")) {
                	try {
                		SincronizadorTiendas.getInstance().pausarTrabajo(Long.parseLong(indice));
						setMensaje(request, "El trabajo se ha pausado correctamente");
					} 
                	catch (Exception e) {
                		setMensajeError(request, "Error al pausar trabajo: " + e.getMessage());
					}
                }
                // Parar trabajo
                else if (operacion.equals("pararTrabajo")) {
                	try {
                		SincronizadorTiendas.getInstance().pararTrabajo(Long.parseLong(indice));
						setMensaje(request, "El trabajo se ha detenido correctamente");
					} 
                	catch (Exception e) {
                		setMensajeError(request, "Error al detener trabajo: " + e.getMessage());
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
	
	private void leerFormularioRegistro(FormularioSincronizacionBean formulario, HttpServletRequest request) throws Exception {
		if (formulario.getFormularioPestañaActiva().isEditable()) {
			TrabajoSincronizadorBean trabajo = (TrabajoSincronizadorBean)formulario.getFormularioPestañaActiva().getRegistroActivo();
			// Fecha proxima ejecucion
			leerFechaProximaEjecucion(trabajo, request);
			// Intervalo
			leerIntervalo(trabajo, request);
		}				
	}
	
	private void leerFechaProximaEjecucion(TrabajoSincronizadorBean trabajo, HttpServletRequest request) throws Exception{
		String fechaProximaEjecucionString = request.getParameter("fechaProximaEjecucion");
		String horaProximaEjecucionString = request.getParameter("horaProximaEjecucion");
		if(!fechaProximaEjecucionString.isEmpty() && !horaProximaEjecucionString.isEmpty()){
			fechaProximaEjecucionString = fechaProximaEjecucionString + " " + horaProximaEjecucionString;
			Date fechaProximaEjecucion = Fechas.getFecha(fechaProximaEjecucionString, "dd/MM/yyyy HH:mm");
			trabajo.setFechaProximaEjecucion(fechaProximaEjecucion);
		
		}else{
			trabajo.setFechaProximaEjecucion(null);
		}
	}
	
	private void leerIntervalo(TrabajoSincronizadorBean trabajo, HttpServletRequest request){
		String cantidad = "", medida = "", dias = "";
		if(request.getParameter("ejecIntervalo") != null){
			
			if(request.getParameter("intervalo").equals("minutos")){
				cantidad = request.getParameter("minutos");
				medida = "m";
			}else if(request.getParameter("intervalo").equals("horas")){
				cantidad = request.getParameter("horas");
				medida = "h";
			}else{
				cantidad = request.getParameter("dias");
				medida = "d";
			}
			
			if(request.getParameter("lunes") != null){
				dias = "L";
			}
			if(request.getParameter("martes") != null){
				dias = dias + "M";
			}
			if(request.getParameter("miercoles") != null){
				dias = dias + "X";
			}
			if(request.getParameter("jueves") != null){
				dias = dias + "J";
			}
			if(request.getParameter("viernes") != null){
				dias = dias + "V";
			}
			if(request.getParameter("sabado") != null){
				dias = dias + "S";
			}
			if(request.getParameter("domingo") != null){
				dias = dias + "D";
			}
			
			trabajo.setIntervalo(cantidad, medida, dias);
		
		}else{
			trabajo.setIntervalo(null);
		}
	}
}
