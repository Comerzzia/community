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

package com.comerzzia.persistencia.general.mediospago.vencimientos;

import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;

public class VencimientoBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5462763665265715552L;
	
	private String codMedioPago;
	private String desVencimiento;
	private Long numeroVencimientos;
	private Long diasCadencia;
	private Long diasEntreVencimientos;
	private boolean diasNaturales;
	private Long idMedioPagoVencimiento;

	protected void initNuevoBean() {	
	}

	public String getCodMedioPago() {
		return codMedioPago;
	}

	public void setCodMedioPago(String codMedioPago) {
		this.codMedioPago = codMedioPago;
	}

	public String getDesVencimiento() {
		return desVencimiento;
	}

	public void setDesVencimiento(String desVencimiento) {
		this.desVencimiento = desVencimiento;
	}

	public Long getNumeroVencimientos() {
		return numeroVencimientos;
	}

	public void setNumeroVencimientos(Long numeroVencimientos) {
		this.numeroVencimientos = numeroVencimientos;
	}

	public Long getDiasCadencia() {
		return diasCadencia;
	}

	public void setDiasCadencia(Long diasCadencia) {
		this.diasCadencia = diasCadencia;
	}

	public Long getDiasEntreVencimientos() {
		return diasEntreVencimientos;
	}

	public void setDiasEntreVencimientos(Long diasEntreVencimientos) {
		this.diasEntreVencimientos = diasEntreVencimientos;
	}

	public void setDiasNaturales(boolean diasNaturales) {
		this.diasNaturales = diasNaturales;
	}
	
	public boolean isNaturales() {
		return diasNaturales;
	}
	
	public String getDiasNaturales() {
		return (diasNaturales) ? TRUE : FALSE;
	}

	public void setDiasNaturales(String diasNaturales) {
		this.diasNaturales = diasNaturales.equals(TRUE);
	}
	
	public void borrar() {
        this.setEstadoBean(Estado.BORRADO);
    }

	public Long getIdMedioPagoVencimiento() {
		return idMedioPagoVencimiento;
	}

	public void setIdMedioPagoVencimiento(Long idMedioPagoVencimiento) {
		this.idMedioPagoVencimiento = idMedioPagoVencimiento;
	}

	public Boolean isTieneVencimientos(){
		if(numeroVencimientos > 0){
			return true;
		}
		else{
			return false;
		}
	}
}
