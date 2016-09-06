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

package com.comerzzia.persistencia.tesoreria.remesas.cobros;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.tesoreria.cobros.DocumentoCobroBean;
import com.comerzzia.util.base.MantenimientoBean;

public class RemesaCobroBean extends MantenimientoBean {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -2976797718030567376L;

	private Long idRemesa;
	private String codBanco;
	private String desBanco;
	private Date fechaRemesa;
	private Integer estado;
	private String desEstado;
	private Long efectos;
	private Long clientes;
	private Long devueltos;
	private Double importe;
	
	private boolean documentosCargados = false;
	private List<DocumentoCobroBean> documentos;

	protected void initNuevoBean() {
		documentos = new ArrayList<DocumentoCobroBean>();
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

	public Date getFechaRemesa() {
		return fechaRemesa;
	}

	public void setFechaRemesa(Date fechaRemesa) {
		this.fechaRemesa = fechaRemesa;
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

	public Long getEfectos() {
		return efectos;
	}

	public void setEfectos(Long efectos) {
		this.efectos = efectos;
	}

	public Long getClientes() {
		return clientes;
	}

	public void setClientes(Long clientes) {
		this.clientes = clientes;
	}

	public Long getDevueltos() {
		return devueltos;
	}

	public void setDevueltos(Long devueltos) {
		this.devueltos = devueltos;
	}

	public Double getImporte() {
		return importe;
	}

	public void setImporte(Double importe) {
		this.importe = importe;
	}

	public List<DocumentoCobroBean> getDocumentos() {
		return documentos;
	}

	public void setDocumentos(List<DocumentoCobroBean> documentos) {
		this.documentos = documentos;
	}
	
	public void addDocumento(DocumentoCobroBean documento){
		this.documentos.add(documento);
	}

	public boolean isDocumentosCargados() {
		return documentosCargados;
	}

	public void setDocumentosCargados(boolean documentosCargados) {
		this.documentosCargados = documentosCargados;
	}

	public void setEstadoPreremesa() {
		this.estado = EstadosRemesasCobro.ESTADO_PREREMESA;
	}
	
	public void setEstadoRemesa() {
		this.estado = EstadosRemesasCobro.ESTADO_REMESA;
	}

	/* ESTADOS */
	
	public int getESTADO_PREREMESA() {
		return EstadosRemesasCobro.ESTADO_PREREMESA;
	}

	public int getESTADO_REMESA() {
		return EstadosRemesasCobro.ESTADO_REMESA;
	}
}
