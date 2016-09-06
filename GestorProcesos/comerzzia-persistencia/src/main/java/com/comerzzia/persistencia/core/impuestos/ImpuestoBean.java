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

package com.comerzzia.persistencia.core.impuestos;

import com.comerzzia.util.numeros.Numero;


public class ImpuestoBean implements ILineaDocumento {

	private Long idDocumento = null;
	private String codImpuesto = null;
	private double base = 0;
	private double impuestos = 0;
	
	
	public ImpuestoBean() {
	}
	
	public ImpuestoBean(String codImpuesto) {
		this.codImpuesto = codImpuesto;
	}
	
	/**
	 * @return the idDocumento
	 */
	public Long getIdDocumento() {
		return idDocumento;
	}

	/**
	 * @param idDocumento the idDocumento to set
	 */
	public void setIdDocumento(Long idDocumento) {
		this.idDocumento = idDocumento;
	}

	/**
	 * @return the codImpuesto
	 */
	public String getCodImpuesto() {
		return codImpuesto;
	}
	
	/**
	 * @param codImpuesto the codImpuesto to set
	 */
	public void setCodImpuesto(String codImpuesto) {
		this.codImpuesto = codImpuesto;
	}
	
	/**
	 * @return the base
	 */
	public double getBase() {
		return Numero.redondea(base, 2);
	}
	
	/**
	 * @param base the base to set
	 */
	public void setBase(double base) {
		this.base = base;
	}
	
	/**
	 * Suma el importe a la base
	 * @param base
	 */
	public void addBase(double importe) {
		this.base += importe;
	}
	
	/**
	 * @return the impuestos
	 */
	public double getImpuestos() {
		return Numero.redondea(impuestos, 2);
	}
	
	/**
	 * @param impuestos the impuestos to set
	 */
	public void setImpuestos(double impuestos) {
		this.impuestos = impuestos;
	}
	
	
	/**
	 * Obtiene el importe total como la suma de la base mas los impuestos
	 * @return
	 */
	public double getTotal() {
		return Numero.redondea(base + impuestos, 2);
	}

	
	@Override
	public Double getImporte() {
		return this.base;
	}
}
