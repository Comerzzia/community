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

package com.comerzzia.persistencia.general.conceptoalmacenes;

import com.comerzzia.util.base.MantenimientoBean;


public class ConceptoAlmacenBean extends MantenimientoBean {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 6615274029401505703L;
	
	private String codAplicacion;
	private String codConAlm;
	private String desConAlm;
	private String signo;
	private String codAlm_origen;
	private String desAlm_origen;
	private String codAlm_destino;
	private String desAlm_destino;
	private boolean visibleCodAlmacenOrigen;
	private boolean solicitudAceptacionAutomatico;
	private boolean visibleSolicitudAceptacionAutomatico;
	private boolean solicitudRecepcionAutomatico;
	private boolean visibleSolicitudRecepcionAutomatico;
	private boolean solicitudGenerarFaltas;
	private boolean visibleSolicitudGenerarFaltas;
	private boolean visibleTiendas;
	private boolean visibleVisibleTiendas;
		
	
	protected void initNuevoBean() {	
	}

	public ConceptoAlmacenBean(){
		this.visibleCodAlmacenOrigen=true;
		this.solicitudAceptacionAutomatico=true;
		this.visibleSolicitudAceptacionAutomatico=true;
		this.solicitudRecepcionAutomatico=true;
		this.visibleSolicitudRecepcionAutomatico=true;
		this.solicitudGenerarFaltas=true;
		this.visibleSolicitudGenerarFaltas=true;
		this.visibleTiendas=true;
		this.visibleVisibleTiendas=true;
	}

	public String getCodAplicacion() {
		return codAplicacion;
	}


	public void setCodAplicacion(String codAplicacion) {
		this.codAplicacion = codAplicacion;
	}


	public String getCodConAlm() {
		return codConAlm;
	}


	public void setCodConAlm(String codConAlm) {
		this.codConAlm = codConAlm;
	}


	public String getDesConAlm() {
		return desConAlm;
	}


	public void setDesConAlm(String desConAlm) {
		this.desConAlm = desConAlm;
	}


	public String getSigno() {
		return signo;
	}


	public void setSigno(String signo) {
		this.signo = signo;
	}


	public String getCodAlm_origen() {
		return codAlm_origen;
	}


	public void setCodAlm_origen(String codAlm_origen) {
		this.codAlm_origen = codAlm_origen;
	}


	public String getDesAlm_origen() {
		return desAlm_origen;
	}

	public void setDesAlm_origen(String desAlm_origen) {
		this.desAlm_origen = desAlm_origen;
	}

	public String getCodAlm_destino() {
		return codAlm_destino;
	}


	public void setCodAlm_destino(String codAlm_destino) {
		this.codAlm_destino = codAlm_destino;
	}

	public String getDesAlm_destino() {
		return desAlm_destino;
	}

	public void setDesAlm_destino(String desAlm_destino) {
		this.desAlm_destino = desAlm_destino;
	}

	public boolean isVisibleCodAlmacenOrigen() {
		return visibleCodAlmacenOrigen;
	}

	public void setVisibleCodAlmacenOrigen(boolean visibleCodAlmacenOrigen) {
		this.visibleCodAlmacenOrigen = visibleCodAlmacenOrigen;
	}


	public boolean isSolicitudAceptacionAutomatico() {
		return solicitudAceptacionAutomatico;
	}

	public void setSolicitudAceptacionAutomatico(boolean solicitudAceptacionAutomatico) {
		this.solicitudAceptacionAutomatico = solicitudAceptacionAutomatico;
	}
	
	public String getSolicitudAceptacionAutomatico() {
		return (solicitudAceptacionAutomatico) ? TRUE : FALSE;
	}
	
	public void setSolicitudAceptacionAutomatico(String solicitudAceptacionAutomatico) {
		this.solicitudAceptacionAutomatico = solicitudAceptacionAutomatico.equals(TRUE);
	}	
	
	public boolean isVisibleSolicitudAceptacionAutomatico() {
		return visibleSolicitudAceptacionAutomatico;
	}

	public void setVisibleSolicitudAceptacionAutomatico(
			boolean visibleSolicitudAceptacionAutomatico) {
		this.visibleSolicitudAceptacionAutomatico = visibleSolicitudAceptacionAutomatico;
	}



	public boolean isSolicitudRecepcionAutomatico() {
		return solicitudRecepcionAutomatico;
	}

	public void setSolicitudRecepcionAutomatico(boolean solicitudRecepcionAutomatico) {
		this.solicitudRecepcionAutomatico = solicitudRecepcionAutomatico;
	}
	
	public String getSolicitudRecepcionAutomatico() {
		return (solicitudRecepcionAutomatico) ? TRUE : FALSE;
	}
	
	public void setSolicitudRecepcionAutomatico(String solicitudRecepcionAutomatico) {
		this.solicitudRecepcionAutomatico = solicitudRecepcionAutomatico.equals(TRUE);
	}
	
	public boolean isVisibleSolicitudRecepcionAutomatico() {
		return visibleSolicitudRecepcionAutomatico;
	}

	public void setVisibleSolicitudRecepcionAutomatico(
			boolean visibleSolicitudRecepcionAutomatico) {
		this.visibleSolicitudRecepcionAutomatico = visibleSolicitudRecepcionAutomatico;
	}



	public boolean isSolicitudGenerarFaltas() {
		return solicitudGenerarFaltas;
	}

	public void setSolicitudGenerarFaltas(boolean solicitudGenerarFaltas) {
		this.solicitudGenerarFaltas = solicitudGenerarFaltas;
	}
	
	public String getSolicitudGenerarFaltas() {
		return (solicitudGenerarFaltas) ? TRUE : FALSE;
	}
	
	public void setSolicitudGenerarFaltas(String solicitudGenerarFaltas) {
		this.solicitudGenerarFaltas = solicitudGenerarFaltas.equals(TRUE);
	}
	
	public boolean isVisibleSolicitudGenerarFaltas() {
		return visibleSolicitudGenerarFaltas;
	}

	public void setVisibleSolicitudGenerarFaltas(
			boolean visibleSolicitudGenerarFaltas) {
		this.visibleSolicitudGenerarFaltas = visibleSolicitudGenerarFaltas;
	}



	public boolean isVisibleTiendas() {
		return visibleTiendas;
	}

	public void setVisibleTiendas(boolean visibleTiendas) {
		this.visibleTiendas = visibleTiendas;
	}
	
	public String getVisibleTiendas() {
		return (visibleTiendas) ? TRUE : FALSE;
	}
	
	public void setVisibleTiendas(String visibleTiendas) {
		this.visibleTiendas = visibleTiendas.equals(TRUE);
	}

	public boolean isVisibleVisibleTiendas() {
		return visibleVisibleTiendas;
	}

	public void setVisibleVisibleTiendas(boolean visibleVisibleTiendas) {
		this.visibleVisibleTiendas = visibleVisibleTiendas;
	}
}
