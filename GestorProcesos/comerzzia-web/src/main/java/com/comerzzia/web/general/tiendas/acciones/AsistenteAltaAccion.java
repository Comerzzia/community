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

import com.comerzzia.persistencia.core.usuarios.UsuarioBean;
import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.general.tiendas.tarifas.TarifaTiendaBean;
import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenUsuarioBean;
import com.comerzzia.servicios.core.permisos.PermisosEfectivosAccionBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.almacenes.ServicioAlmacenes;
import com.comerzzia.servicios.general.clientes.ServicioClientes;
import com.comerzzia.servicios.general.tiendas.AsistenteTienda;
import com.comerzzia.servicios.general.tiendas.ServicioTiendas;
import com.comerzzia.servicios.general.tiendas.Tienda;
import com.comerzzia.servicios.general.tiendas.TiendaException;
import com.comerzzia.servicios.ventas.tarifas.ServicioTarifas;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.numeros.Numero;
import com.comerzzia.web.base.Accion;
import com.comerzzia.web.base.Vista;
import com.comerzzia.web.base.WebKeys;
import com.comerzzia.web.general.tiendas.ui.FormularioTiendaBean;

public class AsistenteAltaAccion extends Accion {

	private static final Vista NEXT_PAGE_PASO1 = new Vista("general/tiendas/asistente/jsp/asistPaso1.jsp", Vista.INTERNA);
	private static final Vista NEXT_PAGE_PASO2 = new Vista("general/tiendas/asistente/jsp/asistPaso2.jsp", Vista.INTERNA);
	private static final Vista NEXT_PAGE_PASO3 = new Vista("general/tiendas/asistente/jsp/asistPaso3.jsp", Vista.INTERNA);
	private static final Vista NEXT_PAGE_PASO4 = new Vista("general/tiendas/asistente/jsp/asistPaso4.jsp", Vista.INTERNA);
	private static final Vista NEXT_PAGE_PASO5 = new Vista("general/tiendas/asistente/jsp/asistPaso5.jsp", Vista.INTERNA);
	private static final int PASO1 = 1;
	private static final int PASO2 = 2;
	private static final int PASO3 = 3;
	private static final int PASO4 = 4;
	private static final int PASO5 = 5;


	/**
	 * Devuelve el nombre de la acción
	 * 
	 * @return String con el nombre de la acción
	 */
	public String getNombre() {
		return "asistenteAlta";
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
			DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);

			// Comprobamos los permisos de la acción
			PermisosEfectivosAccionBean permisos = datosSesion.getPermisosCache(this.getAccionMenu());
			if (!permisos.isPuedeAñadir()) {
				return SIN_PERMISO;
			}

			FormularioTiendaBean formulario = (FormularioTiendaBean) sesion.getAttribute(WebKeys.FORMULARIO_TIENDA);		
			AsistenteTienda asistente = (AsistenteTienda) sesion.getAttribute(WebKeys.ASISTENTE_TIENDA);
			Tienda tienda = asistente.getTienda();
			String operacion = request.getParameter("operacion");
			String indice = request.getParameter("indice");
			
