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

package com.comerzzia.web.ventas.tickets.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.ventas.tickets.errores.ParametrosBuscarErrorTicketsBean;
import com.comerzzia.persistencia.ventas.tickets.historico.ParametrosBuscarHistoricoTicketsBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.ventas.tickets.ProcesadorTickets;
import com.comerzzia.util.fechas.FechaException;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.util.log.Logger;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.ventas.tickets.ui.FormularioTicketBean;


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
			FormularioTicketBean formulario = (FormularioTicketBean) sesion.getAttribute(WebKeys.FORMULARIO_TICKET);
			
			try {
				// Actualizamos los segundos de refresco del formulario
				formulario.setSegundosRefresco(Short.parseShort(request.getParameter("segundosRefresco")));
			}
			catch (Exception ignore) {
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
                // Cancelar cambios del formulario de la pestaña activa
                else if (operacion.equals("cancelarRegistroPestaña")) {
                	formulario.getFormularioPestañaActiva().cancelar();
                }
                else if (operacion.equals("arrancar")) {
                	if (formulario.getPestañaActiva() == 0) {
                		try {
                			ProcesadorTickets.getInstance().arrancar();
                			setMensaje(request, "El Servicio de Procesamiento de Tickets ha arrancado correctamente");
                		}
                		catch (Exception e) {
                			setMensajeError(request, "Error al arrancar el Servicio de Procesamiento de Tickets: " + e.getMessage());
                		}
                	}
                }
                else if (operacion.equals("parar")) {
                	if (formulario.getPestañaActiva() == 0) {
                		try {
                			ProcesadorTickets.getInstance().parar();
                			setMensaje(request, "El Servicio de Procesamiento de Tickets se ha detenido correctamente");
                		}
                		catch (Exception e) {
                			setMensajeError(request, "Error al detener el Servicio de Procesamiento de Tickets: " + e.getMessage());
                		}
                	}
                }
                else if (operacion.equals("reiniciar")) {
                	if (formulario.getPestañaActiva() == 0) {
                		try {
                			ProcesadorTickets.getInstance().reiniciar();
                			setMensaje(request, "El Servicio de Procesamiento de Tickets se ha reiniciado correctamente");
                		}
                		catch (Exception e) {
                			setMensajeError(request, "Error al reiniciar el Servicio de Procesamiento de Tickets: " + e.getMessage());
                		}
                	}
                }
                else if (operacion.equals("consultar")) {
                	switch (formulario.getPestañaActiva()) {
                		case 1:  // Tickets Erroneos
                			setParametrosBuscarTicketsErroneos(formulario, request);
                			break;
                			
                		case 2:  // Historico de Tickets
                			setParametrosBuscarTicketsProcesados(formulario, request);
                			break;
                	}
                }
                else if (operacion.equals("paginar")) {
                	switch (formulario.getPestañaActiva()) {
	            		case 1:  // Tickets Erroneos
	            			setPaginaBuscarTicketsErroneos(formulario, request);
	            			break;
	            			
	            		case 2:  // Historico de Tickets
	            			setPaginaBuscarTicketsProcesados(formulario, request);
	            			break;
                	}
                }
                else if (operacion.equals("ordenar")) {
                	switch (formulario.getPestañaActiva()) {
	            		case 1:  // Tickets Erroneos
	            			setOrdenBuscarTicketsErroneos(formulario, request);
	            			break;
	            			
	            		case 2:  // Historico de Tickets
	            			setOrdenBuscarTicketsProcesados(formulario, request);
	            			break;
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
	
		
    private void setParametrosBuscarTicketsErroneos(FormularioTicketBean formulario, HttpServletRequest request) throws FechaException {
    	ParametrosBuscarErrorTicketsBean param = formulario.getParametrosBuscarErrorTicket();
    	
    	param.setCodAlmacen(request.getParameter("codAlmacenErroneo"));
    	param.setDesAlmacen(request.getParameter("desAlmacenErroneo"));
    	if(request.getParameter("fecha") != null && !request.getParameter("fecha").isEmpty()){
            param.setFecha(Fechas.getFecha(request.getParameter("fecha")));
    	}
    	else{
    		param.setFecha(null);
    	}
        
        param.setNumPagina(1);
		
        // Actualizar el número de resultados por página
		try {
			param.setTamañoPagina(Integer.parseInt(request.getParameter("tamanoPagina")));
		} 
		catch (Exception ignore) {
			// Si no se recibe el tamaño de página, se mantiene el que se tenía
		}
    }
    
    
    private void setPaginaBuscarTicketsErroneos(FormularioTicketBean formulario, HttpServletRequest request) {
    	ParametrosBuscarErrorTicketsBean param = formulario.getParametrosBuscarErrorTicket();
    	
    	try {
            // Obtenemos la pagina solicitada
            int pagina = Integer.parseInt(request.getParameter("pagina"));
            param.setNumPagina(pagina);
        }
        catch (Exception ignore) {
            // Si no tenemos pagina, se mostrará la que teníamos
        }
    }

    
    private void setParametrosBuscarTicketsProcesados(FormularioTicketBean formulario, HttpServletRequest request) throws FechaException {
    	ParametrosBuscarHistoricoTicketsBean param = formulario.getParametrosBuscarHistoricoTicket();
    	
    	param.setCodAlmacen(request.getParameter("codAlmacenProcesado"));
    	param.setDesAlmacen(request.getParameter("desAlmacenProcesado"));
        param.setFechaDesde(Fechas.getFecha(request.getParameter("fechaDesde") + " - 23:59:59", "dd/MM/yyyy - HH:mm:ss"));
        param.setFechaHasta(Fechas.getFecha(request.getParameter("fechaHasta") + " - 23:59:59", "dd/MM/yyyy - HH:mm:ss"));
        
        param.setNumPagina(1);

        // Actualizar el número de resultados por página
		try {
			param.setTamañoPagina(Integer.parseInt(request.getParameter("tamanoPagina")));
		} 
		catch (Exception ignore) {
			// Si no se recibe el tamaño de página, se mantiene el que se tenía
		}
    }
    
    
    private void setPaginaBuscarTicketsProcesados(FormularioTicketBean formulario, HttpServletRequest request) {
    	ParametrosBuscarHistoricoTicketsBean param = formulario.getParametrosBuscarHistoricoTicket();
    	
    	try {
            // Obtenemos la pagina solicitada
            int pagina = Integer.parseInt(request.getParameter("pagina"));
            param.setNumPagina(pagina);
        }
        catch (Exception ignore) {
            // Si no tenemos pagina, se mostrará la que teníamos
        }
    }
    
    
	private void setOrdenBuscarTicketsErroneos(FormularioTicketBean formulario, HttpServletRequest request) {
    	ParametrosBuscarErrorTicketsBean param = formulario.getParametrosBuscarErrorTicket();

    	try {
			// Establecemos primera pagina
			param.setNumPagina(1);

			// Obtenemos la columna por la que ordenar
			int columna = Integer.parseInt(request.getParameter("columna"));

			// Establecemos la columna de orden
			switch (columna) {
			case 1: // CODALM
				if (param.getOrden().equals("CODALM")) {
					param.setOrden("CODALM DESC");
				} else {
					param.setOrden("CODALM");
				}
				break;
			case 2: // DESALM
				if (param.getOrden().equals("DESALM")) {
					param.setOrden("DESALM DESC");
				} else {
					param.setOrden("DESALM");
				}
				break;
			case 3: // FECHA
				if (param.getOrden().equals("FECHA")) {
					param.setOrden("FECHA DESC");
				} else {
					param.setOrden("FECHA");
				}
				break;
			case 4: // DESALM
				if (param.getOrden().equals("ID_TICKET")) {
					param.setOrden("ID_TICKET DESC");
				} else {
					param.setOrden("ID_TICKET");
				}
				break;
			default:
				param.setOrden("CODALM");
			}
		} catch (Exception e) {
			// Si no tenemos orden, se dejar el que se tenía
		}
	}

	
	private void setOrdenBuscarTicketsProcesados(FormularioTicketBean formulario, HttpServletRequest request) {
    	ParametrosBuscarHistoricoTicketsBean param = formulario.getParametrosBuscarHistoricoTicket();

    	try {
			// Establecemos primera pagina
			param.setNumPagina(1);

			// Obtenemos la columna por la que ordenar
			int columna = Integer.parseInt(request.getParameter("columna"));

			// Establecemos la columna de orden
			switch (columna) {
			case 1: // CODALM
				if (param.getOrden().equals("CODALM")) {
					param.setOrden("CODALM DESC");
				} else {
					param.setOrden("CODALM");
				}
				break;
			case 2: // DESALM
				if (param.getOrden().equals("DESALM")) {
					param.setOrden("DESALM DESC");
				} else {
					param.setOrden("DESALM");
				}
				break;
			case 3: // FECHA
				if (param.getOrden().equals("FECHA")) {
					param.setOrden("FECHA DESC");
				} else {
					param.setOrden("FECHA");
				}
				break;
			default:
				param.setOrden("CODALM");
			}
		} catch (Exception e) {
			// Si no tenemos orden, se dejar el que se tenía
		}
	}

}
