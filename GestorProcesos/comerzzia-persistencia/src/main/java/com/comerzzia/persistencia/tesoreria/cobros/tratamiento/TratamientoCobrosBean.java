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

package com.comerzzia.persistencia.tesoreria.cobros.tratamiento;

import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.tesoreria.cobros.DocumentoCobroBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;

public class TratamientoCobrosBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5777049711976135113L;
	
	private DocumentoCobroBean documento;
	private String idCobro;
	private String codCliente;
	private List<DocumentoCobroBean> marcados;
	private List<DocumentoCobroBean> agrupados;

	protected void initNuevoBean() {
		this.marcados = new ArrayList<DocumentoCobroBean>();
		this.agrupados = new ArrayList<DocumentoCobroBean>();
		this.documento = new DocumentoCobroBean();
		this.documento.setEstadoBean(Estado.NUEVO);
	}

	public List<DocumentoCobroBean> getMarcados() {
		return marcados;
	}

	public void setMarcados(List<DocumentoCobroBean> marcados) {
		this.marcados = marcados;
	}

	public List<DocumentoCobroBean> getAgrupados() {
		return agrupados;
	}

	public void setAgrupados(List<DocumentoCobroBean> agrupados) {
		this.agrupados = agrupados;
	}
	
	public double getImporteMarcado(){
		double importe = 0;
		for (DocumentoCobroBean documento : this.marcados){
			importe += documento.getImporte();
		}
		return importe;
	}
	
	public double getImporteAgrupado(){
		double importe = 0;
		for (DocumentoCobroBean documento : this.agrupados){
			importe += documento.getImporte();
		}
		return importe;
	}
	
	public double getImportePendiente(){
		return this.getImporteMarcado() - this.getImporteAgrupado();
	}

	public DocumentoCobroBean getDocumento() {
		return documento;
	}

	public void setDocumento(DocumentoCobroBean documento) {
		this.documento = documento;
	}
	
	public void addMarcado(DocumentoCobroBean documento){
		this.marcados.add(documento);
	}
	
	public void addAgrupado(DocumentoCobroBean documento){
		this.agrupados.add(documento);
	}
	
	public void borrarAgrupado(int indice){
		this.agrupados.remove(indice);
	}

	public String getCodCliente() {
		return codCliente;
	}

	public void setCodCliente(String codCliente) {
		this.codCliente = codCliente;
	}
	
	public int getNumeroMarcados(){
		return this.marcados.size();
	}

	public String getIdCobro() {
		return idCobro;
	}

	public void setIdCobro(String idCobro) {
		this.idCobro = idCobro;
	}

}
