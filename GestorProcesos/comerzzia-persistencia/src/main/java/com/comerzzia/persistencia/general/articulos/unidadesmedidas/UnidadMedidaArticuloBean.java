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

package com.comerzzia.persistencia.general.articulos.unidadesmedidas;

import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;

public class UnidadMedidaArticuloBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5111381318833354485L;
	
	private String codArticulo;
	private String unidadMedida;
	private Double factorConversion;
	private Long alto;
	private Long ancho;
	private Long fondo;
	private Double peso;

	protected void initNuevoBean() {
	}

	public String getUnidadMedida() {
		return unidadMedida;
	}

	public void setUnidadMedida(String unidadMedida) {
		this.unidadMedida = unidadMedida;
	}
	
	public Long getAlto() {
		return alto;
	}

	public void setAlto(Long alto) {
		this.alto = alto;
	}

	public Long getAncho() {
		return ancho;
	}

	public void setAncho(Long ancho) {
		this.ancho = ancho;
	}

	public Long getFondo() {
		return fondo;
	}

	public void setFondo(Long fondo) {
		this.fondo = fondo;
	}
	
	public void borrar() {
		this.setEstadoBean(Estado.BORRADO);
	}

	public Double getFactorConversion() {
		return factorConversion;
	}

	public void setFactorConversion(Double factorConversion) {
		this.factorConversion = factorConversion;
	}

	public Double getPeso() {
		return peso;
	}

	public void setPeso(Double peso) {
		this.peso = peso;
	}

	public String getCodArticulo() {
		return codArticulo;
	}

	public void setCodArticulo(String codArticulo) {
		this.codArticulo = codArticulo;
	}
}
