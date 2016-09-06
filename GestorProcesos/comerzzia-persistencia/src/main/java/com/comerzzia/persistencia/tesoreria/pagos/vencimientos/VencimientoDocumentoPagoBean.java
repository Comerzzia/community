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

package com.comerzzia.persistencia.tesoreria.pagos.vencimientos;

import java.util.Date;

import com.comerzzia.util.base.MantenimientoBean;

public class VencimientoDocumentoPagoBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1340128497445214191L;

	private Long idVencimiento;
	private Long idPago;
	private Long idVencimientoEnlace;
	private String codSerie;
	private String documento;
	private Date fechaFactura;
	private Date fechaVencimiento;
	private Double importe;
	private Date fechaAlta;
	private Date fechaAceptacion;
	
	protected void initNuevoBean() {
	}

	public Long getIdVencimiento() {
		return idVencimiento;
	}

	public void setIdVencimiento(Long idVencimiento) {
		this.idVencimiento = idVencimiento;
	}

	public Long getIdPago() {
		return idPago;
	}

	public void setIdPago(Long idPago) {
		this.idPago = idPago;
	}

	public Long getIdVencimientoEnlace() {
		return idVencimientoEnlace;
	}

	public void setIdVencimientoEnlace(Long idVencimientoEnlace) {
		this.idVencimientoEnlace = idVencimientoEnlace;
	}

	public String getCodSerie() {
		return codSerie;
	}

	public void setCodSerie(String codSerie) {
		this.codSerie = codSerie;
	}

	public String getDocumento() {
		return documento;
	}

	public void setDocumento(String documento) {
		this.documento = documento;
	}

	public Date getFechaFactura() {
		return fechaFactura;
	}

	public void setFechaFactura(Date fechaFactura) {
		this.fechaFactura = fechaFactura;
	}

	public Date getFechaVencimiento() {
		return fechaVencimiento;
	}

	public void setFechaVencimiento(Date fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}

	public Double getImporte() {
		return importe;
	}

	public void setImporte(Double importe) {
		this.importe = importe;
	}

	public Date getFechaAlta() {
		return fechaAlta;
	}

	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	public Date getFechaAceptacion() {
		return fechaAceptacion;
	}

	public void setFechaAceptacion(Date fechaAceptacion) {
		this.fechaAceptacion = fechaAceptacion;
	}

}
