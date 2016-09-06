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

import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.general.tiendas.TiendaBean;
import com.comerzzia.util.base.MantenimientoBean;


public class ClienteTiendaBean extends MantenimientoBean {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 2748716165790259257L;
	
	private String codAlmacen = null;
	private ClienteBean cliente = null;
	private boolean ventaACredito = false;
	
	
	/**
	 * Constructor
	 * 
	 * @param cliente
	 */
	public ClienteTiendaBean(ClienteBean cliente) {
		this.cliente = cliente;
	}
	
	
	/**
	 * Constructor
	 * 
	 * @param cliente
	 * @param codAlmacen
	 */
	public ClienteTiendaBean(ClienteBean cliente, TiendaBean tienda) {
		this.cliente = cliente;
		this.codAlmacen = tienda.getCodAlm();
		
		// El medio de pago por defecto para el cliente que se envía a la tienda 
		// es el definido para la tienda
		this.cliente.setCodMedioPago(tienda.getCodMedioPago());
	}
	
	
	/**
	 * Constructor
	 * 
	 * @param cliente
	 * @param codAlmacen
	 * @param ventaACredito
	 */
	public ClienteTiendaBean(ClienteBean cliente, String codAlmacen, String ventaACredito) {
		this.cliente = cliente;
		this.codAlmacen = codAlmacen.toUpperCase();
		setVentaACredito(ventaACredito);
	}
	
	
	public ClienteBean getCliente() {
		return cliente;
	}


	public String getCodAlmacen() {
		return this.codAlmacen;
	}
	
	
	/**
	 * @return
	 * @see com.comerzzia.util.base.MantenimientoBean#getActivo()
	 */
	public String getActivo() {
		return cliente.getActivo();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getBanco()
	 */
	public String getBanco() {
		return cliente.getBanco();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getCcc()
	 */
	public String getCcc() {
		return cliente.getCcc();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getCif()
	 */
	public String getCif() {
		return cliente.getCif();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getCodAlmacenTienda()
	 */
	public String getCodAlmacenTienda() {
		return cliente.getCodAlmacenTienda();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getCodCli()
	 */
	public String getCodCli() {
		return cliente.getCodCli();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getCodMedioPago()
	 */
	public String getCodMedioPago() {
		return cliente.getCodMedioPago();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getCodPais()
	 */
	public String getCodPais() {
		return cliente.getCodPais();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getCodSec()
	 */
	public String getCodSec() {
		return cliente.getCodSec();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getCodTar()
	 */
	public String getCodTar() {
		return cliente.getCodTar();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getCodTratImp()
	 */
	public String getCodTratImp() {
		return cliente.getCodTratImp();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getCp()
	 */
	public String getCp() {
		return cliente.getCp();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getDesAlmacenTienda()
	 */
	public String getDesAlmacenTienda() {
		return cliente.getDesAlmacenTienda();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getDesCli()
	 */
	public String getDesCli() {
		return cliente.getDesCli();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getDesMedPag()
	 */
	public String getDesMedPag() {
		return cliente.getDesMedioPagoVencimiento();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getDesPais()
	 */
	public String getDesPais() {
		return cliente.getDesPais();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getDesSec()
	 */
	public String getDesSec() {
		return cliente.getDesSec();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getDesTar()
	 */
	public String getDesTar() {
		return cliente.getDesTar();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getDesTratImp()
	 */
	public String getDesTratImp() {
		return cliente.getDesTratImp();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getDomicilio()
	 */
	public String getDomicilio() {
		return cliente.getDomicilio();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getDomicilioBanco()
	 */
	public String getDomicilioBanco() {
		return cliente.getDomicilioBanco();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getEmail()
	 */
	public String getEmail() {
		return cliente.getEmail();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getFax()
	 */
	public String getFax() {
		return cliente.getFax();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getFechaAlta()
	 */
	public Date getFechaAlta() {
		return cliente.getFechaAlta();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getFechaBaja()
	 */
	public Date getFechaBaja() {
		return cliente.getFechaBaja();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getIdTratImp()
	 */
	public Long getIdTratImp() {
		return cliente.getIdTratImp();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getNombreComercial()
	 */
	public String getNombreComercial() {
		return cliente.getNombreComercial();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getObservaciones()
	 */
	public String getObservaciones() {
		return cliente.getObservaciones();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getPersonaContacto()
	 */
	public String getPersonaContacto() {
		return cliente.getPersonaContacto();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getPoblacion()
	 */
	public String getPoblacion() {
		return cliente.getPoblacion();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getPoblacionBanco()
	 */
	public String getPoblacionBanco() {
		return cliente.getPoblacionBanco();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getProvincia()
	 */
	public String getProvincia() {
		return cliente.getProvincia();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getRiesgoConcedido()
	 */
	public Double getRiesgoConcedido() {
		return cliente.getRiesgoConcedido();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getTelefono1()
	 */
	public String getTelefono1() {
		return cliente.getTelefono1();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#getTelefono2()
	 */
	public String getTelefono2() {
		return cliente.getTelefono2();
	}

	/**
	 * @return
	 * @see com.comerzzia.util.base.MantenimientoBean#isActivo()
	 */
	public boolean isActivo() {
		return cliente.isActivo();
	}

	/**
	 * @return
	 * @see com.comerzzia.persistencia.general.clientes.ClienteBean#isEsTienda()
	 */
	public boolean isEsTienda() {
		return cliente.isEsTienda();
	}

	/**
	 * @return the ventaACredito
	 */
	public boolean isVentaACredito() {
		return ventaACredito;
	}

	/**
	 * @param ventaACredito the ventaACredito to set
	 */
	public void setVentaACredito(boolean ventaACredito) {
		this.ventaACredito = ventaACredito;
	}
	
	public void setVentaACredito(String ventaACredito) {
		this.ventaACredito = ventaACredito.equals(TRUE);
	}
	
	public String getVentaACredito() {
		return (ventaACredito) ? TRUE : FALSE;
	}

	@Override
	protected void initNuevoBean() {
	}
}
