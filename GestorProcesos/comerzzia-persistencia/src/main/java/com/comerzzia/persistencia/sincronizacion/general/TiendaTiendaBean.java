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

package com.comerzzia.persistencia.sincronizacion.general;

import java.util.Date;

import com.comerzzia.persistencia.general.tiendas.TiendaBean;
import com.comerzzia.util.xml.XMLDocument;


public class TiendaTiendaBean {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -6802033762990695720L;
	
	private TiendaBean tienda = null;
	
	private String nombreComercial = null;
	private String cif = null;
	private String cifCliente = null;
	

	/**
	 * Constructor
	 * @param tienda
	 */
	public TiendaTiendaBean(TiendaBean tienda) {
		this.tienda = tienda;
	}
	
	/**
	 * @return the tienda
	 */
	public TiendaBean getTienda() {
		return tienda;
	}


	/**
	 * @param tienda the tienda to set
	 */
	public void setTienda(TiendaBean tienda) {
		this.tienda = tienda;
	}


	/**
	 * @return the nombreComercial
	 */
	public String getNombreComercial() {
		return nombreComercial;
	}


	/**
	 * @param nombreComercial the nombreComercial to set
	 */
	public void setNombreComercial(String nombreComercial) {
		this.nombreComercial = nombreComercial;
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
	 * @return the cifCliente
	 */
	public String getCifCliente() {
		return cifCliente;
	}

	/**
	 * @param cifCliente the cifCliente to set
	 */
	public void setCifCliente(String cifCliente) {
		this.cifCliente = cifCliente;
	}

	/**
	 * @return
	 * @see com.comerzzia.util.base.MantenimientoBean#getActivo()
	 */
	public String getActivo() {
		return tienda.getActivo();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getCodAlm()
	 */
	public String getCodAlm() {
		return tienda.getCodAlm();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getCodCliente()
	 */
	public String getCodCliente() {
		return tienda.getCodCliente();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getCodEmp()
	 */
	public String getCodEmp() {
		return tienda.getCodEmp();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getConfiguracion()
	 */
	public XMLDocument getConfiguracion() {
		return tienda.getConfiguracion();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getCp()
	 */
	public String getCp() {
		return tienda.getCp();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getDesAlm()
	 */
	public String getDesAlm() {
		return tienda.getDesAlm();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getDesCliente()
	 */
	public String getDesCliente() {
		return tienda.getDesCliente();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getDesTipoTienda()
	 */
	public String getDesTipoTienda() {
		return tienda.getDesTipoTienda();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getDomicilio()
	 */
	public String getDomicilio() {
		return tienda.getDomicilio();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getFax()
	 */
	public String getFax() {
		return tienda.getFax();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getFechaVersionArticulos()
	 */
	public Date getFechaVersionArticulos() {
		return tienda.getFechaVersionArticulos();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getFechaVersionArticulosRevisada()
	 */
	public Date getFechaVersionArticulosRevisada() {
		return tienda.getFechaVersionArticulosRevisada();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getIdTipoTienda()
	 */
	public Long getIdTipoTienda() {
		return tienda.getIdTipoTienda();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getNombre()
	 */
	public String getNombre() {
		return tienda.getNombre();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getPersonaContacto()
	 */
	public String getPersonaContacto() {
		return tienda.getPersonaContacto();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getPoblacion()
	 */
	public String getPoblacion() {
		return tienda.getPoblacion();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getProvincia()
	 */
	public String getProvincia() {
		return tienda.getProvincia();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getTelefono1()
	 */
	public String getTelefono1() {
		return tienda.getTelefono1();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getTelefono2()
	 */
	public String getTelefono2() {
		return tienda.getTelefono2();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getVersionArticulos()
	 */
	public Long getVersionArticulos() {
		return tienda.getVersionArticulos();
	}


	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.tiendas.TiendaBean#getVersionArticulosRevisada()
	 */
	public Long getVersionArticulosRevisada() {
		return tienda.getVersionArticulosRevisada();
	}


	/**
	 * @return
	 * @see com.comerzzia.util.base.MantenimientoBean#isActivo()
	 */
	public boolean isActivo() {
		return tienda.isActivo();
	}
}
