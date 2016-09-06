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

package com.comerzzia.persistencia.core.empresas;

import com.comerzzia.util.base.MantenimientoBean;

public class EmpresaBean extends MantenimientoBean {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7293399152560988014L;
	
	private String codEmp;
	private String desEmp;
	private String domicilio;
	private String poblacion;
	private String provincia;
	private String cp;
	private String cif;
	private String telefono1;
	private String telefono2;
	private String fax;
	private byte [] logotipo;
	private String registroMercantil;
	
	protected void initNuevoBean() {
	}
	
	/**
	 * Obtiene el valor del atributo codemp
	 * @return Código de la empresa
	 */
	public String getCodEmp() {
		return codEmp;
	}
	
	/**
	 * Establece el valor del atributo codemp
	 * @param codEmp the codEmp to set
	 */
	public void setCodEmp(String codEmp) {
		this.codEmp = codEmp.toUpperCase();
	}
	
	/**
	 * @return the desEmp
	 */
	public String getDesEmp() {
		return desEmp;
	}
	
	/**
	 * @param desemp the desEmp to set
	 */
	public void setDesEmp(String desEmp) {
		this.desEmp = desEmp;
	}
	
	/**
	 * @return the domicilio
	 */
	public String getDomicilio() {
		return domicilio;
	}
	
	/**
	 * @param domicilio the domicilio to set
	 */
	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}
	
	/**
	 * @return the poblacion
	 */
	public String getPoblacion() {
		return poblacion;
	}
	
	/**
	 * @param poblacion the poblacion to set
	 */
	public void setPoblacion(String poblacion) {
		this.poblacion = poblacion;
	}
	
	/**
	 * @return the provincia
	 */
	public String getProvincia() {
		return provincia;
	}
	
	/**
	 * @param provincia the provincia to set
	 */
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}
	
	/**
	 * 
	 * @return the cp
	 */
	public String getCp() {
		return cp;
	}
	
	/**
	 * @param cp the cp to set
	 */
	public void setCp(String cp) {
		this.cp = cp;
	}
	/**
	 * @return the cif
	 */
	public String getCif() {
		return cif;
	}
	
	/**
	 * @param cif the cif to set
	 */
	public void setCif(String cif) {
		this.cif = cif;
	}
	
	/**
	 * @return the telefono1
	 */
	public String getTelefono1() {
		return telefono1;
	}
	
	/**
	 * @param telefono1 the telefono1 to set
	 */
	public void setTelefono1(String telefono1) {
		this.telefono1 = telefono1;
	}
	
	/**
	 * @return the telefono2
	 */
	public String getTelefono2() {
		return telefono2;
	}
	
	/**
	 * @param telefono2 the telefono2 to set
	 */
	public void setTelefono2(String telefono2) {
		this.telefono2 = telefono2;
	}
	
	/**
	 * @return the fax
	 */
	public String getFax() {
		return fax;
	}
	
	/**
	 * @param fax the fax to set
	 */
	public void setFax(String fax) {
		this.fax = fax;
	}

	public byte [] getLogotipo() {
		return logotipo;
	}

	public void setLogotipo(byte [] logotipo) {
		this.logotipo = logotipo;
	}

	public String getRegistroMercantil() {
		return registroMercantil;
	}

	public void setRegistroMercantil(String registroMercantil) {
		this.registroMercantil = registroMercantil;
	}
}
