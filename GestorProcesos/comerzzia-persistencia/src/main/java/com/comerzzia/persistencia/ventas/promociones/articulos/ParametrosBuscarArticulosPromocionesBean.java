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

package com.comerzzia.persistencia.ventas.promociones.articulos;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarArticulosPromocionesBean extends ParametrosBuscarBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1709914282288776651L;

	private Long idPromocion;
	private String descripcion = "";
	private String codArt = "";
	private String desArt = "";
	private String codFam = "";
	private String desFam = "";
	private String codPro = "";
	private String desPro = "";
	
	public ParametrosBuscarArticulosPromocionesBean() {
		super.setOrden("CODART");
		super.setTamañoPagina(100);
		super.setNumPagina(1);
	}
	
	public Long getIdPromocion() {
		return idPromocion;
	}
	public void setIdPromocion(Long idPromocion) {
		this.idPromocion = idPromocion;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = (descripcion != null) ? descripcion : "";;
	}
	public String getDesFam() {
		return desFam;
	}
	public void setDesFam(String desFam) {
		this.desFam = (desFam != null) ? desFam : "";;
	}
	public String getDesPro() {
		return desPro;
	}
	public void setDesPro(String desPro) {
		this.desPro = (desPro != null) ? desPro : "";;
	}
	public String getDesArt() {		
		return desArt;
	}
	public void setDesArt(String desArt) {
		this.desArt = (desArt != null) ? desArt : "";
	}
	public String getCodArt() {
		return codArt;
	}
	public void setCodArt(String codArt) {
		this.codArt = (codArt != null) ? codArt.toUpperCase() : "";
	}
	public String getCodFam() {
		return codFam;
	}
	public void setCodFam(String codFam) {
		this.codFam = (codFam != null) ? codFam.toUpperCase() : "";
	}
	public String getCodPro() {
		return codPro;
	}
	public void setCodPro(String codPro) {
		this.codPro = (codPro != null) ? codPro.toUpperCase() : "";
	}
	
}
