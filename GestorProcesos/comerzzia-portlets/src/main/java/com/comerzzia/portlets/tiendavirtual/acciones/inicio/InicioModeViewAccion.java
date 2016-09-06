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

package com.comerzzia.portlets.tiendavirtual.acciones.inicio;

import javax.portlet.PortletSession;
import javax.portlet.RenderRequest;

import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.tiendavirtual.articulos.ParametrosBuscarArticulosTVBean;
import com.comerzzia.persistencia.tiendavirtual.tiendas.TiendaVirtualBean;
import com.comerzzia.portlets.base.AccionInicio;
import com.comerzzia.portlets.base.Vista;
import com.comerzzia.portlets.base.WebKeys;
import com.comerzzia.portlets.tiendavirtual.iu.FormularioTienda;
import com.comerzzia.servicios.core.variables.ServicioVariables;
import com.comerzzia.servicios.core.variables.Variables;
import com.comerzzia.servicios.tiendavirtual.articulos.ServicioArticulosTiendaVirtual;
import com.comerzzia.servicios.tiendavirtual.categorizaciones.CategorizacionTiendaVirtualException;
import com.comerzzia.servicios.tiendavirtual.categorizaciones.ServicioCategorizacionesTiendaVirtual;
import com.comerzzia.servicios.tiendavirtual.cesta.CestaBean;
import com.comerzzia.servicios.tiendavirtual.clientes.ServicioClientesTiendaVirtual;
import com.comerzzia.servicios.tiendavirtual.login.LoginTiendaVirtualException;
import com.comerzzia.servicios.tiendavirtual.login.ServicioLoginTiendaVirtual;
import com.comerzzia.servicios.tiendavirtual.sesion.DatosSesionTiendaVirtualBean;
import com.comerzzia.servicios.tiendavirtual.tiendas.ServicioTiendasTiendaVirtual;
import com.comerzzia.util.log.Logger;
import com.comerzzia.util.xml.XMLDocumentException;

public class InicioModeViewAccion extends AccionInicio {

	/** Logger */
	private static Logger log = Logger.getMLogger(InicioModeViewAccion.class);

	/** Vista inicio */
	private static final Vista NEXT_PAGE = new Vista("/tienda_virtual/busqueda/jsp/busqueda.jsp");

	public Vista ejecutar(RenderRequest request) {
		try {
			log.debug("ejectuar() - Ejecutando acción inicio para modo VIEW.");

			// inicializamos datos sesión
			PortletSession session = request.getPortletSession();
			DatosSesionTiendaVirtualBean datosSesion = (DatosSesionTiendaVirtualBean) session.getAttribute(WebKeys.DATOS_SESION);
			FormularioTienda formulario = (FormularioTienda) session.getAttribute(WebKeys.FORMULARIO_TV);
			ClienteBean cliente = (ClienteBean) session.getAttribute(WebKeys.CLIENTE_TV);

			if (datosSesion == null || cliente == null || formulario == null){
				datosSesion = ServicioLoginTiendaVirtual.iniciarSesion();
				session.setAttribute(WebKeys.DATOS_SESION, datosSesion);
		
				// establecemos la configuración de la tienda virtual
				TiendaVirtualBean tienda = ServicioTiendasTiendaVirtual.consultar(TiendaVirtualBean.UID_TIENDA_VIRTUAL, datosSesion);
				datosSesion.setTienda(tienda);
				datosSesion.getConfigTiendaVirtual().setCodAlmacen(tienda.getCodAlmacen());
				datosSesion.getConfigTiendaVirtual().setCodAlmacenCentral(tienda.getCodAlmacenCentral());
		
				// consultamos cliente genérico
				cliente = ServicioClientesTiendaVirtual.consultar(tienda.getClientePorDefecto(), datosSesion);
				session.setAttribute(WebKeys.CLIENTE_TV, cliente);
		
				// instanciamos formulario y lo inicializamos
				formulario = new FormularioTienda();
				session.setAttribute(WebKeys.FORMULARIO_TV, formulario);
				formulario.setParamBuscar(new ParametrosBuscarArticulosTVBean());
				formulario.getParamBuscar().setTamañoPagina(15);
				formulario.getParamBuscar().setOrden("ARTICULOS.DESART");
				formulario.setCategoriasPrimarias(ServicioCategorizacionesTiendaVirtual.consultarPrimarias(datosSesion));
		
				// instanciamos la cesta
				CestaBean cesta = new CestaBean();
				session.setAttribute(WebKeys.CESTA_TV, cesta);
				
				// Establecer los títulos de los campos de desglose a partir de sus respectivas variables
				try {
					formulario.setTituloDesglose1(ServicioVariables.consultar(Variables.ARTICULOS_DESGLOSE1_TITULO).getValor());
				} 
				catch (Exception e) {
					formulario.setTituloDesglose1("");
					e.printStackTrace(); 
				}
				try {
					formulario.setTituloDesglose2(ServicioVariables.consultar(Variables.ARTICULOS_DESGLOSE2_TITULO).getValor());
				} 
				catch (Exception e) {
					formulario.setTituloDesglose2("");
					e.printStackTrace(); 
				}
			}		
			
			formulario.setEscaparate(ServicioArticulosTiendaVirtual.consultarEscaparate(datosSesion, cliente, null));
			formulario.deseleccionarCategoriaPrimaria();
			request.setAttribute(WebKeys.FORMULARIO_TV, formulario);
			
			return NEXT_PAGE;
		} 
		catch (LoginTiendaVirtualException e) {
			setMensajeError(request, "Se ha producido un error al intentar iniciar una nueva sesión. Disculpe las molestias.");
			return ERROR_GENERAL;
		} 
		catch (CategorizacionTiendaVirtualException e) {
			setMensajeError(request, "Se ha producido un error al intentar consultar el listado de categorías de artículos. Disculpe las molestias.");
			return ERROR_GENERAL;
		}
		catch (XMLDocumentException e){
			setMensajeError(request, "Se ha producido un error al consultar la configuración de la tienda. Disculpe las molestias.");
			return ERROR_GENERAL;
		}
		catch (Exception e) {
			e.printStackTrace();
			return ERROR_GENERAL;
		}
	}
}
