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

package com.comerzzia.persistencia.ventas.tarifas.articulos;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarArticulosTarifaBean extends ParametrosBuscarBean {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -4054163446328737687L;

	protected String codTar = "";
	protected String codArt = "";
	protected String desArt = "";
	protected String desArtText = "";
	protected String codFam = "";
	protected String desFam = "";
	protected String codPro = "";
	protected String desPro = "";
	protected String codArtDesde = "";
	protected String desArtDesde = "";
	protected String codArtHasta = "";
	protected String desArtHasta = "";
	protected String codFamDesde = "";
	protected String desFamDesde = "";
	protected String codFamHasta = "";
	protected String desFamHasta = "";
	protected String codProDesde = "";
	protected String desProDesde = "";
	protected String codProHasta = "";
	protected String desProHasta = "";
	protected boolean sinPaginar;
	

	public ParametrosBuscarArticulosTarifaBean() {
		super.setOrden("CODART");
		super.setTamañoPagina(50);
	}

	public String getCodTar() {
		return codTar;
	}

	public void setCodTar(String codTar) {
		this.codTar = (codTar != null) ? codTar.toUpperCase() : "";
	}

	public String getCodArt() {
		return codArt;
	}

	public void setCodArt(String codArt) {
		this.codArt = (codArt != null) ? codArt.toUpperCase() : "";
	}

	public String getDesArt() {
		return desArt;
	}

	public void setDesArt(String desArt) {
		this.desArt = (desArt != null) ? desArt : "";
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

	public String getDesFam() {
		return desFam;
	}

	public void setDesFam(String desFam) {
		this.desFam = (desFam != null) ? desFam : "";
	}

	public String getDesPro() {
		return desPro;
	}

	public void setDesPro(String desPro) {
		this.desPro = (desPro != null) ? desPro : "";
	}

	public String getDesArtText() {
		return desArtText;
	}

	public void setDesArtText(String desArtText) {
		this.desArtText = (desArtText != null) ? desArtText : "";
	}

	public String getCodArtDesde() {
		return codArtDesde;
	}

	public void setCodArtDesde(String codArtDesde) {
		this.codArtDesde = (codArtDesde != null) ? codArtDesde : "";
	}

	public String getDesArtDesde() {
		return desArtDesde;
	}

	public void setDesArtDesde(String desArtDesde) {
		this.desArtDesde = (desArtDesde != null) ? desArtDesde : "";
	}

	public String getCodArtHasta() {
		return codArtHasta;
	}

	public void setCodArtHasta(String codArtHasta) {
		this.codArtHasta = (codArtHasta != null) ? codArtHasta : "";
	}

	public String getDesArtHasta() {
		return desArtHasta;
	}

	public void setDesArtHasta(String desArtHasta) {
		this.desArtHasta = (desArtHasta != null) ? desArtHasta : "";
	}

	public String getCodFamDesde() {
		return codFamDesde;
	}

	public void setCodFamDesde(String codFamDesde) {
		this.codFamDesde = (codFamDesde != null) ? codFamDesde : "";
	}

	public String getDesFamDesde() {
		return desFamDesde;
	}

	public void setDesFamDesde(String desFamDesde) {
		this.desFamDesde = (desFamDesde != null) ? desFamDesde : "";
	}

	public String getCodFamHasta() {
		return codFamHasta;
	}

	public void setCodFamHasta(String codFamHasta) {
		this.codFamHasta = (codFamHasta != null) ? codFamHasta : "";
	}

	public String getDesFamHasta() {
		return desFamHasta;
	}

	public void setDesFamHasta(String desFamHasta) {
		this.desFamHasta = (desFamHasta != null) ? desFamHasta : "";
	}

	public String getCodProDesde() {
		return codProDesde;
	}

	public void setCodProDesde(String codProDesde) {
		this.codProDesde = (codProDesde != null) ? codProDesde : "";
	}

	public String getDesProDesde() {
		return desProDesde;
	}

	public void setDesProDesde(String desProDesde) {
		this.desProDesde = (desProDesde != null) ? desProDesde : "";
	}

	public String getCodProHasta() {
		return codProHasta;
	}

	public void setCodProHasta(String codProHasta) {
		this.codProHasta = (codProHasta != null) ? codProHasta : "";
	}

	public String getDesProHasta() {
		return desProHasta;
	}

	public void setDesProHasta(String desProHasta) {
		this.desProHasta = (desProHasta != null) ? desProHasta : "";
	}

	public boolean isSinPaginar() {
		return sinPaginar;
	}

	public void setSinPaginar(boolean sinPaginar) {
		this.sinPaginar = sinPaginar;
	}
	
	
}
