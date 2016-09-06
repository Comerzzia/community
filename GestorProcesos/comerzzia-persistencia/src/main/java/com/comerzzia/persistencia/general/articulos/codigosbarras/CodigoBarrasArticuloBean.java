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

package com.comerzzia.persistencia.general.articulos.codigosbarras;

import com.comerzzia.util.base.Estado;
import com.comerzzia.util.base.MantenimientoBean;

public class CodigoBarrasArticuloBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6196040855565830401L;

	private String desglose1;
	private String desglose2;
	private String codigoBarras;
	private boolean dun14 = false;
	private String codArticulo;
	private Double factorConversion;

	protected void initNuevoBean() {
	}

	public String getDesglose1() {
		return desglose1;
	}

	public void setDesglose1(String desglose1) {
		this.desglose1 = desglose1;
	}

	public String getDesglose2() {
		return desglose2;
	}

	public void setDesglose2(String desglose2) {
		this.desglose2 = desglose2;
	}

	public String getCodigoBarras() {
		return codigoBarras;
	}

	public void setCodigoBarras(String codigoBarras) {
		this.codigoBarras = codigoBarras;
	}

	public String getDun14() {
		return (dun14) ? TRUE : FALSE;
	}

	public void setDun14(String dun14) {
		this.dun14 = dun14.equals(TRUE);
	}

	public boolean isDun14() {
		return dun14;
	}

	public void setDun14(boolean dun14) {
		this.dun14 = dun14;
	}

	public String getCodArticulo() {
		return codArticulo;
	}

	public void setCodArticulo(String codArticulo) {
		this.codArticulo = codArticulo;
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
}
