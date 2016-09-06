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

package com.comerzzia.persistencia.compras.facturas.vencimientos;

import java.util.Date;

import com.comerzzia.persistencia.general.facturas.vencimientos.VencimientoFacturaBean;
import com.comerzzia.util.base.MantenimientoBean;

public class VencimientoFacturaCompraBean extends MantenimientoBean {
	
	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -4253494520013481306L;

	//Pagos
	private Long idVencimientoEnlace;
	private Long idVencimiento;
	private Long idPago;
	private String codSerie;
	private String documento;
	private Date fechaFactura;
	private Date fechaVencimiento;
	private Double importe;
	private Date fechaAceptacion;
	
	//Doc Pagos
	private String codEmpresa;
	private String codProveedor;
	private Date fechaAlta;
	private Date fechaBaja;
	private Date fechaPago;
	private String borrado;
	private String codTipoEfecto;
	private String codBancoPago;
	private String documentoPago;
	private Long idRemesa;
	private Date fechaEmision;
	private String observaciones;

	protected void initNuevoBean() {
	}

	public VencimientoFacturaCompraBean(){
	}
	
	public VencimientoFacturaCompraBean(VencimientoFacturaBean vencimiento){
		this.importe = vencimiento.getImporte();
		this.fechaVencimiento = vencimiento.getFechaVencimiento();
	}

	public Long getIdVencimientoEnlace() {
		return idVencimientoEnlace;
	}

	public void setIdVencimientoEnlace(Long idVencimientoEnlace) {
		this.idVencimientoEnlace = idVencimientoEnlace;
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

	public Date getFechaAceptacion() {
		return fechaAceptacion;
	}

	public void setFechaAceptacion(Date fechaAceptacion) {
		this.fechaAceptacion = fechaAceptacion;
	}

	public String getCodEmpresa() {
		return codEmpresa;
	}

	public void setCodEmpresa(String codEmpresa) {
		this.codEmpresa = codEmpresa;
	}

	public String getCodProveedor() {
		return codProveedor;
	}

	public void setCodProveedor(String codProveedor) {
		this.codProveedor = codProveedor;
	}

	public Date getFechaAlta() {
		return fechaAlta;
	}

	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	public Date getFechaBaja() {
		return fechaBaja;
	}

	public void setFechaBaja(Date fechaBaja) {
		this.fechaBaja = fechaBaja;
	}

	public Date getFechaPago() {
		return fechaPago;
	}

	public void setFechaPago(Date fechaPago) {
		this.fechaPago = fechaPago;
	}

	public String getBorrado() {
		return borrado;
	}

	public void setBorrado(String borrado) {
		this.borrado = borrado;
	}

	public String getCodTipoEfecto() {
		return codTipoEfecto;
	}

	public void setCodTipoEfecto(String codTipoEfecto) {
		this.codTipoEfecto = codTipoEfecto;
	}

	public String getCodBancoPago() {
		return codBancoPago;
	}

	public void setCodBancoPago(String codBancoPago) {
		this.codBancoPago = codBancoPago;
	}

	public String getDocumentoPago() {
		return documentoPago;
	}

	public void setDocumentoPago(String documentoPago) {
		this.documentoPago = documentoPago;
	}

	public Long getIdRemesa() {
		return idRemesa;
	}

	public void setIdRemesa(Long idRemesa) {
		this.idRemesa = idRemesa;
	}

	public Date getFechaEmision() {
		return fechaEmision;
	}

	public void setFechaEmision(Date fechaEmision) {
		this.fechaEmision = fechaEmision;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

}
