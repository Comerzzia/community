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

package com.comerzzia.servicios.general.inicio;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.comerzzia.persistencia.core.estados.EstadoBean;
import com.comerzzia.persistencia.core.estados.Estados;
import com.comerzzia.persistencia.general.tiendas.TiendaBean;
import com.comerzzia.persistencia.general.tiendas.tarifas.TarifaTiendaBean;
import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenUsuarioBean;
import com.comerzzia.persistencia.sincronizacion.ListaTrabajos;
import com.comerzzia.persistencia.sincronizacion.TrabajoSincronizadorBean;
import com.comerzzia.persistencia.ventas.pedidos.ParametrosBuscarPedidosVentasBean;
import com.comerzzia.persistencia.ventas.tickets.errores.ParametrosBuscarErrorTicketsBean;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.tiendas.ServicioTiendas;
import com.comerzzia.servicios.general.tiendas.TiendaException;
import com.comerzzia.servicios.general.tiendas.tarifas.ServicioTarifasTiendas;
import com.comerzzia.servicios.general.tiendas.tarifas.TarifaTiendaException;
import com.comerzzia.servicios.general.tiendas.usuarios.ServicioAlmacenesUsuarios;
import com.comerzzia.servicios.sincronizacion.ServicioSincronizador;
import com.comerzzia.servicios.sincronizacion.SincronizadorTiendas;
import com.comerzzia.servicios.sincronizacion.TrabajoSincronizadorException;
import com.comerzzia.servicios.ventas.pedidos.PedidoVentaException;
import com.comerzzia.servicios.ventas.pedidos.ServicioPedidosVentas;
import com.comerzzia.servicios.ventas.tickets.ProcesadorTickets;
import com.comerzzia.servicios.ventas.tickets.errores.ErrorTicketException;
import com.comerzzia.servicios.ventas.tickets.errores.ServicioErroresTickets;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.paginacion.PaginaResultados;


public class MensajesInicio {
	
	/**
	 * Logger
	 */
	protected static Logger log = Logger.getMLogger(MensajesInicio.class);
	
	// TODO: Tomar proceso y estados de EstadosPedidosVentas
	private static final String PROCESO_PEDIDOS_CLIENTES = "PEDCLI";
	private static final int ESTADO_SOLICITUD_PTE_ACEPTACION = 10;
	private static final int ESTADO_EN_PREPARACION = 20;

