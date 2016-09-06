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

package com.comerzzia.persistencia.ventas.facturas.vencimientos;

import java.util.Date;

import com.comerzzia.persistencia.general.facturas.vencimientos.VencimientoFacturaBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;

public class VencimientoFacturaVentaBean extends MantenimientoBean {
	
	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -4253494520013481306L;

	private Long idVencimientoEnlace;
	private Long idVencimiento;
	private Long idCobro;
	private Date fechaBaja;
	private Double importe;
	private Long estado;
	private Date fechaFactura;
	private Date fechaAlta;
	private Date fechaVencimiento;
	private Date fechaEntradaDocumento;
	private Date fechaVencimientoDocumento;
	private Date fechaBajaDocumento;
	private Date fechaBajaRiesgoBanco;
	private String codTipoEfecto;
	private String desTipoEfecto;
	private String codSerie;
	private String documento;
	private String codBancoCobro;
	private String codBancoDevolucion;
	private Double gastosDevolucion;
	private String codEmpresa;
	private String codCliente;
	private String remesable;
	private Date fechaCobro;
	private Double importeDocumento;
	private String observaciones;
	private String borrado;
	private Long idCodRemesa;
	private String codBancoRemesa;
	private Date fechaRemesa;
	
	protected void initNuevoBean() {
	}

	public VencimientoFacturaVentaBean(){
	}
	
	public VencimientoFacturaVentaBean(VencimientoFacturaBean vencimiento){
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

	public Long getIdCobro() {
		return idCobro;
	}

	public void setIdCobro(Long idCobro) {
		this.idCobro = idCobro;
	}

	public Date getFechaBaja() {
		return fechaBaja;
	}

	public void setFechaBaja(Date fechaBaja) {
		this.fechaBaja = fechaBaja;
	}

	public Long getEstado() {
		return estado;
	}

	public void setEstado(Long estado) {
		this.estado = estado;
	}

	public Date getFechaFactura() {
		return fechaFactura;
	}

	public void setFechaFactura(Date fechaFactura) {
		this.fechaFactura = fechaFactura;
	}

	public Date getFechaAlta() {
		return fechaAlta;
	}

	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	public Date getFechaVencimientoDocumento() {
		return fechaVencimientoDocumento;
	}

	public void setFechaVencimientoDocumento(Date fechaVencimientoDocumento) {
		this.fechaVencimientoDocumento = fechaVencimientoDocumento;
	}

	public Date getFechaBajaDocumento() {
		return fechaBajaDocumento;
	}

	public void setFechaBajaDocumento(Date fechaBajaDocumento) {
		this.fechaBajaDocumento = fechaBajaDocumento;
	}

	public Date getFechaBajaRiesgoBanco() {
		return fechaBajaRiesgoBanco;
	}

	public void setFechaBajaRiesgoBanco(Date fechaBajaRiesgoBanco) {
		this.fechaBajaRiesgoBanco = fechaBajaRiesgoBanco;
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

	public String getDocumento() {
		return documento;
	}

	public void setDocumento(String documento) {
		this.documento = documento;
	}

	public String getCodBancoCobro() {
		return codBancoCobro;
	}

	public void setCodBancoCobro(String codBancoCobro) {
		this.codBancoCobro = codBancoCobro;
	}

	public Date getFechaCobro() {
		return fechaCobro;
	}

	public void setFechaCobro(Date fechaCobro) {
		this.fechaCobro = fechaCobro;
	}

	public Double getImporteDocumento() {
		return importeDocumento;
	}

	public void setImporteDocumento(Double importeDocumento) {
		this.importeDocumento = importeDocumento;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public String getBorrado() {
		return borrado;
	}

	public void setBorrado(String borrado) {
		this.borrado = borrado;
	}

	public Long getIdCodRemesa() {
		return idCodRemesa;
	}

	public void setIdCodRemesa(Long idCodRemesa) {
		this.idCodRemesa = idCodRemesa;
	}

	public String getCodBancoRemesa() {
		return codBancoRemesa;
	}

	public void setCodbanRemesa(String codBancoRemesa) {
		this.codBancoRemesa = codBancoRemesa;
	}

	public Date getFechaRemesa() {
		return fechaRemesa;
	}

	public void setFechaRemesa(Date fechaRemesa) {
		this.fechaRemesa = fechaRemesa;
	}

	public void borrar() {
        this.setEstadoBean(Estado.BORRADO);
    }

	public Double getImporte() {
		return importe;
	}

	public void setImporte(Double importe) {
		this.importe = importe;
	}

	public Date getFechaVencimiento() {
		return fechaVencimiento;
	}

	public void setFechaVencimiento(Date fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}

	public String getCodEmpresa() {
		return codEmpresa;
	}

	public void setCodEmpresa(String codEmpresa) {
		this.codEmpresa = codEmpresa;
	}

	public String getCodCliente() {
		return codCliente;
	}

	public void setCodCliente(String codCliente) {
		this.codCliente = codCliente;
	}

	public String getRemesable() {
		return remesable;
	}

	public void setRemesable(String remesable) {
		this.remesable = remesable;
	}

	public Date getFechaEntradaDocumento() {
		return fechaEntradaDocumento;
	}

	public void setFechaEntradaDocumento(Date fechaEntradaDocumento) {
		this.fechaEntradaDocumento = fechaEntradaDocumento;
	}

	public String getCodBancoDevolucion() {
		return codBancoDevolucion;
	}

	public void setCodBancoDevolucion(String codBancoDevolucion) {
		this.codBancoDevolucion = codBancoDevolucion;
	}

	public Double getGastosDevolucion() {
		return gastosDevolucion;
	}

	public void setGastosDevolucion(Double gastosDevolucion) {
		this.gastosDevolucion = gastosDevolucion;
	}

	public void setCodBancoRemesa(String codBancoRemesa) {
		this.codBancoRemesa = codBancoRemesa;
	}

}
