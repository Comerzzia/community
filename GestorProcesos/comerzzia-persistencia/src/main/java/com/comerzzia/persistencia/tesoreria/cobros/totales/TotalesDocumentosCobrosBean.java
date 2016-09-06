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

package com.comerzzia.persistencia.tesoreria.cobros.totales;

import com.comerzzia.util.base.MantenimientoBean;

public class TotalesDocumentosCobrosBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2813217010281280858L;

	private int numRegistros;
	private Double importeTotal;
	private int numClientes;
	private Double riesgoConcedido;
	
	protected void initNuevoBean() {
	}

	public int getNumRegistros() {
		return numRegistros;
	}

	public void setNumRegistros(int numRegistros) {
		this.numRegistros = numRegistros;
	}

	public Double getImporteTotal() {
		return importeTotal;
	}

	public void setImporteTotal(Double importeTotal) {
		this.importeTotal = importeTotal;
	}

	public int getNumClientes() {
		return numClientes;
	}

	public void setNumClientes(int numClientes) {
		this.numClientes = numClientes;
	}

	public Double getRiesgoConcedido() {
		return riesgoConcedido;
	}

	public void setRiesgoConcedido(Double riesgoConcedido) {
		this.riesgoConcedido = riesgoConcedido;
	}
	
	public double getDiferencia(){
		return this.importeTotal.doubleValue() - this.riesgoConcedido.doubleValue();
	}

}
