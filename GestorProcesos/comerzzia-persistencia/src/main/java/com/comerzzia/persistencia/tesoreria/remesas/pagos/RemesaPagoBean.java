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

package com.comerzzia.persistencia.tesoreria.remesas.pagos;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.tesoreria.pagos.DocumentoPagoBean;
import com.comerzzia.util.base.MantenimientoBean;

public class RemesaPagoBean extends MantenimientoBean{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -4830253785612669713L;

	private Long idRemesa;
	private String codBanco;
	private String desBanco;
	private String codTipoEfecto;
	private String desTipoEfecto;
	private Date fechaRemesa;
	private Date fechaGeneracion;
	private Integer estado;
	private String desEstado;
	private Long efectos;
	private Long proveedores;
	private Double importe;
	
	private boolean documentosCargados = false;
	private List<DocumentoPagoBean> documentos;

	protected void initNuevoBean() {
		documentos = new ArrayList<DocumentoPagoBean>();
	}

	public Long getIdRemesa() {
		return idRemesa;
	}

	public void setIdRemesa(Long idRemesa) {
		this.idRemesa = idRemesa;
	}

	public String getCodBanco() {
		return codBanco;
	}

	public void setCodBanco(String codBanco) {
		this.codBanco = codBanco;
	}

	public String getDesBanco() {
		return desBanco;
	}

	public void setDesBanco(String desBanco) {
		this.desBanco = desBanco;
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

	public Date getFechaRemesa() {
		return fechaRemesa;
	}

	public void setFechaRemesa(Date fechaRemesa) {
		this.fechaRemesa = fechaRemesa;
	}

	public Date getFechaGeneracion() {
		return fechaGeneracion;
	}

	public void setFechaGeneracion(Date fechaGeneracion) {
		this.fechaGeneracion = fechaGeneracion;
	}

	public Long getEfectos() {
		return efectos;
	}

	public void setEfectos(Long efectos) {
		this.efectos = efectos;
	}

	public Long getProveedores() {
		return proveedores;
	}

	public void setProveedores(Long proveedores) {
		this.proveedores = proveedores;
	}

	public Double getImporte() {
		return importe;
	}

	public void setImporte(Double importe) {
		this.importe = importe;
	}

	public void addDocumento(DocumentoPagoBean documento){
		this.documentos.add(documento);
	}

	public boolean isDocumentosCargados() {
		return documentosCargados;
	}

	public void setDocumentosCargados(boolean documentosCargados) {
		this.documentosCargados = documentosCargados;
	}

	public List<DocumentoPagoBean> getDocumentos() {
		return documentos;
	}

	public void setDocumentos(List<DocumentoPagoBean> documentos) {
		this.documentos = documentos;
	}

	public Integer getEstado() {
		return estado;
	}

	public void setEstado(Integer estado) {
		this.estado = estado;
	}

	public String getDesEstado() {
		return desEstado;
	}

	public void setDesEstado(String desEstado) {
		this.desEstado = desEstado;
	}

	public void setEstadoPreremesa() {
		this.estado = EstadosRemesasPago.ESTADO_PREREMESA;
	}
	
	public void setEstadoRemesa() {
		this.estado = EstadosRemesasPago.ESTADO_REMESA;
	}

	/* ESTADOS */
	
	public int getESTADO_PREREMESA() {
		return EstadosRemesasPago.ESTADO_PREREMESA;
	}

	public int getESTADO_REMESA() {
		return EstadosRemesasPago.ESTADO_REMESA;
	}
}
