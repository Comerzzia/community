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

import java.util.List;

import com.comerzzia.util.numeros.Numero;


public class ImpuestosBean {

	List<ImpuestoBean> listaImpuestos = null;
	double base = 0;
	double impuestos = 0;
	
	
	public ImpuestosBean() {
	}
	
	
	public ImpuestosBean(List<ImpuestoBean> listaImpuestos) {
		this.listaImpuestos = listaImpuestos;
		calculaTotales();
	}
	
	
	public void calculaTotales() {
		base = 0;
		impuestos = 0;
		
		for (ImpuestoBean impuesto : listaImpuestos) {
			base += impuesto.getBase();
			impuestos += impuesto.getImpuestos();
		}
	}
	
	/**
	 * @return the listaImpuestos
	 */
	public List<ImpuestoBean> getListaImpuestos() {
		return listaImpuestos;
	}

	/**
	 * @param listaImpuestos the listaImpuestos to set
	 */
	public void setListaImpuestos(List<ImpuestoBean> listaImpuestos) {
		this.listaImpuestos = listaImpuestos;
	}

	/**
	 * @return the base
	 */
	public double getBase() {
		return Numero.redondea(base, 2);
	}

	/**
	 * @return the impuestos
	 */
	public double getImpuestos() {
		return Numero.redondea(impuestos, 2);
	}

	/**
	 * Obtiene el importe total como la suma de la base mas los impuestos
	 * @return
	 */
	public double getTotal() {
		return Numero.redondea(base + impuestos, 2);
	}
}