			if(operacion == null || operacion.isEmpty()){
				asistente.setPaso(PASO1);
				return NEXT_PAGE_PASO1;
			}
			else if (operacion.equals("siguiente")){
				return pasoSiguiente(request, asistente, formulario);
			}
			else if (operacion.equals("anterior")) {
				return pasoAnterior(request, asistente, formulario);
			}
			else if (operacion.equals("asignarCliente")) {
				tienda.asignarCliente(null, null);
				
				return pasoMismaPagina(request, asistente);
			}
			else if (operacion.equals("nuevoCliente")) {
				tienda.inicializarCliente(datosSesion);
				
				return pasoMismaPagina(request, asistente);
			}
			else if (operacion.equals("cargarTipoTienda")) {
				Long idTipoTienda = Numero.desformateaLong(request.getParameter("idTipoTienda"), null);
				
				// Comprobar si ya existe una tienda de tipo tienda virtual, en caso de que exista avisar y no permitir continuar
				if (idTipoTienda == Tienda.TIPO_TIENDA_TIENDA_VIRTUAL) {
					if (ServicioTiendas.existeTipoTienda(datosSesion, Tienda.TIPO_TIENDA_TIENDA_VIRTUAL)) {
						setMensajeAviso(request, "Ya existe una tienda del tipo TIENDA VIRTUAL en el sistema");
					}
					else {
						tienda.setIdTipoTienda(Numero.desformateaLong(request.getParameter("idTipoTienda"), null), datosSesion);
					}
				}
				else {
					tienda.setIdTipoTienda(Numero.desformateaLong(request.getParameter("idTipoTienda"), null), datosSesion);
				}
				
				inicializaPestañaActiva(formulario, datosSesion, request);
				
            	return pasoMismaPagina(request, asistente);
            }
			else if (operacion.equals("nuevoUsuario")) {
				leerFormulario(request, asistente, formulario);
				request.setAttribute("modoFicha", true);			
				return pasoMismaPagina(request, asistente);
            }
			else if (operacion.equals("eliminarNuevoUsuario")) {
				leerFormulario(request, asistente, formulario);
				tienda.deleteUsuarioNuevo(Integer.parseInt(indice));
				inicializaPestañaActiva(formulario, datosSesion, request);
				return pasoMismaPagina(request, asistente);
            }
			else if (operacion.equals("aceptarUsuario")) {
				leerFormularioRegistro(asistente, request);
				inicializaPestañaActiva(formulario, datosSesion, request);
				return pasoMismaPagina(request, asistente);
            }
			else if (operacion.equals("cancelarUsuario")) {				
            	inicializaPestañaActiva(formulario, datosSesion, request);
            	return pasoMismaPagina(request, asistente);
            }
			else{
				return ERROR_PAGE;
			}
		}  
		catch (Exception e) {
			e.printStackTrace();
			setError(request, e);
			return ERROR_PAGE;
		}
	}
	
	private Vista pasoMismaPagina(HttpServletRequest request, AsistenteTienda asistente){
		switch (asistente.getPaso()) {
			case PASO1:
				return NEXT_PAGE_PASO1;
			case PASO2:
				return NEXT_PAGE_PASO2;
			case PASO3:
				return NEXT_PAGE_PASO3;
			case PASO4:
				return NEXT_PAGE_PASO4;
			case PASO5:
				return NEXT_PAGE_PASO5;
			default:
				return NEXT_PAGE_PASO1;
		}
	}
	
	private Vista pasoAnterior(HttpServletRequest request, AsistenteTienda asistente, FormularioTiendaBean formulario) 
			throws Exception{
		
		HttpSession sesion = request.getSession();
		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
		
		leerFormulario(request, asistente, formulario);
		switch (asistente.getPaso()) {
			case PASO1:
				formulario.setPestañaActiva(0);
				return NEXT_PAGE_PASO1;
			case PASO2:
				formulario.setPestañaActiva(0);
				asistente.setPaso(PASO1);
				return NEXT_PAGE_PASO1;
			case PASO3:
				formulario.setPestañaActiva(0);
				asistente.setPaso(PASO2);
				return NEXT_PAGE_PASO2;
			case PASO4:
				formulario.setPestañaActiva(2);
				inicializaPestañaActiva(formulario, datosSesion, request);
				asistente.setPaso(PASO3);
				return NEXT_PAGE_PASO3;
			case PASO5:
				formulario.setPestañaActiva(3);
				inicializaPestañaActiva(formulario, datosSesion, request);
				asistente.setPaso(PASO4);
				return NEXT_PAGE_PASO4;
			default:
				asistente.setPaso(PASO1);
				return NEXT_PAGE_PASO1;
		}
	}

	private Vista pasoSiguiente(HttpServletRequest request, AsistenteTienda asistente, FormularioTiendaBean formulario) {
		HttpSession sesion = request.getSession();
		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
		
		Tienda tienda = asistente.getTienda();	
		
		try{
			leerFormulario(request, asistente, formulario);
			switch (asistente.getPaso()) {
				case PASO1: // Datos Generales
					boolean existeAlmacen = ServicioAlmacenes.existe(tienda.getCodAlm(), datosSesion);
					if(existeAlmacen){
						setMensajeError(request, "Ya existe un almacén con el mismo código en el sistema.");
						return NEXT_PAGE_PASO1;
					}
					
					// Inicializamos los datos del cliente para el siguiente paso
					if(!tienda.isClienteCargado()) {
						tienda.inicializarCliente(datosSesion);
					}
					
					asistente.setPaso(PASO2);
					return NEXT_PAGE_PASO2;
					
				case PASO2: // Cliente
					if(tienda.getCliente() != null){
						//Se comprueba que no existe un cliente con el mismo codigo
						try{
							boolean existeCliente = ServicioClientes.consultar(tienda.getCodCliente(), datosSesion) != null;
							if(existeCliente){
								setMensajeError(request, "Ya existe un cliente con el mismo código en el sistema.");
								return NEXT_PAGE_PASO2;
							}
						}
						catch(Exception ignore){;}
					}
					else {
						try {
							// Comprobar que el cliente asignado no lo esté ya para otro almacén
							if(ServicioAlmacenes.consultarPorCliente(datosSesion, tienda.getCodCliente()) != null) {
								setMensajeError(request, "Ya existe una tienda con el mismo código de cliente asignado.");
								
								return pasoMismaPagina(request, asistente);
							}
						}
						catch(Exception ignore){;}
					}
					
					// Inicializamos la tarifa general para el siguiente paso
					if(!tienda.isTarifaGeneralCargada())
						tienda.inicializarTarifaGeneral();
					
					// Si solo existe la tarifa general nos saltamos el paso 3
					if(ServicioTarifas.consultar(datosSesion).size() <= 1){
						formulario.setPestañaActiva(3);
						inicializaPestañaActiva(formulario, datosSesion, request);
						asistente.setPaso(PASO4);
						return NEXT_PAGE_PASO4;
					}
					
					formulario.setPestañaActiva(2);
					inicializaPestañaActiva(formulario, datosSesion, request);
					
					asistente.setPaso(PASO3);
					return NEXT_PAGE_PASO3;
					
				case PASO3:	// Tarifas	
					formulario.setPestañaActiva(3);
					
					asistente.setPaso(PASO4);
					return NEXT_PAGE_PASO4;
					
				case PASO4: // Configuracion
					formulario.setPestañaActiva(4);
					inicializaPestañaActiva(formulario, datosSesion, request);
					
					asistente.setPaso(PASO5);
					return NEXT_PAGE_PASO5;
					
				case PASO5: // Usuarios
					ServicioTiendas.salvar(tienda, datosSesion);
					formulario.aceptar();
		    		
		    		setMensaje(request, "La tienda se ha grabado correctamente");
		    		
		    		// Consultamos la tienda e inicializamos el formulario
		    		try {
						tienda = ServicioTiendas.consultar(tienda.getCodAlm(), datosSesion);
						formulario.inicializar(tienda);
						formulario.setPestañaActiva(0);
					}
		    		catch (Exception e) {
		    			setMensajeError(request, "Se ha producido un error al acceder al registro");
		    			return getControlador().getAccion("buscar").ejecutar(request);
					}
		    		
		    		sesion.removeAttribute(WebKeys.ASISTENTE_TIENDA);
		    		return getControlador().getAccion("verFormulario").ejecutar(request);
					
				default:
					asistente.setPaso(PASO1);
					return NEXT_PAGE_PASO1;
			}
		}
		catch (Exception e) {
			setError(request, e);
			return ERROR_PAGE;
		}
	}
	
	private void inicializaPestañaActiva(FormularioTiendaBean formulario, DatosSesionBean datosSesion, HttpServletRequest request)
			throws Exception {
		
		// Obtenemos la tienda
		Tienda tienda = (Tienda) formulario.getRegistroActivo();

		// Actualizamos la pestaña activa
		switch (formulario.getPestañaActiva()) {
			case 2:
				request.setAttribute("lstTarifas", formulario.obtenerListaTarifas(datosSesion));			
				break;
			case 3:
				if(!tienda.isConfiguracionCargada() && tienda.isTipoTiendaCargado()){
					tienda.cargarConfiguracion();
					tienda.setConfiguracionCargada(true);
				}
				break;
			case 4:
				request.setAttribute("lstUsuarios", formulario.obtenerListaUsuarios());
				break;
		}
	}
	
	private void leerFormulario(HttpServletRequest request, AsistenteTienda asistente, FormularioTiendaBean formulario) 
			throws TiendaException{
		
		HttpSession sesion = request.getSession();
		DatosSesionBean datosSesion = (DatosSesionBean) sesion.getAttribute(WebKeys.DATOS_SESION);
		
		Tienda tienda = asistente.getTienda();	
		switch (asistente.getPaso()) {
			case PASO1: // Datos Generales
				tienda.setCodAlm(request.getParameter("codAlm"));
				tienda.setDesAlm(request.getParameter("desAlm"));
				tienda.setCodEmp(datosSesion.getEmpresa().getCodEmp());
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
				
				break;
	
			case PASO2: // Cliente
				if (tienda.getCliente() != null) {
					ClienteBean cliente = tienda.getCliente();
					cliente.setCodCli(request.getParameter("codCliente"));
					cliente.setDesCli(request.getParameter("desCliente"));
					cliente.setNombreComercial(request
							.getParameter("nombreComercial"));
					cliente.setIdTratImp(Numero.desformateaLong(request
							.getParameter("idTratImp"), 0L));
					cliente.setDesTratImp(request.getParameter("desTratImp"));
					cliente.setIdMedioPagoVencimiento(Numero.desformateaLong(
							request.getParameter("idMedioPagoVencimiento"), null));
					cliente.setDesMedioPagoVencimiento(request
							.getParameter("desMedioPagoVencimiento"));
	
					tienda.setCodCliente(cliente.getCodCli());
				}
				else {
					tienda.asignarCliente(request.getParameter("codCliente"), request.getParameter("desCliente"));
				}
	
				break;
	
			case PASO3: // Tarifas
				// Recogemos los tarifas seleccionadas
	    		String[] tarifas = request.getParameterValues("tarifas");
	    		if(tarifas != null) {
	        		for (String tarifaSelecionada : tarifas){
	        			TarifaTiendaBean tarifa = new TarifaTiendaBean();
						tarifa.setEstadoBean(Estado.NUEVO);
						tarifa.setCodAlmacen(tienda.getCodAlm());
						tarifa.setCodTarifa(tarifaSelecionada.split(",")[0]);
						tarifa.setDesTarifa(tarifaSelecionada.split(",")[1]);
						tarifa.setVersionTarifa(new Long(0));
						tarifa.setVersionTarifaRevisada(new Long(0));
						
						// Si la tarifa no estaba previamente seleccionada la añadimos a las tarifas seleccionadas
						if(!tienda.getTarifasSeleccionadas().containsKey(tarifa.getCodTarifa())){
							tienda.addTarifa(tarifa);					
							tienda.addTarifaSeleccionada(tarifa);
						}
		    		}   
	        		tienda.setTarifasCargadas(true);
	    		}
				break;
	
			case PASO4: // Configuracion
				if(request.getParameter("idTipoTienda") != null && !request.getParameter("idTipoTienda").isEmpty()) {
					tienda.setParametros(request);
				}
	
				break;
	
			case PASO5: // Usuarios
				// Recogemos los usuarios seleccionados
		    	String[] usuarios = request.getParameterValues("usuarios");
		    	if(usuarios != null){   			
		        	for (String usuarioSelecionado : usuarios){
		        		AlmacenUsuarioBean usuario = new AlmacenUsuarioBean();
		        		usuario.setEstadoBean(Estado.NUEVO);
		        		usuario.setIdUsuario(Numero.desformateaLong(usuarioSelecionado.split(",")[0], 0L));
		        		usuario.setUsuario(usuarioSelecionado.split(",")[1]);
		        		usuario.setDesUsuario(usuarioSelecionado.split(",")[2]);
		        		
		        		// Si el usuario no estaba previamente seleccionado lo añadimos a los usuarios seleccionados
						if(!tienda.getUsuariosSeleccionados().containsKey(usuario.getUsuario())){
							tienda.addUsuario(usuario);
							tienda.addUsuarioSeleccionado(usuario);
						}
			    	} 
		        	tienda.setUsuariosCargados(true);
		    	}
				break;
		}		
	}
	
	private void leerFormularioRegistro(AsistenteTienda asistente, HttpServletRequest request) {
		Tienda tienda = asistente.getTienda();
		switch (asistente.getPaso()) {
			case PASO5:  // Usuarios
				UsuarioBean usuario = new UsuarioBean();
				usuario.setUsuario(request.getParameter("usuario"));
				usuario.setDesUsuario(request.getParameter("desUsuario"));
				usuario.setClave(request.getParameter("clave"));
				
				tienda.addUsuarioNuevo(usuario);
				tienda.setUsuariosCargados(true);
				
				break;
		}
	}
}
