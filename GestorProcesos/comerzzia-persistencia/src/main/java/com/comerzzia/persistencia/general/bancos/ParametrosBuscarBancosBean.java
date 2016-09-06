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

package com.comerzzia.persistencia.general.bancos;

import com.comerzzia.util.base.ParametrosBuscarBean;

public class ParametrosBuscarBancosBean extends ParametrosBuscarBean  {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1815958755492193188L;
	
	private String codBan = "";
	private String desBan = "";
	private String domicilio = "";
	private String poblacion = "";
	private String provincia = "";	
	private String telefono1 = "";
	private String telefono2 = "";
	private String fax = "";
	private String ccc = "";
	private String cif = "";
	private String cp = "";
	private String codEmp = "";
	private String observaciones = "";
	private Integer dias_fin_riesgo_remesados = null;
	private String activo = "";
	
	
	public ParametrosBuscarBancosBean() {
		super.setOrden("CODBAN");
	}
	public String getCodBan() {
		return codBan;
	}
	public void setCodBan(String codBan) {
		this.codBan = (codBan != null) ? codBan.toUpperCase() : "";
	}
	public String getDesBan() {
		return desBan;
	}
	public void setDesBan(String desBan) {
		this.desBan = (desBan !=null) ? desBan:"";
	}
	public String getDomicilio() {
		return domicilio;
	}
	public void setDomicilio(String domicilio) {
		this.domicilio = (domicilio !=null) ? domicilio:"";
	}
	public String getPoblacion() {
		return poblacion;
	}
	public void setPoblacion(String poblacion) {
		this.poblacion = (poblacion !=null) ? poblacion : "";
	}
	public String getProvincia() {
		return provincia;
	}
	public void setProvincia(String provincia) {
		this.provincia = (provincia !=null) ? provincia : "";
	}
	public String getTelefono1() {
		return telefono1;
	}
	public void setTelefono1(String telefono1) {
		this.telefono1 = (telefono1 !=null) ? telefono1 : "";
	}
	public String getTelefono2() {
		return telefono2;
	}
	public void setTelefono2(String telefono2) {
		this.telefono2 = (telefono2 !=null) ? telefono2 : "";
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = (fax !=null) ? fax : "";
	}
	public String getCcc() {
		return ccc;
	}
	public void setCcc(String ccc) {
		this.ccc = (ccc !=null) ? ccc : "";
	}
	public String getCif() {
		return cif;
	}
	public void setCif(String cif) {
		this.cif = (cif !=null) ? cif : "";
	}
	public String getCp() {
		return cp;
	}
	public void setCp(String cp) {
		this.cp = (cif !=null) ? cp : "";
	}
	public String getCodEmp() {
		return codEmp;
	}
	public void setCodEmp(String codEmp) {
		this.codEmp = (codEmp !=null) ? codEmp : "";
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = (observaciones !=null) ? observaciones : "";
	}
	public Integer getDias_fin_riesgo_remesados() {
		return dias_fin_riesgo_remesados;
	}
	public void setDias_fin_riesgo_remesados(Integer dias_fin_riesgo_remesados) {
		this.dias_fin_riesgo_remesados = (dias_fin_riesgo_remesados !=null) ? dias_fin_riesgo_remesados : null;
	}
	public String getActivo() {
		return activo;
	}
	public void setActivo(String activo) {
		this.activo = (activo != null) ? activo : "";
	}
	
}
