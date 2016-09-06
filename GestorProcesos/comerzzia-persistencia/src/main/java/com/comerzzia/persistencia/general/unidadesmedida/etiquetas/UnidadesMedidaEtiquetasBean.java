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

package com.comerzzia.persistencia.general.unidadesmedida.etiquetas;

import com.comerzzia.util.base.MantenimientoBean;


public class UnidadesMedidaEtiquetasBean extends MantenimientoBean {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = -4146055527094080240L;
	
	private String cod_UM_Etiqueta;
	private String des_UM_Etiqueta;
	private String desEtiqueta;
	private Long factor;
		
	
	protected void initNuevoBean() {	
	}


	public String getCod_UM_Etiqueta() {
		return cod_UM_Etiqueta;
	}


	public void setCod_UM_Etiqueta(String cod_UM_Etiqueta) {
		this.cod_UM_Etiqueta = cod_UM_Etiqueta;
	}


	public String getDes_UM_Etiqueta() {
		return des_UM_Etiqueta;
	}


	public void setDes_UM_Etiqueta(String des_UM_Etiqueta) {
		this.des_UM_Etiqueta = des_UM_Etiqueta;
	}


	public String getDesEtiqueta() {
		return desEtiqueta;
	}


	public void setDesEtiqueta(String desEtiqueta) {
		this.desEtiqueta = desEtiqueta;
	}


	public Long getFactor() {
		return factor;
	}


	public void setFactor(Long factor) {
		this.factor = factor;
	}



}
