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

package com.comerzzia.persistencia.compras.albaranes.pagos;

import com.comerzzia.util.base.MantenimientoBean;

public class PagoAlbaranCompraBean extends MantenimientoBean {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8051121322271661229L;
	
	private Long idAlbaran = null; // PK
	private Integer linea = null; // PK
	private Long idMedioPagoVencimiento = null;
	private String desMedioPagoVencimiento = null;
	private Double importe = null;
	
	protected void initNuevoBean() {
	}
	
	
	public Long getIdAlbaran() {
		return idAlbaran;
	}
	public void setIdAlbaran(Long idAlbaran) {
		this.idAlbaran = idAlbaran;
	}
	
	
	public Integer getLinea() {
		return linea;
	}
	public void setLinea(Integer linea) {
		this.linea = linea;
	}
	
	
	public Long getIdMedioPagoVencimiento() {
		return idMedioPagoVencimiento;
	}
	public void setIdMedioPagoVencimiento(Long idMedioPagoVencimiento) {
		this.idMedioPagoVencimiento = idMedioPagoVencimiento;
	}
	
	
	public String getDesMedioPagoVencimiento() {
		return desMedioPagoVencimiento;
	}
	public void setDesMedioPagoVencimiento(String desMedioPagoVencimiento) {
		this.desMedioPagoVencimiento = desMedioPagoVencimiento;
	}
	
	
	public Double getImporte() {
		return importe;
	}
	public void setImporte(Double importe) {
		this.importe = importe;
	}
}
