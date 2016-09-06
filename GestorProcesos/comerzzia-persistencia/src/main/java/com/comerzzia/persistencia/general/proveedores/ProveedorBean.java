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

package com.comerzzia.persistencia.general.proveedores;

import java.util.Date;

import com.comerzzia.util.base.MantenimientoBean;

public class ProveedorBean extends MantenimientoBean {

	/**
	 * serialVersionUID.
	 */
	private static final long serialVersionUID = 6692804715231824000L;

	private String codPro;
	private String desPro;
	private String tipoProveedor;
	private String nombreComercial;
	private String domicilio;
	private String poblacion;
	private String provincia;
	private String cp;
	private String codPais;
	private String desPais;
	private String telefono1;
	private String telefono2;
	private String fax;
	private String personaContacto;
	private String email;
	private String cif;
	private Long idTratImp;
	private String codTratImp;
	private String desTratImp;
	private Long idMedioPagoVencimiento;
	private String desMedioPagoVencimiento;
	private String observaciones;
	private Date fechaAlta;
	private Date fechaBaja;
	private String banco;
	private String domicilioBanco;
	private String poblacionBanco;
	private String ccc;

	protected void initNuevoBean() {
	}

	public String getCodPro() {
		return codPro;
	}

	public void setCodPro(String codPro) {
		this.codPro = codPro.toUpperCase();
	}

	public String getDesPro() {
		return desPro;
	}

	public void setDesPro(String desPro) {
		this.desPro = desPro;
	}

	public String getTipoProveedor() {
		return tipoProveedor;
	}

	public void setTipoProveedor(String tipoProveedor) {
		this.tipoProveedor = tipoProveedor;
	}

	public String getNombreComercial() {
		return nombreComercial;
	}

	public void setNombreComercial(String nombreComercial) {
		this.nombreComercial = nombreComercial;
	}

	public String getDomicilio() {
		return domicilio;
	}

	public void setDomicilio(String domicilio) {
		this.domicilio = domicilio;
	}

	public String getPoblacion() {
		return poblacion;
	}

	public void setPoblacion(String poblacion) {
		this.poblacion = poblacion;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getCp() {
		return cp;
	}

	public void setCp(String cp) {
		this.cp = cp;
	}

	public String getCodPais() {
		return codPais;
	}

	public void setCodPais(String codPais) {
		this.codPais = codPais;
	}

	public String getTelefono1() {
		return telefono1;
	}

	public void setTelefono1(String telefono1) {
		this.telefono1 = telefono1;
	}

	public String getTelefono2() {
		return telefono2;
	}

	public void setTelefono2(String telefono2) {
		this.telefono2 = telefono2;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getPersonaContacto() {
		return personaContacto;
	}

	public void setPersonaContacto(String personaContacto) {
		this.personaContacto = personaContacto;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCif() {
		return cif;
	}

	public void setCif(String cif) {
		this.cif = cif;
	}

	public Long getIdTratImp() {
		return idTratImp;
	}

	public void setIdTratImp(Long idTratImp) {
		this.idTratImp = idTratImp;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public Date getFechaAlta() {
		return fechaAlta;
	}

	public void setFechaAlta(Date fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	public Date getFechaBaja() {
		return fechaBaja;
	}

	public void setFechaBaja(Date fechaBaja) {
		this.fechaBaja = fechaBaja;
	}

	public String getBanco() {
		return banco;
	}

	public void setBanco(String banco) {
		this.banco = banco;
	}

	public String getDomicilioBanco() {
		return domicilioBanco;
	}

	public void setDomicilioBanco(String domicilioBanco) {
		this.domicilioBanco = domicilioBanco;
	}

	public String getPoblacionBanco() {
		return poblacionBanco;
	}

	public void setPoblacionBanco(String poblacionBanco) {
		this.poblacionBanco = poblacionBanco;
	}

	public String getCcc() {
		return ccc;
	}

	public void setCcc(String ccc) {
		this.ccc = ccc;
	}

	public String getDesPais() {
		return desPais;
	}

	public void setDesPais(String desPais) {
		this.desPais = desPais;
	}

	public String getCodTratImp() {
		return codTratImp;
	}

	public void setCodTratImp(String codTratImp) {
		this.codTratImp = codTratImp;
	}

	public String getDesTratImp() {
		return desTratImp;
	}

	public void setDesTratImp(String desTratImp) {
		this.desTratImp = desTratImp;
	}

	public Long getIdMedioPagoVencimiento() {
		return idMedioPagoVencimiento;
	}

	public void setIdMedioPagoVencimiento(Long idMedioPagoVencimiento) {
		this.idMedioPagoVencimiento = idMedioPagoVencimiento;
	}

	public String getDesMedioPagoVencimiento() {
		return desMedioPagoVencimiento;
	}

	public void setDesMedioPagoVencimiento(String desMedioPagoVencimiento) {
		this.desMedioPagoVencimiento = desMedioPagoVencimiento;
	}
}
