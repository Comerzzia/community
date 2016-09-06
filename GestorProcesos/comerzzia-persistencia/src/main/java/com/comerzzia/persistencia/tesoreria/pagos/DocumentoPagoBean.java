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

package com.comerzzia.persistencia.tesoreria.pagos;

import java.util.Date;

import com.comerzzia.util.base.MantenimientoBean;

public class DocumentoPagoBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7710243486171509390L;

	private Long idPago;
	private String codEmpresa;
	private String codProveedor;
	private String desProveedor;
	private Date fechaFactura;
	private Date fechaAlta;
	private Date fechaVencimiento;
	private Date fechaBaja;
	private Date fechaPago;
	private boolean borrado;
	private String codTipoEfecto;
	private String desTipoEfecto;
	private String codSerie;
	private String desSerie;
	private String documento;
	private Double importe;
	private String codBancoPago;
	private String desBancoPago;
	private String documentoPago;
	private Long idRemesa;
	private Date fechaRemesa;
	private Date fechaGeneracion;
	private Date fechaEmision;
	private String observaciones;
	private String codBancoRemesa;
	private String desBancoRemesa;
	private boolean remesable;
	
	
	protected void initNuevoBean() {
		
	}


	public Long getIdPago() {
		return idPago;
	}


	public void setIdPago(Long idPago) {
		this.idPago = idPago;
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


	public String getDesProveedor() {
		return desProveedor;
	}


	public void setDesProveedor(String desProveedor) {
		this.desProveedor = desProveedor;
	}
	
	
	public Date getFechaVencimiento() {
		return fechaVencimiento;
	}


	public void setFechaVencimiento(Date fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
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


	public boolean isBorrado() {
		return borrado;
	}


	public void setBorrado(boolean borrado) {
		this.borrado = borrado;
	}


	public String getCodTipoEfecto() {
		return codTipoEfecto;
	}


	public void setCodTipoEfecto(String codTipoEfecto) {
		this.codTipoEfecto = codTipoEfecto;
	}


	public String getDesTipoEfecto() {
		return desTipoEfecto;
	}


	public void setDesTipoEfecto(String desTipoEfecto) {
		this.desTipoEfecto = desTipoEfecto;
	}


	public String getCodSerie() {
		return codSerie;
	}


	public void setCodSerie(String codSerie) {
		this.codSerie = codSerie;
	}


	public String getDesSerie() {
		return desSerie;
	}


	public void setDesSerie(String desSerie) {
		this.desSerie = desSerie;
	}


	public String getDocumento() {
		return documento;
	}


	public void setDocumento(String documento) {
		this.documento = documento;
	}


	public Double getImporte() {
		return importe;
	}


	public void setImporte(Double importe) {
		this.importe = importe;
	}


	public String getCodBancoPago() {
		return codBancoPago;
	}


	public void setCodBancoPago(String codBancoPago) {
		this.codBancoPago = codBancoPago;
	}


	public String getDesBancoPago() {
		return desBancoPago;
	}


	public void setDesBancoPago(String desBancoPago) {
		this.desBancoPago = desBancoPago;
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
	
	public void setBorrado(String borrado) {
		this.borrado = borrado.equals(TRUE);
	}
	
	public String getBorrado(){
		return (borrado) ? TRUE : FALSE;
	}


	public Date getFechaFactura() {
		return fechaFactura;
	}


	public void setFechaFactura(Date fechaFactura) {
		this.fechaFactura = fechaFactura;
	}


	public Date getFechaGeneracion() {
		return fechaGeneracion;
	}


	public void setFechaGeneracion(Date fechaGeneracion) {
		this.fechaGeneracion = fechaGeneracion;
	}


//	public String getCodBancoRemesa() {
//		return codBancoRemesa;
//	}
//
//
//	public void setCodBancoRemesa(String codBancoRemesa) {
//		this.codBancoRemesa = codBancoRemesa;
//	}
//
//
//	public String getDesBancoRemesa() {
//		return desBancoRemesa;
//	}
//
//
//	public void setDesBancoRemesa(String desBancoRemesa) {
//		this.desBancoRemesa = desBancoRemesa;
//	}


	public Date getFechaRemesa() {
		return fechaRemesa;
	}


	public void setFechaRemesa(Date fechaRemesa) {
		this.fechaRemesa = fechaRemesa;
	}
	
	public Date getFechaAlta() {
		return fechaAlta;
	}


	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}


	public boolean isRemesable() {
		return remesable;
	}


	public void setRemesable(boolean remesable) {
		this.remesable = remesable;
	}
	
	public void setRemesable(String remesable){
		this.remesable = remesable.equals(TRUE);
	}


	public String getCodBancoRemesa() {
		return codBancoRemesa;
	}


	public void setCodBancoRemesa(String codBancoRemesa) {
		this.codBancoRemesa = codBancoRemesa;
	}


	public String getDesBancoRemesa() {
		return desBancoRemesa;
	}


	public void setDesBancoRemesa(String desBancoRemesa) {
		this.desBancoRemesa = desBancoRemesa;
	}

}
