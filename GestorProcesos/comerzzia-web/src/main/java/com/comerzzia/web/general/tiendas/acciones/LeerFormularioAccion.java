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

package com.comerzzia.web.general.tiendas.acciones;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.comerzzia.persistencia.general.tiendas.cajas.CajaBean;
import com.comerzzia.persistencia.general.tiendas.tarifas.TarifaTiendaBean;
import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenUsuarioBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.tiendas.ServicioTiendas;
import com.comerzzia.servicios.general.tiendas.Tienda;
import com.comerzzia.servicios.general.tiendas.TiendaException;
import com.comerzzia.servicios.general.tiendas.TiendaNotFoundException;
import com.comerzzia.servicios.general.tiendas.tarifas.ServicioTarifasTiendas;
import com.comerzzia.servicios.general.tiendas.tarifas.TarifaTiendaException;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.general.tiendas.ui.FormularioTiendaBean;


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
			
			// Obtenemos la operación solicitada
			String operacion = request.getParameter("operacion");
			String indice = request.getParameter("indice");
			log.debug("ejecutar() - operacion=" + operacion + " indice=" + indice);
			
			// Actualizamos el formulario
			FormularioTiendaBean formulario = (FormularioTiendaBean) sesion.getAttribute(WebKeys.FORMULARIO_TIENDA);
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
	    				case 1:  // Cajas
	    					CajaBean caja = new CajaBean();
	    					formulario.getFormularioPestañaActiva().setModoInsercion(caja);
	    				case 2:  // Tarifas
	    					request.setAttribute("modoFicha", true);
	    					/*formulario.getFormularioPestañaActiva().setModoVisualizacionFicha();*/
	    				case 3:  // Configuracion
	    					request.setAttribute("modoFicha", true);
	    					formulario.getFormularioPestañaActiva().setModoVisualizacionFicha();
	    				case 4:  // Usuarios
	    					request.setAttribute("modoFicha", true);
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
                else if (operacion.equals("aceptarRegistroPestaña")) {
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
                		setMensajeError(request, "Debe aceptar o cancelar los cambios de la línea antes de salvar la tienda");
                	}
                	else {
                		Tienda tienda = (Tienda) formulario.getRegistroActivo();
                		// Comprobar que existen tarifas 
                		if(!tienda.isExistenTarifas()) {
                			formulario.setPestañaActiva(2); // Pestaña de tarifas
                			setMensajeError(request, "La tienda debe tener asignada al menos una tarifa");
                			
                			return getControlador().getAccion("verFormulario").ejecutar(request);
                		}
                		
                		// Comprobar que existen usuarios
                		if(!tienda.isExistenUsuarios()) {
                			formulario.setPestañaActiva(4); // Pestaña de usuarios
                			setMensajeError(request, "La tienda debe tener asignada al menos un usuario");
                			
                			return getControlador().getAccion("verFormulario").ejecutar(request);
                		}
                		
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
                		Tienda tienda = (Tienda) formulario.getRegistroActivo();
                		tienda = ServicioTiendas.consultar(tienda.getCodAlm(), datosSesion);
                		formulario.inicializar(tienda);
                	}
                }
                // Reiniciar la version de la tienda
                else if(operacion.equals("forzarEnvioArticulos")){
                	Tienda tienda = (Tienda) formulario.getRegistroActivo();
                	tienda.setVersionArticulos(0L);
        			tienda.setVersionArticulosRevisada(0L);
        			tienda.setFechaVersionArticulos(null);
        			tienda.setFechaVersionArticulosRevisada(null);
                }
                // Reiniciar la version de la tarida
                else if(operacion.equals("forzarEnvioTarifas")){
                	forzarEnvioArticulosTienda((Tienda) formulario.getRegistroActivo(), datosSesion);
                }
                // Reiniciar la version de la tarida
                else if(operacion.equals("forzarEnvioTarifa")){
        			forzarEnvioTarifa((TarifaTiendaBean) formulario.getFormularioPestañaActiva().getRegistroActivo());
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
	 * @throws TiendaException
	 * @throws TiendaNotFoundException 
	 */
	private void leerFormulario(FormularioTiendaBean formulario, HttpServletRequest request) throws TiendaException, TiendaNotFoundException {
		Tienda tienda = (Tienda) formulario.getRegistroActivo();
		
		if (formulario.isEnInsercion()) {
			tienda.setCodAlm(request.getParameter("codAlm"));
		}
		
		if (formulario.isEditable()) {
			tienda.setDesAlm(request.getParameter("desAlm"));
			tienda.setActivo(request.getParameter("activo")!= null);
			
			switch (formulario.getPestañaActiva()) {
				case 0:  // Datos Generales
					
					HttpSession sesion = request.getSession();
					DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
					
					tienda.setCodEmp(datosSesion.getEmpresa().getCodEmp());
					tienda.setCodCliente(request.getParameter("codCliente"));
					tienda.setDesCliente(request.getParameter("desCliente"));
					tienda.setPersonaContacto(request.getParameter("personaContacto"));
					tienda.setDomicilio(request.getParameter("domicilio"));
					tienda.setPoblacion(request.getParameter("poblacion"));
					tienda.setProvincia(request.getParameter("provincia"));
					tienda.setCp(request.getParameter("cp"));
					tienda.setTelefono1(request.getParameter("telefono1"));
					tienda.setTelefono2(request.getParameter("telefono2"));
					tienda.setFax(request.getParameter("fax"));
					tienda.setCodMedioPago(request.getParameter("codMedioPago"));
					tienda.setDesMedioPago(request.getParameter("desMedioPago"));
					tienda.setCodConceptoAlmacen(request.getParameter("codConceptoAlmacen"));
					tienda.setDesConceptoAlmacen(request.getParameter("desConceptoAlmacen"));
					
					//Tipo Tienda
					if (formulario.isEnInsercion()) {
						tienda.setIdTipoTienda(Numero.desformateaLong(request.getParameter("idTipoTienda"), 0L), datosSesion);
					}
					break;
					
				case 1:  // Cajas
					if (formulario.getFormularioPestañaActiva().isEditable()) {
						CajaBean caja = (CajaBean) formulario.getFormularioPestañaActiva().getRegistroActivo();
						caja.setCodCaja(request.getParameter("codCaja"));
						caja.setIdentificadorCaja(request.getParameter("identificadorCaja"));						
					}	
				case 3:
					if (formulario.isEditable()) {
						if(formulario.getFormularioPestañaActiva().isModoVisualizacionTabla()){
							tienda.setParametros(request);
						}else{
							tienda.setXmlConfiguracion(request.getParameter("xmlConfiguracion"));
						}
					}
					break;
					
			}
		}
	}
	
	
	@SuppressWarnings("unchecked")
	private void leerFormularioRegistro(FormularioTiendaBean formulario, HttpServletRequest request) {
		switch (formulario.getPestañaActiva()) {
			case 1:  // Cajas
				if (formulario.getFormularioPestañaActiva().isEditable()) {
					CajaBean caja = (CajaBean) formulario.getFormularioPestañaActiva().getRegistroActivo();
					caja.setCodCaja(request.getParameter("codCaja"));
					caja.setIdentificadorCaja(request.getParameter("identificadorCaja"));
				}
				break;
			case 2:  // Tarifas
				String[] codsTarifas = request.getParameter("codTarifas").split(",");
				String[] desTarifas = request.getParameter("desTarifas").split(",");
				Tienda tienda = (Tienda) formulario.getRegistroActivo();

				for (int i = 0; i < codsTarifas.length; i++) {
					TarifaTiendaBean tarifa = new TarifaTiendaBean();
					tarifa.setEstadoBean(Estado.NUEVO);
					tarifa.setCodAlmacen(tienda.getCodAlm());
					tarifa.setCodTarifa(codsTarifas[i]);
					tarifa.setDesTarifa(desTarifas[i]);
					tarifa.setVersionTarifa(new Long(0));
					tarifa.setVersionTarifaRevisada(new Long(0));
					
					// Los voy añadiendo a la lista de registros
					formulario.getFormularioPestañaActiva().getRegistros().add(tarifa);
				}
				break;
			case 4:  // Usuarios
				// Recogemos los usuarios seleccionados
	    		String[] usuarios = request.getParameterValues("usuarios");
	    		if(usuarios != null){   			
	        		for (String usuarioSelecionado : usuarios){
	        			AlmacenUsuarioBean usuario = new AlmacenUsuarioBean();
	        			usuario.setEstadoBean(Estado.NUEVO);
	        			usuario.setIdUsuario(Numero.desformateaLong(usuarioSelecionado.split(",")[0], 0L));
	        			usuario.setUsuario(usuarioSelecionado.split(",")[1]);
	        			usuario.setDesUsuario(usuarioSelecionado.split(",")[2]);
						// Los voy añadiendo a la lista de registros
						formulario.getFormularioPestañaActiva().getRegistros().add(usuario);												
		    		}   		
	    		}
				break;
		}
	}
	
	private void forzarEnvioArticulosTienda(Tienda tienda, DatosSesionBean datosSesion) throws TarifaTiendaException {
    	tienda.setVersionArticulos(0L);
		tienda.setVersionArticulosRevisada(0L);
		tienda.setFechaVersionArticulos(null);
		tienda.setFechaVersionArticulosRevisada(null);
		
		//si la tienda no tiene las tarifas cargadas, las consultamos
		if (!tienda.isTarifasCargadas()) {
			tienda.setTarifas(ServicioTarifasTiendas.consultar(tienda.getCodAlm(), datosSesion));
			tienda.setTarifasCargadas(true);
		}
		
		
		for (TarifaTiendaBean tarifa : tienda.getTarifas()) {
			forzarEnvioTarifa(tarifa);
		}
	}
	
	private void forzarEnvioTarifa(TarifaTiendaBean tarifa) {
    	tarifa.setVersionTarifa(0L);
		tarifa.setVersionTarifaRevisada(0L);
		tarifa.setFechaVersionTarifa(null);
		tarifa.setFechaVersionTarifaRevisada(null); 
		tarifa.setEstadoBean(Estado.MODIFICADO);
	}
}
