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

package com.comerzzia.persistencia.tesoreria.cobros.vencimientos;

import java.util.Date;

import com.comerzzia.util.base.MantenimientoBean;

public class VencimientoDocumentoCobroBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2443243381412659301L;
	
	private Long idVencimiento;
	private Long idCobro;
	private Long idVencimientoEnlace;
	private String codSerie;
	private Date fechaVencimiento;
	private String documento;
	private Date fechaFactura;
	private Double importe;
	private Date fechaAlta;

	protected void initNuevoBean() {
	}

	public Long getIdVencimiento() {
		return idVencimiento;
	}

	public void setIdVencimiento(Long idVencimiento) {
		this.idVencimiento = idVencimiento;
	}

	public Long getIdCobro() {
		return idCobro;
	}

	public void setIdCobro(Long idCobro) {
		this.idCobro = idCobro;
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

	public Date getFechaVencimiento() {
		return fechaVencimiento;
	}

	public void setFechaVencimiento(Date fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
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

}
