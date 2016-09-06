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

package com.comerzzia.servicios.estadisticas;

import java.util.Date;
import java.util.HashMap;

import com.comerzzia.persistencia.core.empresas.EmpresaBean;

public class Estadisticas {

	private Date fecha = null;
	private String version = null;
	private EmpresaBean datosEmpresa = null;
	private VolumenNegocio volumenNegocio = null;
	private TransaccionesNegocio transaccionNegocio = null;
	
	/* DATOS GENERALES */
	
	public Date getFecha() {
		return fecha;
	}
	
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	
	public String getVersion() {
		return version;
	}
	
	public void setVersion(String version) {
		this.version = version;
	}
	
	/* DATOS EMPRESA */
	
	public void setDatosEmpresa(EmpresaBean datosEmpresa) {
		this.datosEmpresa = datosEmpresa;
	}

	public String getDesEmpresa() {
		return datosEmpresa.getDesEmp();
	}
	
	public String getCif() {
		return datosEmpresa.getCif();
	}

	public String getRegistroMercantil() {
		return datosEmpresa.getRegistroMercantil();
	}

	/* DATOS VOLUMEN NEGOCIO */
	
	public void setVolumenNegocio(VolumenNegocio volumenNegocio) {
		this.volumenNegocio = volumenNegocio;
	}

	public Long getNumeroClientes() {
		return volumenNegocio.getNumeroClientes();
	}

	public Long getNumeroProveedores() {
		return volumenNegocio.getNumeroProveedores();
	}

	public Long getNumeroArticulos() {
		return volumenNegocio.getNumeroArticulos();
	}

	public Long getNumeroUsuarios() {
		return volumenNegocio.getNumeroUsuarios();
	}

	public Long getNumeroAlmacenes() {
		return volumenNegocio.getNumeroAlmacenes();
	}

	public Long getNumeroMovimientosAlmacen() {
		return volumenNegocio.getNumeroMovimientosAlmacen();
	}

	/* DATOS TRANSACCIONES NEGOCIO */
	
	public void setTransaccionNegocio(TransaccionesNegocio transaccionNegocio) {
		this.transaccionNegocio = transaccionNegocio;
	}
	
	public Long getNumeroTicketsEmpresa() {
		return transaccionNegocio.getNumeroTicketsEmpresa();
	}

	public Long getNumeroAlbaranesVentaEmpresa() {
		return transaccionNegocio.getNumeroAlbaranesVentaEmpresa();
	}

	public Long getNumeroAlbaranesCompraEmpresa() {
		return transaccionNegocio.getNumeroAlbaranesCompraEmpresa();
	}

	public Long getNumeroPedidosTiendaVirtual() {
		return transaccionNegocio.getNumeroPedidosTiendaVirtual();
	}

	public HashMap<String, Long> getNumeroTransaccionesVentaFormaPago() {
		return transaccionNegocio.getNumeroTransaccionesVentaFormaPago();
	}

	public HashMap<String, Long> getNumeroTransaccionesCompraFormaPago() {
		return transaccionNegocio.getNumeroTransaccionesCompraFormaPago();
	}

	public Double getNumeroLineasTickets() {
		return transaccionNegocio.getNumeroLineasTickets();
	}
}
