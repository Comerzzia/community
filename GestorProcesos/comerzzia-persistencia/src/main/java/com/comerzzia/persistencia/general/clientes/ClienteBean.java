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

package com.comerzzia.persistencia.general.clientes;

import java.util.Date;

import com.comerzzia.util.base.MantenimientoBean;

public class ClienteBean extends MantenimientoBean{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8975079679534956996L;
	
	private String codCli;
	private String desCli;
	private String nombreComercial;
	private String domicilio;
	private String poblacion;
	private String provincia;
	private String cp;
	private String telefono1;
	private String telefono2;
	private String fax;
	private String codPais;
	private String desPais;
	private String personaContacto;
	private String email;
	private String cif;
	private Long idTratImp;
	private String codTratImp;
	private String desTratImp;
	private String codMedioPago;
	private Long idMedioPagoVencimiento;
	private String desMedioPagoVencimiento;
	private String codTar;
	private String desTar;
	private String codSec;
	private String desSec;
	private String banco;
	private String domicilioBanco;
	private String poblacionBanco;
	private String ccc;
	private String observaciones;
	private Date fechaAlta;
	private Date fechaBaja;
	private String codAlmacenTienda;
	private String desAlmacenTienda;
	private Double riesgoConcedido;
	
	protected void initNuevoBean() {
	}

	public String getCodCli() {
		return codCli;
	}

	public void setCodCli(String codCli) {
		this.codCli = codCli.toUpperCase();
	}

	public String getDesCli() {
		return desCli;
	}

	public void setDesCli(String desCli) {
		this.desCli = desCli;
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

	public String getCodPais() {
		return codPais;
	}

	public void setCodPais(String codPais) {
		this.codPais = codPais;
	}

	public String getDesPais() {
		return desPais;
	}

	public void setDesPais(String desPais) {
		this.desPais = desPais;
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

	public String getCodTar() {
		return codTar;
	}

	public void setCodTar(String codTar) {
		this.codTar = codTar;
	}

	public String getDesTar() {
		return desTar;
	}

	public void setDesTar(String desTar) {
		this.desTar = desTar;
	}

	public String getCodSec() {
		return codSec;
	}

	public void setCodSec(String codSec) {
		this.codSec = codSec;
	}

	public String getDesSec() {
		return desSec;
	}

	public void setDesSec(String desSec) {
		this.desSec = desSec;
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

	public String getCodAlmacenTienda() {
		return codAlmacenTienda;
	}

	public void setCodAlmacenTienda(String codAlmacenTienda) {
		this.codAlmacenTienda = codAlmacenTienda;
	}

	public String getDesAlmacenTienda() {
		return desAlmacenTienda;
	}

	public void setDesAlmacenTienda(String desAlmacenTienda) {
		this.desAlmacenTienda = desAlmacenTienda;
	}
	
	public boolean isEsTienda() {
		return (codAlmacenTienda != null && !codAlmacenTienda.isEmpty());
	}

	public Double getRiesgoConcedido() {
		return riesgoConcedido;
	}

	public void setRiesgoConcedido(Double riesgoConcedido) {
		this.riesgoConcedido = riesgoConcedido;
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

	public String getCodMedioPago() {
		return codMedioPago;
	}

	public void setCodMedioPago(String codMedioPago) {
		this.codMedioPago = codMedioPago;
	}
}
