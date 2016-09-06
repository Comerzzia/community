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

package com.comerzzia.persistencia.ventas.facturas.pagos;

import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.util.base.MantenimientoBean;

public class PagoFacturaVentaBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3262820087326657586L;

	private Long idFacturaRep;	//PK
	private Integer linea;  //PK
	private Long idMedioPagoVencimiento;
	private String desMedioPagoVencimiento;
	private Double importe;
	private String numeroOperacion;
	
	public PagoFacturaVentaBean(){		
	}
	
	public PagoFacturaVentaBean(ClienteBean cliente){
		this.idMedioPagoVencimiento = cliente.getIdMedioPagoVencimiento();
		this.desMedioPagoVencimiento = cliente.getDesMedioPagoVencimiento();
	}

	@Override
	protected void initNuevoBean() {
	}

	public Long getIdFacturaRep() {
		return idFacturaRep;
	}

	public void setIdFacturaRep(Long idFacturaRep) {
		this.idFacturaRep = idFacturaRep;
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

	public String getNumeroOperacion() {
		return numeroOperacion;
	}

	public void setNumeroOperacion(String numeroOperacion) {
		this.numeroOperacion = numeroOperacion;
	}
	
}