	private List<MensajeBean> avisosSistema;
	private List<MensajeBean> pendientesUsuario;
	List<AlmacenUsuarioBean> almacenes;
	
	
	public MensajesInicio() {
		avisosSistema = new ArrayList<MensajeBean>();
		pendientesUsuario = new ArrayList<MensajeBean>();
	}
	
	
	public void obtenerMensajes(DatosSesionBean datosSesion) {
		try {
			// Obtenemos los almacenes asociados al usuario
			almacenes = ServicioAlmacenesUsuarios.consultar(datosSesion.getUsuario().getIdUsuario(), datosSesion);
		} 
		catch (Exception e) {
			almacenes = new ArrayList<AlmacenUsuarioBean>();
			log.error("obtenerMensajes() - Error al obtener almacenes asociados al usuario: " + e.getMessage(), e);
		}
		
		obtenerAvisosSistema(datosSesion);
		obtenerPendientesUsuario(datosSesion);
	}
	
	
	public List<MensajeBean> getAvisosSistema() {
		return avisosSistema;
	}
	
	
	public List<MensajeBean> getPendientesUsuario() {
		return pendientesUsuario;
	}
	
	
	private void obtenerAvisosSistema(DatosSesionBean datosSesion) {
		comprobarSincronizador();
		comprobarTrabajosErroneos(datosSesion);
		comprobarProcesadorTickets();
		comprobarTicketsErroneos(datosSesion);
	}
	
	
	private void obtenerPendientesUsuario(DatosSesionBean datosSesion) {
		comprobarCambiosArticulosPendientesRevisar(datosSesion);
		comprobarSolicitudesPendientesAceptar(datosSesion);
		comprobarPedidosPendientesPreparar(datosSesion);
	}
	
	
	private void addMensajeAvisoSistema(MensajeBean mensaje) {
		avisosSistema.add(mensaje);
	}
	
	
	private void addMensajePendienteUsuario(MensajeBean mensaje) {
		pendientesUsuario.add(mensaje);
	}
	
	
	private void comprobarSincronizador() {
		try {
			if (SincronizadorTiendas.getInstance().isParado()) {
				MensajeBean mensaje = new MensajeBean();
				mensaje.setMensajeError("El Sincronizador de Tiendas está parado");
				mensaje.setUrl("sincronizacion");
				
				this.addMensajeAvisoSistema(mensaje);
			}
		} 
		catch (Exception e) {
			log.error("comprobarSincronizador() - Error: " + e.getMessage(), e);
		}
	}
	
	
	private void comprobarTrabajosErroneos(DatosSesionBean datosSesion) {
		try {
			if (SincronizadorTiendas.getInstance().isArrancado()) {
				List<ListaTrabajos> trabajos = ServicioSincronizador.consultarTrabajosTiendas(datosSesion);
				
				for (ListaTrabajos listaTrabajos : trabajos) {
					List<TrabajoSincronizadorBean> trabajosSincronizacion = listaTrabajos.getListaTrabajos();
					for (TrabajoSincronizadorBean trabajoSincronizacion : trabajosSincronizacion) {
						if (trabajoSincronizacion.getResultado() != null 
								&& trabajoSincronizacion.getResultado() == TrabajoSincronizadorBean.ESTADO_ERROR) {
							MensajeBean mensaje = new MensajeBean();
							mensaje.setMensajeError("Existen errores en los trabajos de sincronización de la tienda " 
									+ trabajoSincronizacion.getCodAlmacen() + " " + trabajoSincronizacion.getDesAlmacen());
							mensaje.setUrl("sincronizacion");
							
							this.addMensajeAvisoSistema(mensaje);
							
							break;
						}
					}
				}
			}
		} 
		catch (TrabajoSincronizadorException e) {
			log.error("comprobarTrabajosErroneos() - Error: " + e.getMessage());
		}
		catch (Exception e) {
			log.error("comprobarTrabajosErroneos() - Error: " + e.getMessage(), e);
		}
	}
	
	
	private void comprobarProcesadorTickets() {
		try {
			if (ProcesadorTickets.getInstance().isParado()) {
				MensajeBean mensaje = new MensajeBean();
				mensaje.setMensajeError("El Servicio de Procesamiento de Tickets está parado");
				mensaje.setUrl("tickets");
				
				this.addMensajeAvisoSistema(mensaje);
			}
		} 
		catch (Exception e) {
			log.error("comprobarProcesadorTickets() - Error: " + e.getMessage(), e);
		}
	}
	
	
	private void comprobarTicketsErroneos(DatosSesionBean datosSesion) {
		try {
			ParametrosBuscarErrorTicketsBean param = new ParametrosBuscarErrorTicketsBean();
			param.setNumPagina(1);
			PaginaResultados resultados = ServicioErroresTickets.consultar(param, datosSesion);
			
			if (resultados.getTotalResultados() > 0) {
				MensajeBean mensaje = new MensajeBean();
				mensaje.setMensajeError("Existen tickets con errores que no pueden ser procesados");
				mensaje.setUrl("tickets");
				
				this.addMensajeAvisoSistema(mensaje);
			}
		} 
		catch (ErrorTicketException e) {
			log.error("comprobarTicketsErroneos() - Error: " + e.getMessage());
		}
		catch (Exception e) {
			log.error("comprobarTicketsErroneos() - Error: " + e.getMessage(), e);
		}
	}
	
	
	private void comprobarCambiosArticulosPendientesRevisar(DatosSesionBean datosSesion) {
		try {
			// Obtenemos las tiendas asociadas al usuario
			List<TiendaBean> tiendas = ServicioTiendas.consultarTiendasUsuario(datosSesion.getUsuario().getIdUsuario(), datosSesion);
			
			for (TiendaBean tienda : tiendas){
				boolean existenCambios = false;
				
				// Comprobamos las versiones de los artículos
				if (tienda.getVersionArticulos().longValue() != tienda.getVersionArticulosRevisada().longValue()) {
					existenCambios = true;
				}
				else {
					// Comprobamos las versiones de las tarifas
					List<TarifaTiendaBean> tarifas = ServicioTarifasTiendas.consultar(tienda.getCodAlm(), datosSesion);
					for (TarifaTiendaBean tarifa : tarifas){
						if (tarifa.getVersionTarifa().longValue() != tarifa.getVersionTarifaRevisada().longValue()) {
							existenCambios = true;
							break;
						}
					}
				}
				
				if (existenCambios) {
					MensajeBean mensaje = new MensajeBean();
					mensaje.setMensajeAlerta("Existen cambios pendientes de revisar en Artículos y/o Tarifas para la tienda " 
							+ tienda.getCodAlm() + " " + tienda.getDesAlm());
					mensaje.setUrl("cambiosArticulosTarifas");
					
					this.addMensajePendienteUsuario(mensaje);
				}
			}
		} 
		catch (TarifaTiendaException e) {
			log.error("comprobarCambiosArticulosPendientesRevisar() - Error: " + e.getMessage());
		} 
		catch (TiendaException e) {
			log.error("comprobarCambiosArticulosPendientesRevisar() - Error: " + e.getMessage());
		}
		catch (Exception e) {
			log.error("comprobarCambiosArticulosPendientesRevisar() - Error: " + e.getMessage(), e);
		}
	}
	
	
	private void comprobarSolicitudesPendientesAceptar(DatosSesionBean datosSesion) {
		try {
			ParametrosBuscarPedidosVentasBean param = getParametrosBuscar(ESTADO_SOLICITUD_PTE_ACEPTACION);
			
			// Comprobamos si existen solicitudes pendientes de aceptar en los almacenes asignados al usuario
			for (AlmacenUsuarioBean almacen : almacenes){
				param.setCodAlmacen(almacen.getCodAlmacen());
				
				PaginaResultados resultados = ServicioPedidosVentas.consultar(param, datosSesion);
				if (resultados.getTotalResultados() > 0) {
					MensajeBean mensaje = new MensajeBean();
					mensaje.setMensajeAlerta("Existen pedidos pendientes de aceptar para el almacén " 
							+ almacen.getCodAlmacen() + " " + almacen.getDesAlmacen());
					mensaje.setUrl("pedidosVentas");
					
					this.addMensajePendienteUsuario(mensaje);
				}
			}
		} 
		catch (PedidoVentaException e) {
			log.error("comprobarSolicitudesPendientesAceptar() - Error: " + e.getMessage());
		}
		catch (Exception e) {
			log.error("comprobarSolicitudesPendientesAceptar() - Error: " + e.getMessage(), e);
		}
	}
	
	
	private void comprobarPedidosPendientesPreparar(DatosSesionBean datosSesion) {
		try {
			ParametrosBuscarPedidosVentasBean param = getParametrosBuscar(ESTADO_EN_PREPARACION);
			
			// Comprobamos si existen pedidos pendientes de preprarar en los almacenes asignados al usuario
			for (AlmacenUsuarioBean almacen : almacenes){
				param.setCodAlmacen(almacen.getCodAlmacen());
				
				PaginaResultados resultados = ServicioPedidosVentas.consultar(param, datosSesion);
				if (resultados.getTotalResultados() > 0) {
					MensajeBean mensaje = new MensajeBean();
					mensaje.setMensajeAlerta("Existen pedidos pendientes de preparar para el almacén " 
							+ almacen.getCodAlmacen() + " " + almacen.getDesAlmacen());
					mensaje.setUrl("pedidosVentas");
					
					this.addMensajePendienteUsuario(mensaje);
				}
			}
		} 
		catch (PedidoVentaException e) {
			log.error("comprobarPedidosPendientesPreparar() - Error: " + e.getMessage());
		}
		catch (Exception e) {
			log.error("comprobarPedidosPendientesPreparar() - Error: " + e.getMessage(), e);
		}
	}
	
	
	private ParametrosBuscarPedidosVentasBean getParametrosBuscar(int estado) {
		ParametrosBuscarPedidosVentasBean param = new ParametrosBuscarPedidosVentasBean();
		param.setNumPagina(1);
		param.setTamañoPagina(1);
		Map<Integer, EstadoBean> mapaEstados = new HashMap<Integer, EstadoBean>();
		EstadoBean estadoBean = new EstadoBean();
		estadoBean.setProceso(PROCESO_PEDIDOS_CLIENTES);
		estadoBean.setEstado(estado);
		estadoBean.setChecked(true);
		mapaEstados.put(estadoBean.getEstado(), estadoBean);
		Estados estados = new Estados(mapaEstados);
		
		param.setEstados(estados);
		
		return param;
	}
}
