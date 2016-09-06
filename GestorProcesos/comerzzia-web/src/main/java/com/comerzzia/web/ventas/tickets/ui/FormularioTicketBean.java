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

package com.comerzzia.web.ventas.tickets.ui;

import java.util.Date;

import com.comerzzia.persistencia.ventas.tickets.errores.ParametrosBuscarErrorTicketsBean;
import com.comerzzia.persistencia.ventas.tickets.historico.ParametrosBuscarHistoricoTicketsBean;
import com.comerzzia.servicios.ventas.tickets.ProcesadorTickets;
import com.comerzzia.util.fechas.Fechas;
import com.comerzzia.web.core.ui.FormularioBean;


public class FormularioTicketBean extends FormularioBean {

	// Definición de las pestañas del formulario
	private FormularioBean pestañaTicketsPendientesProcesar = new FormularioBean("Pendiente de Procesar");
	private FormularioBean pestañaTicketsErroneos = new FormularioBean("Con Errores");
	private FormularioBean pestañaTicketsProcesados = new FormularioBean("Procesados");
	
	private int segundosRefresco = 60;
	
	
	/**
	 * Constructor
	 */
	public FormularioTicketBean() {
		this.addPestaña(pestañaTicketsPendientesProcesar);
		this.addPestaña(pestañaTicketsErroneos);
		this.addPestaña(pestañaTicketsProcesados);
		
		// Establecemos los parámetros de búsqueda de cada formulario
		pestañaTicketsErroneos.setParam(new ParametrosBuscarErrorTicketsBean());
		
		ParametrosBuscarHistoricoTicketsBean paramBuscarTicketsProcesados = new ParametrosBuscarHistoricoTicketsBean();
		paramBuscarTicketsProcesados.setFechaDesde(Fechas.sumaDias(new Date(), -10));
		paramBuscarTicketsProcesados.setFechaHasta(new Date());
		pestañaTicketsProcesados.setParam(paramBuscarTicketsProcesados);
	}
	
	
	/**
	 * Inicializa los parámetros de búsqueda asociados a los formularios de pestañas
	 */
	public void inicializarParametrosBuscar() {
		pestañaTicketsErroneos.getParam().setNumPagina(0);
		pestañaTicketsProcesados.getParam().setNumPagina(0);
	}
	
	
	/**
	 * Obtiene los parámetros de búsqueda de la pestaña de Errores
	 * @return
	 */
	public ParametrosBuscarErrorTicketsBean getParametrosBuscarErrorTicket() {
		return (ParametrosBuscarErrorTicketsBean) pestañaTicketsErroneos.getParam();
	}
	
	
	/**
	 * Obtiene los parámetros de búsqueda de la pestaña de Historico
	 * @return
	 */
	public ParametrosBuscarHistoricoTicketsBean getParametrosBuscarHistoricoTicket() {
		return (ParametrosBuscarHistoricoTicketsBean) pestañaTicketsProcesados.getParam();
	}
	
	
	/**
	 * Obtiene una instancia del procesador de tickets
	 * @return
	 */
	public ProcesadorTickets getProcesadorTickets() {
		return ProcesadorTickets.getInstance();
	}
	
	
	/**
	 * @return the segundosRefresco
	 */
	public int getSegundosRefresco() {
		return segundosRefresco;
	}


	/**
	 * @param segundosRegresco the segundosRefresco to set
	 */
	public void setSegundosRefresco(int segundosRefresco) {
		this.segundosRefresco = segundosRefresco;
	}
}
