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

package com.comerzzia.persistencia.tesoreria.cobros;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.tesoreria.cobros.vencimientos.VencimientoDocumentoCobroBean;
import com.comerzzia.util.base.MantenimientoBean;

public class DocumentoCobroBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2002048266232662667L;
	
	private Long idCobro;
	private Long idCobroDevolucion;
	private String codEmpresa;
	private Date fechaVencimiento;
	private String codCliente;
	private String desCliente;
	private Double importe;
	private String codSerie;
	private String documento;
	private Date fechaFactura;
	private String codTipoEfecto;
	private String desTipoEfecto;
	private Date fechaEntradaDocumento;
	private Date fechaCobro;
	private Long idRemesa;
	private String observaciones;
	private String codBancoCobro;
	private String desBancoCobro;
	private String codBancoDevolucion;
	private boolean remesable;
	private List<VencimientoDocumentoCobroBean> vencimientos;
	private boolean borrado = false;
	private Date fechaBaja;
	private Date fechaAlta;
	private Date fechaRemesa;
	
	public DocumentoCobroBean (){
	}
	
	public DocumentoCobroBean (DocumentoCobroBean documentoCobro){
		this.codEmpresa = documentoCobro.getCodEmpresa();
		this.fechaVencimiento = documentoCobro.getFechaVencimiento();
		this.codCliente = documentoCobro.getCodCliente();
		this.importe = documentoCobro.getImporte();
		this.codSerie = documentoCobro.getCodSerie();
		this.documento = documentoCobro.getDocumento();
		this.fechaFactura = documentoCobro.getFechaFactura();
		this.codTipoEfecto = documentoCobro.getCodTipoEfecto();
		this.fechaEntradaDocumento = documentoCobro.getFechaEntradaDocumento();
		this.observaciones = documentoCobro.getObservaciones();
		this.borrado = documentoCobro.isBorrado();
		this.remesable = documentoCobro.isRemesable();
		this.fechaAlta = documentoCobro.getFechaAlta();
	}
	
	protected void initNuevoBean() {
		vencimientos = new ArrayList<VencimientoDocumentoCobroBean>();
	}

	public Date getFechaVencimiento() {
		return fechaVencimiento;
	}

	public void setFechaVencimiento(Date fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}

	public String getCodCliente() {
		return codCliente;
	}

	public void setCodCliente(String codCliente) {
		this.codCliente = codCliente;
	}

	public String getDesCliente() {
		return desCliente;
	}

	public void setDesCliente(String desCliente) {
		this.desCliente = desCliente;
	}

	public Double getImporte() {
		return importe;
	}

	public void setImporte(Double importe) {
		this.importe = importe;
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

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public Date getFechaEntradaDocumento() {
		return fechaEntradaDocumento;
	}

	public void setFechaEntradaDocumento(Date fechaEntradaDocumento) {
		this.fechaEntradaDocumento = fechaEntradaDocumento;
	}

	public Long getIdRemesa() {
		return idRemesa;
	}

	public void setIdRemesa(Long idRemesa) {
		this.idRemesa = idRemesa;
	}

	public Long getIdCobro() {
		return idCobro;
	}

	public void setIdCobro(Long idCobro) {
		this.idCobro = idCobro;
	}

	public Long getIdCobroDevolucion() {
		return idCobroDevolucion;
	}

	public void setIdCobroDevolucion(Long idCobroDevolucion) {
		this.idCobroDevolucion = idCobroDevolucion;
	}

	public boolean isRemesable() {
		return remesable;
	}

	public void setRemesable(boolean remesable) {
		this.remesable = remesable;
	}

	public List<VencimientoDocumentoCobroBean> getVencimientos() {
		return vencimientos;
	}

	public void setVencimientos(List<VencimientoDocumentoCobroBean> vencimientos) {
		this.vencimientos = vencimientos;
	}
	
	public void addVencimiento(VencimientoDocumentoCobroBean vencimiento){
		this.vencimientos.add(vencimiento);
	}
	
	public String getCodEmpresa() {
		return codEmpresa;
	}

	public void setCodEmpresa(String codEmpresa) {
		this.codEmpresa = codEmpresa;
	}

	public boolean isBorrado() {
		return borrado;
	}

	public void setBorrado(boolean borrado) {
		this.borrado = borrado;;
	}
	
	public void setBorrado(String borrado) {
		this.borrado = borrado.equals(TRUE);
	}
	
	public String getBorrado(){
		return (borrado) ? TRUE : FALSE;
	}
	
	public void setRemesable(String remesable){
		this.remesable = remesable.equals(TRUE);
	}
	
	public String getRemesable (){
		return (this.remesable) ? TRUE : FALSE;
	}

	public String getCodSerie() {
		return codSerie;
	}

	public void setCodSerie(String codSerie) {
		this.codSerie = codSerie;
	}

	public Date getFechaBaja() {
		return fechaBaja;
	}

	public void setFechaBaja(Date fechaBaja) {
		this.fechaBaja = fechaBaja;
	}

	public String getCodBancoCobro() {
		return codBancoCobro;
	}

	public void setCodBancoCobro(String codBancoCobro) {
		this.codBancoCobro = codBancoCobro;
	}

	public String getDesBancoCobro() {
		return desBancoCobro;
	}

	public void setDesBancoCobro(String desBancoCobro) {
		this.desBancoCobro = desBancoCobro;
	}

	public Date getFechaCobro() {
		return fechaCobro;
	}

	public void setFechaCobro(Date fechaCobro) {
		this.fechaCobro = fechaCobro;
	}

	public Date getFechaAlta() {
		return fechaAlta;
	}

	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	public Date getFechaRemesa() {
		return fechaRemesa;
	}

	public void setFechaRemesa(Date fechaRemesa) {
		this.fechaRemesa = fechaRemesa;
	}

	public String getCodBancoDevolucion() {
		return codBancoDevolucion;
	}

	public void setCodBancoDevolucion(String codBancoDevolucion) {
		this.codBancoDevolucion = codBancoDevolucion;
	}

}
