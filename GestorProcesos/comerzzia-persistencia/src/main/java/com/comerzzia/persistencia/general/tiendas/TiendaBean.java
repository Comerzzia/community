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

package com.comerzzia.persistencia.general.tiendas;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.w3c.dom.Document;

import com.comerzzia.persistencia.general.tiendas.cajas.CajaBean;
import com.comerzzia.persistencia.general.tiendas.tarifas.TarifaTiendaBean;
import com.comerzzia.persistencia.general.tiendas.usuarios.AlmacenUsuarioBean;
import com.comerzzia.util.base.MantenimientoBean;
import com.comerzzia.util.xml.XMLDocument;

public class TiendaBean extends MantenimientoBean {

	/**
	 * Serial Version UID
	 */
	private static final long serialVersionUID = 357570011196434138L;

	private String codAlm;
	private String desAlm;
	private String domicilio;
	private String poblacion;
	private String provincia;
	private String cp;
	private String telefono1;
	private String telefono2;
	private String fax;
	private String personaContacto;
	private String codEmp;
	private String codCliente;
	private String desCliente;
	private Long idTipoTienda;
	private String desTipoTienda;
	private String claseConfiguracion;
	private String claseSincronizacion;
	private Long versionArticulos = new Long(0);
	private Long versionArticulosRevisada = new Long(0);
	private Date fechaVersionArticulos;
	private Date fechaVersionArticulosRevisada;
	private XMLDocument configuracion = new XMLDocument();
	private String codMedioPago;
	private String desMedioPago;
	private String codConceptoAlmacen;
	private String desConceptoAlmacen;

	private boolean cajasCargadas;
	private List<CajaBean> cajas;

	private boolean tarifasCargadas;
	private List<TarifaTiendaBean> tarifas;
	
	private boolean usuariosCargados;
	private List<AlmacenUsuarioBean> usuarios;

	protected void initNuevoBean() {
		cajas = new ArrayList<CajaBean>();
		this.cajasCargadas = true;

		tarifas = new ArrayList<TarifaTiendaBean>();
		this.tarifasCargadas = true;
		
		usuarios = new ArrayList<AlmacenUsuarioBean>();
		this.usuariosCargados = false;
	}

	public String getCodAlm() {
		return codAlm;
	}

	public void setCodAlm(String codAlm) {
		this.codAlm = codAlm;
	}

	public Long getIdTipoTienda() {
		return idTipoTienda;
	}

	public void setIdTipoTienda(Long idTipoTienda) {
		this.idTipoTienda = idTipoTienda;
	}

	public String getDesTipoTienda() {
		return desTipoTienda;
	}

	public void setDesTipoTienda(String desTipoTienda) {
		this.desTipoTienda = desTipoTienda;
	}

	public Long getVersionArticulos() {
		return versionArticulos;
	}

	public void setVersionArticulos(Long versionArticulos) {
		this.versionArticulos = versionArticulos;
	}

	public Long getVersionArticulosRevisada() {
		return versionArticulosRevisada;
	}

	public void setVersionArticulosRevisada(Long verionArticulosRevisada) {
		this.versionArticulosRevisada = verionArticulosRevisada;
	}

	public String getDesAlm() {
		return desAlm;
	}

