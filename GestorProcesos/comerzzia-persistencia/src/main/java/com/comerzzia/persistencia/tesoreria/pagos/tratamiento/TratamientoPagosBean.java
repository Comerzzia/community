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

package com.comerzzia.persistencia.tesoreria.pagos.tratamiento;

import java.util.ArrayList;
import java.util.List;

import com.comerzzia.persistencia.tesoreria.pagos.DocumentoPagoBean;
import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;

public class TratamientoPagosBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4020955737363792084L;
	
	private DocumentoPagoBean documento; 
	private String idPago;
	private String codProveedor;
	private List<DocumentoPagoBean> marcados;
	private List<DocumentoPagoBean> agrupados;

	protected void initNuevoBean() {
		this.marcados = new ArrayList<DocumentoPagoBean>();
		this.agrupados = new ArrayList<DocumentoPagoBean>();
		this.documento = new DocumentoPagoBean();
		this.documento.setEstadoBean(Estado.NUEVO);
	}

	public DocumentoPagoBean getDocumento() {
		return documento;
	}

	public void setDocumento(DocumentoPagoBean documento) {
		this.documento = documento;
	}

	public String getIdPago() {
		return idPago;
	}

	public void setIdPago(String idPago) {
		this.idPago = idPago;
	}

	public List<DocumentoPagoBean> getMarcados() {
		return marcados;
	}

	public void setMarcados(List<DocumentoPagoBean> marcados) {
		this.marcados = marcados;
	}

	public List<DocumentoPagoBean> getAgrupados() {
		return agrupados;
	}

	public void setAgrupados(List<DocumentoPagoBean> agrupados) {
		this.agrupados = agrupados;
	}
	
	public double getImporteMarcado(){
		double importe = 0;
		for (DocumentoPagoBean documento : this.marcados){
			importe += documento.getImporte();
		}
		return importe;
	}
	
	public double getImporteAgrupado(){
		double importe = 0;
		for (DocumentoPagoBean documento : this.agrupados){
			importe += documento.getImporte();
		}
		return importe;
	}
	
	public double getImportePendiente(){
		return this.getImporteMarcado() - this.getImporteAgrupado();
	}
	
	public void addMarcado(DocumentoPagoBean documento){
		this.marcados.add(documento);
	}
	
	public void addAgrupado(DocumentoPagoBean documento){
		this.agrupados.add(documento);
	}
	
	public void borrarAgrupado(int indice){
		this.agrupados.remove(indice);
	}

	public String getCodProveedor() {
		return codProveedor;
	}

	public void setCodProveedor(String codProveedor) {
		this.codProveedor = codProveedor;
	}
	
	public int getNumeroMarcados(){
		return this.marcados.size();
	}

}