	public void setDesAlm(String desAlm) {
		this.desAlm = desAlm;
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

	public String getPersonaContacto() {
		return personaContacto;
	}

	public void setPersonaContacto(String personaContacto) {
		this.personaContacto = personaContacto;
	}

	public String getCodEmp() {
		return codEmp;
	}

	public void setCodEmp(String codEmp) {
		this.codEmp = codEmp;
	}

	public String getCodCliente() {
		return codCliente;
	}

	public void setCodCliente(String codCliente) {
		this.codCliente = codCliente;
	}

	public String getDesCliente() {
		return desCliente;
	}

	public void setDesCliente(String desCliente) {
		this.desCliente = desCliente;
	}

	public Date getFechaVersionArticulos() {
		return fechaVersionArticulos;
	}

	public void setFechaVersionArticulos(Date fechaVersionArticulos) {
		this.fechaVersionArticulos = fechaVersionArticulos;
	}

	public Date getFechaVersionArticulosRevisada() {
		return fechaVersionArticulosRevisada;
	}

	public void setFechaVersionArticulosRevisada(
			Date fechaVersionArticulosRevisada) {
		this.fechaVersionArticulosRevisada = fechaVersionArticulosRevisada;
	}

	// ******** CAJAS ******** //
	public boolean isCajasCargadas() {
		return cajasCargadas;
	}

	public void setCajasCargadas(boolean cajasCargadas) {
		this.cajasCargadas = cajasCargadas;
	}

	public List<CajaBean> getCajas() {
		return cajas;
	}

	public void setCajas(List<CajaBean> cajas) {
		this.cajas = cajas;
	}

	public int getNumCajas() {
		return cajas.size();
	}

	public CajaBean getCaja(int indice) {
		return (CajaBean) cajas.get(indice);
	}

	public void addCaja(CajaBean caja) {
		cajas.add(caja);
	}

	public void deleteCaja(int indice) {
		if (getCaja(indice).isEstadoNuevo()) {
			cajas.remove(indice);
		} else {
			this.getCaja(indice).borrar();
		}
	}

	// ******** TARIFAS ******** //
	public boolean isTarifasCargadas() {
		return tarifasCargadas;
	}

	public void setTarifasCargadas(boolean tarifasCargadas) {
		this.tarifasCargadas = tarifasCargadas;
	}

	public List<TarifaTiendaBean> getTarifas() {
		return tarifas;
	}

	public void setTarifas(List<TarifaTiendaBean> tarifas) {
		this.tarifas = tarifas;
	}

	public int getNumTarifas() {
		return tarifas.size();
	}

	public TarifaTiendaBean getTarifa(int indice) {
		return (TarifaTiendaBean) tarifas.get(indice);
	}

	public void addTarifa(TarifaTiendaBean tarifa) {
		tarifas.add(tarifa);
	}

	public void deleteTarifa(int indice) {
		if (getTarifa(indice).isEstadoNuevo()) {
			tarifas.remove(indice);
		} else {
			this.getTarifa(indice).borrar();
		}
	}

	// ******** USUARIOS ******** //
	public boolean isUsuariosCargados() {
		return usuariosCargados;
	}

	public void setUsuariosCargados(boolean usuariosCargados) {
		this.usuariosCargados = usuariosCargados;
	}

	public List<AlmacenUsuarioBean> getUsuarios() {
		return usuarios;
	}

	public void setUsuarios(List<AlmacenUsuarioBean> usuarios) {
		this.usuarios = usuarios;
	}
	
	public int getNumUsuarios() {
		return usuarios.size();
	}
	
	public void addUsuario(AlmacenUsuarioBean usuario) {
		usuarios.add(usuario);
	}

	public String getNombre() {
		return this.getCodAlm() + " - " + this.getDesAlm();
	}

	public void setConfiguracion(Blob configuracion) {
		this.configuracion.setDocument(configuracion);
	}
	
	public void setConfiguracion(String configuracion) {
		this.configuracion.setDocument(configuracion);
	}
	
	public void setConfiguracion(Document configuracion) {
		this.configuracion.setDocument(configuracion);
	}

	public XMLDocument getConfiguracion() {
		return configuracion;
	}
	
	public Document getDocumentConfiguracion() {
		return configuracion.getDocument();
	}

	public String getClaseConfiguracion() {
		return claseConfiguracion;
	}

	public void setClaseConfiguracion(String claseConfiguracion) {
		this.claseConfiguracion = claseConfiguracion;
	}

	public String getClaseSincronizacion() {
		return claseSincronizacion;
	}

	public void setClaseSincronizacion(String claseSincronizacion) {
		this.claseSincronizacion = claseSincronizacion;
	}

	public String getCodMedioPago() {
		return codMedioPago;
	}

	public void setCodMedioPago(String codMedioPago) {
		this.codMedioPago = codMedioPago;
	}

	public String getDesMedioPago() {
		return desMedioPago;
	}

	public void setDesMedioPago(String desMedioPago) {
		this.desMedioPago = desMedioPago;
	}

	public String getCodConceptoAlmacen() {
		return codConceptoAlmacen;
	}

	public void setCodConceptoAlmacen(String codConceptoAlmacen) {
		this.codConceptoAlmacen = codConceptoAlmacen;
	}

	public String getDesConceptoAlmacen() {
		return desConceptoAlmacen;
	}

	public void setDesConceptoAlmacen(String desConceptoAlmacen) {
		this.desConceptoAlmacen = desConceptoAlmacen;
	}
}
